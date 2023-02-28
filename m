Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F146A5E40
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 18:34:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX3r9-0002Kc-75; Tue, 28 Feb 2023 12:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1pX3r7-0002JD-Iy
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:33:37 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1pX3r4-0008UA-HB
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:33:36 -0500
Received: from mailhub.u-ga.fr (mailhub-1.u-ga.fr [129.88.178.98])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 375F540264;
 Tue, 28 Feb 2023 18:33:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1677605610;
 bh=Cr26sp2y3+mFZq6HGx5VQuK2uDI10zDp6ITnLPzXiA8=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=KNi8K7xpKZHq8CAh8G6tUYFU6nS81yvzI8yR9XRCrCA0awaQQEIhAU5EuTr4QPBqM
 Qouc4QD74JurzMxk79WHxctZOE7CcsmWYiG2exVoGbuQH7C6aCwUJf0IQhlXhkAuXU
 XY8p6WW7xryf6JTdgytQx5vN240puOn8l6pFl8mLK16ldxexS11DuixndO08tT3Awo
 rP8JIYgkND0n3ZuxXmxErgiKWa2F5rz4KMG6kvg5mC95HjiNa+IcF2n9HeH+EIYQxC
 vRd2rP/Lsnz0BfXNnO0Tt7Lpxj4h6xKs7GHFVf2HO0pLaRxifzrEcveMnIIg20Ety3
 YioVl1My6CO8w==
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhub.u-ga.fr (Postfix) with ESMTP id 3498A10005A;
 Tue, 28 Feb 2023 18:33:30 +0100 (CET)
Received: from [192.168.1.61] (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id DD6604004D;
 Tue, 28 Feb 2023 18:33:28 +0100 (CET)
Message-ID: <b622ee87-6583-e095-6e59-415b685dba4e@univ-grenoble-alpes.fr>
Date: Tue, 28 Feb 2023 18:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: fr
To: Emilio Cota <cota@braap.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 "Eli G. Boling" <eboling@draper.com>
References: <20230222043204.941336-1-cota@braap.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH] plugin: fix clearing of plugin_mem_cbs before TB exit
In-Reply-To: <20230222043204.941336-1-cota@braap.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 22/02/2023 à 05:32, Emilio Cota a écrit :
> Currently we are wrongly accessing plugin_tb->mem_helper at
> translation time from plugin_gen_disable_mem_helpers, which is
> called before generating a TB exit, e.g. with exit_tb.
> 
> Recall that it is only during TB finalisation, i.e. when we go over
> the TB post-translation to inject or remove plugin instrumentation,
> when plugin_tb->mem_helper is set. This means that we never clear
> plugin_mem_cbs when calling plugin_gen_disable_mem_helpers since
> mem_helper is always false. Therefore a guest instruction that uses
> helpers and emits an explicit TB exit results in plugin_mem_cbs being
> set upon exiting, which is caught by an assertion as reported in
> the reopening of issue #1381 and replicated below.
> 
> Fix this by (1) adding an insertion point before exiting a TB
> ("before_exit"), and (2) deciding whether or not to emit the
> clearing of plugin_mem_cbs at this newly-added insertion point
> during TB finalisation.
> 
> While at it, suffix plugin_gen_disable_mem_helpers with _before_exit
> to make its intent more clear.
> 
> - Before:
> $ ./qemu-system-riscv32 -M spike -nographic -plugin contrib/plugins/libexeclog.so -d plugin,in_asm,op
> IN:
> Priv: 3; Virt: 0
> 0x00001000:  00000297          auipc                   t0,0                    # 0x1000
> 0x00001004:  02828613          addi                    a2,t0,40
> 0x00001008:  f1402573          csrrs                   a0,mhartid,zero
> 
> OP:
>   ld_i32 tmp1,env,$0xfffffffffffffff0
>   brcond_i32 tmp1,$0x0,lt,$L0
> 
>   ---- 00001000 00000000
>   mov_i64 tmp2,$0x7ff9940152e0
>   ld_i32 tmp1,env,$0xffffffffffffef80
>   call plugin(0x7ff9edbcb6f0),$0x11,$0,tmp1,tmp2
>   mov_i32 x5/t0,$0x1000
> 
>   ---- 00001004 00000000
>   mov_i64 tmp2,$0x7ff9940153e0
>   ld_i32 tmp1,env,$0xffffffffffffef80
>   call plugin(0x7ff9edbcb6f0),$0x11,$0,tmp1,tmp2
>   add_i32 x12/a2,x5/t0,$0x28
> 
>   ---- 00001008 f1402573
>   mov_i64 tmp2,$0x7ff9940136c0
>   st_i64 tmp2,env,$0xffffffffffffef68
>   mov_i64 tmp2,$0x7ff994015530
>   ld_i32 tmp1,env,$0xffffffffffffef80
>   call plugin(0x7ff9edbcb6f0),$0x11,$0,tmp1,tmp2 <-- sets plugin_mem_cbs
>   call csrr,$0x0,$1,x10/a0,env,$0xf14  <-- helper that might access memory
>   mov_i32 pc,$0x100c
>   exit_tb $0x0  <-- exit_tb right after the helper; missing clearing of plugin_mem_cbs
>   mov_i64 tmp2,$0x0
>   st_i64 tmp2,env,$0xffffffffffffef68 <-- after_insn clearing: dead due to exit_tb above
>   set_label $L0
>   exit_tb $0x7ff9a4000043 <-- again, missing clearing (doesn't matter due to $L0 label)
> 
> 0, 0x1000, 0x297, "00000297          auipc                   t0,0                    # 0x1000"
> 0, 0x1004, 0x2828613, "02828613          addi                    a2,t0,40"
> **
> ERROR:../accel/tcg/cpu-exec.c:983:cpu_exec_loop: assertion failed: (cpu->plugin_mem_cbs == ((void *)0))
> Bail out! ERROR:../accel/tcg/cpu-exec.c:983:cpu_exec_loop: assertion failed: (cpu->plugin_mem_cbs == ((void *)0))
> Aborted (core dumped)
> 
> - After:
> $ ./qemu-system-riscv32 -M spike -nographic -plugin contrib/plugins/libexeclog.so -d plugin,in_asm,op
> (snip)
>   call plugin(0x7f19bc9e36f0),$0x11,$0,tmp1,tmp2 <-- sets plugin_mem_cbs
>   call csrr,$0x0,$1,x10/a0,env,$0xf14
>   mov_i32 pc,$0x100c
>   mov_i64 tmp2,$0x0
>   st_i64 tmp2,env,$0xffffffffffffef68 <-- before_exit clearing of plugin_mem_cbs
>   exit_tb $0x0
>   mov_i64 tmp2,$0x0
>   st_i64 tmp2,env,$0xffffffffffffef68 <-- after_insn clearing (dead)
>   set_label $L0
>   mov_i64 tmp2,$0x0
>   st_i64 tmp2,env,$0xffffffffffffef68 <-- before_exit clearing (doesn't matter due to $L0)
>   exit_tb $0x7f38c8000043
> [...]
> 
> Fixes: #1381
> Signed-off-by: Emilio Cota <cota@braap.org>
> ---
>   accel/tcg/plugin-gen.c    | 44 ++++++++++++++++++++-------------------
>   include/exec/plugin-gen.h |  4 ++--
>   include/qemu/plugin.h     |  3 ---
>   tcg/tcg-op.c              |  6 +++---
>   4 files changed, 28 insertions(+), 29 deletions(-)

    Thanks Emilio for the fix, and Aaron for pointing it out to me.

    Tested-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>

