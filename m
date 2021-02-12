Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A21F31A0E4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 15:48:15 +0100 (CET)
Received: from localhost ([::1]:37918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAZjy-0006HV-7r
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 09:48:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAZgY-0005Tc-Qu
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:44:42 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAZgV-0003nf-OO
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:44:42 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v14so8222394wro.7
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 06:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=MGhMx7TnP/Rm8seA9/cUn8Dhouhd9BNOJ5oYfM0iF8E=;
 b=Nq6nmq1HiHoIc+umLubRFr0oaJmNA54uIskGaoUoTR+/vvFWkP1g5wqLZ8vtbUkJp7
 F9bxDAguWfnIha/9yqicH7Icj9XWQhpE7jLMmxo2SFq3ibUYzNJ0QzdN9+YoULk4Ub1e
 MkKLZpTniOXTnAGy1dGx8h4RRBS7gjCbR0uhAQ/zEPXovHehUpDuLztIbPJOSatoR29r
 Z1HI+7gl7ejhn9JNL3uri5mRVlTm3rRkyrfwrs0Y24pkDMjQyW1q14AxllnIvqCUgybI
 eGOL4+swwJq9q3q40EbSKzYSr+6p0vnf/Ga5vos96Pd/HEpTKaehFRFAMZtWsMFlY9F7
 3UIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=MGhMx7TnP/Rm8seA9/cUn8Dhouhd9BNOJ5oYfM0iF8E=;
 b=pNXX4g/x3MrU3xb/U1UqrPwT74rbMkXwVYGame4f4hkuhdEXWZjWQ9gSAHCxFxo79e
 PZOmiaigVznE0UT8JQlttC6KhdyXmWbCQSLqdq1AIfMdayPko2NZzvssHPFaAtRzozE8
 8XW8ns4U4I+ZWgf+UCEG2Od0jDqIWQeiIURib+mtkL/e8waw9DvHPb99UP4uXC67jjVF
 DX6zVPp829qEGERcJJGStQ6BwdQmWiHohLOpPrw/iIdNrUheA1ggTHm+yiUgQ8yg/0tE
 kWecAFNylxEkJgl4V7E9C4fYevtbUr0Eg0MwqvjQ7YSBbFdDJEMiRgvvJPQn6ptFY0DI
 kO1Q==
X-Gm-Message-State: AOAM532lZtDr85T64ulDVriPe3BoF262hGcquFhSIyuM+5CwJ9GVcFq+
 YMNSbmXLo0Ag3JDEISEqZWBg7g==
X-Google-Smtp-Source: ABdhPJyiRjmkc0OqZSIUsKUdzAUEDIErf9Lg2iwbWpVOFp8dVpic3vWJIJblcTx4Kgzx0GleSDPNJg==
X-Received: by 2002:a05:6000:1141:: with SMTP id
 d1mr3784283wrx.47.1613141078094; 
 Fri, 12 Feb 2021 06:44:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v11sm10904569wrr.3.2021.02.12.06.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 06:44:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 591681FF7E;
 Fri, 12 Feb 2021 14:44:36 +0000 (GMT)
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-21-alex.bennee@linaro.org>
 <YCXRpCiekU+TgoAX@strawberry.localdomain>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: [PATCH  v2 20/21] accel/tcg: allow plugin instrumentation to be
 disable via cflags
Date: Fri, 12 Feb 2021 14:43:30 +0000
In-reply-to: <YCXRpCiekU+TgoAX@strawberry.localdomain>
Message-ID: <877dndz6p7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Feb 10 22:10, Alex Benn=C3=A9e wrote:
>> When icount is enabled and we recompile an MMIO access we end up
>> double counting the instruction execution. To avoid this we introduce
>> the CF_NOINSTR cflag which disables instrumentation for the next TB.
>> As this is part of the hashed compile flags we will only execute the
>> generated TB while coming out of a cpu_io_recompile.
>
> Unfortunately this patch works a little too well!
>
> With this change, the memory access callbacks registered via
> `qemu_plugin_register_vcpu_mem_cb()` are never called for the
> re-translated instruction making the IO access, since we've disabled all
> instrumentation.
>
> Is it possible to selectively disable only instruction callbacks using
> this mechanism, while still allowing others that would not yet have been
> called for the re-translated instruction?

Can you try the following fugly patch on top of this series:

--8<---------------cut here---------------start------------->8---
diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
index 4834a9e2f4..b1b72b5d90 100644
--- a/include/exec/plugin-gen.h
+++ b/include/exec/plugin-gen.h
@@ -19,7 +19,7 @@ struct DisasContextBase;
=20
 #ifdef CONFIG_PLUGIN
=20
-bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb);
+bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool s=
upress);
 void plugin_gen_tb_end(CPUState *cpu);
 void plugin_gen_insn_start(CPUState *cpu, const struct DisasContextBase *d=
b);
 void plugin_gen_insn_end(void);
