Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C99732AC76
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 23:10:16 +0100 (CET)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHDDb-00086s-Lp
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 17:10:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHDCX-0007X9-0X
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 17:09:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHDCU-0002Pn-Mj
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 17:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614722945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxTe2yfLF/MO8vtz8ObR+CYyz38b8Xp/Foio78wRQd0=;
 b=ArdqfsT92dbqmjt+0tu0lnzKIk+OwhWcA7djdU8/ax3ZS6TVosjpvSmIzgonS5gj3EtIyd
 Wg0+FviQpu5RSmM+n/HA/Ijb2sH6prxLu3KTEYYRWDfyron4RI1deHeTIMpjS5uQtgkzYJ
 cOlePQMB+EhE/IThueBJFxxAzTjjJgM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-0vEOeA6CPoG8ZE8yFzltag-1; Tue, 02 Mar 2021 17:09:03 -0500
X-MC-Unique: 0vEOeA6CPoG8ZE8yFzltag-1
Received: by mail-wr1-f72.google.com with SMTP id p15so11650649wre.13
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 14:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=KXI535Z0Ohhr3QocY591wey+aSMoadkmsSGnH79y/o8=;
 b=o6dF6KDCH4rS+EI3tT5xVpLUW8DToaE9kjWdDRmNZZF73ENZ45/1Pc/8m8rS6dXGDH
 yFrUNShkq6qcE00R0OOhHognbtEll1/86McMKQ8k9qhARAacO5ApjbQpDswOmfg2DtgG
 dXmI2CuyrtRo3FwdAhz6WrcYWg/ZB1acBbrzrxQNG7KB+e6DC4uRP2WIDKjZ88bH3EXH
 fxwDKJJZPT7fFpy81cyAfJLUx/Hpddz8MP6euSZ4MZqse3d2m3/EbzmpsMGW+gfp/4a1
 /gxTG1qekFPofiTr3gnQ71ZBDZrw4px1c4mO1apljKrrz5TTaJScDey99gSG1cWHpNcy
 Hf4g==
X-Gm-Message-State: AOAM533wXC8JGIVexxZJGCUAp30h47NsOl01GG1olv5Kt4hG3NNwl3Ro
 HAoL01iTiqGdpQwHqzILEEDswNrK4oNi0KWUG9RvsiUB/uIO3yCJJyFRK90QJ9mszPxFGZs5d2/
 +jL5tfN2OzPj2JeE=
X-Received: by 2002:a1c:cc14:: with SMTP id h20mr5998313wmb.14.1614722941947; 
 Tue, 02 Mar 2021 14:09:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz81xH5vJquR/18330hAQm+hCOdegedCleZWCTuKN00136mMJd0uFyA85imCQ7mnlpOg9Fllw==
X-Received: by 2002:a1c:cc14:: with SMTP id h20mr5998295wmb.14.1614722941642; 
 Tue, 02 Mar 2021 14:09:01 -0800 (PST)
Received: from [192.168.3.108] (p5b0c671d.dip0.t-ipconnect.de. [91.12.103.29])
 by smtp.gmail.com with ESMTPSA id
 p16sm18498586wrt.54.2021.03.02.14.09.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 14:09:01 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] target/s390x: Implement the MVPG condition-code-option bit
