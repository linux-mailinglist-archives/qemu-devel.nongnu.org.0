Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B566685CCB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 02:47:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN2CH-00039h-Sf; Tue, 31 Jan 2023 20:46:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1pN2CF-00039Q-Nx
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 20:45:59 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1pN2CC-00072t-N9
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 20:45:59 -0500
Received: from kwepemm600007.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4P64T33j7gzJrSt;
 Wed,  1 Feb 2023 09:43:51 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 1 Feb 2023 09:45:26 +0800
Subject: Re: [PULL 16/22] tcg/aarch64: Reorg goto_tb implementation
To: Richard Henderson <richard.henderson@linaro.org>
CC: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>, hev <r@hev.cc>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
 <20230117231051.354444-17-richard.henderson@linaro.org>
Message-ID: <ffac2cd4-b1e1-53a9-8c88-367f80f1e977@huawei.com>
Date: Wed, 1 Feb 2023 09:45:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20230117231051.354444-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=yuzenghui@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023/1/18 7:10, Richard Henderson wrote:
> +void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
> +                              uintptr_t jmp_rx, uintptr_t jmp_rw)
> +{
> +    uintptr_t d_addr = tb->jmp_target_addr[n];
> +    ptrdiff_t d_offset = d_addr - jmp_rx;
> +    tcg_insn_unit insn;
> +
> +    /* Either directly branch, or indirect branch load. */
> +    if (d_offset == sextract64(d_offset, 0, 28)) {
> +        insn = deposit32(I3206_B, 0, 26, d_offset >> 2);
> +    } else {
> +        uintptr_t i_addr = (uintptr_t)&tb->jmp_target_addr[n];
> +        ptrdiff_t i_offset = i_addr - jmp_rx;
> +
> +        /* Note that we asserted this in range in tcg_out_goto_tb. */
> +        insn = deposit32(I3305_LDR | TCG_REG_TMP, 0, 5, i_offset >> 2);

'offset' should be bits [23:5] of LDR instruction, rather than [4:0].

