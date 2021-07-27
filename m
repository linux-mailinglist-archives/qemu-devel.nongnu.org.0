Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855593D6E7E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 07:58:32 +0200 (CEST)
Received: from localhost ([::1]:60650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8G6p-0006jq-2E
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 01:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1m8G68-00064Z-8J
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 01:57:48 -0400
Received: from mail.ispras.ru ([83.149.199.84]:55862)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1m8G65-00077t-VL
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 01:57:48 -0400
Received: from [192.168.0.92] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id 486C340A2BDD;
 Tue, 27 Jul 2021 05:57:33 +0000 (UTC)
Subject: Re: Regression caught by
 replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
To: Cleber Rosa <crosa@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, QEMU devel <qemu-devel@nongnu.org>
References: <87pmv4zj22.fsf@p50.localhost.localdomain>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <02e3fbd8-3389-f90c-14ef-6da47018af7d@ispras.ru>
Date: Tue, 27 Jul 2021 08:57:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87pmv4zj22.fsf@p50.localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.438,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 27.07.2021 03:39, Cleber Rosa wrote:
> 
> Hi everyone,
> 
> tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
> is currently failing consistently (first found that in [1]).
> 
> I've bisected it down to the following commit:

Thanks for bisecting.
I didn't try to understand why the bug happens, but it can be solved 
with the following patch:

--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1428,7 +1428,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,

      max_insns = cflags & CF_COUNT_MASK;
      if (max_insns == 0) {
-        max_insns = TCG_MAX_INSNS;
+        max_insns = CF_COUNT_MASK;
      }
      QEMU_BUILD_BUG_ON(CF_COUNT_MASK + 1 != TCG_MAX_INSNS);


> 
> ---
> 
> 78ff82bb1b67c0d79113688e4b3427fc99cab9d4 is the first bad commit
> commit 78ff82bb1b67c0d79113688e4b3427fc99cab9d4
> Author: Richard Henderson <richard.henderson@linaro.org>
> 
>      accel/tcg: Reduce CF_COUNT_MASK to match TCG_MAX_INSNS
>      
>      The space reserved for CF_COUNT_MASK was overly large.
>      Reduce to free up cflags bits and eliminate an extra test.
>      
>      Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>      Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>      Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>      Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>      Message-Id: <20210717221851.2124573-2-richard.henderson@linaro.org>
> 
>   accel/tcg/translate-all.c | 5 ++---
>   include/exec/exec-all.h   | 4 +++-
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> ---
> 
> To reproduce it:
> 
> 1. configure --target-list=aarch64-softmmu
> 2. meson compile
> 3. make check-venv
> 4. ./tests/venv/bin/avocado --show=test run tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
> 
> PS: I haven't had the time yet to scan the mailing list for possible
> discussions about it.
> 
> [1] https://gitlab.com/qemu-project/qemu/-/jobs/1445513133#L268
> 


