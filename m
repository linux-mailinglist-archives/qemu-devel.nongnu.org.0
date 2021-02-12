Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAE731A3A0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 18:30:00 +0100 (CET)
Received: from localhost ([::1]:48460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAcGV-0004Ue-4Y
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 12:29:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAc9L-0007nF-3u
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:22:35 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAc9I-0002VK-Kv
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 12:22:34 -0500
Received: by mail-wm1-x32c.google.com with SMTP id j11so291198wmi.3
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 09:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=LeRmWPd8GQaGBlVmW5XomDQarAkpkjpGdtg4vRJoY7A=;
 b=qD7xo9Rkj1y8cj4ZQHoGETIgfY1OG9YJiDtjUB5I8hQ4bXEjwg19aILk2WclR/iGXh
 QTzYk7aWxp0IZwVhwzdLk12hYP4Y8KSYawfhoD80naUQF/LSBNjFwF5kpyc1bSg3vTtN
 UlPI1D2RdMl36hjuYDf78cJwDm8WrYgvGwGHQqPOXfQmOgMDtYdy4BZOFGaNFLOjiUaC
 T8en7H+dj9GZzICKF2xXnipjNfsZ+47UQpni45vyzSt/IxPMwCrRUrvYM/W4PUnqZhG2
 jWPymPwM8f72RXhPU5+XX0IL53pZPjNxRRRaaqSp1GSg4IqLR/XHdoqxeIbxPc41eA3t
 4B6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=LeRmWPd8GQaGBlVmW5XomDQarAkpkjpGdtg4vRJoY7A=;
 b=ocN5DlMYUHKpUPJ8LCnTtEWEMEGpmiOU8hBN9kovcDfr2LByaaYM2YzgpRg42fQwpK
 ZowEUbjbf3LrQGadeqJtCm43yBGMlxIsv6pxJt5JPuzRRSOVtgFAwOC5Eqotk9Wqkmjx
 /nqGfwXShkVgzrMZbqyqS7HMMWXKNjeRPcx6iRdgYa11fFiZ5GMEsV5KPHtVz1j9OH1B
 YaDj09rBw4OzhYy9RAXwRLrY+b2w8Vw5sJezyJPT9nj/aWsji3JpbS1qtGGpfAcH57pH
 gYK8GRjrGKjp2hf6Aub4Pi4qDaRVIU+cNc2wwkzsJaBIV81XrNO81mFO2jj8jXkx+m6h
 bh2Q==
X-Gm-Message-State: AOAM530cFpT+1Jr9phu3tO0OYpcGIdL8slg2UerXLf7uXb8JfzoMDzES
 kWOgoV5KcxjudOnWHrNCXuJQbw==
X-Google-Smtp-Source: ABdhPJzpAC9stNdIWoYoFPEWfgSyFkeLO5h9Pwwv9N8LGp4LNB8HkSSG0R2IO40Dl5PBwg2OgZUMkQ==
X-Received: by 2002:a05:600c:3589:: with SMTP id
 p9mr3659279wmq.18.1613150550037; 
 Fri, 12 Feb 2021 09:22:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b2sm9175960wrn.2.2021.02.12.09.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 09:22:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 40E741FF7E;
 Fri, 12 Feb 2021 17:22:28 +0000 (GMT)
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-21-alex.bennee@linaro.org>
 <YCXRpCiekU+TgoAX@strawberry.localdomain> <877dndz6p7.fsf@linaro.org>
 <YCahojKDngG997Xz@strawberry.localdomain>
 <CAHDbmO0no_pRyG_hAEzUUJ60X6xoX1387CwaaZCJQwyyT+b0VQ@mail.gmail.com>
 <YCax2Q6VsDwMDMe6@strawberry.localdomain>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: [PATCH v2 20/21] accel/tcg: allow plugin instrumentation to be
 disable via cflags
Date: Fri, 12 Feb 2021 17:19:02 +0000
In-reply-to: <YCax2Q6VsDwMDMe6@strawberry.localdomain>
Message-ID: <87sg61xktn.fsf@linaro.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Robert Henry <robhenry@microsoft.com>,
 mahmoudabdalghany@outlook.com, "Emilio G. Cota" <cota@braap.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Feb 12 16:04, Alex Benn=C3=A9e wrote:
>> Do you see two stores or one store? I think I got the sense the wrong
>> way around because the store is instrumented before the mmu code,
>> hence should be skipped on a re-instrumented block.
>
> I only see one store between the instruction callback for the store and
> the instruction callback for the subsequent instruction.

OK - having looked more closely and reminded myself what's going on I
think the difference is memory callbacks versus memory inline. All
inline calls happen before the actual instructions. The callbacks have a
pre and post memory helper where the actual callback comes after the
operation. Those are what we want to preserve.

Let me re-spin the patch and see if I can add a test case to compare the
counts between inline and cb (which should be the same with
deterministic icount).

>
> -Aaron
>
>> On Fri, 12 Feb 2021 at 15:41, Aaron Lindsay
>> <aaron@os.amperecomputing.com> wrote:
>> >
>> > On Feb 12 14:43, Alex Benn=C3=A9e wrote:
>> > > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
>> > > > On Feb 10 22:10, Alex Benn=C3=A9e wrote:
>> > > >> When icount is enabled and we recompile an MMIO access we end up
>> > > >> double counting the instruction execution. To avoid this we intro=
duce
>> > > >> the CF_NOINSTR cflag which disables instrumentation for the next =
TB.
>> > > >> As this is part of the hashed compile flags we will only execute =
the
>> > > >> generated TB while coming out of a cpu_io_recompile.
>> > > >
>> > > > Unfortunately this patch works a little too well!
>> > > >
>> > > > With this change, the memory access callbacks registered via
>> > > > `qemu_plugin_register_vcpu_mem_cb()` are never called for the
>> > > > re-translated instruction making the IO access, since we've disabl=
ed all
>> > > > instrumentation.
>> > > >
>> > > > Is it possible to selectively disable only instruction callbacks u=
sing
>> > > > this mechanism, while still allowing others that would not yet hav=
e been
>> > > > called for the re-translated instruction?
>> > >
>> > > Can you try the following fugly patch on top of this series:
>> >
>> > This patch does allow me to successfully observe memory callbacks for
>> > stores in this case. It seems from looking at the patch that you
>> > intentionally only allowed memory callbacks for stores in this case, a=
nd
>> > I still don't see callbacks any for loads.
>> >
>> > -Aaron
>> >
>> > > --8<---------------cut here---------------start------------->8---
>> > > diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
>> > > index 4834a9e2f4..b1b72b5d90 100644
>> > > --- a/include/exec/plugin-gen.h
>> > > +++ b/include/exec/plugin-gen.h
>> > > @@ -19,7 +19,7 @@ struct DisasContextBase;
>> > >
>> > >  #ifdef CONFIG_PLUGIN
>> > >
>> > > -bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb);
>> > > +bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb,=
 bool supress);
