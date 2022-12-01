Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DCD63F87D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 20:41:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0pPF-00050t-14; Thu, 01 Dec 2022 14:39:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0pPC-00050h-6g
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 14:39:34 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0pP2-0007vg-Uo
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 14:39:33 -0500
Received: by mail-wr1-x431.google.com with SMTP id m14so4479678wrh.7
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 11:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nSCqWjglM9ap5DzyxaO1Ni6JqVDhDXbxBaEHV3U6JFU=;
 b=DfI7VT2+21jeox10Rs3qiJptdk0k5BwtxHyywNN8r0VU2LaHCbRy/7rHQIOR9ew4cF
 SxBv2rYA1G+pSdcajnanQaO5wH+X6rn2TdV6sAxid/6I0NfPvOYGZ0XcIOt4sz1zaTTf
 oFkZoQCq9KP5OF8T5lOrOJsb0wpie3kYr1L4LuQFJFB8qiaFWAaqiF+D+UaaBlYbqyAD
 SQP9gAbpKE0yXs5hGgq7BbFBc6iRphy0CWmFG3VntgQapwMoccGVWCMtioyUxVIzuL4a
 z/ZEw66vrfIqtW5ONyJ2bX1TfA1jSLZ2XeT/jheVHLyee0X3Lq2/F4gA7kp+d+FnptvV
 oD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nSCqWjglM9ap5DzyxaO1Ni6JqVDhDXbxBaEHV3U6JFU=;
 b=G3vyUPhoCViaVz/UCTsYXKuXR8xJBhl38oSGFxNzY3e3Fjvqi32fpP/SRzHXEtbicf
 aaXszsOZxSkvLE7OWFgvmSpWR09iZi8uElUfJsgB+9jpivvGZxHIth8/4D4Tcb5UdQo7
 MryasLYtVcgvbBb8RMjxqEJux+YcSIgBIVnpx0uxgqXu3QE3E+Jcd7b+llVY1zfLYiBs
 1D+yQelv7ijcj2FPMY3cO7onUgUf8bpN506VHl1cShEKF+Qvt5uRDQJOhLcJ+Xa3IDz2
 sHycOHQHJc+hAAjhkxaRE7jrc0zg2nQgzjxgu2W+4SiVabGuSXGB4tabbI92ZwV/yJOv
 kvEA==
X-Gm-Message-State: ANoB5plUKgxWMPqNwa09KW/eaZfuwFC3yxbTUQ92szDR7Ug6mjHa4PoF
 f9zLZbx/HgGMA9zSneTe+lhjnA==
X-Google-Smtp-Source: AA0mqf5JPzwc+fCf3XVtIJRwZ2dbZ2pDf73l/cMEJJ2Re2cbk4gBrP7O4ol/RMwKW8bfhhuSV02otA==
X-Received: by 2002:a5d:5254:0:b0:242:14dc:a06e with SMTP id
 k20-20020a5d5254000000b0024214dca06emr15000487wrc.675.1669923562428; 
 Thu, 01 Dec 2022 11:39:22 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p14-20020adf9d8e000000b00236b2804d79sm5284194wre.2.2022.12.01.11.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 11:39:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8E9961FFB7;
 Thu,  1 Dec 2022 19:39:21 +0000 (GMT)
References: <Y3QNRWUK8BLRQlaQ@strawberry.localdomain>
 <878rkbalba.fsf@linaro.org> <Y3vdIHJrR1k1lmf8@strawberry.localdomain>
 <871qpwc6i6.fsf@linaro.org>
 <a0eae94e-eafa-e206-be32-e2ce58e466d2@linaro.org>
 <Y3zxW/vFsxCuDFW+@strawberry.localdomain>
 <Y4Ztn91bFssBdbmR@strawberry.localdomain>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Emilio G. Cota" <cota@braap.org>
