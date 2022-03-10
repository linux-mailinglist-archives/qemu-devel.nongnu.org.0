Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1954D515B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 19:53:01 +0100 (CET)
Received: from localhost ([::1]:54666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSNuG-0001Om-1P
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 13:53:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSNr6-0005Dg-Ny
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 13:49:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSNr3-0000R9-Vp
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 13:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646938181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iBdLlcyG7BJyggkbE0SCqdhGrD8s5H6EmylRkorSYyc=;
 b=AD5zYxR9kwOUlRt55d8nk51FMKtslsaPVMl5rT6Ej52tW9Z0UTyurSZoX6jYsoOo3h1B1U
 hciQZMfh5Y5tGhdB6HJQUvKoTEBZ39FN/AEIWj/OwMZx7OW2ojQvc6Lb2C0SEz1U3fVeEE
 53LL2aeWTxtK4XjYnX+l8jijujD7bPs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-boIHBVv_N7q0BDRD6NBLig-1; Thu, 10 Mar 2022 13:49:38 -0500
X-MC-Unique: boIHBVv_N7q0BDRD6NBLig-1
Received: by mail-wm1-f70.google.com with SMTP id
 j42-20020a05600c1c2a00b00381febe402eso4441122wms.0
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 10:49:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iBdLlcyG7BJyggkbE0SCqdhGrD8s5H6EmylRkorSYyc=;
 b=uD4dP4kXo1uxzLDpwp7LjJ9i/dhxAaz/XSnEQXrYWp2B1iKziY++3AJh+9NiJ/sCto
 huUi9c+Ttm9yGxLiJtjnhVi6FL6AbE0S/NlTcq9GNAIDQI9aaiKp6n2EmR0nsyQKKzLl
 MktDvrQhCoc8QJ5I298uhUM5e83zLQ4dnjgtpnvHTrSNEaIo15+BMWib6wgKM01amiiO
 cH4rejHw9FIfUhdNh5i/6uMQe5nwhMKK1sWqM0+yGL+/dsYNZuG6we5RET7Chnd8gKwj
 9TCJxEvVb46lT7lGBN0P8kfhxCK6rYbQCA0sjE56+wqQ5FrsjXOw4FF625L+z6OnKKHF
 gnow==
X-Gm-Message-State: AOAM531Hz/ZBBmy5adGEvwZG+X3Dif94C2y218PEhGyLOZ4ZJQe6Pil/
 v7kxhK4UuY/7XYikN2TNIzXh876ym8l7iruESHiKgfvq3/02sC+C0zVBsQgKRitzGzR0FsqpTV7
 YIpAs6YKgLvVmvOo=
X-Received: by 2002:a05:6000:188f:b0:1f1:e5da:b116 with SMTP id
 a15-20020a056000188f00b001f1e5dab116mr4716697wri.467.1646938177783; 
 Thu, 10 Mar 2022 10:49:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzG/XKfA4sLq3EdWipO/2/ILH9sEQUUXr1Q4Nx+Tgtnw0jlxCIfSze+ceihZUGTKgJYN48l2w==
X-Received: by 2002:a05:6000:188f:b0:1f1:e5da:b116 with SMTP id
 a15-20020a056000188f00b001f1e5dab116mr4716684wri.467.1646938177544; 
 Thu, 10 Mar 2022 10:49:37 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 i186-20020a1c3bc3000000b00382b25f6c9fsm5580489wma.42.2022.03.10.10.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 10:49:37 -0800 (PST)
Message-ID: <cc037332-a0f5-3acb-396a-49bdac653d2e@redhat.com>
Date: Thu, 10 Mar 2022 19:49:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v5 0/5] user creatable pnv-phb4 devices
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220111131027.599784-1-danielhb413@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220111131027.599784-1-danielhb413@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/01/2022 14.10, Daniel Henrique Barboza wrote:
> Hi,
> 
> This version implements Cedric's review suggestions from v4. No
> drastic design changes were made.
> 
> Changes from v4:
> - patches 1,3,5: unchanged
> - patch 2:
>    * renamed function to pnv_phb4_xscom_realize()
>    * pnv4_phb4_xscom_realize() is now called at the end of phb4_realize()
> - patch 4:
>    * changed pnv_phb4_get_stack signature to use chip and phb
>    * added a new helper called pnv_pec_stk_default_phb_realize() to
> realize the default phb when running with defaults
> - v4 link: https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg02148.html
> 
> Daniel Henrique Barboza (5):
>    ppc/pnv: set phb4 properties in stk_realize()
>    ppc/pnv: move PHB4 XSCOM init to phb4_realize()
>    ppc/pnv: turn 'phb' into a pointer in struct PnvPhb4PecStack
>    ppc/pnv: Introduce user creatable pnv-phb4 devices
>    ppc/pnv: turn pnv_phb4_update_regions() into static

It's now possible to crash QEMU with the pnv-phb4 device:

$ ./qemu-system-ppc64 -nographic -M powernv9 -device pnv-phb4
Unexpected error in object_property_try_add() at 
../../devel/qemu/qom/object.c:1229:
qemu-system-ppc64: -device pnv-phb4: attempt to add duplicate property 
'pnv-phb4[0]' to object (type 'power9_v2.0-pnv-chip')
Aborted (core dumped)

Any ideas how to fix this?

  Thomas