>> > >  void plugin_gen_tb_end(CPUState *cpu);
>> > >  void plugin_gen_insn_start(CPUState *cpu, const struct DisasContext=
Base *db);
>> > >  void plugin_gen_insn_end(void);
>> > > @@ -41,7 +41,7 @@ static inline void plugin_insn_append(const void *=
from, size_t size)
>> > >  #else /* !CONFIG_PLUGIN */
>> > >
>> > >  static inline
>> > > -bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
>> > > +bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb,=
 bool supress)
>> > >  {
>> > >      return false;
>> > >  }
>> > > diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
>> > > index 841deed79c..2a26a2277f 100644
>> > > --- a/include/qemu/plugin.h
>> > > +++ b/include/qemu/plugin.h
>> > > @@ -92,6 +92,7 @@ struct qemu_plugin_dyn_cb {
>> > >      };
>> > >  };
>> > >
>> > > +/* Internal context for instrumenting an instruction */
>> > >  struct qemu_plugin_insn {
>> > >      GByteArray *data;
>> > >      uint64_t vaddr;
>> > > @@ -99,6 +100,7 @@ struct qemu_plugin_insn {
>> > >      GArray *cbs[PLUGIN_N_CB_TYPES][PLUGIN_N_CB_SUBTYPES];
>> > >      bool calls_helpers;
>> > >      bool mem_helper;
>> > > +    bool store_only;
>> > >  };
>> > >
>> > >  /*
>> > > @@ -128,6 +130,7 @@ static inline struct qemu_plugin_insn *qemu_plug=
in_insn_alloc(void)
>> > >      return insn;
>> > >  }
>> > >
>> > > +/* Internal context for this TranslationBlock */
>> > >  struct qemu_plugin_tb {
>> > >      GPtrArray *insns;
>> > >      size_t n;
>> > > @@ -135,6 +138,7 @@ struct qemu_plugin_tb {
>> > >      uint64_t vaddr2;
>> > >      void *haddr1;
>> > >      void *haddr2;
>> > > +    bool store_only;
>> > >      GArray *cbs[PLUGIN_N_CB_SUBTYPES];
>> > >  };
>> > >
>> > > diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
>> > > index 8a1bb801e0..137b91282e 100644
>> > > --- a/accel/tcg/plugin-gen.c
>> > > +++ b/accel/tcg/plugin-gen.c
>> > > @@ -842,7 +842,7 @@ static void plugin_gen_inject(const struct qemu_=
plugin_tb *plugin_tb)
>> > >      pr_ops();
>> > >  }
>> > >
>> > > -bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb)
>> > > +bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb,=
 bool store_only)
