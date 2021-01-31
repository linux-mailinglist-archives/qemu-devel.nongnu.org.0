Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB8F309BA1
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 12:41:31 +0100 (CET)
Received: from localhost ([::1]:50710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6B6e-0006er-LM
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 06:41:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lrwei@bupt.edu.cn>) id 1l6B4e-0005g0-Nc
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 06:39:25 -0500
Received: from smtpbg702.qq.com ([203.205.195.102]:33662
 helo=smtpproxy21.qq.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lrwei@bupt.edu.cn>) id 1l6B4Y-0000DR-Qr
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 06:39:22 -0500
X-QQ-mid: bizesmtp12t1612093137te519l1v
Received: from [192.168.0.105] (unknown [144.255.82.34])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sun, 31 Jan 2021 19:38:56 +0800 (CST)
X-QQ-SSF: 0140000000400060U000B00A0000000
X-QQ-FEAT: XIEqvPtYnoGp0ReNyjDa6vUburWTkR/bbW5iLGYXqXJjbl8R1bSlw1INizNns
 yO+LeAKRaxY8ut9arPi9dmnEtPozlwtagwT1bDDOEiCe+9oekJnGLpQj9r8mZuTyJ+gzT92
 G3OIye1aOfeJL5kK6LkLHtWgoU02bbNzXD4eN4lurQSs6mAtt0o4Of4hXn5LJMipfmmIooo
 HksR0cNXSo4lgcoNx0ol5SeJ9OasgMfv1iRaH9PPAQd4UOm6DyFvAijoH2EEmw6lQdhFmpA
 AcfHuiUScM2XTZE5uqk3Ouf6Vi+mmxX6Sv7TJIT+owgTvXhtXcT6xUhTW3n5Tv4C9m8Utze
 1pWz9mAMgI+Bv6zcNW1HKLbH62RZg==
X-QQ-GoodBg: 2
From: Liren Wei <lrwei@bupt.edu.cn>
Subject: [QUESTION] tcg: Is concurrent storing and code translation of the
 same code page considered as racing in MTTCG?
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Message-ID: <bdf3823d-c21e-075d-da1f-98fb78266e07@bupt.edu.cn>+AB6ADC00B05F0BCA
Date: Sun, 31 Jan 2021 19:38:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:bupt.edu.cn:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
Received-SPF: pass client-ip=203.205.195.102; envelope-from=lrwei@bupt.edu.cn;
 helo=smtpproxy21.qq.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 INVALID_MSGID=0.568, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

After reading related source code and discussions in the mailing list,
I understand that:

1. tb_page_add() calls tlb_protect_code() to clear the code page by
setting TLB_NOTDIRTY in .addr_write field of corresponding CPUTLBEntry
*of all vCPUs*.

2. Updating and accessing (even from TCG-generated code) of .addr_write
is atomic and therefore does NOT result in any undefined behavior.

3. .addr_write field with TLB_NOTDIRTY forces qemu_st to execute the
so-called "slow path", in which TBs in the modified portion of the
code page is invalidated, so the modified code will be re-translated.

However, similar to the situation described in:
https://lists.nongnu.org/archive/html/qemu-devel/2018-02/msg02529.html

When we have 2 vCPUs with one of them writing to the code page while
the other just translated some code within that same page, the following
situation might happen:

    vCPU thread 1 - writing      vCPU thread 2 - translating
    -----------------------      -----------------------
    TLB check -> slow path
      notdirty_write()
        set dirty flag
      write to RAM
                                 tb_gen_code()
                                   tb_page_add()
                                     tlb_protect_code()

    TLB check -> fast path
                                       set TLB_NOTDIRTY
      write to RAM
executing unmodified code for this time
                                 and maybe also for the next time, never
                                 re-translate modified TBs.


My question is:
   Should the situation described above be considered as a bug or,
   an intended behavior for QEMU (, so it's the programmer's fault
   for not flushing the icache after modifying shared code page)?

Looking forward for your reply, and thanks in advance!

--
Liren Wei





