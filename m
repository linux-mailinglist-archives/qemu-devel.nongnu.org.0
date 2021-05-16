Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7CB381EFD
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 15:06:17 +0200 (CEST)
Received: from localhost ([::1]:50896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGTI-0004sz-BK
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 09:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liGGg-0006dn-QW
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:53:15 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liGGc-0001Ny-HK
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:53:12 -0400
Received: by mail-wm1-x331.google.com with SMTP id z130so2078370wmg.2
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7qjmSdsxmiAEogZp5FkJGrdhnjhrabFQbjte2Ch0Zzs=;
 b=FKN60seIvWtXZEap1b1XrFAmcU8IY41XpiD2toSGwapaGIRFKiH1ZM3fdoPqgoy6q7
 vCQlYsxJpSnD38MLIL+RQhspWnOaj++ZgIIKqq2meLCn4csZW5k/pq9ogd3piyt9wWEe
 r0eM60DsGYvS7VA1PC8Buk5vwINgSvDnJD239wpnSpdOahL0z1eKM7FAQG6doqRIhXI+
 CFf9b26YRRC7FBv5H93PSemVVPDzotGFJmyZ/f1VRyuf74yo4/Ms/Zuv0YpdIRs8UyNn
 /TN+MVwwDYCt6S8ikcPPBsSljyzutF8IwntLRp1IG0Nn+GqLxZrb8pequRouhMPbuo/y
 BzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7qjmSdsxmiAEogZp5FkJGrdhnjhrabFQbjte2Ch0Zzs=;
 b=HbTg//kvwXPs+hqYdFGlt0zrdoxfQ/N/TLU8DFv+IHXOhZnHtQDx1KeZt2KUGGQF0+
 z2v+FxRBC7FjvW9QgyzZ86Kmw7S3hwLhvGvcIYYyNnmYfDO0qTXmETt8cY6dpE0Dv7qN
 Iybf7d8bqTatxHjquJgU72zw99vX0d5659Igfb8YZ7zVD/2h7Lx0StXs7oKJYxJNqWt7
 CN5Jqi+7GLG1JlwZtsSDeeNjc0MA1gSGMWwJA9e76r1AQDU0jNXEzhVFO6WtbftRaFsj
 wUZTxcfrQ51MDpQfeSFI+Lw93KXbuVp1U0u7HUeR0XU0W96OUArMWpqyP4Fp/s57LD/b
 sFfQ==
X-Gm-Message-State: AOAM533cllVAf+T2Akb/DPUXNzTodYSa40syBRJMAWEnU0Igy+ukumxR
 rLzsGJmW+5gCOfwXwyp21maVBeOMRc0Pdg==
X-Google-Smtp-Source: ABdhPJztAps5OY+eibOTD281f/KQki2oBecGekOoeTF2VscMC3G3lSjteL9VbbdiDiBUedbOrIKidA==
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr18530419wmh.102.1621169588601; 
 Sun, 16 May 2021 05:53:08 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id t7sm6758113wrs.87.2021.05.16.05.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 May 2021 05:53:08 -0700 (PDT)
Subject: Re: [PATCH v6 04/26] plugins: Drop tcg_flags from struct
 qemu_plugin_dyn_cb
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c1f14c27-f1bd-093f-959f-85b6c072e08a@amsat.org>
Date: Sun, 16 May 2021 14:53:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502235727.1979457-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 5/3/21 1:57 AM, Richard Henderson wrote:
> As noted by qemu-plugins.h, enum qemu_plugin_cb_flags is
> currently unused -- plugins can neither read nor write
> guest registers.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/plugin-helpers.h |  1 -
>  include/qemu/plugin.h      |  1 -
>  accel/tcg/plugin-gen.c     |  8 ++++----
>  plugins/core.c             | 30 ++++++------------------------
>  4 files changed, 10 insertions(+), 30 deletions(-)
> 
> diff --git a/accel/tcg/plugin-helpers.h b/accel/tcg/plugin-helpers.h
> index 1916ee7920..853bd21677 100644
> --- a/accel/tcg/plugin-helpers.h
> +++ b/accel/tcg/plugin-helpers.h
> @@ -1,5 +1,4 @@
>  #ifdef CONFIG_PLUGIN
> -/* Note: no TCG flags because those are overwritten later */
>  DEF_HELPER_2(plugin_vcpu_udata_cb, void, i32, ptr)
>  DEF_HELPER_4(plugin_vcpu_mem_cb, void, i32, i32, i64, ptr)
>  #endif
> diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
> index c5a79a89f0..0fefbc6084 100644
> --- a/include/qemu/plugin.h
> +++ b/include/qemu/plugin.h
> @@ -79,7 +79,6 @@ enum plugin_dyn_cb_subtype {
>  struct qemu_plugin_dyn_cb {
>      union qemu_plugin_cb_sig f;
>      void *userp;
> -    unsigned tcg_flags;
>      enum plugin_dyn_cb_subtype type;
>      /* @rw applies to mem callbacks only (both regular and inline) */
>      enum qemu_plugin_mem_rw rw;
> diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
> index eb99be52d0..1e7f201cd2 100644
> --- a/accel/tcg/plugin-gen.c
> +++ b/accel/tcg/plugin-gen.c
> @@ -385,7 +385,7 @@ static TCGOp *copy_st_ptr(TCGOp **begin_op, TCGOp *op)
>  }
>  
>  static TCGOp *copy_call(TCGOp **begin_op, TCGOp *op, void *empty_func,
> -                        void *func, unsigned tcg_flags, int *cb_idx)
> +                        void *func, int *cb_idx)
>  {
>      /* copy all ops until the call */
>      do {
> @@ -412,7 +412,7 @@ static TCGOp *copy_call(TCGOp **begin_op, TCGOp *op, void *empty_func,
>          tcg_debug_assert(i < MAX_OPC_PARAM_ARGS);
>      }
>      op->args[*cb_idx] = (uintptr_t)func;
> -    op->args[*cb_idx + 1] = tcg_flags;
> +    op->args[*cb_idx + 1] = (*begin_op)->args[*cb_idx + 1];

I don't understand this change, can you explain?

>  
>      return op;
>  }
> @@ -439,7 +439,7 @@ static TCGOp *append_udata_cb(const struct qemu_plugin_dyn_cb *cb,
>  
>      /* call */
>      op = copy_call(&begin_op, op, HELPER(plugin_vcpu_udata_cb),
> -                   cb->f.vcpu_udata, cb->tcg_flags, cb_idx);
> +                   cb->f.vcpu_udata, cb_idx);
>  
>      return op;
>  }
> @@ -490,7 +490,7 @@ static TCGOp *append_mem_cb(const struct qemu_plugin_dyn_cb *cb,
>      if (type == PLUGIN_GEN_CB_MEM) {
>          /* call */
>          op = copy_call(&begin_op, op, HELPER(plugin_vcpu_mem_cb),
> -                       cb->f.vcpu_udata, cb->tcg_flags, cb_idx);
> +                       cb->f.vcpu_udata, cb_idx);
>      }
>  
>      return op;
> diff --git a/plugins/core.c b/plugins/core.c
> index 87b823bbc4..03e0a4c806 100644
> --- a/plugins/core.c
> +++ b/plugins/core.c
> @@ -297,33 +297,15 @@ void plugin_register_inline_op(GArray **arr,
>      dyn_cb->inline_insn.imm = imm;
>  }
>  
> -static inline uint32_t cb_to_tcg_flags(enum qemu_plugin_cb_flags flags)
> -{
> -    uint32_t ret;
> -
> -    switch (flags) {
> -    case QEMU_PLUGIN_CB_RW_REGS:
> -        ret = 0;
> -        break;
> -    case QEMU_PLUGIN_CB_R_REGS:
> -        ret = TCG_CALL_NO_WG;
> -        break;
> -    case QEMU_PLUGIN_CB_NO_REGS:
> -    default:
> -        ret = TCG_CALL_NO_RWG;
> -    }
> -    return ret;
> -}
> -
> -inline void
> -plugin_register_dyn_cb__udata(GArray **arr,
> -                              qemu_plugin_vcpu_udata_cb_t cb,
> -                              enum qemu_plugin_cb_flags flags, void *udata)
> +void plugin_register_dyn_cb__udata(GArray **arr,
> +                                   qemu_plugin_vcpu_udata_cb_t cb,
> +                                   enum qemu_plugin_cb_flags flags,
> +                                   void *udata)
>  {
>      struct qemu_plugin_dyn_cb *dyn_cb = plugin_get_dyn_cb(arr);
>  
>      dyn_cb->userp = udata;
> -    dyn_cb->tcg_flags = cb_to_tcg_flags(flags);
> +    /* Note flags are discarded as unused. */
>      dyn_cb->f.vcpu_udata = cb;
>      dyn_cb->type = PLUGIN_CB_REGULAR;
>  }
> @@ -338,7 +320,7 @@ void plugin_register_vcpu_mem_cb(GArray **arr,
>  
>      dyn_cb = plugin_get_dyn_cb(arr);
>      dyn_cb->userp = udata;
> -    dyn_cb->tcg_flags = cb_to_tcg_flags(flags);
> +    /* Note flags are discarded as unused. */
>      dyn_cb->type = PLUGIN_CB_REGULAR;
>      dyn_cb->rw = rw;
>      dyn_cb->f.generic = cb;
> 


