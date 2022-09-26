Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749A05EABCE
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 17:57:52 +0200 (CEST)
Received: from localhost ([::1]:41074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocqUQ-0001JR-Uf
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 11:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocqJk-0003bM-Nl
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:46:49 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocqJi-0008Dm-Ap
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:46:47 -0400
Received: by mail-wm1-x333.google.com with SMTP id ay36so4834827wmb.0
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 08:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=HLJ6CvfnZnNKY7RJIVqKr+WI201l9WGFgF471JMUjOQ=;
 b=ppZIv8+6qrJUWcEpssNzKPdYbbCHjuoeqSnWiOa8hBrrWZs3T2P5h2WnlZVPAPK0C+
 FMlQv03Ocq3B6q5LVWxznR4wTClWDtgTexk1l2yCDipPWDVQDTHuFMUKDdpidJVVnkKk
 YcES/Bc3rIanW11pezPLwp8coO9SGs52gnwl2wD0WAT1ecoo7z7OvVJEOWUae+1FFGki
 B9bxAaQkRKTS6bs1yn6/Gm9bzRogZ/t7mBRuGDRPb7vvnDQXJxnkQdF5Q1bKgfPUDrR9
 m0E8D2mAd8ld5kgsI2t+jChLIu3piTAyQPNeuNDCjUxZqQvqjLh/QJWUDETs+cpiBdvE
 9VjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=HLJ6CvfnZnNKY7RJIVqKr+WI201l9WGFgF471JMUjOQ=;
 b=ky73EPWPQlRqgu04QVFWo6HCzPTZ32nzsLTcpuE0Jb60GnYfYi2evGR/IQCQJkdmwn
 dsGOg0JF8PFi3ZZ5IDNt6KAKZLNSQm4JXwzYfhXCHKwuB5dr6FLtGuMtCyFmPiyHpRLH
 elm2RHFExarnKYqoRoOO9oXUElCTmXQNPbof+nbfEhuft57fXTyoxynKN1NSKHlHu8wy
 xTIRGrDbcJaHil2puqtfxMfABytcbqy1VPoMYRjAO6Z9uAejfeS6suNHwfPZ0ty0SsOD
 W0IxTZot2Z0imNQK2QYBEP/i4sL6Tfx/b4vVrRxgm6ss25OnyVpNiVP0e5fRsAmC0S37
 eeqA==
X-Gm-Message-State: ACrzQf2l/CT0RVgg/wmaW//zUB4q9OcqHAEtN18p8FcEAl45owRnyTi6
 jmJonQfVTFo4+xtMUT6LgSR2Nw==
X-Google-Smtp-Source: AMsMyM5+a5J+tIhwOP1b5XuwLZFmmfbGl+F2IFh8CTZICf4zcPSmBV0KCmtP4QQuOSdImZBwxz4P7w==
X-Received: by 2002:a05:600c:19cc:b0:3b4:b15a:7df with SMTP id
 u12-20020a05600c19cc00b003b4b15a07dfmr15648225wmq.185.1664207204985; 
 Mon, 26 Sep 2022 08:46:44 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a05600c3b0a00b003b47b913901sm25864734wms.1.2022.09.26.08.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 08:46:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BD0A51FFB7;
 Mon, 26 Sep 2022 16:46:43 +0100 (BST)
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-4-alex.bennee@linaro.org>
 <CAFEAcA9OF4DOvYcfLJ6msAVNe9t_Ufxu9gHWUiuZFj-9qq9epQ@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk,
 qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v2 03/11] target/arm: ensure HVF traps set appropriate
 MemTxAttrs
Date: Mon, 26 Sep 2022 16:46:14 +0100
In-reply-to: <CAFEAcA9OF4DOvYcfLJ6msAVNe9t_Ufxu9gHWUiuZFj-9qq9epQ@mail.gmail.com>
Message-ID: <87zgem2l5o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 26 Sept 2022 at 14:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>
>> As most HVF devices are done purely in software we need to make sure
>> we properly encode the source CPU in MemTxAttrs. This will allow the
>> device emulations to use those attributes rather than relying on
>> current_cpu (although current_cpu will still be correct in this case).
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Mads Ynddal <mads@ynddal.dk>
>> Cc: Alexander Graf <agraf@csgraf.de>
>> ---
>>  target/arm/hvf/hvf.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
>> index 060aa0ccf4..13b7971560 100644
>> --- a/target/arm/hvf/hvf.c
>> +++ b/target/arm/hvf/hvf.c
>> @@ -1233,11 +1233,11 @@ int hvf_vcpu_exec(CPUState *cpu)
>>              val =3D hvf_get_reg(cpu, srt);
>>              address_space_write(&address_space_memory,
>>                                  hvf_exit->exception.physical_address,
>> -                                MEMTXATTRS_UNSPECIFIED, &val, len);
>> +                                MEMTXATTRS_CPU(cpu->cpu_index), &val, l=
en);
>>          } else {
>>              address_space_read(&address_space_memory,
>>                                 hvf_exit->exception.physical_address,
>> -                               MEMTXATTRS_UNSPECIFIED, &val, len);
>> +                               MEMTXATTRS_CPU(cpu->cpu_index), &val, le=
n);
>>              hvf_set_reg(cpu, srt, val);
>>          }
>
> Don't we need a similar thing for KVM ? (In that case it's in
> the generic code in accel/kvm/kvm-all.c, for the KVM_EXIT_MMIO
> handling.)

Added to MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
which at least anticipates an out-of-kernel GIC.


>
> -- PMM


--=20
Alex Benn=C3=A9e

