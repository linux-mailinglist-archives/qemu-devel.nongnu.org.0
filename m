Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CB62FF559
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:05:44 +0100 (CET)
Received: from localhost ([::1]:45342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2gD9-0000EO-3l
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1l2g8z-00063X-2a
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:01:26 -0500
Received: from mail.csgraf.de ([188.138.100.120]:51082
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1l2g8w-0003qA-MB
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:01:24 -0500
Received: from macbook.alex.local
 (dynamic-095-117-099-148.95.117.pool.telefonica.de [95.117.99.148])
 by csgraf.de (Postfix) with ESMTPSA id 402ED39001A8;
 Thu, 21 Jan 2021 21:01:20 +0100 (CET)
Subject: Re: [PATCH v4] tcg: Toggle page execution for Apple Silicon
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210121184752.1395873-1-richard.henderson@linaro.org>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <6d5d9d93-30b6-2f71-e71b-94bd8f18198a@csgraf.de>
Date: Thu, 21 Jan 2021 21:01:16 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210121184752.1395873-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 21.01.21 19:47, Richard Henderson wrote:
> From: Roman Bolshakov <r.bolshakov@yadro.com>
>
> Pages can't be both write and executable at the same time on Apple
> Silicon. macOS provides public API to switch write protection [1] for
> JIT applications, like TCG.
>
> 1. https://developer.apple.com/documentation/apple_silicon/porting_just-in-time_compilers_to_apple_silicon
>
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Message-Id: <20210113032806.18220-1-r.bolshakov@yadro.com>
> [rth: Inline the qemu_thread_jit_* functions;
>  drop the MAP_JIT change for a follow-on patch.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> Supercedes: <20210113032806.18220-1-r.bolshakov@yadro.com>
>
> This is the version of Roman's patch that I'm queuing to tcg-next.
> What's missing from the full "Fix execution" patch is setting MAP_JIT
> for !splitwx in alloc_code_gen_buffer().


This patch segfaults in tcg_out32() for me if I add the MAP_JIT flag
manually to the mmap call:


(lldb) bt
* thread #3, stop reason = EXC_BAD_ACCESS (code=2, address=0x118000000)
  * frame #0: 0x0000000100297e8c qemu-system-x86_64`tcg_prologue_init
[inlined] tcg_out32(s=0x0000000100bb64c0, v=2847570941) at tcg.c:250:24
[opt]
    frame #1: 0x0000000100297e7c qemu-system-x86_64`tcg_prologue_init
[inlined] tcg_out_insn_3314(s=0x0000000100bb64c0, insn=2847539200,
r1=TCG_REG_X29, r2=TCG_REG_X30, rn=TCG_REG_SP, ofs=-96, pre=true,
w=true) at tcg-target.c.inc:666 [opt]
    frame #2: 0x0000000100297e7c qemu-system-x86_64`tcg_prologue_init
[inlined] tcg_target_qemu_prologue(s=0x0000000100bb64c0) at
tcg-target.c.inc:2858 [opt]
    frame #3: 0x0000000100297e7c
qemu-system-x86_64`tcg_prologue_init(s=0x0000000100bb64c0) at tcg.c:1116
[opt]
    frame #4: 0x00000001002d7ab8
qemu-system-x86_64`tcg_exec_init(tb_size=<unavailable>,
splitwx=<unavailable>) at translate-all.c:1349:5 [opt]
    frame #5: 0x000000010028d690
qemu-system-x86_64`tcg_init(ms=<unavailable>) at tcg-all.c:113:5 [opt]
    frame #6: 0x000000010007d540
qemu-system-x86_64`accel_init_machine(accel=0x00000001020c9ec0,
ms=0x00000001020c6880) at accel.c:55:11 [opt]
    frame #7: 0x00000001002b90f0
qemu-system-x86_64`do_configure_accelerator(opaque=0x000000016ff12ea0,
opts=0x00000001020c9e30, errp=0x0000000100bc18e0) at vl.c:2148:11 [opt]
    frame #8: 0x0000000100482c00
qemu-system-x86_64`qemu_opts_foreach(list=<unavailable>,
func=(qemu-system-x86_64`do_configure_accelerator at vl.c:2125),
opaque=0x000000016ff12ea0, errp=0x0000000100bc18e0) at
qemu-option.c:1147:14 [opt]
    frame #9: 0x00000001002b6d48 qemu-system-x86_64`qemu_init [inlined]
configure_accelerators(progname=<unavailable>) at vl.c:2216:10 [opt]
    frame #10: 0x00000001002b6bd8
qemu-system-x86_64`qemu_init(argc=<unavailable>, argv=<unavailable>,
envp=<unavailable>) at vl.c:3484 [opt]
    frame #11: 0x0000000100007aac qemu-system-x86_64`qemu_main(argc=3,
argv=0x000000016fdff848, envp=<unavailable>) at main.c:49:5 [opt]
    frame #12: 0x000000010001dd34
qemu-system-x86_64`call_qemu_main(opaque=0x0000000000000000) at
cocoa.m:1714:14 [opt]
    frame #13: 0x0000000100477c1c
qemu-system-x86_64`qemu_thread_start(args=<unavailable>) at
qemu-thread-posix.c:521:9 [opt]
    frame #14: 0x000000019846106c libsystem_pthread.dylib`_pthread_start
+ 320


Alex



