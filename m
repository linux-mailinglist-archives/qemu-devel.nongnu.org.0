Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A406FF66D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:49:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8Xf-0002mE-AW; Thu, 11 May 2023 11:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8Xb-0002kt-1C
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:49:15 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8XZ-0003ii-96
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:49:14 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f450815d02so16944385e9.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683820151; x=1686412151;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GS5AG10nBfgD3BS5w/a6dOsvuF4wqeOs390JT7gbkww=;
 b=oQ+R0mP1pa/uREYow27qTJwaIIrd9rE9L+Ps5kg3Dd1g8c8czGaU5MmsBWSngsgKn2
 20BoyYY/PEeiUK6trJWGYvTx07QqSt3ixmnLDEPU/8hYJGKZEBHz/Uqetn2zBQAqta92
 8eAix9akR+Pyh92BeGEnVB+CquUmKIVvXK6zRx2mBXb5Yzwz0iqNgcDWAt2GRS8PkNNX
 TmIgNkEOsXDQMiBBEzhf9JQRl5TPgfYVcmsN6ZmkwylQpkDsGosYiyOdzZU+xWvcErA2
 WP7LfRYwqZcwEadHAH4vVqVHjIV7eVHOr6x86QiLb52Jr0itYj/nJ/x1e6ljt8s4Uc7Y
 fQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683820151; x=1686412151;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GS5AG10nBfgD3BS5w/a6dOsvuF4wqeOs390JT7gbkww=;
 b=YaiEZ4JwDv63qGywnH/bh8VEuRNH7+d5jl226Rc9cnCZ1zIRY5qynQMHGs3LYLSA1w
 RL37TmTjPEVPC/dPJNX9o2Qq0S4hruQ0rkJ+jdj6YmKkt2qh6p320HeKW4TqSEbr0zwD
 O2dC1t2bCHHxUfeJFTiDLX8HXIZLUDCSSDtLaHn9WW3k4K5Li0EJ73V5Z17KeZk4GFY0
 oXsxc9nk6JUDJ9G9hg8NcD8wz8GsvNp2dPqLpNWeL/Zb1NFkal17RS1RXvVdTONCge8r
 K8mSdPxySuYDW/vXcQUQptFq1vlKf6BUSd0IX9D+ek7sBrRQgDY9FljduH8ryw1leaqR
 3sEQ==
X-Gm-Message-State: AC+VfDzHWRxCnMCdLSU2fno9SJIM0MNT2+ZOwh5O11k8Txt6/xTXyo+X
 rwt7ucW7WHLb9OLcmM5cP9oCpQ==
X-Google-Smtp-Source: ACHHUZ7owZNIiZpJe2Tx3C19T6nHub/B+/2IP0LwnEOH56DXAyFogfurtGtJntFLt5yHNV8ZJJSXgA==
X-Received: by 2002:a1c:f211:0:b0:3ef:8b0:dbb1 with SMTP id
 s17-20020a1cf211000000b003ef08b0dbb1mr14987265wmc.7.1683820151347; 
 Thu, 11 May 2023 08:49:11 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a11-20020adfeecb000000b003048477729asm20669293wrp.81.2023.05.11.08.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 08:49:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8424C1FFBB;
 Thu, 11 May 2023 16:49:10 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-11-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 10/84] accel/tcg: Widen plugin_gen_empty_mem_callback to
 i64
Date: Thu, 11 May 2023 16:47:16 +0100
In-reply-to: <20230503072331.1747057-11-richard.henderson@linaro.org>
Message-ID: <87r0rm27ih.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Since we do this inside gen_empty_mem_cb anyway, let's
> do this earlier inside tcg expansion.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/plugin-gen.h |  4 ++--
>  accel/tcg/plugin-gen.c    |  9 +++------
>  tcg/tcg-op-ldst.c         | 28 ++++++++++++++++++++--------
>  3 files changed, 25 insertions(+), 16 deletions(-)
>
> diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
> index 5f5506f1cc..3af0168e65 100644
> --- a/include/exec/plugin-gen.h
> +++ b/include/exec/plugin-gen.h
> @@ -27,7 +27,7 @@ void plugin_gen_insn_start(CPUState *cpu, const struct =
DisasContextBase *db);
>  void plugin_gen_insn_end(void);
>=20=20
>  void plugin_gen_disable_mem_helpers(void);
> -void plugin_gen_empty_mem_callback(TCGv addr, uint32_t info);
> +void plugin_gen_empty_mem_callback(TCGv_i64 addr, uint32_t info);
>=20=20
>  static inline void plugin_insn_append(abi_ptr pc, const void *from, size=
_t size)
>  {
> @@ -69,7 +69,7 @@ static inline void plugin_gen_tb_end(CPUState *cpu)
>  static inline void plugin_gen_disable_mem_helpers(void)
>  { }
>=20=20
> -static inline void plugin_gen_empty_mem_callback(TCGv addr, uint32_t inf=
o)
> +static inline void plugin_gen_empty_mem_callback(TCGv_i64 addr, uint32_t=
 info)
>  { }
>=20=20
>  static inline void plugin_insn_append(abi_ptr pc, const void *from, size=
_t size)
> diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
> index 55e892b684..34be1b940c 100644
> --- a/accel/tcg/plugin-gen.c
> +++ b/accel/tcg/plugin-gen.c
> @@ -124,23 +124,20 @@ static void gen_empty_inline_cb(void)
>      tcg_temp_free_i64(val);
>  }
>=20=20
> -static void gen_empty_mem_cb(TCGv vaddr, uint32_t info)
> +static void gen_empty_mem_cb(TCGv_i64 addr, uint32_t info)

You bounced the name a few times in this series:

  445a4a2f14 accel/tcg: Widen plugin_gen_empty_mem_callback to i64
  modified   accel/tcg/plugin-gen.c
  @@ -127,3 +127,3 @@
  -static void gen_empty_mem_cb(TCGv vaddr, uint32_t info)
  +static void gen_empty_mem_cb(TCGv_i64 addr, uint32_t info)
   {
       TCGv_i32 cpu_index =3D tcg_temp_ebb_new_i32();

  8b99baa592 accel/tcg: Merge do_gen_mem_cb into caller
  modified   accel/tcg/plugin-gen.c
  @@ -148,3 +127,3 @@
  -static void gen_empty_mem_cb(TCGv addr, uint32_t info)
  +static void gen_empty_mem_cb(TCGv vaddr, uint32_t info)
   {
  -    do_gen_mem_cb(addr, info);
  +    TCGv_i32 cpu_index =3D tcg_temp_ebb_new_i32();

  38b47b19ec plugin-gen: add module for TCG-related code
  modified   accel/tcg/plugin-gen.c
  @@ -0,0 +145,3 @@
  +static void gen_empty_mem_cb(TCGv addr, uint32_t info)
  +{
  +    do_gen_mem_cb(addr, info);

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

