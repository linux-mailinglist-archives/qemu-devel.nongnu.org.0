Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3D5676B9F
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 09:28:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJVi3-00041F-QB; Sun, 22 Jan 2023 03:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1pJVi2-000416-FA
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 03:28:14 -0500
Received: from mail.xen0n.name ([115.28.160.31] helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1pJVi0-0004vr-CV
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 03:28:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1674376089; bh=gQ2L39MJaqSgYhIWjfM68g/410TT781H+yvVe7eZV4k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WZjj1/yPQ9G6/ylshQ4HWqNpNK8JBnkM/udP44gzk9fRcToECv+AtOGIzH+jbnOvV
 j/81wJftmX3vkcOFvyC/pZRYzD9KHPhfDYYjtxKqHTE+/loYWbZoJh0sFANDvUfvYR
 mWAFmLfU+fZMZ2AYo3AoPxWwNh1HCbxsHnQRDQys=
Received: from [192.168.9.172] (unknown [101.88.135.165])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 3C13260106;
 Sun, 22 Jan 2023 16:28:09 +0800 (CST)
Message-ID: <1048d5e2-6700-9700-5675-5216a6a735f7@xen0n.name>
Date: Sun, 22 Jan 2023 16:28:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101
 Firefox/111.0 Thunderbird/111.0a1
Subject: Re: [PATCH v2 00/10] tcg/loongarch64: Reorg goto_tb and cleanups
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: git@xen0n.name
References: <20230118011123.392823-1-richard.henderson@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20230118011123.392823-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi,

On 1/18/23 09:11, Richard Henderson wrote:
> Based-on: 20230117231051.354444-1-richard.henderson@linaro.org
> ("[PULL 00/22] tcg patch queue")
>
> Includes:
>    * Disassembler from target/loongarch/.
>    * Improvements to movi by Rui Wang, with minor tweaks.
>    * Improvements to setcond.
>    * Implement movcond.
>    * Fix the same goto_tb bug that affected some others.
>
>
> r~
>
>
> Richard Henderson (9):
>    target/loongarch: Enable the disassembler for host tcg
>    target/loongarch: Disassemble jirl properly
>    target/loongarch: Disassemble pcadd* addresses
>    tcg/loongarch64: Update tcg-insn-defs.c.inc
>    tcg/loongarch64: Introduce tcg_out_addi
>    tcg/loongarch64: Improve setcond expansion
>    tcg/loongarch64: Implement movcond
>    tcg/loongarch64: Use tcg_pcrel_diff in tcg_out_ldst
>    tcg/loongarch64: Reorg goto_tb implementation
>
> Rui Wang (1):
>    tcg/loongarch64: Optimize immediate loading
>
>   tcg/loongarch64/tcg-target-con-set.h          |   5 +-
>   tcg/loongarch64/tcg-target-con-str.h          |   2 +-
>   tcg/loongarch64/tcg-target.h                  |  11 +-
>   disas.c                                       |   2 +
>   target/loongarch/disas.c                      |  39 +-
>   .../loongarch/insn_trans/trans_branch.c.inc   |   2 +-
>   target/loongarch/insns.decode                 |   3 +-
>   target/loongarch/meson.build                  |   3 +-
>   tcg/loongarch64/tcg-insn-defs.c.inc           |  10 +-
>   tcg/loongarch64/tcg-target.c.inc              | 364 ++++++++++++------
>   10 files changed, 300 insertions(+), 141 deletions(-)
>   mode change 100644 => 100755 tcg/loongarch64/tcg-insn-defs.c.inc
>
Sorry for the late review; I was focusing more on LLVM and day job these 
days. I've reviewed some of these and will take a look at the rest (and 
test all of them on native HW) tonight. Thanks very much for all the 
refactoring!

