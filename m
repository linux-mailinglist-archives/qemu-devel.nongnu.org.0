Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6058A497856
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 06:20:50 +0100 (CET)
Received: from localhost ([::1]:58902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBrmb-0006ml-46
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 00:20:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nBrk5-0005ze-J6; Mon, 24 Jan 2022 00:18:13 -0500
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:45607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nBrk0-0003UR-ID; Mon, 24 Jan 2022 00:18:12 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1106058|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.00193024-7.77372e-05-0.997992;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047212; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=13; RT=13; SR=0; TI=SMTPD_---.MhQmkCg_1643001477; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MhQmkCg_1643001477)
 by smtp.aliyun-inc.com(10.147.44.118);
 Mon, 24 Jan 2022 13:17:58 +0800
Subject: Re: [PATCH 0/2] RISC-V: Correctly generate store/amo faults
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20220124005958.38848-1-alistair.francis@opensource.wdc.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <bdc7e993-1baa-0ce9-75f9-fc078617ed4f@c-sky.com>
Date: Mon, 24 Jan 2022 13:17:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220124005958.38848-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.221; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-221.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 alistair23@gmail.com, Paolo Bonzini <pbonzini@redhat.com>, bmeng.cn@gmail.com,
 palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/1/24 上午8:59, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
>
> This series adds a MO_ op to specify that a load instruction should
> produce a store fault. This is used on RISC-V to produce a store/amo
> fault when an atomic access fails.

Hi Alistair,

As Richard said,  we  can address this issue in two ways, probe_read(I 
think probe_write is typo) or with another new MO_ op.

In my opinion use MO_op in io_readx may be not right because the issue 
is not only with IO access. And MO_ op in io_readx is too later because 
the exception has been created when tlb_fill.

Currently tlb_fill doesn't receive this parameter. Is it possible to add 
a new Memop parameter to  tlb_fill?

Thanks,
Zhiwei

>
> This fixes: https://gitlab.com/qemu-project/qemu/-/issues/594
>
> Alistair Francis (2):
>    accel: tcg: Allow forcing a store fault on read ops
>    targett/riscv: rva: Correctly generate a store/amo fault
>
>   include/exec/memop.h                    |  2 +
>   accel/tcg/cputlb.c                      | 11 ++++-
>   target/riscv/insn_trans/trans_rva.c.inc | 56 ++++++++++++++++---------
>   3 files changed, 48 insertions(+), 21 deletions(-)
>

