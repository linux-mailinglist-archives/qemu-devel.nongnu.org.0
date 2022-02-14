Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6AB4B5DF7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 23:56:45 +0100 (CET)
Received: from localhost ([::1]:51288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJkGy-0001QI-Hn
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 17:56:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJkFF-0000aH-PP; Mon, 14 Feb 2022 17:54:57 -0500
Received: from [2607:f8b0:4864:20::62d] (port=42532
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJkFE-0003e0-4y; Mon, 14 Feb 2022 17:54:57 -0500
Received: by mail-pl1-x62d.google.com with SMTP id z17so11657697plb.9;
 Mon, 14 Feb 2022 14:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=09Yfvog3+34dbrGhsqY5UV7pIpfc0o5g0YMFMrZFX7o=;
 b=oJX5u8tUKtyo99tyEX9KzRRldzLJ3AeAC9aWe4LmzMEQ0HP+mWD6+7Q3T5YTVQ+1Kj
 QZpLWDucvKvc81UzfOX+qjmiMESkU22LdEMrvcBfT8OlS384b0SKqk6UFNPaZhzlN+tH
 wCzhQLRf7llkp/l/t69rfirrZvMJsW+lwbpUwURlkU1iE9HlrcaNbaBPCGdMXkdy8zH8
 O3ZwgLost4V2gYBmN/YAuOTYqBZlUYue9f0iF7Z4TXtx8M9LiJvfSF8muWJuCQFKt530
 VMh82IwifDc5xLF29I+zNj5fV9oYmAm/ZoidDcOtxmbxkvm2p4ntDIf3qMQxHDNvfnm4
 Z6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=09Yfvog3+34dbrGhsqY5UV7pIpfc0o5g0YMFMrZFX7o=;
 b=qMfzE3E3TXOfbbD+for3BwslpWytJcFL425JkO2FDrE+aWL1YHQwboMLOJeGRzynqL
 A6q9DcRVhux1b8rmmAFnpNMwtS6GamFlpEMwbuIYcSrhDT0d/VdbActejcQVDG20gA89
 THkNhu7wRHBHWn7WpAgFXyhFzu94qvsZmnR9q1AtkPS9XnFANcPs3eWtdBIkoxFpMPx0
 UkQ0nNfTjSIZrK8GKxQRKLPPlBGg3RI/KpEkfUvYFRnSL/mvOjogNCWtushqQWTI6Vvv
 dL1s6M4P2Oxn1bY0/7fJJoyNCRPJOKjzsqRE9N1902Zt0x/wS28exUOhR9uVoHxwIm3/
 thHA==
X-Gm-Message-State: AOAM531ESxaSqClaZ2I3hXYV0fZeFzBGzVyKrm6l+5P5hatqbfGruPzM
 ADEky6I9u6gHQv8iIMPHpDY=
X-Google-Smtp-Source: ABdhPJyOk7dnRy1Ij9SX//fF0JAxno40Wo6JFgfSj7jhst5KaK0nC6uNroqcwqmRGpScfjm2dXvmng==
X-Received: by 2002:a17:90b:3b8f:b0:1b8:fe9e:b929 with SMTP id
 pc15-20020a17090b3b8f00b001b8fe9eb929mr981131pjb.165.1644879294296; 
 Mon, 14 Feb 2022 14:54:54 -0800 (PST)
Received: from localhost (27-33-251-132.static.tpgi.com.au. [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id mw8sm5373870pjb.8.2022.02.14.14.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 14:54:53 -0800 (PST)
Date: Tue, 15 Feb 2022 08:54:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] target/ppc/kvm: Use KVM_CAP_PPC_AIL_MODE_3 to
 determine cap-ail-mode-3 support
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-ppc@nongnu.org
References: <20220214111749.1542196-1-npiggin@gmail.com>
 <20220214111749.1542196-2-npiggin@gmail.com> <87sfsllhez.fsf@linux.ibm.com>
In-Reply-To: <87sfsllhez.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1644878889.dc8nyl60bz.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Excerpts from Fabiano Rosas's message of February 14, 2022 11:13 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> Use KVM_CAP_PPC_AIL_MODE_3 to determine cap-ail-mode-3 support for KVM
>> guests. Keep the fallback heuristic for KVM hosts that pre-date this
>> CAP.
>>
>> This is only proposed the KVM CAP has not yet been allocated. I will
>> ask to merge the new KVM cap when there are no objections on the QEMU
>> side.
>>
>> not-yet-Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  hw/ppc/spapr_caps.c       |  2 +-
>>  linux-headers/linux/kvm.h |  1 +
>>  target/ppc/kvm.c          | 18 +++++++++++++++++-
>>  target/ppc/kvm_ppc.h      |  4 ++--
>>  4 files changed, 21 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
>> index 5fd4a53c33..5cc80776d0 100644
>> --- a/hw/ppc/spapr_caps.c
>> +++ b/hw/ppc/spapr_caps.c
>> @@ -619,7 +619,7 @@ static void cap_ail_mode_3_apply(SpaprMachineState *=
spapr,
>>      ERRP_GUARD();
>> =20
>>      if (kvm_enabled()) {
>> -        if (!kvmppc_supports_ail_3()) {
>> +        if (!kvmppc_has_cap_ail_3()) {
>>              error_setg(errp, "KVM implementation does not support cap-a=
il-mode-3");
>>              error_append_hint(errp, "Try appending -machine cap-ail-mod=
e-3=3Doff\n");
>>              return;
>> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
>> index 02c5e7b7bb..d91f578200 100644
>> --- a/linux-headers/linux/kvm.h
>> +++ b/linux-headers/linux/kvm.h
>> @@ -1130,6 +1130,7 @@ struct kvm_ppc_resize_hpt {
>>  #define KVM_CAP_BINARY_STATS_FD 203
>>  #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
>>  #define KVM_CAP_ARM_MTE 205
>> +#define KVM_CAP_PPC_AIL_MODE_3 210
>> =20
>>  #ifdef KVM_CAP_IRQ_ROUTING
>> =20
>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>> index 128bc530d4..d0d0bdaac4 100644
>> --- a/target/ppc/kvm.c
>> +++ b/target/ppc/kvm.c
>> @@ -90,6 +90,7 @@ static int cap_ppc_nested_kvm_hv;
>>  static int cap_large_decr;
>>  static int cap_fwnmi;
>>  static int cap_rpt_invalidate;
>> +static int cap_ail_mode_3;
>> =20
>>  static uint32_t debug_inst_opcode;
>> =20
>> @@ -154,6 +155,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>      }
>> =20
>>      cap_rpt_invalidate =3D kvm_vm_check_extension(s, KVM_CAP_PPC_RPT_IN=
VALIDATE);
>> +    cap_ail_mode_3 =3D kvm_vm_check_extension(s, KVM_CAP_PPC_AIL_MODE_3=
);
>>      kvm_ppc_register_host_cpu_type();
>> =20
>>      return 0;
>> @@ -2563,10 +2565,24 @@ int kvmppc_has_cap_rpt_invalidate(void)
>>      return cap_rpt_invalidate;
>>  }
>> =20
>> -int kvmppc_supports_ail_3(void)
>> +int kvmppc_has_cap_ail_3(void)
>>  {
>>      PowerPCCPUClass *pcc =3D kvm_ppc_get_host_cpu_class();
>> =20
>> +    if (cap_ail_mode_3) {
>> +        return 1;
>> +    }
>> +
>> +    if (kvm_ioctl(kvm_state, KVM_CHECK_EXTENSION, KVM_CAP_PPC_AIL_MODE_=
3) =3D=3D 0) {
>> +        return 0;
>> +    }
>=20
> This is not needed here it seems.

This is to test whether the capability is recognised by the HV.=20
kvm_vm_check_extension() treats ioctl error as 0 capability but we want=20
to do this extra heuristic.

I'm not sure if there's a better standard way to do this.

Thanks,
Nick