Date: Tue, 2 Mar 2021 23:09:00 +0100
Message-Id: <BB9F19BA-B5DC-49A0-A8DB-5271B710B73A@redhat.com>
References: <e71f6b5e-ff83-ee5d-8dcf-446c2c1a165e@linaro.org>
In-Reply-To: <e71f6b5e-ff83-ee5d-8dcf-446c2c1a165e@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: iPhone Mail (18D52)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> Am 02.03.2021 um 22:46 schrieb Richard Henderson <richard.henderson@linar=
o.org>:
>=20
> =EF=BB=BFOn 3/2/21 11:25 AM, David Hildenbrand wrote:
>>> On 02.03.21 20:12, Thomas Huth wrote:
>>> If the CCO bit is set, MVPG should not generate an exception
>>> but report page translation faults via a CC code, so we have
>>> to check the translation in this case before calling the
>>> access_prepare() function.
>>>=20
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   This patch is required to get Claudio's new kvm-unit-tests patches
>>>   working with TCG: https://www.spinics.net/lists/kvm/msg236784.html
>>>=20
>>>   target/s390x/cpu.h         | 14 ++++++++++++++
>>>   target/s390x/excp_helper.c | 14 --------------
>>>   target/s390x/mem_helper.c  | 23 ++++++++++++++++++++++-
>>>   3 files changed, 36 insertions(+), 15 deletions(-)
>>>=20
>>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>>> index 60d434d5ed..731e2c6452 100644
>>> --- a/target/s390x/cpu.h
>>> +++ b/target/s390x/cpu.h
>>> @@ -366,6 +366,20 @@ static inline int cpu_mmu_index(CPUS390XState *env=
, bool ifetch)
>>>   #endif
>>>   }
>>> +static inline uint64_t cpu_mmu_idx_to_asc(int mmu_idx)
>>> +{
>>> +    switch (mmu_idx) {
>>> +    case MMU_PRIMARY_IDX:
>>> +        return PSW_ASC_PRIMARY;
>>> +    case MMU_SECONDARY_IDX:
>>> +        return PSW_ASC_SECONDARY;
>>> +    case MMU_HOME_IDX:
>>> +        return PSW_ASC_HOME;
>>> +    default:
>>> +        abort();
>>> +    }
>>> +}
>>> +
>>>   static inline void cpu_get_tb_cpu_state(CPUS390XState* env, target_ul=
ong *pc,
>>>                                           target_ulong *cs_base, uint32=
_t *flags)
>>>   {
>>> diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
>>> index ce16af394b..44bff27f8f 100644
>>> --- a/target/s390x/excp_helper.c
>>> +++ b/target/s390x/excp_helper.c
>>> @@ -105,20 +105,6 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
>>>   #else /* !CONFIG_USER_ONLY */
>>> -static inline uint64_t cpu_mmu_idx_to_asc(int mmu_idx)
>>> -{
>>> -    switch (mmu_idx) {
>>> -    case MMU_PRIMARY_IDX:
>>> -        return PSW_ASC_PRIMARY;
>>> -    case MMU_SECONDARY_IDX:
>>> -        return PSW_ASC_SECONDARY;
>>> -    case MMU_HOME_IDX:
>>> -        return PSW_ASC_HOME;
>>> -    default:
>>> -        abort();
>>> -    }
>>> -}
>>> -
>>>   bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>>>                          MMUAccessType access_type, int mmu_idx,
>>>                          bool probe, uintptr_t retaddr)
>>> diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
>>> index 25cfede806..c7037adf2c 100644
>>> --- a/target/s390x/mem_helper.c
>>> +++ b/target/s390x/mem_helper.c
>>> @@ -855,10 +855,31 @@ uint32_t HELPER(mvpg)(CPUS390XState *env, uint64_=
t r0, uint64_t r1, uint64_t r2)
>>>       r1 =3D wrap_address(env, r1 & TARGET_PAGE_MASK);
>>>       r2 =3D wrap_address(env, r2 & TARGET_PAGE_MASK);
>>> +    /*
>>> +     * If the condition-code-option (CCO) bit is set and DAT is enable=
d,
>>> +     * we have to check for page table translation faults first:
>>> +     */
>>> +#ifndef CONFIG_USER_ONLY
>>> +    if (extract64(r0, 8, 1) && mmu_idx !=3D MMU_REAL_IDX) {
>>> +        uint64_t asc =3D cpu_mmu_idx_to_asc(mmu_idx);
>>> +        uint64_t raddr, tec;
>>> +        int flags, exc;
>>> +
>>> +        exc =3D mmu_translate(env, r2, MMU_DATA_LOAD, asc, &raddr, &fl=
ags, &tec);
>>> +        if (exc) {
>>> +            return 2;
>>> +        }
>>> +
>>> +        exc =3D mmu_translate(env, r1, MMU_DATA_STORE, asc, &raddr, &f=
lags, &tec);
>>> +        if (exc && exc !=3D PGM_PROTECTION) {
>>> +            return 1;
>>> +        }
>>> +    }
>>> +#endif
>>> +
>> This way you always need two additional translations and don't even chec=
k if we have something in the TLB. While this works, it's quite inefficient=
.
>> Using probe_access_flags() we can actually lookup the tlb/fill the tlb b=
ut get an error instead of a fault. We could e.g., extent probe_access() to=
 allow specifying whether we want a fault or not.
>=20
> I think probe_access_flags() will do all that you need; no further extens=
ion to probe_access() required.  I presume you meant access_prepare() is wh=
at you meant to extend?

I was worrying about watchpoint handling etc. as done in probe_access().

But I think what you mean is we can simply do two probe_access_flags() to c=
atch these special pgm interrupt, followed by existing access_prepare(). Th=
at should work I guess.


