Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55294EA93A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 10:29:19 +0200 (CEST)
Received: from localhost ([::1]:43938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ7E6-0000bb-Cr
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 04:29:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nZ79x-00074S-7F; Tue, 29 Mar 2022 04:25:02 -0400
Received: from [2607:f8b0:4864:20::102b] (port=40901
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nZ79v-0004kY-G8; Tue, 29 Mar 2022 04:25:00 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so1410280pjb.5; 
 Tue, 29 Mar 2022 01:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=O3Eh9db0TZZPmvH3t+d287WZTnxgzOpcDo7XZl01kvU=;
 b=NcM5R8Ol+tAyTEBFdYlZ+qEWTDaVqLlTfvaznVpaIS9CpUpnKdpZ3fHrSsjsJy7Yd6
 j+9+PXcgcgkA5cNHWJfpwkR6xUUiuLN+ny5pupBOvyAr14bJKbcElWsz0axTrYs97VmC
 cLOoj0rN9nqCX45a8FGRf/m/45puFlx6NhsMwMol+ZJK2sJv1HDoKVfcalkIi6xoSDNv
 H5xAtmCOkQv7eIfLtA/RuyMT9718RNVLzB5jvL4ADuV6xv+8KXkvoGCLsq03W32uTc/i
 y0KtBBNHLbiRvb+3RU0WZr7roU0Ny2dmNAw9a0Mpt92qvZ7MvHe4tO5NEhRpZs36OxRg
 ho0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=O3Eh9db0TZZPmvH3t+d287WZTnxgzOpcDo7XZl01kvU=;
 b=2Z5JDH8JuRyYnGvEPe7ZIPCTMesaJq7ag3WXoD1bYowgJp9uX+ekMXOf9kJFglNf2W
 Ck7D68SEG/HzSarEy93FFY5ygfFRpLYGOhTRNkL+9TX+MSkv9qvHx9TqJtPR2+6ooD3y
 7PKurUXBKZIMGgFCj35T0WlyRibjxFQ0MwEOTCnvJyptPrJ8OzqmesCLubt70aamtH3U
 gOMAQE8K7vZmZ78lHaUaT79Qz6FLhRaLrkUkqPXtFop+8lWXJcRw9mNHOp1iZJIodRH6
 ZewMctDTBnPOwR1njaSekjj8VkCjgJ5rbrvyUT/uSLTPP+he6N1JKH0lcBe1fLg0dMMr
 UA+Q==
X-Gm-Message-State: AOAM530oq6zDz/hX6pRqPfs+kpQUnRbZYmFoaViNPunnaAWKoeTJuFnD
 4288xual9umcfztFzFLtasE=
X-Google-Smtp-Source: ABdhPJx6+gb99dEp8rGOVClZE3ojATkcEjBFQIqSPQTNXdxz2BWk2fxUkCTdFy7dotkFhW2AnTJW7g==
X-Received: by 2002:a17:902:7c0d:b0:155:d507:3cf0 with SMTP id
 x13-20020a1709027c0d00b00155d5073cf0mr20385873pll.103.1648542297572; 
 Tue, 29 Mar 2022 01:24:57 -0700 (PDT)
Received: from localhost (58-6-255-110.tpgi.com.au. [58.6.255.110])
 by smtp.gmail.com with ESMTPSA id
 be11-20020a056a001f0b00b004fb29215dd9sm10010503pfb.30.2022.03.29.01.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 01:24:57 -0700 (PDT)
Date: Tue, 29 Mar 2022 18:24:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 2/2] spapr: Move nested KVM hypercalls under a TCG only
 config.
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220325221113.255834-1-farosas@linux.ibm.com>
 <20220325221113.255834-3-farosas@linux.ibm.com>
In-Reply-To: <20220325221113.255834-3-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1648542276.ugrvtxeia2.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from Fabiano Rosas's message of March 26, 2022 8:11 am:
> These are the spapr virtual hypervisor implementation of the nested
> KVM API. They only make sense when running with TCG.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  hw/ppc/spapr_hcall.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 08b50590a8..9244aa3ad8 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1473,7 +1473,7 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, targe=
t_ulong opcode,
>      return H_FUNCTION;
>  }
> =20
> -/* TCG only */
> +#ifdef CONFIG_TCG
>  #define PRTS_MASK      0x1f
> =20
>  static target_ulong h_set_ptbl(PowerPCCPU *cpu,
> @@ -1800,18 +1800,35 @@ out_restore_l1:
>      spapr_cpu->nested_host_state =3D NULL;
>  }
> =20
> -#ifdef CONFIG_TCG
> +static void hypercall_register_nested(void)
> +{
> +    spapr_register_hypercall(KVMPPC_H_SET_PARTITION_TABLE, h_set_ptbl);
> +    spapr_register_hypercall(KVMPPC_H_ENTER_NESTED, h_enter_nested);
> +    spapr_register_hypercall(KVMPPC_H_TLB_INVALIDATE, h_tlb_invalidate);
> +    spapr_register_hypercall(KVMPPC_H_COPY_TOFROM_GUEST, h_copy_tofrom_g=
uest);
> +}
> +
>  static void hypercall_register_softmmu(void)
>  {
>      /* DO NOTHING */
>  }
>  #else
> +void spapr_exit_nested(PowerPCCPU *cpu, int excp)
> +{
> +    g_assert_not_reached();
> +}
> +
>  static target_ulong h_softmmu(PowerPCCPU *cpu, SpaprMachineState *spapr,
>                              target_ulong opcode, target_ulong *args)
>  {
>      g_assert_not_reached();
>  }
> =20
> +static void hypercall_register_nested(void)
> +{
> +    /* DO NOTHING */
> +}
> +
>  static void hypercall_register_softmmu(void)
>  {
>      /* hcall-pft */
> @@ -1881,10 +1898,7 @@ static void hypercall_register_types(void)
> =20
>      spapr_register_hypercall(KVMPPC_H_UPDATE_DT, h_update_dt);
> =20
> -    spapr_register_hypercall(KVMPPC_H_SET_PARTITION_TABLE, h_set_ptbl);
> -    spapr_register_hypercall(KVMPPC_H_ENTER_NESTED, h_enter_nested);
> -    spapr_register_hypercall(KVMPPC_H_TLB_INVALIDATE, h_tlb_invalidate);
> -    spapr_register_hypercall(KVMPPC_H_COPY_TOFROM_GUEST, h_copy_tofrom_g=
uest);
> +    hypercall_register_nested();
>  }
> =20
>  type_init(hypercall_register_types)
> --=20
> 2.35.1
>=20
>=20

