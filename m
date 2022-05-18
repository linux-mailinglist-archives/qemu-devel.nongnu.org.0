Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FF552B5C5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 11:28:47 +0200 (CEST)
Received: from localhost ([::1]:60944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrFz4-0001bY-E9
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 05:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1nrFkd-000805-Kb
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:13:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1nrFkb-0005yF-Jm
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:13:51 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4832E4081F
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 12:13:41 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 89BAF11B
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 12:13:39 +0300 (MSK)
Message-ID: <7c82caac-4426-b107-af3c-79b99856fca9@msgid.tls.msk.ru>
Date: Wed, 18 May 2022 12:13:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: qemu-user (arm64) fails (null ptr deref) under qemu-system-x86_64 w/o
 avx?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

Here's an interesting bug. Interesting because qemu-user does not run under qemu-system.

Running 7.0.0 qemu-aarch64-static under 7.0.0 qemu-system-x86_64 -enable-kvm with
default cpu type, getting:

Thread 1 "qemu-aarch64-static" received signal SIGSEGV, Segmentation fault.
0x00000000005d3db3 in fold_call (op=0xf2a4d8, ctx=0x7fffffffdf20)
     at tcg/optimize.c:1215

bt:

#0  0x00000000005d3db3 in fold_call (op=0xf2a4d8, ctx=0x7fffffffdf20)
     at tcg/optimize.c:1215
#1  tcg_optimize (s=s@entry=0xe3cf00 <tcg_init_ctx>)
     at tcg/optimize.c:2049
#2  0x00000000005df5e1 in tcg_gen_code (s=0xe3cf00 <tcg_init_ctx>,
     tb=tb@entry=0x7fffe8024580 <code_gen_buffer+148822>)
     at tcg/tcg.c:4233

Code:

static bool fold_call(OptContext *ctx, TCGOp *op)
{
     TCGContext *s = ctx->tcg;
     int nb_oargs = TCGOP_CALLO(op);
     int nb_iargs = TCGOP_CALLI(op);
     int flags, i;

     init_arguments(ctx, op, nb_oargs + nb_iargs);
     copy_propagate(ctx, op, nb_oargs, nb_iargs);

     /* If the function reads or writes globals, reset temp data. */
     flags = tcg_call_flags(op);  <==== here
     if (!(flags & (TCG_CALL_NO_READ_GLOBALS | TCG_CALL_NO_WRITE_GLOBALS))) {

Disassembly:

    0x5d3d93 <tcg_optimize+659>     call   0x5d2da0 <copy_propagate>
    0x5d3d98 <tcg_optimize+664>     movzbl 0x1(%r15),%eax
    0x5d3d9d <tcg_optimize+669>     mov    %eax,%edx
    0x5d3d9f <tcg_optimize+671>     and    $0xf,%eax
    0x5d3da2 <tcg_optimize+674>     shr    $0x4,%dl
    0x5d3da5 <tcg_optimize+677>     movzbl %dl,%edx
    0x5d3da8 <tcg_optimize+680>     lea    0x1(%rdx,%rax,1),%eax
    0x5d3dac <tcg_optimize+684>     cltq
    0x5d3dae <tcg_optimize+686>     mov    0x18(%r15,%rax,8),%rax
   >0x5d3db3 <tcg_optimize+691>     testb  $0x3,0x10(%rax)
    0x5d3db7 <tcg_optimize+695>     jne    0x5d3e50 <tcg_optimize+848>

info registers:
rax            0x0                 0
rbx            0xf2a558            15902040
rcx            0xe3e088            14934152
rdx            0x1                 1
rsi            0x0                 0
rdi            0x0                 0
rbp            0x1                 0x1
rsp            0x7fffffffdf10      0x7fffffffdf10
r8             0xf2a4f8            15901944
r9             0xf2a4f8            15901944
r10            0x0                 0
r11            0x1                 1
r12            0xf2a510            15901968
r13            0x7fffffffdf20      140737488346912
r14            0xf2a510            15901968
r15            0xf2a4d8            15901912
rip            0x5d3db3            0x5d3db3 <tcg_optimize+691>
eflags         0x10202             [ IF RF ]
cs             0x33                51
ss             0x2b                43
ds             0x0                 0
es             0x0                 0
fs             0x0                 0
gs             0x0                 0


#define TCGOP_CALLI(X)    (X)->param1
#define TCGOP_CALLO(X)    (X)->param2

static inline const TCGHelperInfo *tcg_call_info(TCGOp *op)
{
     return (void *)(uintptr_t)op->args[TCGOP_CALLO(op) + TCGOP_CALLI(op) + 1];
}

static inline unsigned tcg_call_flags(TCGOp *op)
{
     return tcg_call_info(op)->flags;
}

(gdb) p *op
$1 = {opc = INDEX_op_call, param1 = 3, param2 = 1, life = 0, link = {
     tqe_next = 0xf2a558, tqe_circ = {tql_next = 0xf2a558,
       tql_prev = 0xf2a460}}, args = {14933928, 14933928, 14933872, 14934152,
     8603936, 0, 281470681808895, 281470681808895, 281470681808895,
     281470681808895, 281470681808895, 281470681808895}, output_pref = {65535,
     65535}}

So tcg_call_info() return args[5] which is NULL, and tcg_call_flags()
does NULL->flags, which obviously fails with SIGSEGV.

Now what is especially interesting here is that it fails only when
the cpu does not have AVX.  For example, running it under
qemu-system-x86_64 -enable-kvm -cpu Westmere fails the same way,
but with -cpu SandyBridge works.  -cpu SandyBridge,-avx fails too.

I tried the same qemu-aarch64 on an actual hw system with older
CPU which does not have AVX extensions, - there, it surprizingly
works just fine.

How to debug it further?

Thanks,

/mjt

