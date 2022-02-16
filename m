Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4844B7C9B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 02:52:41 +0100 (CET)
Received: from localhost ([::1]:38432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK9Um-000712-6t
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 20:52:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nK9PR-0005x3-Mw; Tue, 15 Feb 2022 20:47:09 -0500
Received: from [2607:f8b0:4864:20::62c] (port=38463
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nK9PN-0007SL-PW; Tue, 15 Feb 2022 20:47:07 -0500
Received: by mail-pl1-x62c.google.com with SMTP id c3so821411pls.5;
 Tue, 15 Feb 2022 17:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Cv490oYRcM+V4RW679A4WGMabr1x4UH9R1W6J1h4Oe4=;
 b=ndd5+JvONeMV4/c/18WjSHOVMKOH7+Iawm2Y1pZLb+UpumJvbdOw6oWiqR9Ikc4YAl
 Q1EJkg3Syfp2NqyjrsM4x3ubDgTC4C3NiSoPHISlraA+7oYJLwWLmt7mpq8uV8HpP+rp
 nyXD0Iv8G5VatkNbRYUWfAeuEdIXjk42dFn0uHQXWij2zMsuv3mUc/NSies7p9GwVKYQ
 CTNMI1tlR7nYADY6C8xj/5YS3dt+/IGpDIxutZ9sIq3rgrkxLvj8nqzLqyNl3ryBUwlD
 M1bHg+UVeI5s5O//7mOjhT/4WhU+cCD82IMZkGwq+5pEj1Q2fKpUcp2S4OxPeAxgFQ+a
 u5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Cv490oYRcM+V4RW679A4WGMabr1x4UH9R1W6J1h4Oe4=;
 b=7lOWXfq8WYWEbxDSWzJgcuOAX2fXlG44kqhffBRLJzbRy9VpFzizeOvAAYqRJd5C1m
 B9LqgeaiuY+v84eAMz3KrXPu2UWR0JKNI/S1KEHq2LCsf2Chw9hcVe4V02TjLn5Kpztw
 eA5MnFuuWRIZB40AB0/IkdftumUOPbSsLt/BscYCrhqRdyScMDBX1p26i1oBV+QjnZBg
 y0BttEwASTgFBdErOJp5BLQdokqIxrWJ0t5LR7O46VG09OkwZg4KwTD/eFehFDCYqeKV
 WaCU3jkJjrz/ykViegYPkIh3Ya6XlREPr1Kb09MoiRmxjdnWRRA2nj8gct3I1pbvixT8
 8lzg==
X-Gm-Message-State: AOAM530dsqffI4IPryV95ThIP7xfaLZrvJG+Ll28qX7EGGSBvIPY0kpI
 LKflcd7RsjYUmP2Wb5S6PFA=
X-Google-Smtp-Source: ABdhPJwimCWlE2dfMH7gYTpgTmF+cAsbwVEtNrMNOmiJwtRSUajTc2Vo0fK1bhqGXzKHGa07MLr3Jw==
X-Received: by 2002:a17:90a:ead8:b0:1b9:f17d:4454 with SMTP id
 ev24-20020a17090aead800b001b9f17d4454mr307946pjb.104.1644976023955; 
 Tue, 15 Feb 2022 17:47:03 -0800 (PST)
Received: from localhost (60-241-140-189.static.tpgi.com.au. [60.241.140.189])
 by smtp.gmail.com with ESMTPSA id
 p17sm42806342pfh.59.2022.02.15.17.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 17:47:03 -0800 (PST)
Date: Wed, 16 Feb 2022 11:46:58 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] target/ppc/kvm: Use KVM_CAP_PPC_AIL_MODE_3 to
 determine cap-ail-mode-3 support
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-ppc@nongnu.org
References: <20220214111749.1542196-1-npiggin@gmail.com>
 <20220214111749.1542196-2-npiggin@gmail.com> <87sfsllhez.fsf@linux.ibm.com>
 <1644878889.dc8nyl60bz.astroid@bobo.none> <87tud0xqvb.fsf@linux.ibm.com>
In-Reply-To: <87tud0xqvb.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1644975678.e05ill5mjj.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from Fabiano Rosas's message of February 15, 2022 10:21 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> Excerpts from Fabiano Rosas's message of February 14, 2022 11:13 pm:
>>> Nicholas Piggin <npiggin@gmail.com> writes:
>>>=20
>>>> Use KVM_CAP_PPC_AIL_MODE_3 to determine cap-ail-mode-3 support for KVM
>>>> guests. Keep the fallback heuristic for KVM hosts that pre-date this
>>>> CAP.
>>>>
>>>> This is only proposed the KVM CAP has not yet been allocated. I will
>>>> ask to merge the new KVM cap when there are no objections on the QEMU
>>>> side.
>>>>
>>>> not-yet-Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>> ---
>>>>  hw/ppc/spapr_caps.c       |  2 +-
>>>>  linux-headers/linux/kvm.h |  1 +
>>>>  target/ppc/kvm.c          | 18 +++++++++++++++++-
>>>>  target/ppc/kvm_ppc.h      |  4 ++--
>>>>  4 files changed, 21 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
>>>> index 5fd4a53c33..5cc80776d0 100644
>>>> --- a/hw/ppc/spapr_caps.c
>>>> +++ b/hw/ppc/spapr_caps.c
>>>> @@ -619,7 +619,7 @@ static void cap_ail_mode_3_apply(SpaprMachineState=
 *spapr,
>>>>      ERRP_GUARD();
>>>> =20
>>>>      if (kvm_enabled()) {
>>>> -        if (!kvmppc_supports_ail_3()) {
>>>> +        if (!kvmppc_has_cap_ail_3()) {
>>>>              error_setg(errp, "KVM implementation does not support cap=
-ail-mode-3");
>>>>              error_append_hint(errp, "Try appending -machine cap-ail-m=
ode-3=3Doff\n");
>>>>              return;
>>>> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
>>>> index 02c5e7b7bb..d91f578200 100644
>>>> --- a/linux-headers/linux/kvm.h
>>>> +++ b/linux-headers/linux/kvm.h
>>>> @@ -1130,6 +1130,7 @@ struct kvm_ppc_resize_hpt {
>>>>  #define KVM_CAP_BINARY_STATS_FD 203
>>>>  #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
>>>>  #define KVM_CAP_ARM_MTE 205
>>>> +#define KVM_CAP_PPC_AIL_MODE_3 210
>>>> =20
>>>>  #ifdef KVM_CAP_IRQ_ROUTING
>>>> =20
>>>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>>>> index 128bc530d4..d0d0bdaac4 100644
>>>> --- a/target/ppc/kvm.c
>>>> +++ b/target/ppc/kvm.c
>>>> @@ -90,6 +90,7 @@ static int cap_ppc_nested_kvm_hv;
>>>>  static int cap_large_decr;
>>>>  static int cap_fwnmi;
>>>>  static int cap_rpt_invalidate;
>>>> +static int cap_ail_mode_3;
>>>> =20
>>>>  static uint32_t debug_inst_opcode;
>>>> =20
>>>> @@ -154,6 +155,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>>>      }
>>>> =20
>>>>      cap_rpt_invalidate =3D kvm_vm_check_extension(s, KVM_CAP_PPC_RPT_=
INVALIDATE);
>>>> +    cap_ail_mode_3 =3D kvm_vm_check_extension(s, KVM_CAP_PPC_AIL_MODE=
_3);
>>>>      kvm_ppc_register_host_cpu_type();
>>>> =20
>>>>      return 0;
>>>> @@ -2563,10 +2565,24 @@ int kvmppc_has_cap_rpt_invalidate(void)
>>>>      return cap_rpt_invalidate;
>>>>  }
>>>> =20
>>>> -int kvmppc_supports_ail_3(void)
>>>> +int kvmppc_has_cap_ail_3(void)
>>>>  {
>>>>      PowerPCCPUClass *pcc =3D kvm_ppc_get_host_cpu_class();
>>>> =20
>>>> +    if (cap_ail_mode_3) {
>>>> +        return 1;
>>>> +    }
>>>> +
>>>> +    if (kvm_ioctl(kvm_state, KVM_CHECK_EXTENSION, KVM_CAP_PPC_AIL_MOD=
E_3) =3D=3D 0) {
>>>> +        return 0;
>>>> +    }
>>>=20
>>> This is not needed here it seems.
>>
>> This is to test whether the capability is recognised by the HV.=20
>> kvm_vm_check_extension() treats ioctl error as 0 capability but we want=20
>> to do this extra heuristic.
>=20
> Do you intend to make the KVM capability return < 0 in case AIL_3 is not
> supported?

No it should return 0 in that case.

> AFAICS the unknown capability won't result in an ioctl error
> as kvm_vm_ioctl_check_extension always returns >=3D 0.

Oh. There is no way to tell that a host does not recognise a cap? :(

Great for the purity test, unknown cap =3D=3D unsupported. For a practical=20
point of view to catch such bugs and oversights there should have been
some way to handle it.

I'm not sure what to do then. Try some even worse hack and leave that
in for a couple of years to give upstream KVM a chance to trickle down.

Thanks,
Nick