@@ -41,7 +41,7 @@ static inline void plugin_insn_append(const void *from, s=
ize_t size)
 #else /* !CONFIG_PLUGIN */
=20
 static inline
-bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
+bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool s=
upress)
 {
     return false;
 }
diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index 841deed79c..2a26a2277f 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -92,6 +92,7 @@ struct qemu_plugin_dyn_cb {
     };
 };
=20
+/* Internal context for instrumenting an instruction */
 struct qemu_plugin_insn {
     GByteArray *data;
     uint64_t vaddr;
@@ -99,6 +100,7 @@ struct qemu_plugin_insn {
     GArray *cbs[PLUGIN_N_CB_TYPES][PLUGIN_N_CB_SUBTYPES];
     bool calls_helpers;
     bool mem_helper;
+    bool store_only;
 };
=20
 /*
@@ -128,6 +130,7 @@ static inline struct qemu_plugin_insn *qemu_plugin_insn=
_alloc(void)
     return insn;
 }
=20
+/* Internal context for this TranslationBlock */
 struct qemu_plugin_tb {
     GPtrArray *insns;
     size_t n;
@@ -135,6 +138,7 @@ struct qemu_plugin_tb {
     uint64_t vaddr2;
     void *haddr1;
     void *haddr2;
+    bool store_only;
     GArray *cbs[PLUGIN_N_CB_SUBTYPES];
 };
=20
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 8a1bb801e0..137b91282e 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -842,7 +842,7 @@ static void plugin_gen_inject(const struct qemu_plugin_=
tb *plugin_tb)
     pr_ops();
 }
=20
-bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
+bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool s=
tore_only)
 {
     struct qemu_plugin_tb *ptb =3D tcg_ctx->plugin_tb;
     bool ret =3D false;
@@ -855,6 +855,7 @@ bool plugin_gen_tb_start(CPUState *cpu, const Translati=
onBlock *tb)
         ptb->vaddr2 =3D -1;
         get_page_addr_code_hostp(cpu->env_ptr, tb->pc, &ptb->haddr1);
         ptb->haddr2 =3D NULL;
+        ptb->store_only =3D store_only;
=20
         plugin_gen_empty_callback(PLUGIN_GEN_FROM_TB);
     }
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 14d1ea795d..082f2c8ee1 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -58,7 +58,7 @@ void translator_loop(const TranslatorOps *ops, DisasConte=
xtBase *db,
     ops->tb_start(db, cpu);
     tcg_debug_assert(db->is_jmp =3D=3D DISAS_NEXT);  /* no early exit */
=20
-    plugin_enabled =3D !(tb_cflags(db->tb) & CF_NOINSTR) && plugin_gen_tb_=
start(cpu, tb);
+    plugin_enabled =3D plugin_gen_tb_start(cpu, tb, tb_cflags(db->tb) & CF=
_NOINSTR);
=20
     while (true) {
         db->num_insns++;
@@ -100,6 +100,8 @@ void translator_loop(const TranslatorOps *ops, DisasCon=
textBase *db,
             gen_io_start();
             ops->translate_insn(db, cpu);
         } else {
+            /* we should only see NOINSTR for io_recompile */
+            g_assert(!(tb_cflags(db->tb) & CF_NOINSTR));
             ops->translate_insn(db, cpu);
         }
=20
diff --git a/plugins/api.c b/plugins/api.c
index 5dc8e6f934..ac8475707d 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -84,15 +84,19 @@ void qemu_plugin_register_vcpu_tb_exec_cb(struct qemu_p=
lugin_tb *tb,
                                           enum qemu_plugin_cb_flags flags,
                                           void *udata)
 {
-    plugin_register_dyn_cb__udata(&tb->cbs[PLUGIN_CB_REGULAR],
-                                  cb, flags, udata);
+    if (!tb->store_only) {
+        plugin_register_dyn_cb__udata(&tb->cbs[PLUGIN_CB_REGULAR],
+                                      cb, flags, udata);
+    }
 }
=20
 void qemu_plugin_register_vcpu_tb_exec_inline(struct qemu_plugin_tb *tb,
                                               enum qemu_plugin_op op,
                                               void *ptr, uint64_t imm)
 {
-    plugin_register_inline_op(&tb->cbs[PLUGIN_CB_INLINE], 0, op, ptr, imm);
+    if (!tb->store_only) {
+        plugin_register_inline_op(&tb->cbs[PLUGIN_CB_INLINE], 0, op, ptr, =
imm);
+    }
 }
=20
 void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
@@ -100,16 +104,20 @@ void qemu_plugin_register_vcpu_insn_exec_cb(struct qe=
mu_plugin_insn *insn,
                                             enum qemu_plugin_cb_flags flag=
s,
                                             void *udata)
 {
-    plugin_register_dyn_cb__udata(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_REG=
ULAR],
-        cb, flags, udata);
+    if (!insn->store_only) {
+        plugin_register_dyn_cb__udata(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB=
_REGULAR],
+                                      cb, flags, udata);
+    }
 }