Subject: Re: Plugin Memory Callback Debugging
Date: Thu, 01 Dec 2022 19:32:14 +0000
In-reply-to: <Y4Ztn91bFssBdbmR@strawberry.localdomain>
Message-ID: <87edtic3rq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Nov 22 10:57, Aaron Lindsay wrote:
>> On Nov 21 18:22, Richard Henderson wrote:
>> > On 11/21/22 13:51, Alex Benn=C3=A9e wrote:
>> > >=20
>> > > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
>> > >=20
>> > > > On Nov 15 22:36, Alex Benn=C3=A9e wrote:
>> > > > > Aaron Lindsay <aaron@os.amperecomputing.com> writes:
>> > > > > > I believe the code *should* always reset `cpu->plugin_mem_cbs`=
 to NULL at the
>> > > > > > end of an instruction/TB's execution, so its not exactly clear=
 to me how this
>> > > > > > is occurring. However, I suspect it may be relevant that we ar=
e calling
>> > > > > > `free_dyn_cb_arr()` because my plugin called `qemu_plugin_rese=
t()`.
>> > > > >=20
>> > > > > Hmm I'm going to have to remind myself about how this bit works.
>> > > >=20
>> > > > When is it expected that cpu->plugin_mem_cbs is reset to NULL if i=
t is
>> > > > set for an instruction? Is it guaranteed it is reset by the end of=
 the
