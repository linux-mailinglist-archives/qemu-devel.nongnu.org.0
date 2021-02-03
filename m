Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DFE30DFC2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:33:03 +0100 (CET)
Received: from localhost ([::1]:45120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7L5S-0007JB-Dt
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7KxZ-0000eG-SQ
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:24:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7KxW-0002mW-FI
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:24:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612369488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LOqMLwa5Tota4pD6n9aqoencQy2rVSn44E6E+gK9QEs=;
 b=MoEQzQjCY02Ntfrh/v1BvnUfLYN7oqEj8InzZ4lVAx7P8uN64Zgqz7H4VfKDVfkgTlYqwR
 oa3SnoAy/UzfmQo/8yeDO+dqYHU0ZVIvfcga3actPIbn9xBGVOu5425MELsW/yTnELeILz
 xNd4mAmY4shO4AGk++757wC/mg/waGU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-_bCV16TBMg2wTiLbx3YU5Q-1; Wed, 03 Feb 2021 11:24:47 -0500
X-MC-Unique: _bCV16TBMg2wTiLbx3YU5Q-1
Received: by mail-ej1-f69.google.com with SMTP id ar27so11259348ejc.22
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 08:24:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LOqMLwa5Tota4pD6n9aqoencQy2rVSn44E6E+gK9QEs=;
 b=BwAfMRW3NVI3XJ9fAI27068id8ZRDLbcDVtXtZ1jp81K8YDZWc7R8DVz+xHYnKn9UK
 EM9MDMhu9v39YRTHVCxKwORqoY9Xu6ng2eid1aiNbk3BBVcFe6njDounSPis7zN9VRLk
 YWlZSZ7omx7Ao2sr7ynk3gxfnA6yP7qAlpFVrLoa7a7CjS/Xu7hJVjGwb578pVMff4Ap
 iAjuDN7Y4iwub61/aI7chkof7QDCoGt+SmJWaIsmpZ1KpkcN6HGyjcaAh6AXHwJrQOYJ
 QTdEM2OVKxz5poxmx8UKDZhh6xxeF/AwmysX2Qg9T1Xs/oUoX/lIZkHozc6va5bWpDTM
 +KAA==
X-Gm-Message-State: AOAM531EqPqHZq0MVCEKn4na7nhlJyPUg/VmJSl7SNojncUgiZKFUN4Q
 ft5bmzumUhH1EduF7c9/ZxqARe53CSnTy+28WSkRFtVYahhU7iIoXJpKfTcaPB6nTjNGdsYjktp
 UmBZfDmckucGYymY=
X-Received: by 2002:a05:6402:13c8:: with SMTP id
 a8mr3704433edx.191.1612369485750; 
 Wed, 03 Feb 2021 08:24:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBzGHUvj4TN1+i7l3kQhtGfVX6gFVHv1GznyILDKThTCSsvIUcBPcclDpS1fU4FzuaEsx3YQ==
X-Received: by 2002:a05:6402:13c8:: with SMTP id
 a8mr3704384edx.191.1612369485295; 
 Wed, 03 Feb 2021 08:24:45 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id e11sm1204629ejz.94.2021.02.03.08.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 08:24:44 -0800 (PST)
Subject: Re: [PATCH] target/arm: Don't migrate CPUARMState.features
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA-qq-Eue+ktR1tNO7FZdtCe428=5vdA5472W-16p=d75A@mail.gmail.com>
 <20210203161340.55210-1-aaron@os.amperecomputing.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d45cb218-a3a5-6040-e588-50f31479a2c0@redhat.com>
Date: Wed, 3 Feb 2021 17:24:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203161340.55210-1-aaron@os.amperecomputing.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 5:13 PM, Aaron Lindsay wrote:
> As feature flags are added or removed, the meanings of bits in the
> `features` field can change between QEMU versions, causing migration
> failures. Additionally, migrating the field is not useful because it is
> a constant function of the CPU being used.

Please don't bury patches within mailing list threads.

BTW you found yet another 13 years old problem :)
918f5dca18d ("target-arm: Extend feature flags to 64 bits")
aa941b94450 ("Savevm/loadvm bits for ARM core, the PXA2xx peripherals
and Spitz hardware.")

> 
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index c9e9fd0a12..7f2511b6ed 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -834,7 +834,7 @@ const VMStateDescription vmstate_arm_cpu = {
>          VMSTATE_UINT64(env.exclusive_addr, ARMCPU),
>          VMSTATE_UINT64(env.exclusive_val, ARMCPU),
>          VMSTATE_UINT64(env.exclusive_high, ARMCPU),
> -        VMSTATE_UINT64(env.features, ARMCPU),
> +        VMSTATE_UNUSED(sizeof(uint64_t)),
>          VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
>          VMSTATE_UINT32(env.exception.fsr, ARMCPU),
>          VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
> 