>> > >  {
>> > >      struct qemu_plugin_tb *ptb =3D tcg_ctx->plugin_tb;
>> > >      bool ret =3D false;
>> > > @@ -855,6 +855,7 @@ bool plugin_gen_tb_start(CPUState *cpu, const Tr=
anslationBlock *tb)
>> > >          ptb->vaddr2 =3D -1;
>> > >          get_page_addr_code_hostp(cpu->env_ptr, tb->pc, &ptb->haddr1=
);
>> > >          ptb->haddr2 =3D NULL;
>> > > +        ptb->store_only =3D store_only;
>> > >
>> > >          plugin_gen_empty_callback(PLUGIN_GEN_FROM_TB);
>> > >      }
>> > > diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
>> > > index 14d1ea795d..082f2c8ee1 100644
>> > > --- a/accel/tcg/translator.c
>> > > +++ b/accel/tcg/translator.c
>> > > @@ -58,7 +58,7 @@ void translator_loop(const TranslatorOps *ops, Dis=
asContextBase *db,
>> > >      ops->tb_start(db, cpu);
>> > >      tcg_debug_assert(db->is_jmp =3D=3D DISAS_NEXT);  /* no early ex=
it */
>> > >
>> > > -    plugin_enabled =3D !(tb_cflags(db->tb) & CF_NOINSTR) && plugin_=
gen_tb_start(cpu, tb);
>> > > +    plugin_enabled =3D plugin_gen_tb_start(cpu, tb, tb_cflags(db->t=
b) & CF_NOINSTR);
>> > >
>> > >      while (true) {
>> > >          db->num_insns++;
>> > > @@ -100,6 +100,8 @@ void translator_loop(const TranslatorOps *ops, D=
isasContextBase *db,
>> > >              gen_io_start();
>> > >              ops->translate_insn(db, cpu);
>> > >          } else {
>> > > +            /* we should only see NOINSTR for io_recompile */
>> > > +            g_assert(!(tb_cflags(db->tb) & CF_NOINSTR));
>> > >              ops->translate_insn(db, cpu);
>> > >          }
>> > >
>> > > diff --git a/plugins/api.c b/plugins/api.c
>> > > index 5dc8e6f934..ac8475707d 100644
>> > > --- a/plugins/api.c
>> > > +++ b/plugins/api.c
>> > > @@ -84,15 +84,19 @@ void qemu_plugin_register_vcpu_tb_exec_cb(struct=
 qemu_plugin_tb *tb,
>> > >                                            enum qemu_plugin_cb_flags=
 flags,
>> > >                                            void *udata)
>> > >  {
>> > > -    plugin_register_dyn_cb__udata(&tb->cbs[PLUGIN_CB_REGULAR],
>> > > -                                  cb, flags, udata);
>> > > +    if (!tb->store_only) {
>> > > +        plugin_register_dyn_cb__udata(&tb->cbs[PLUGIN_CB_REGULAR],
>> > > +                                      cb, flags, udata);
>> > > +    }
>> > >  }
>> > >
>> > >  void qemu_plugin_register_vcpu_tb_exec_inline(struct qemu_plugin_tb=
 *tb,
>> > >                                                enum qemu_plugin_op o=
p,
>> > >                                                void *ptr, uint64_t i=
mm)
>> > >  {
>> > > -    plugin_register_inline_op(&tb->cbs[PLUGIN_CB_INLINE], 0, op, pt=
r, imm);
>> > > +    if (!tb->store_only) {
>> > > +        plugin_register_inline_op(&tb->cbs[PLUGIN_CB_INLINE], 0, op=
, ptr, imm);
>> > > +    }
>> > >  }
>> > >
>> > >  void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn=
 *insn,
>> > > @@ -100,16 +104,20 @@ void qemu_plugin_register_vcpu_insn_exec_cb(st=
ruct qemu_plugin_insn *insn,
>> > >                                              enum qemu_plugin_cb_fla=
gs flags,
>> > >                                              void *udata)
>> > >  {
>> > > -    plugin_register_dyn_cb__udata(&insn->cbs[PLUGIN_CB_INSN][PLUGIN=
_CB_REGULAR],
>> > > -        cb, flags, udata);
>> > > +    if (!insn->store_only) {
>> > > +        plugin_register_dyn_cb__udata(&insn->cbs[PLUGIN_CB_INSN][PL=
UGIN_CB_REGULAR],
>> > > +                                      cb, flags, udata);
>> > > +    }
>> > >  }
>> > >
>> > >  void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_=
insn *insn,
>> > >                                                  enum qemu_plugin_op=
 op,
>> > >                                                  void *ptr, uint64_t=
 imm)
>> > >  {
>> > > -    plugin_register_inline_op(&insn->cbs[PLUGIN_CB_INSN][PLUGIN_CB_=
INLINE],
>> > > -                              0, op, ptr, imm);
>> > > +    if (!insn->store_only) {
>> > > +        plugin_register_inline_op(&insn->cbs[PLUGIN_CB_INSN][PLUGIN=
_CB_INLINE],
>> > > +                                  0, op, ptr, imm);
>> > > +    }
>> > >  }
>> > >
>> > >
>> > > @@ -120,8 +128,13 @@ void qemu_plugin_register_vcpu_mem_cb(struct qe=
mu_plugin_insn *insn,
>> > >                                        enum qemu_plugin_mem_rw rw,
>> > >                                        void *udata)
>> > >  {
>> > > -    plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB=
_REGULAR],
>> > > -                                cb, flags, rw, udata);
>> > > +    if (insn->store_only && (rw & QEMU_PLUGIN_MEM_W)) {
>> > > +        plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGI=
N_CB_REGULAR],
>> > > +                                    cb, flags, QEMU_PLUGIN_MEM_W, u=
data);
>> > > +    } else {
>> > > +        plugin_register_vcpu_mem_cb(&insn->cbs[PLUGIN_CB_MEM][PLUGI=
N_CB_REGULAR],
>> > > +                                    cb, flags, rw, udata);
>> > > +    }
>> > >  }
>> > >
>> > >  void qemu_plugin_register_vcpu_mem_inline(struct qemu_plugin_insn *=
insn,
>> > > @@ -129,8 +142,10 @@ void qemu_plugin_register_vcpu_mem_inline(struc=
t qemu_plugin_insn *insn,
>> > >                                            enum qemu_plugin_op op, v=
oid *ptr,
>> > >                                            uint64_t imm)
>> > >  {
>> > > -    plugin_register_inline_op(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_CB_I=
NLINE],
>> > > -        rw, op, ptr, imm);
>> > > +    if (!insn->store_only) {
>> > > +        plugin_register_inline_op(&insn->cbs[PLUGIN_CB_MEM][PLUGIN_=
CB_INLINE],
>> > > +                                  rw, op, ptr, imm);
>> > > +    }
>> > >  }
>> > >
>> > >  void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
>> > > @@ -181,10 +196,13 @@ uint64_t qemu_plugin_tb_vaddr(const struct qem=
u_plugin_tb *tb)
>> > >  struct qemu_plugin_insn *
>> > >  qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx)
>> > >  {
>> > > +    struct qemu_plugin_insn *insn;
>> > >      if (unlikely(idx >=3D tb->n)) {
>> > >          return NULL;
>> > >      }
>> > > -    return g_ptr_array_index(tb->insns, idx);
>> > > +    insn =3D g_ptr_array_index(tb->insns, idx);
>> > > +    insn->store_only =3D tb->store_only;
>> > > +    return insn;
>> > >  }
>> > >
>> > >  /*
>> > > --8<---------------cut here---------------end--------------->8---
>> > >
>> > > --
>> > > Alex Benn=C3=A9e
>>=20
>>=20
>>=20
>> --=20
>> Alex Benn=C3=A9e
>> KVM/QEMU Hacker for Linaro


--=20
Alex Benn=C3=A9e