>> > > > tb?
>> > >=20
>> > > It should be by the end of the instruction. See
>> > > inject_mem_disable_helper() which inserts TCG code to disable the
>> > > helpers. We also have plugin_gen_disable_mem_helpers() which should
>> > > catch every exit out of a block (exit_tb, goto_tb, goto_ptr). That is
>> > > why qemu_plugin_disable_mem_helpers() is only really concerned about
>> > > when we longjmp out of the loop.
>> > >=20
>> > > > If I were to put an assertion in cpu_tb_exec() just after the call
>> > > > to tcg_qemu_tb_exec(), should cpu->plugin_mem_cbs always be NULL
>> > > > there?
>> > >=20
>> > > Yes I think so.
>> >=20
>> > Indeed.
>>=20
>> Well, the good news is that if this is an assumption we're relying on, i=
t is
>> now trivial to reproduce the problem!
>>=20
>> Compile some simple program (doesn't really matter, the issue gets trigg=
ered
>> early):
>>=20
>> $ echo "int main() { return 0; }" > simple.c && gcc simple.c -o simple
>>=20
>> Make this change to cpu_tb_exec():
>>=20
>> > diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> > index 356fe348de..50a010327d 100644
>> > --- a/accel/tcg/cpu-exec.c
>> > +++ b/accel/tcg/cpu-exec.c
>> > @@ -436,6 +436,9 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, =
int *tb_exit)
>> >=20
>> >      qemu_thread_jit_execute();
>> >      ret =3D tcg_qemu_tb_exec(env, tb_ptr);
>> > +    if (cpu->plugin_mem_cbs !=3D NULL) {
>> > +        g_assert_not_reached();
>> > +    }
>> >      cpu->can_do_io =3D 1;
>> >      /*
>> >       * TODO: Delay swapping back to the read-write region of the TB
>>=20
>> And run:
>>=20
>> $ ./build/qemu-aarch64 -plugin contrib/plugins/libexeclog.so -d plugin .=
/simple
>>=20
>> You should fairly quickly see something like:
>>=20
>> > [snip]
>> > 0, 0x5502814d04, 0xb4000082, ""
>> > 0, 0x5502814d08, 0xf9400440, "", load, 0x5502844ed0
>> > 0, 0x5502814d0c, 0xf1001c1f, ""

Hmm why are you not getting any opcodes there? Missing capstone?

>> > **
>> > ERROR:../accel/tcg/cpu-exec.c:440:cpu_tb_exec: code should not be reac=
hed
>> > Bail out! ERROR:../accel/tcg/cpu-exec.c:440:cpu_tb_exec: code
>> > should not be reached

Hmm I can replicate so I need to check my understanding. It fails in the
first block:


  ./qemu-aarch64 -plugin contrib/plugins/libexeclog.so -d \
    plugin,in_asm,op,op_opt,out_asm  ./tests/tcg/aarch64-linux-user/sha512

gives:

  PROLOGUE: [size=3D45]
  0x7f4b64000000:  55                       pushq    %rbp
  0x7f4b64000001:  53                       pushq    %rbx
  0x7f4b64000002:  41 54                    pushq    %r12
  0x7f4b64000004:  41 55                    pushq    %r13
  0x7f4b64000006:  41 56                    pushq    %r14
  0x7f4b64000008:  41 57                    pushq    %r15
  0x7f4b6400000a:  48 8b ef                 movq     %rdi, %rbp
  0x7f4b6400000d:  48 81 c4 78 fb ff ff     addq     $-0x488, %rsp
  0x7f4b64000014:  ff e6                    jmpq     *%rsi
  0x7f4b64000016:  33 c0                    xorl     %eax, %eax
  0x7f4b64000018:  48 81 c4 88 04 00 00     addq     $0x488, %rsp
  0x7f4b6400001f:  c5 f8 77                 vzeroupper=20
  0x7f4b64000022:  41 5f                    popq     %r15
  0x7f4b64000024:  41 5e                    popq     %r14
  0x7f4b64000026:  41 5d                    popq     %r13
  0x7f4b64000028:  41 5c                    popq     %r12
  0x7f4b6400002a:  5b                       popq     %rbx
  0x7f4b6400002b:  5d                       popq     %rbp
  0x7f4b6400002c:  c3                       retq=20=20=20=20=20

  ----------------
  IN:=20
  0x004005d0:  d280001d  movz     x29, #0
  0x004005d4:  d280001e  movz     x30, #0
  0x004005d8:  aa0003e5  mov      x5, x0
  0x004005dc:  f94003e1  ldr      x1, [sp]
  0x004005e0:  910023e2  add      x2, sp, #8
  0x004005e4:  910003e6  mov      x6, sp
  0x004005e8:  90000000  adrp     x0, #0x400000
  0x004005ec:  91182000  add      x0, x0, #0x608
  0x004005f0:  b0000023  adrp     x3, #0x405000
  0x004005f4:  91014063  add      x3, x3, #0x50
  0x004005f8:  b0000024  adrp     x4, #0x405000
  0x004005fc:  91044084  add      x4, x4, #0x110
  0x00400600:  940010e8  bl       #0x4049a0

  OP:
   ld_i32 tmp0,env,$0xfffffffffffffff0
   brcond_i32 tmp0,$0x0,lt,$L0

   ---- 00000000004005d0 0000000000000000 0000000000000000
   mov_i64 tmp2,$0x55c0ff203430
   ld_i32 tmp0,env,$0xffffffffffffffa8
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,tmp2
   mov_i64 x29,$0x0

   ---- 00000000004005d4 0000000000000000 0000000000000000
   mov_i64 tmp2,$0x55c0ff202800
   ld_i32 tmp0,env,$0xffffffffffffffa8
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,tmp2
   mov_i64 lr,$0x0

   ---- 00000000004005d8 0000000000000000 0000000000000000
   mov_i64 tmp2,$0x55c0ff203400
   ld_i32 tmp0,env,$0xffffffffffffffa8
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,tmp2
   mov_i64 x5,x0

This is a memory annotated instruction:

   ---- 00000000004005dc 0000000000000000 0000000000000f06
   mov_i64 tmp2,$0x55c0ff1a6150
   ld_i32 tmp0,env,$0xffffffffffffffa8
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,tmp2
   mov_i64 tmp2,sp
   shl_i64 tmp4,tmp2,$0x8
   sar_i64 tmp4,tmp4,$0x8
   and_i64 tmp4,tmp4,tmp2
   mov_i64 tmp7,tmp4
   qemu_ld_i64 x1,tmp7,leq,0
   mov_i32 tmp8,$0x10030
   mov_i64 tmp11,$0x0
   ld_i32 tmp0,env,$0xffffffffffffffa8
   mov_i64 tmp10,tmp7
   call plugin(0x7f4b71c14388),$0x1,$0,tmp0,tmp8,tmp10,tmp11

   ---- 00000000004005e0 0000000000000000 0000000000000000
   mov_i64 tmp2,$0x55c0ff1fa4e0
   ld_i32 tmp0,env,$0xffffffffffffffa8
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,tmp2
   add_i64 tmp2,sp,$0x8
   mov_i64 x2,tmp2

   ---- 00000000004005e4 0000000000000000 0000000000000000
   mov_i64 tmp2,$0x55c0ff193500
   ld_i32 tmp0,env,$0xffffffffffffffa8
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,tmp2
   mov_i64 tmp2,sp
   mov_i64 x6,tmp2

   ---- 00000000004005e8 0000000000000000 0000000000000000
   mov_i64 tmp2,$0x55c0ff219700
   ld_i32 tmp0,env,$0xffffffffffffffa8
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,tmp2
   mov_i64 x0,$0x400000

   ---- 00000000004005ec 0000000000000000 0000000000000000
   mov_i64 tmp2,$0x55c0ff21d160
   ld_i32 tmp0,env,$0xffffffffffffffa8
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,tmp2
   add_i64 tmp2,x0,$0x608
   mov_i64 x0,tmp2

   ---- 00000000004005f0 0000000000000000 0000000000000000
   mov_i64 tmp2,$0x55c0ff217f80
   ld_i32 tmp0,env,$0xffffffffffffffa8
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,tmp2
   mov_i64 x3,$0x405000

   ---- 00000000004005f4 0000000000000000 0000000000000000
   mov_i64 tmp2,$0x55c0ff2180c0
   ld_i32 tmp0,env,$0xffffffffffffffa8
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,tmp2
   add_i64 tmp2,x3,$0x50
   mov_i64 x3,tmp2

   ---- 00000000004005f8 0000000000000000 0000000000000000
   mov_i64 tmp2,$0x55c0ff21c4b0
   ld_i32 tmp0,env,$0xffffffffffffffa8
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,tmp2
   mov_i64 x4,$0x405000

   ---- 00000000004005fc 0000000000000000 0000000000000000
   mov_i64 tmp2,$0x55c0ff21c590
   ld_i32 tmp0,env,$0xffffffffffffffa8
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,tmp2
   add_i64 tmp2,x4,$0x110
   mov_i64 x4,tmp2

   ---- 0000000000400600 0000000000000000 0000000000000000
   mov_i64 tmp2,$0x55c0ff217cd0
   st_i64 tmp2,env,$0xffffffffffffff90
   mov_i64 tmp2,$0x55c0ff21c670
   ld_i32 tmp0,env,$0xffffffffffffffa8
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,tmp2
   mov_i64 lr,$0x400604
   mov_i64 pc,$0x4049a0
   call lookup_tb_ptr,$0x6,$1,tmp2,env
   goto_ptr tmp2
   set_label $L0
   exit_tb $0x7f4b64000043

  OP after optimization and liveness analysis:
   ld_i32 tmp0,env,$0xfffffffffffffff0      pref=3D0xffff
   brcond_i32 tmp0,$0x0,lt,$L0              dead: 0 1

   ---- 00000000004005d0 0000000000000000 0000000000000000
   ld_i32 tmp0,env,$0xffffffffffffffa8      pref=3D0x80
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,$0x55c0ff203430  dead: 0 1
   mov_i64 x29,$0x0                         sync: 0  dead: 0  pref=3D0xffff

   ---- 00000000004005d4 0000000000000000 0000000000000000
   ld_i32 tmp0,env,$0xffffffffffffffa8      pref=3D0x80
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,$0x55c0ff202800  dead: 0 1
   mov_i64 lr,$0x0                          sync: 0  dead: 0  pref=3D0xffff

   ---- 00000000004005d8 0000000000000000 0000000000000000
   ld_i32 tmp0,env,$0xffffffffffffffa8      pref=3D0x80
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,$0x55c0ff203400  dead: 0 1
   mov_i64 x5,x0                            sync: 0  dead: 0 1  pref=3D0xff=
ff

   ---- 00000000004005dc 0000000000000000 0000000000000f06
   ld_i32 tmp0,env,$0xffffffffffffffa8      pref=3D0x80
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,$0x55c0ff1a6150  dead: 0 1
   shl_i64 tmp4,sp,$0x8                     pref=3D0xffff
   sar_i64 tmp4,tmp4,$0x8                   dead: 1  pref=3D0xffff
   and_i64 tmp4,tmp4,sp                     dead: 1  pref=3D0xffff
   mov_i64 tmp7,tmp4                        dead: 1  pref=3D0xf038
   qemu_ld_i64 x1,tmp7,leq,0                sync: 0  dead: 0  pref=3D0xffff
   ld_i32 tmp0,env,$0xffffffffffffffa8      pref=3D0x80
   mov_i64 tmp10,tmp7                       dead: 1  pref=3D0x4
   call plugin(0x7f4b71c14388),$0x1,$0,tmp0,$0x10030,tmp10,$0x0  dead: 0 1 =
2 3

   ---- 00000000004005e0 0000000000000000 0000000000000000
   ld_i32 tmp0,env,$0xffffffffffffffa8      pref=3D0x80
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,$0x55c0ff1fa4e0  dead: 0 1
   add_i64 tmp2,sp,$0x8                     dead: 2  pref=3D0xffff
   mov_i64 x2,tmp2                          sync: 0  dead: 0 1  pref=3D0xff=
ff

   ---- 00000000004005e4 0000000000000000 0000000000000000
   ld_i32 tmp0,env,$0xffffffffffffffa8      pref=3D0x80
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,$0x55c0ff193500  dead: 0 1
   mov_i64 x6,sp                            sync: 0  dead: 0 1  pref=3D0xff=
ff

   ---- 00000000004005e8 0000000000000000 0000000000000000
   ld_i32 tmp0,env,$0xffffffffffffffa8      pref=3D0x80
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,$0x55c0ff219700  dead: 0 1

   ---- 00000000004005ec 0000000000000000 0000000000000000
   ld_i32 tmp0,env,$0xffffffffffffffa8      pref=3D0x80
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,$0x55c0ff21d160  dead: 0 1
   mov_i64 x0,$0x400608                     sync: 0  dead: 0 1  pref=3D0xff=
ff

   ---- 00000000004005f0 0000000000000000 0000000000000000
   ld_i32 tmp0,env,$0xffffffffffffffa8      pref=3D0x80
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,$0x55c0ff217f80  dead: 0 1

   ---- 00000000004005f4 0000000000000000 0000000000000000
   ld_i32 tmp0,env,$0xffffffffffffffa8      pref=3D0x80
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,$0x55c0ff2180c0  dead: 0 1
   mov_i64 x3,$0x405050                     sync: 0  dead: 0 1  pref=3D0xff=
ff

   ---- 00000000004005f8 0000000000000000 0000000000000000
   ld_i32 tmp0,env,$0xffffffffffffffa8      pref=3D0x80
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,$0x55c0ff21c4b0  dead: 0 1

   ---- 00000000004005fc 0000000000000000 0000000000000000
   ld_i32 tmp0,env,$0xffffffffffffffa8      pref=3D0x80
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,$0x55c0ff21c590  dead: 0 1
   mov_i64 x4,$0x405110                     sync: 0  dead: 0 1  pref=3D0xff=
ff

   ---- 0000000000400600 0000000000000000 0000000000000000
   st_i64 $0x55c0ff217cd0,env,$0xffffffffffffff90  dead: 0
   ld_i32 tmp0,env,$0xffffffffffffffa8      pref=3D0x80
   call plugin(0x7f4b71c1449f),$0x1,$0,tmp0,$0x55c0ff21c670  dead: 0 1
   mov_i64 lr,$0x400604                     sync: 0  dead: 0 1  pref=3D0xff=
ff
   mov_i64 pc,$0x4049a0                     sync: 0  dead: 0 1  pref=3D0xff=
ff
   call lookup_tb_ptr,$0x6,$1,tmp2,env      dead: 1  pref=3Dnone
   goto_ptr tmp2                            dead: 0
   set_label $L0=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
   exit_tb $0x7f4b64000043=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

  OUT: [size=3D432]
    -- guest addr 0x00000000004005d0 + tb prologue
  0x7f4b64000100:  8b 5d f0                 movl     -0x10(%rbp), %ebx
  0x7f4b64000103:  85 db                    testl    %ebx, %ebx
  0x7f4b64000105:  0f 8c 8a 01 00 00        jl       0x7f4b64000295
  0x7f4b6400010b:  8b 7d a8                 movl     -0x58(%rbp), %edi
  0x7f4b6400010e:  48 be 30 34 20 ff c0 55  movabsq  $0x55c0ff203430, %rsi
  0x7f4b64000116:  00 00
  0x7f4b64000118:  e8 82 43 c1 0d           callq    0x7f4b71c1449f
  0x7f4b6400011d:  48 c7 85 28 01 00 00 00  movq     $0, 0x128(%rbp)
  0x7f4b64000125:  00 00 00
    -- guest addr 0x00000000004005d4
  0x7f4b64000128:  8b 7d a8                 movl     -0x58(%rbp), %edi
  0x7f4b6400012b:  48 be 00 28 20 ff c0 55  movabsq  $0x55c0ff202800, %rsi
  0x7f4b64000133:  00 00
  0x7f4b64000135:  e8 65 43 c1 0d           callq    0x7f4b71c1449f
  0x7f4b6400013a:  48 c7 85 30 01 00 00 00  movq     $0, 0x130(%rbp)
  0x7f4b64000142:  00 00 00
    -- guest addr 0x00000000004005d8
  0x7f4b64000145:  8b 7d a8                 movl     -0x58(%rbp), %edi
  0x7f4b64000148:  48 be 00 34 20 ff c0 55  movabsq  $0x55c0ff203400, %rsi
  0x7f4b64000150:  00 00
  0x7f4b64000152:  e8 48 43 c1 0d           callq    0x7f4b71c1449f
  0x7f4b64000157:  48 8b 5d 40              movq     0x40(%rbp), %rbx
  0x7f4b6400015b:  48 89 5d 68              movq     %rbx, 0x68(%rbp)
    -- guest addr 0x00000000004005dc
  0x7f4b6400015f:  8b 7d a8                 movl     -0x58(%rbp), %edi
  0x7f4b64000162:  48 be 50 61 1a ff c0 55  movabsq  $0x55c0ff1a6150, %rsi
  0x7f4b6400016a:  00 00
  0x7f4b6400016c:  e8 2e 43 c1 0d           callq    0x7f4b71c1449f
  0x7f4b64000171:  48 8b 9d 38 01 00 00     movq     0x138(%rbp), %rbx
  0x7f4b64000178:  4c 8b e3                 movq     %rbx, %r12
  0x7f4b6400017b:  49 c1 e4 08              shlq     $8, %r12
  0x7f4b6400017f:  49 c1 fc 08              sarq     $8, %r12
  0x7f4b64000183:  4c 23 e3                 andq     %rbx, %r12
  0x7f4b64000186:  4d 8b 2c 24              movq     (%r12), %r13
  0x7f4b6400018a:  4c 89 6d 48              movq     %r13, 0x48(%rbp)
  0x7f4b6400018e:  8b 7d a8                 movl     -0x58(%rbp), %edi
  0x7f4b64000191:  be 30 00 01 00           movl     $0x10030, %esi
  0x7f4b64000196:  49 8b d4                 movq     %r12, %rdx
  0x7f4b64000199:  33 c9                    xorl     %ecx, %ecx
  0x7f4b6400019b:  e8 e8 41 c1 0d           callq    0x7f4b71c14388
    -- guest addr 0x00000000004005e0
  0x7f4b640001a0:  8b 7d a8                 movl     -0x58(%rbp), %edi
  0x7f4b640001a3:  48 be e0 a4 1f ff c0 55  movabsq  $0x55c0ff1fa4e0, %rsi
  0x7f4b640001ab:  00 00
  0x7f4b640001ad:  e8 ed 42 c1 0d           callq    0x7f4b71c1449f
  0x7f4b640001b2:  4c 8d 63 08              leaq     8(%rbx), %r12
  0x7f4b640001b6:  4c 89 65 50              movq     %r12, 0x50(%rbp)
    -- guest addr 0x00000000004005e4
  0x7f4b640001ba:  8b 7d a8                 movl     -0x58(%rbp), %edi
  0x7f4b640001bd:  48 be 00 35 19 ff c0 55  movabsq  $0x55c0ff193500, %rsi
  0x7f4b640001c5:  00 00
  0x7f4b640001c7:  e8 d3 42 c1 0d           callq    0x7f4b71c1449f
  0x7f4b640001cc:  48 89 5d 70              movq     %rbx, 0x70(%rbp)
    -- guest addr 0x00000000004005e8
  0x7f4b640001d0:  8b 7d a8                 movl     -0x58(%rbp), %edi
  0x7f4b640001d3:  48 be 00 97 21 ff c0 55  movabsq  $0x55c0ff219700, %rsi
  0x7f4b640001db:  00 00
  0x7f4b640001dd:  e8 bd 42 c1 0d           callq    0x7f4b71c1449f
    -- guest addr 0x00000000004005ec
  0x7f4b640001e2:  8b 7d a8                 movl     -0x58(%rbp), %edi
  0x7f4b640001e5:  48 be 60 d1 21 ff c0 55  movabsq  $0x55c0ff21d160, %rsi
  0x7f4b640001ed:  00 00
  0x7f4b640001ef:  e8 ab 42 c1 0d           callq    0x7f4b71c1449f
  0x7f4b640001f4:  48 c7 45 40 08 06 40 00  movq     $0x400608, 0x40(%rbp)
    -- guest addr 0x00000000004005f0
  0x7f4b640001fc:  8b 7d a8                 movl     -0x58(%rbp), %edi
  0x7f4b640001ff:  48 be 80 7f 21 ff c0 55  movabsq  $0x55c0ff217f80, %rsi
  0x7f4b64000207:  00 00
  0x7f4b64000209:  e8 91 42 c1 0d           callq    0x7f4b71c1449f
    -- guest addr 0x00000000004005f4
  0x7f4b6400020e:  8b 7d a8                 movl     -0x58(%rbp), %edi
  0x7f4b64000211:  48 be c0 80 21 ff c0 55  movabsq  $0x55c0ff2180c0, %rsi
  0x7f4b64000219:  00 00
  0x7f4b6400021b:  e8 7f 42 c1 0d           callq    0x7f4b71c1449f
  0x7f4b64000220:  48 c7 45 58 50 50 40 00  movq     $0x405050, 0x58(%rbp)
    -- guest addr 0x00000000004005f8
  0x7f4b64000228:  8b 7d a8                 movl     -0x58(%rbp), %edi
  0x7f4b6400022b:  48 be b0 c4 21 ff c0 55  movabsq  $0x55c0ff21c4b0, %rsi
  0x7f4b64000233:  00 00
  0x7f4b64000235:  e8 65 42 c1 0d           callq    0x7f4b71c1449f
    -- guest addr 0x00000000004005fc
  0x7f4b6400023a:  8b 7d a8                 movl     -0x58(%rbp), %edi
  0x7f4b6400023d:  48 be 90 c5 21 ff c0 55  movabsq  $0x55c0ff21c590, %rsi
  0x7f4b64000245:  00 00
  0x7f4b64000247:  e8 53 42 c1 0d           callq    0x7f4b71c1449f
  0x7f4b6400024c:  48 c7 45 60 10 51 40 00  movq     $0x405110, 0x60(%rbp)
    -- guest addr 0x0000000000400600
  0x7f4b64000254:  48 bb d0 7c 21 ff c0 55  movabsq  $0x55c0ff217cd0, %rbx
  0x7f4b6400025c:  00 00
  0x7f4b6400025e:  48 89 5d 90              movq     %rbx, -0x70(%rbp)
  0x7f4b64000262:  8b 7d a8                 movl     -0x58(%rbp), %edi
  0x7f4b64000265:  48 be 70 c6 21 ff c0 55  movabsq  $0x55c0ff21c670, %rsi
  0x7f4b6400026d:  00 00
  0x7f4b6400026f:  e8 2b 42 c1 0d           callq    0x7f4b71c1449f
  0x7f4b64000274:  48 c7 85 30 01 00 00 04  movq     $0x400604, 0x130(%rbp)
  0x7f4b6400027c:  06 40 00
  0x7f4b6400027f:  48 c7 85 40 01 00 00 a0  movq     $0x4049a0, 0x140(%rbp)
  0x7f4b64000287:  49 40 00
  0x7f4b6400028a:  48 8b fd                 movq     %rbp, %rdi
  0x7f4b6400028d:  ff 15 15 00 00 00        callq    *0x15(%rip)
  0x7f4b64000293:  ff e0                    jmpq     *%rax
  0x7f4b64000295:  48 8d 05 a7 fd ff ff     leaq     -0x259(%rip), %rax
  0x7f4b6400029c:  e9 77 fd ff ff           jmp      0x7f4b64000018
    -- tb slow paths + alignment
  0x7f4b640002a1:  90                       nop=20=20=20=20=20=20
  0x7f4b640002a2:  90                       nop=20=20=20=20=20=20
  0x7f4b640002a3:  90                       nop=20=20=20=20=20=20
  0x7f4b640002a4:  90                       nop=20=20=20=20=20=20
  0x7f4b640002a5:  90                       nop=20=20=20=20=20=20
  0x7f4b640002a6:  90                       nop=20=20=20=20=20=20
  0x7f4b640002a7:  90                       nop=20=20=20=20=20=20
    data: [size=3D8]
  0x7f4b640002a8:  .quad  0x000055c0feba1d00

  0, 0x4005d0, 0xd280001d, "movz x29, #0"
  0, 0x4005d4, 0xd280001e, "movz x30, #0"
  0, 0x4005d8, 0xaa0003e5, "mov x5, x0"
  0, 0x4005dc, 0xf94003e1, "ldr x1, [sp]", load, 0x55008000f0
  0, 0x4005e0, 0x910023e2, "add x2, sp, #8"
  0, 0x4005e4, 0x910003e6, "mov x6, sp"
  0, 0x4005e8, 0x90000000, "adrp x0, #0x400000"
  0, 0x4005ec, 0x91182000, "add x0, x0, #0x608"
  0, 0x4005f0, 0xb0000023, "adrp x3, #0x405000"
  0, 0x4005f4, 0x91014063, "add x3, x3, #0x50"
  0, 0x4005f8, 0xb0000024, "adrp x4, #0x405000"
  0, 0x4005fc, 0x91044084, "add x4, x4, #0x110"
  cpu_tb_exec: 0
  **
  ERROR:../../accel/tcg/cpu-exec.c:443:cpu_tb_exec: code should not be reac=
hed
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped



>>=20
>> When digging through my other failure in `rr` I saw the cpu->plugin_mem_=
cbs
>> pointer changing from one non-null value to another (which also seems to
>> indicate it is not being cleared between instructions).
>>=20
>> Does this hint that there are cases where reset cpu->plugin_mem_cbs to N=
ULL is
>> getting optimized away, but not the code to set it in the first place?
>
> Is there anyone who could help take a look at this from the code gen
> perspective?
>
> -Aaron


--=20
Alex Benn=C3=A9e

