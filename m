Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BE864AA1F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 23:21:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4r9P-0001sr-RR; Mon, 12 Dec 2022 17:19:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4r9H-0001rM-LO
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:19:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4r9F-0008VR-8N
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:19:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670883584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IHI9gKRF5+vXRTGhLgS/mHuw6rkz+FhOHNOI5K062/w=;
 b=ILk65os4MN2HHZjDzH8IkINKkIG7YKQNCCr0irfxah9OFC3fa9uJ9QRPsoN2z0QsJNyxhd
 jdvhOu54IS5vw4opPIMmUi7k3fmkRCcO+kaLUthZhBx/2mSEbupqx+5upga08hXvDpQpMw
 Mid0wSK5Iqpfcxthcfy9WBkTIoZnmMA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-CBrUmYOwOQS5xRLtmyqbPA-1; Mon, 12 Dec 2022 17:19:43 -0500
X-MC-Unique: CBrUmYOwOQS5xRLtmyqbPA-1
Received: by mail-wm1-f70.google.com with SMTP id
 h81-20020a1c2154000000b003d1c8e519fbso4713052wmh.2
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 14:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IHI9gKRF5+vXRTGhLgS/mHuw6rkz+FhOHNOI5K062/w=;
 b=dY4iM/yzvbTjQ9dXjFA9JwwO/jj5a80PhDRHGkOUaaxv4R98Qs4m+fc3M6TsHK5X9d
 PZy084SqftkcnerMk9oocHWQFe7T+SiZZ9xpOjGUfwE9n1uM0xLarpYgKjoxsQnsGdov
 kBPD4nQodJaoD9Bik+2aVK0KF2vIqTUSZrc9VlCOnmeExCYNXGhPxcmmASq+Qv8guxSa
 SGqpViVprTA03UGz0jPF00wDtIHt9OO5/xjzo9j7xCCc9Dy/FPIvHrW/W9X2yw0r2kO+
 dtsRkyS7/NR7vCfBjgSTXzVu6sQxHWxzvffwTt1nRPiJiyICb9EweDgfLj5dGB6o2rP0
 dg/Q==
X-Gm-Message-State: ANoB5pmy0rYSyrcQYgutCAlMpJCbNgqTxkCypTVVDKrbcD3V83WPchl3
 ZaIsRpTluVk5FVP4qXGCCmEq04xRzUIl4KEdhUrOxVh2v+gjzqnnahQTNBd/HfWJerOB14G0RUd
 BQT5Za8JFnZT0Wz0=
X-Received: by 2002:a05:600c:3d96:b0:3cf:7704:50ce with SMTP id
 bi22-20020a05600c3d9600b003cf770450cemr13402448wmb.38.1670883582023; 
 Mon, 12 Dec 2022 14:19:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Jl4CGH41WyYLjRvF06rh/+MaTo7mFD/CtOfTXZ+BklhbskWEeMwcgol2+jDPVIDVp7jc1QA==
X-Received: by 2002:a05:600c:3d96:b0:3cf:7704:50ce with SMTP id
 bi22-20020a05600c3d9600b003cf770450cemr13402434wmb.38.1670883581760; 
 Mon, 12 Dec 2022 14:19:41 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 i2-20020a1c5402000000b003c6c182bef9sm12979260wmb.36.2022.12.12.14.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 14:19:41 -0800 (PST)
Message-ID: <c623ec7a-657d-09e2-b205-09e455924154@redhat.com>
Date: Mon, 12 Dec 2022 23:19:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/3] include/block: Untangle inclusion loops
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org
References: <20221208143939.2775453-1-armbru@redhat.com>
 <20221208143939.2775453-2-armbru@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221208143939.2775453-2-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/8/22 15:39, Markus Armbruster wrote:
>    * Global state (GS) API. These functions run under the BQL.
>    *
>    * See include/block/block-global-state.h for more information about
> - * the GS API.
> + * the GS API.b
>    */

One-character typo.

Paolo


