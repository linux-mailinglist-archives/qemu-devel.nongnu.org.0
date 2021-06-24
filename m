Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3495B3B249C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 03:47:34 +0200 (CEST)
Received: from localhost ([::1]:46938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwESr-0000nL-8W
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 21:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lwERi-00005y-MT
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 21:46:22 -0400
Received: from relay64.bu.edu ([128.197.228.104]:47622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lwERg-0006UJ-Rn
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 21:46:22 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 15O1jc4r020527
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 23 Jun 2021 21:45:41 -0400
Date: Wed, 23 Jun 2021 21:45:38 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Steven Raasch <sraasch@gmail.com>
Subject: Re: Extracting PC information from QEMU/KVM during single-step
Message-ID: <20210624014538.6osoiuj5l4llor7v@mozz.bu.edu>
References: <CA+5M2MC9q5RTNYh2YTan_g0TMAkNc0YD_Nx0OV7ze4v7dYdP9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+5M2MC9q5RTNYh2YTan_g0TMAkNc0YD_Nx0OV7ze4v7dYdP9w@mail.gmail.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210623 1514, Steven Raasch wrote:
> Hi -
> 
> I'm trying to create a hack that will allow me to extract an instruction
> trace from QEMU/KVM (i386). The KVM part is important (see below).
> 
> Background:
> 
>    - I have used KVM to create a snapshot of a windows-10 guest running a
>    graphics-intensive app. The *original* issue is that the app does not
>    execute correctly when re-started from the snapshot using TCG (it doesn't
>    crash, but it doesn't run correctly, either). So, using the existing "-d
>    in_asm" won't work. It seemed to me that hacking in tracing to KVM should
>    be easier than figuring out why the app doesn't work.
>    - I've poked around the tracing mechanism in the TCG, and extracted what
>    I need to dump instructions and then added that to kvm_cpu_exec().
>    - I'm setting DEBUG & single-step modes by calling cpu_single_step()
>    from the top of kvm_vcpu_thread_fn().
>    - in kvm_cpu_exec() I wait until I get a KVM_EXIT_DEBUG signal before
>    logging the instruction.
> 
> I have the output of TCG "-d in_asm" from the beginning of the execution,
> and I'm comparing the KVM output with that.
> 
> What I don't have right is the PC of the instruction that's been executed.
> The TCG is clearly sane, but the KVM output is not.
> 
> My best thought was to extract the PC from kvm_run (run->debug.arch.pc)
> after the KVM_RUN ioctl, but that doesn't match up. I also tried
> kvm_vcpu_ioctl() with KVM_GET_REGS, and grabbing the rip from cpu->env.rip.
> I didn't expect any of these to be *exactly* right, but I thought they
> would lead me to something sane.
> 
> Using run->debug.arch.pc gives me the right address for the first
> instruction, but nothing makes sense after that.
> 
> Can anyone help me get onto the right track?
> 
> Thanks!
> 
> -Steve

Is there some reason you can't do this using qemu's gdbstub and gdb? It
supports single-stepping under KVM. 

-Alex

