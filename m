Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888AA2C5F48
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 05:42:48 +0100 (CET)
Received: from localhost ([::1]:48586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiVap-0004Qr-K9
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 23:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiVZk-0003ra-ER
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 23:41:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiVZi-0001C7-P2
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 23:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606452097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZWCVFj85jqTfSDrscs3XCmi2JSwu/JGyt5L41/MZHOU=;
 b=GYwf91wWUNzaMbaaqq73D45xcnUkyjljDYcjX+DZ5Qvxb7inRPMspcUdkZY/8CCAvivLyh
 ZgRTOB3mNNHlNK+15V5p0xf9o+lTX6wQFhewj/BUQnVRsCICllIYv4dMnzdaburxm7BMDD
 rBn/nWiTjP8+NUzWngeOKIdFMmZnTyU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-CejjiJMmOuu8DyUk-uCW9g-1; Thu, 26 Nov 2020 23:41:36 -0500
X-MC-Unique: CejjiJMmOuu8DyUk-uCW9g-1
Received: by mail-ed1-f70.google.com with SMTP id n25so1956955edr.20
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 20:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZWCVFj85jqTfSDrscs3XCmi2JSwu/JGyt5L41/MZHOU=;
 b=s4DxIrhjhbY3lVvRx5/RarEtQcfhmHlWMZNG9rEOmb11TSQlA1fgtJqYDlKdi26cao
 y/uPOyfL3MAWSoDvSoNTLFS95cQLoemrdX/cQeBIKA7f36hiOx4rCheMO6rvrUdECfdg
 6dfEq9VqE3HuSO9fmoxWBzKxBkR82wHFaq7I9VwXDDfHSkCnmA2ozINmAixOl2+DlMUa
 At+h2t46YBC5SI+fMsu6AFkO/1lIhKLpOyH4Jz+hBoYBPi+HN6KpX5GvuoAaPEVSHTWP
 hp2f6bJfd4M5j0MumyU6mNBmXqpxD4UBynZ70dRRmDSEkit/IbUhHOU8EXy4szv5MKK2
 MhnA==
X-Gm-Message-State: AOAM530fycBGOzidVkoOgZ/mocTse67cPFAaXgoKJtSNzNo8pkH9ETek
 pLwLw0YIo+ozChnRPhfAnUdPWaj0mpoyLgSnqVvcrFHOvhk/IV/LmOFqS02eR7+PinoqmxAcVcv
 f9feut78cG6xMi28=
X-Received: by 2002:aa7:c058:: with SMTP id k24mr5694979edo.263.1606452094893; 
 Thu, 26 Nov 2020 20:41:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhpNenukEglOX6vUcdBbv6y6M2t/As72V7OPnofNLR+jiE8plCnXMlM63eOtg3eMoWQXEjvA==
X-Received: by 2002:aa7:c058:: with SMTP id k24mr5694961edo.263.1606452094517; 
 Thu, 26 Nov 2020 20:41:34 -0800 (PST)
Received: from [192.168.10.118] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id h22sm4213231ejt.21.2020.11.26.20.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 20:41:33 -0800 (PST)
Subject: Re: [PATCH 4/8] arm: Synchronize CPU on PSCI on
To: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
References: <20201126213600.40654-1-agraf@csgraf.de>
 <20201126213600.40654-5-agraf@csgraf.de>
 <CAFEAcA_XZu07Fg3G05VWYDYTJfMSAzOH5yyd=rFLJVa73juDtw@mail.gmail.com>
 <785c216b-d4b5-b65f-1ddf-4c6374b72ece@csgraf.de>
 <CAFEAcA9QUfBQpmH=8_A+xDm53GkkOgFEDnkTDXOX_1A-bFg0Ng@mail.gmail.com>
 <284d0cd2-268b-b937-3a6e-d074ce28baee@csgraf.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3594db71-c72f-2946-ffa5-47da737900c6@redhat.com>
Date: Fri, 27 Nov 2020 05:41:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <284d0cd2-268b-b937-3a6e-d074ce28baee@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/11/20 00:32, Alexander Graf wrote:
> 
> On 26.11.20 23:26, Peter Maydell wrote:
>> On Thu, 26 Nov 2020 at 22:16, Alexander Graf <agraf@csgraf.de> wrote:
>>> cpu_synchronize_state() sets the CPU registers into "dirty" state which
>>> means that env now holds the current copy. On the next entry, we then
>>> sync them back into HVF.
>>>
>>> Without the cpu_synchronize_state() call, HVF never knows that the CPU
>>> state is actually dirty. I guess it could as well live in cpu_reset()
>>> somewhere, but we have to get the state switched over to dirty one way
>>> or another.
>>>
>>> One interesting thing to note here is that the CPU actually comes up in
>>> "dirty" after init. But init is done on realization already. I'm not
>>> sure why we lose the dirty state in between that and the reset.
>> Yeah, it sounds like you need to figure out where the dirty
>> to not-dirty transitions ought to be happening rather than
>> just fudging things here...
> 
> 
> When init is complete (system is ready to launch), the CPU state is 
> pushed to HVF and dirty is set to false. So by design, a normal 
> cpu_reset doesn't have vcpu_dirty set.
> 
> How about this patch instead?
> 
> Alex
> 
> 
> 
> commit 8c61bc4d613b01e251b6b2f892d1a55a333c6e37
> Author: Alexander Graf <agraf@csgraf.de>
> Date:   Thu Nov 26 02:47:09 2020 +0100
> 
>      hvf: arm: Mark CPU as dirty on reset
> 
>      When clearing internal state of a CPU, we should also make sure 
> that HVF
>      knows about it and can push the new values down to vcpu state.
> 
>      Make sure that with HVF enabled, we tell it that it should synchronize
>      CPU state on next entry after a reset.
> 
>      This fixes PSCI handling, because now newly pushed state such as X0 
> and
>      PC on remote CPU enablement also get pushed into HVF.
> 
>      Signed-off-by: Alexander Graf <agraf@csgraf.de>
> 
> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
> index b75f813b40..a49a5b32e6 100644
> --- a/target/arm/arm-powerctl.c
> +++ b/target/arm/arm-powerctl.c
> @@ -15,6 +15,7 @@
>   #include "arm-powerctl.h"
>   #include "qemu/log.h"
>   #include "qemu/main-loop.h"
> +#include "sysemu/hw_accel.h"
> 
>   #ifndef DEBUG_ARM_POWERCTL
>   #define DEBUG_ARM_POWERCTL 0
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index db6f7c34ed..9a501ea4bd 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -411,6 +411,8 @@ static void arm_cpu_reset(DeviceState *dev)
>   #ifndef CONFIG_USER_ONLY
>       if (kvm_enabled()) {
>           kvm_arm_reset_vcpu(cpu);
> +    } else if (hvf_enabled()) {
> +        s->vcpu_dirty = true;
>       }
>   #endif
> 

Why only for HVF and only for ARM?  For example hax_init_vcpu and 
whpx_init_vcpu both set s->vcpu_dirty; should you just set it 
unconditionally in cpu_common_reset?

Thanks,

Paolo