=20
 void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_insn *i=
nsn,
                                                 enum qemu_plugin_op op,
                                                 void *ptr, uint64_t imm)
 {
-    plugin_register_inline_op(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_INLINE],
-                              0, op, ptr, imm);
+    if (!insn->store_only) {
+        plugin_register_inline_op(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_INL=
INE],
+                                  0, op, ptr, imm);
+    }
 }
=20
=20
@@ -120,8 +128,13 @@ void qemu_plugin_register_vcpu_mem_cb(struct qemu_plug=
in_insn *insn,
                                       enum qemu_plugin_mem_rw rw,
                                       void *udata)
 {
-    plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_REGULA=
R],
-                                cb, flags, rw, udata);
+    if (insn->store_only && (rw & QEMU_PLUGIN_MEM_W)) {
+        plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_RE=
GULAR],
+                                    cb, flags, QEMU_PLUGIN_MEM_W, udata);
+    } else {
+        plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_RE=
GULAR],
+                                    cb, flags, rw, udata);
+    }
 }
=20
 void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *insn,
@@ -129,8 +142,10 @@ void qemu_plugin_register_vcpu_mem_inline(struct qemu_=
plugin_insn *insn,
                                           enum qemu_plugin_op op, void *pt=
r,
                                           uint64_t imm)
 {
-    plugin_register_inline_op(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_INLINE],
-        rw, op, ptr, imm);
+    if (!insn->store_only) {
+        plugin_register_inline_op(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_INLI=
NE],
+                                  rw, op, ptr, imm);
+    }
 }
=20
 void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
@@ -181,10 +196,13 @@ uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugi=
n_tb *tb)
 struct qemu_plugin_insn *
 qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx)
 {
+    struct qemu_plugin_insn *insn;
     if (unlikely(idx >=3D tb->n)) {
         return NULL;
     }
-    return g_ptr_array_index(tb->insns, idx);
+    insn =3D g_ptr_array_index(tb->insns, idx);
+    insn->store_only =3D tb->store_only;
+    return insn;
 }
=20
 /*
--8<---------------cut here---------------end--------------->8---

--=20
Alex Benn=C3=A9e

