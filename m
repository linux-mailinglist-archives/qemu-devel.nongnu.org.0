Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A376F640865
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 15:29:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p171z-0006XP-Ob; Fri, 02 Dec 2022 09:28:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p171r-0006Wk-2M
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 09:28:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p171p-0002to-Fu
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 09:28:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669991314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kg7q4G5EUubQrVZSdA5OSkKWQvbARmEKM47A2qeZPq8=;
 b=Bu9vlC9rfeStZnps8pm5BU+hCqenu/MDBnNBi/cpSZ0NkwLjQIWqRwZirOZ9eHFjXuciod
 bSGd8nSc2fY4m01/EhB5ZzV6r9v5suI9Gr4LIYyfayVFOpi8PgfMkY+mR7djBhMT3z5gJS
 92O2KDTjfckJ7XvLES4PdPFtvfcHd9U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-149-yP5pzaoyN6WwOGW7x0pRog-1; Fri, 02 Dec 2022 09:28:32 -0500
X-MC-Unique: yP5pzaoyN6WwOGW7x0pRog-1
Received: by mail-wm1-f72.google.com with SMTP id
 o5-20020a05600c510500b003cfca1a327fso2570856wms.8
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 06:28:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kg7q4G5EUubQrVZSdA5OSkKWQvbARmEKM47A2qeZPq8=;
 b=3MVKY2AanoB2koqJHOXhxtnYc5LOwfAm3citJGRNsYz1nyhdKT9P1sgeJ9pvAfUVe+
 CwAAMpxLKFoVskaQumIXKy38FmMFg1spW8N2nhC7LTs/yeF7WKpuD1v72KDPNctLS1ki
 dN0laoeLeCdqmoPKQNoHVaVBLj6iRo1ZXpK1LCf7R9X3K0DaYH/qM3EdBZcMterF83rQ
 2pjeBjznOQKUeQs6hKHqMCaCk38MvY6RL23EvSEAJY8ZTUFWG6Gm1CrkrVFXar96vQYJ
 iYDzrw8l2uWkwT4i80Lii36R3KLfgI3MKseByFEdUBF+k0oD0ZGHo+mf26PgqXK7XYdB
 n/4w==
X-Gm-Message-State: ANoB5plv91D9Z/hjsmkawslVmLsx3K2FIEckLlO1fK79Aq7xbZ/8DhSh
 Mlh9DRbg4oMEfKZBqlv+lAm0kuA3XbRBlLJuBQtFtbvn5OhUc7pNfPYYn14Z7qtJok5IgS2bbXN
 /RL2VxSW2gQAZ2Ks=
X-Received: by 2002:a5d:4a8c:0:b0:242:165e:7a79 with SMTP id
 o12-20020a5d4a8c000000b00242165e7a79mr15414239wrq.343.1669991311809; 
 Fri, 02 Dec 2022 06:28:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6B0x4yu4PnS/nopgeHGOjYfbG0Q/LhK8Mm9dLAdFqhyTBCXuZgBeTz6/Yn0dpK8KA1BUkw7w==
X-Received: by 2002:a5d:4a8c:0:b0:242:165e:7a79 with SMTP id
 o12-20020a5d4a8c000000b00242165e7a79mr15414229wrq.343.1669991311599; 
 Fri, 02 Dec 2022 06:28:31 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-86.web.vodafone.de.
 [109.43.178.86]) by smtp.gmail.com with ESMTPSA id
 s17-20020a5d5111000000b0022584c82c80sm7196391wrt.19.2022.12.02.06.28.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 06:28:31 -0800 (PST)
Message-ID: <5a5031b4-d00f-fcc0-6b47-38413dd6c308@redhat.com>
Date: Fri, 2 Dec 2022 15:28:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221130111559.52150-1-thuth@redhat.com>
 <CAFEAcA-hneP0SLUTW=_maTztra9gYnKgPeXevDcVu3jZZnDObA@mail.gmail.com>
 <95226bbe-9658-660c-12bb-dbf82b28dbd5@redhat.com>
Subject: Re: [PATCH for-8.0] hw/misc: Move some arm-related files from
 specific_ss into softmmu_ss
In-Reply-To: <95226bbe-9658-660c-12bb-dbf82b28dbd5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.258, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 02/12/2022 13.25, Thomas Huth wrote:
> On 01/12/2022 12.55, Peter Maydell wrote:
>> On Wed, 30 Nov 2022 at 11:16, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> By removing #include "kvm-consts.h" from arm-powerctl.h (seems not to
>>> be required there) and adjusting the header includes in some files, we
>>> can move them from specific_ss into softmmu_ss, so that they only need
>>> to be compiled once and not for qemu-system-arm and qemu-system-aarch64
>>> individually.
>>
>>> --- a/target/arm/arm-powerctl.h
>>> +++ b/target/arm/arm-powerctl.h
>>> @@ -11,8 +11,6 @@
>>>   #ifndef QEMU_ARM_POWERCTL_H
>>>   #define QEMU_ARM_POWERCTL_H
>>>
>>> -#include "kvm-consts.h"
>>> -
>>>   #define QEMU_ARM_POWERCTL_RET_SUCCESS QEMU_PSCI_RET_SUCCESS
>>>   #define QEMU_ARM_POWERCTL_INVALID_PARAM QEMU_PSCI_RET_INVALID_PARAMS
>>>   #define QEMU_ARM_POWERCTL_ALREADY_ON QEMU_PSCI_RET_ALREADY_ON
>>
>> kvm-consts.h is where QEMU_PSCI_RET_SUCCESS etc are defined.
>> So while the #include isn't strictly needed for compilation to work
>> because arm-powerctl.h only creates the #define and doesn't use it,
>> it does mean that any source file that uses the QEMU_ARM_POWERCTL_*
>> now needs to include kvm-consts.h somehow itself. (Usually this is
>> going to happen implicitly via target/arm/cpu.h, I think.)

Thinking about this a little bit more (and finally having a look at the 
contents of kvm-consts.h itself) ... I think there might be an even more 
elegant solution here: We could maybe apply the "#ifdef NEED_CPU_H" trick in 
kvm-consts.h (like it is e.g. done in include/sysemu/kvm.h) to avoid to 
touch the poisoned CONFIG_KVM macro in common code ... I'll give it a try, 
and if it works, I'll use that method for my v2 of this patch.

  Thomas


