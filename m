Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F175EA9CA
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 17:11:22 +0200 (CEST)
Received: from localhost ([::1]:41840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocplR-0002MX-3c
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 11:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocpgW-0006aO-8D
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:06:19 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocpgT-0002HD-VD
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:06:15 -0400
Received: by mail-wr1-x429.google.com with SMTP id bq9so10709947wrb.4
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 08:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=ndzCbFVE+gYkvd7JbsgHyS2C4TcpX8OOkmzMSDAbtcw=;
 b=HEC6kpu83MfggJUxSfRWUStqjKOSY6PJCFXDR7iV459rG+mwL2b/jcdJQBPxB6xP/8
 LxA9OTKCgHlqgXYmIaYD2jdb8JXJ0Q/AVuXgojLCZI88wCtV9PBrkm+9vwGjnTV3Cngo
 YNdkb0CrbGy+N8RV+exlO74Wog+kAhJekwSszQed7ohghjCqWpzstEjVGFk/kX/ZFJYN
 csAwRe1qGPHmNJtq7/DmXJjgc/6YSOtTQ+HF731pP9XNHi4+fYknlVbV/FOdW1A5BMSP
 iPSGoaxcx6mMuXSSysvV+zBkMhpCvfz7v27vsyTv8VV3m46LzuW/3O17tGhk71Xom/Eo
 nbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=ndzCbFVE+gYkvd7JbsgHyS2C4TcpX8OOkmzMSDAbtcw=;
 b=xeJ5/xl00QyrdbHhkEffMO0F2+N1Iiay8fbQYBNqlFn/OCs8hfLeDYTVCJxYNXx0GE
 eCBTT6YJDYN6330khtXekbnPvibXYf0l9KucZU1E7LA/VxhvK+zrkZZXwrRzqVLIebL/
 7IgUJj08VWXgc397CL0tdp9d4YVErskKZH/iwccxBiPwwbN7Z5lSDZEP1Tt/+pMGJsgV
 IVD9O5spBJ89/TCmkktucbfxNpliYbtqnB7f+S4kobhdruW6le8RJd/cnq1D9yvcNU8f
 8vSh+3J15J6FbgEtZcM/xATPZbj22KBZuExK7HD/9+w1RY05yi3mAWAsFexJzxV1LgTo
 p3pQ==
X-Gm-Message-State: ACrzQf2f6mpKFjb4wB6sAXtj/6PL3elBd/LPj/ix70Gk4FhTBz+bRtB7
 kUX0kZc4VrtgPuieInGnav+KVw==
X-Google-Smtp-Source: AMsMyM4dDwhRz09lvFJ6BYUXL/MdvqttJt+RkGwQorM5Zmqef2UtQGDKAOSMSJI3qovFpg3QxQVDMg==
X-Received: by 2002:adf:de0b:0:b0:22a:c7f7:8eb4 with SMTP id
 b11-20020adfde0b000000b0022ac7f78eb4mr13795006wrm.195.1664204772303; 
 Mon, 26 Sep 2022 08:06:12 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a7bce8c000000b003b5054c6cd2sm13191139wmj.36.2022.09.26.08.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 08:06:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0F8041FFB7;
 Mon, 26 Sep 2022 16:06:11 +0100 (BST)
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-3-alex.bennee@linaro.org>
 <CAFEAcA-gpE6XYbiacSAso1_66RXYEJD04z4+HW4fFpqeCvpdQw@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 02/11] target/arm: enable tracking of CPU index in
 MemTxAttrs
Date: Mon, 26 Sep 2022 16:05:34 +0100
In-reply-to: <CAFEAcA-gpE6XYbiacSAso1_66RXYEJD04z4+HW4fFpqeCvpdQw@mail.gmail.com>
Message-ID: <87pmfi41lp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
>> Both arm_cpu_tlb_fill (for normal IO) and
>> arm_cpu_get_phys_page_attrs_debug (for debug access) come through
>> get_phys_addr which is setting the other memory attributes for the
>> transaction. As these are all by definition CPU accesses we can also
>> set the requested_type/index as appropriate.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  target/arm/ptw.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
>> index 3261039d93..644d450662 100644
>> --- a/target/arm/ptw.c
>> +++ b/target/arm/ptw.c
>> @@ -2315,6 +2315,9 @@ bool get_phys_addr(CPUARMState *env, target_ulong =
address,
>>  {
>>      ARMMMUIdx s1_mmu_idx =3D stage_1_mmu_idx(mmu_idx);
>>
>> +    attrs->requester_type =3D MEMTXATTRS_CPU;
>> +    attrs->requester_id =3D env_cpu(env)->cpu_index;
>> +
>
> This only catches the case where the memory access is
> done via something that does a virtual-to-physical translation.
> It misses memory accesses done directly on physical addresses,
> such as those in arm_ldl_ptw() and arm_ldq_ptw(), plus various
> M-profile specific ones.

I thought they were just used for the page table walk. Can you place
your page tables aliases with a piece of HW?

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

