Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909AB46D076
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 11:01:22 +0100 (CET)
Received: from localhost ([::1]:37138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mutlJ-0004Pk-4k
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 05:01:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mutja-0003W0-Gd
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 04:59:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mutjQ-0004yV-PG
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 04:59:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638957562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lsx4BcPcxvMsPZ1VXCH226GZhNZtC4knghjBoE43wKs=;
 b=DnEUg0N6jYNJYajI6cRdjWpWQQ6OJcYE+DsAfWrkVyzWmktgys/BV2G0gpHmnf9XwGJgmw
 wO23f6n5GxeOO0iF0nkXWScVLJ7XBRmNyCRpgRT5wPtQtJD40mGK2USUSR/3nkp51FbuWQ
 z9/SwQk/EMhFYsgMXw2BYu1+iu2510c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-405-PDDXw0oXOiWCBsOCf-Zs_A-1; Wed, 08 Dec 2021 04:59:19 -0500
X-MC-Unique: PDDXw0oXOiWCBsOCf-Zs_A-1
Received: by mail-wm1-f72.google.com with SMTP id
 m18-20020a05600c3b1200b0033283ea5facso1045070wms.1
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 01:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lsx4BcPcxvMsPZ1VXCH226GZhNZtC4knghjBoE43wKs=;
 b=oFS7z0JAYjLKWrTm9IFnZI84hN/a7lHwl5/POoE4XN7cENlAFuDif+gXV6pExiIC2u
 qYiIpoBCPjIUjpSx/Pc1Lpyn99I8O2SdqiSx1feO7Y/3f851bWxiI5aXgMU6EENtEypW
 fSC5H0pWJ+V8Q5sBze9/2fifog5OfjPBT1VkdameFQ6SPAIz/N2N+1lklj3SGE1E3CN3
 1no86HHkWDNB7uhQxat+mqig1xsP6kKHo3k/Lyab4L3hUi0w69P8fR7dank0SCA3+zI6
 mawky7hdkEBmaBrY88jfrYghnYM5U1wuDBbiyGPuPSokAaRN0R8QjvyTdb7sxq2U/6qa
 L0WA==
X-Gm-Message-State: AOAM532LOd/54vGciBBx1TcYnRqU3vvpcr1LHr47c3uuDYKcq7gFkr4v
 HhCc3wyaJpiFfW62SjUXvI/y4snbtaAqh6MAPIEmblMtFwW2SUhnqtH11t7aKHAjCrKs/ahsTkD
 1izKhhbcTATknwbE=
X-Received: by 2002:a05:600c:21cd:: with SMTP id
 x13mr14927694wmj.52.1638957558475; 
 Wed, 08 Dec 2021 01:59:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLf8U4TV+7WinZNl0RdqA4pErH09CFmvVi4owDBKaMCj8aCNFtRWp3dTpZP3M4S4G0ipguMQ==
X-Received: by 2002:a05:600c:21cd:: with SMTP id
 x13mr14927659wmj.52.1638957558196; 
 Wed, 08 Dec 2021 01:59:18 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id f7sm2756674wri.74.2021.12.08.01.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 01:59:17 -0800 (PST)
Message-ID: <8c1bb1df-112f-fe75-1d06-30e169b94770@redhat.com>
Date: Wed, 8 Dec 2021 10:59:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [qemu-web PATCH v4] Add Sponsors page
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211124103028.484302-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211124103028.484302-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Thomas Markey <admin@fosshost.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair23@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/11/2021 11.30, Philippe Mathieu-Daudé wrote:
> Add a page listing QEMU sponsors.
> 
> For now, only mention Fosshost which requested to be listed:
> https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05381.html
> 
> Cc: Thomas Markey <admin@fosshost.org>
> Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/2
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---

Thanks - after considering 
https://lore.kernel.org/qemu-devel/YZ5NIo3XKLm1pRL2@redhat.com/ I've finally 
applied the patch now:

  https://www.qemu.org/sponsors/

Sorry for the delay.

  Thomas


