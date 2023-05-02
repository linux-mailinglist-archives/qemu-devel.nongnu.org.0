Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EFF6F3CC4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 06:39:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pthlf-000089-I1; Tue, 02 May 2023 00:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pthld-00007v-Qf; Tue, 02 May 2023 00:37:33 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pthlb-0002g0-Kd; Tue, 02 May 2023 00:37:33 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1ab01bf474aso9914715ad.1; 
 Mon, 01 May 2023 21:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683002243; x=1685594243;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nbpUWJRO3DRROPQ4vxvhArHff4T9HPu++L4OfHhhbFc=;
 b=dUjNlfgLT9IV2s6zJCG6Uj/nvK7l71pfyGhc0F/CXFZZxlkit7o0x15uAISk/ru35d
 7qsYfZ9wErE7cPnpvBjvFtnLmRVbDBbwOrjgvaMxmcsLvQZmvOBJEQa6WtjzxmcjOtd8
 4qs1VYWI2VjT89CbB2AvhEegl4dKtoTRE/iv4Qa06LGukcENojHdJHuBwCtpgRPc+6oj
 dHdto6AV0VatBjAws5mMa/0ZoeEDwBLvCRObSs1yLbANMtTf7m2cZp63wGUeimXlE9yn
 1iXff/qsGCPwOeycd2YyQd+Pqwu400BKW0PhucErB6qbSDBkbMMkuipOKg8WxpDKDe9j
 ZYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683002243; x=1685594243;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nbpUWJRO3DRROPQ4vxvhArHff4T9HPu++L4OfHhhbFc=;
 b=ZCrCjhfX3bGDIrfggz4XEjju4d1MZnJ4/mIeOJv/R0fwYoJ32vi5qxvSgV0opCihgB
 6Uv4DUxVS31jtXH0HjYwfychXssDYcUa48xGtdz2tMF7I6ZtewO6g7P1+KWfRpPX/snh
 C+gxE52py4Jtib8IA5DNW+7jWavyx4djtVMQjPj5MGjQr7CZCq+D6bSVXVDw1R1/sQcR
 2Is6t8VkRYg1NmsCXQArQ5MRACFNx2oOHq++mc9ZfVPmjW49Eg7dg1I/hwqMGwI5C0dG
 1QFZBt/WzDUpVkRt+h6CR2q1ee+ZhJkfD+hcMkDpB+53vLfnZprVtfsdfVDue7PF37Dj
 LtRg==
X-Gm-Message-State: AC+VfDw1+6OyR+u5HB5m7VKS2HGfPAQ0g/Q8ECzcqcbwNE5ZXTa8pDqp
 1/ImKqgmrFkB9LN5kJnP8BM=
X-Google-Smtp-Source: ACHHUZ7ojgnIabK7EkFcSYB0f8y8N6cQY1G2XvYpUXqP0acr+96UB/w41huZUKb81ISyEgLeu8ga1Q==
X-Received: by 2002:a17:902:d2c7:b0:1ab:581:839e with SMTP id
 n7-20020a170902d2c700b001ab0581839emr2803550plc.65.1683002243177; 
 Mon, 01 May 2023 21:37:23 -0700 (PDT)
Received: from localhost (118-208-214-188.tpgi.com.au. [118.208.214.188])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902a40d00b001a687c505e6sm18626178plq.232.2023.05.01.21.37.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 21:37:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 May 2023 14:37:16 +1000
Message-Id: <CSBII1VGPEQB.3Q8OP9FELWTC3@wheely>
Cc: <qemu-devel@nongnu.org>, <farosas@suse.de>, <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/4] ppc: spapr: cleanup cr get/store in
 [h_enter|spapr_exit]_nested with helpers.
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Harsh Prateek Bora" <harshpb@linux.ibm.com>, <qemu-ppc@nongnu.org>
X-Mailer: aerc 0.14.0
References: <20230424144712.1985425-1-harshpb@linux.ibm.com>
 <20230424144712.1985425-2-harshpb@linux.ibm.com>
In-Reply-To: <20230424144712.1985425-2-harshpb@linux.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue Apr 25, 2023 at 12:47 AM AEST, Harsh Prateek Bora wrote:
> The bits in cr reg are grouped into eight 4-bit fields represented
> by env->crf[8] and the related calculations should be abstracted to
> keep the calling routines simpler to read. This is a step towards
> cleaning up the [h_enter|spapr_exit]_nested calls for better readability.
>
> Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
> Reviewed-by: Fabiano Rosas <farosas@suse.de>
> ---
>  hw/ppc/spapr_hcall.c | 18 ++----------------

Could you either convert all callers, or do implementation and
conversion as separate patches. Preference for former if you can
be bothered.

save_user_regs(), restore_user_regs(), gdb read/write register * 2,
kvm_arch_get/put_registers, monitor_get_ccr, at a quick glance.

>  target/ppc/cpu.c     | 17 +++++++++++++++++
>  target/ppc/cpu.h     |  2 ++
>  3 files changed, 21 insertions(+), 16 deletions(-)
>
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index ec4def62f8..124cee5e53 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c

[snip]

> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
> index 1a97b41c6b..3b444e58b5 100644
> --- a/target/ppc/cpu.c
> +++ b/target/ppc/cpu.c
> @@ -67,6 +67,23 @@ uint32_t ppc_get_vscr(CPUPPCState *env)
>      return env->vscr | (sat << VSCR_SAT);
>  }
> =20
> +void ppc_store_cr(CPUPPCState *env, uint64_t cr)

Set is normal counterpart to get. Or load and store, but
I think set and get is probably better.

Good refactoring though, it shouldn't be open-coded everywhere.

Thanks,
Nick

> +{
> +    for (int i =3D 7; i >=3D 0; i--) {
> +        env->crf[i] =3D cr & 15;
> +        cr >>=3D 4;
> +    }
> +}
> +
> +uint64_t ppc_get_cr(CPUPPCState *env)
> +{
> +    uint64_t cr =3D 0;
> +    for (int i =3D 0; i < 8; i++) {
> +        cr |=3D (env->crf[i] & 15) << (4 * (7 - i));
> +    }
> +    return cr;
> +}
> +
>  /* GDBstub can read and write MSR... */
>  void ppc_store_msr(CPUPPCState *env, target_ulong value)
>  {
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 557d736dab..b4c21459f1 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2773,6 +2773,8 @@ void dump_mmu(CPUPPCState *env);
>  void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int le=
n);
>  void ppc_store_vscr(CPUPPCState *env, uint32_t vscr);
>  uint32_t ppc_get_vscr(CPUPPCState *env);
> +void ppc_store_cr(CPUPPCState *env, uint64_t cr);
> +uint64_t ppc_get_cr(CPUPPCState *env);
> =20
>  /***********************************************************************=
******/
>  /* Power management enable checks                                       =
     */
> --=20
> 2.31.1


