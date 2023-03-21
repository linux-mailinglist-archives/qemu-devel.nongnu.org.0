Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D40E6C3077
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 12:33:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peaDO-0000wn-Di; Tue, 21 Mar 2023 07:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1peaDL-0000wa-4l
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 07:31:39 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1peaDI-0002Ub-98
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 07:31:38 -0400
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8BxttiMlRlkQ2MPAA--.27682S3;
 Tue, 21 Mar 2023 19:31:25 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Axnr6MlRlkUooIAA--.30155S3; 
 Tue, 21 Mar 2023 19:31:24 +0800 (CST)
Subject: Re: [RFC PATCH 40/43] target/loongarch: Implement vreplve vpack vpick
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-41-gaosong@loongson.cn>
 <f47ae8f2-9563-750a-d190-d6ad90600be6@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <9191ffdb-9bd7-97f4-232b-fa8f5f4d240c@loongson.cn>
Date: Tue, 21 Mar 2023 19:31:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f47ae8f2-9563-750a-d190-d6ad90600be6@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8Axnr6MlRlkUooIAA--.30155S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7ArWfCw4kKw1fJw4ruFWxWFg_yoW8Wr4fpw
 4rJr48GryDtw18W3WDW34DK3sIyrnIgw1UAwn5GF1jqrWUJFy2qrZFqr4jgry5Kr40vr1x
 tw1SvrWjvF15Jr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1wL05UUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi, Richard

在 2022/12/25 上午5:12, Richard Henderson 写道:
> On 12/24/22 00:16, Song Gao wrote:
>> +TRANS(vreplve_b, gen_vvr, gen_helper_vreplve_b)
>> +TRANS(vreplve_h, gen_vvr, gen_helper_vreplve_h)
>> +TRANS(vreplve_w, gen_vvr, gen_helper_vreplve_w)
>> +TRANS(vreplve_d, gen_vvr, gen_helper_vreplve_d)
>> +TRANS(vreplvei_b, gen_vv_i, gen_helper_vreplvei_b)
>> +TRANS(vreplvei_h, gen_vv_i, gen_helper_vreplvei_h)
>> +TRANS(vreplvei_w, gen_vv_i, gen_helper_vreplvei_w)
>> +TRANS(vreplvei_d, gen_vv_i, gen_helper_vreplvei_d)
> tcg_gen_gvec_dupm.
>
> In the case of imm, this will be cpu_env + offsetof.
e.g  vreplvei_b  vd, vj, imm
vd->B(i) = Vj->B(imm);
tcg_gen_gvec_dup_mem(MO_8,  vreg_full_offset(a->vd), 
offsetof(CPULoongArchState,  fpr[a->vj].vreg.B(a->imm)),
                                                  16, 16);
this case no problem.
> In the case of reg, compute cpu_env + register offset + offsetof.
>
but for this case.
e.g
vreplve_b  vd vj, rk
index  = gpr[rk] % (128/8);
Vd->B(i) = Vj->B(index);
tcg_gen_gvec_dup_mem(MO_8, vreg_full_offset(a->vd), 
offsetof(CPULoongArchState, fpr[a->vj].vreg.B(index))), 16, 16 );

How can we get the index with cpu_env? or  need env->gpr[rk]?
The index type is not TCGv.
I have no idea.

Thanks.
Song Gao
>> +TRANS(vbsll_v, gen_vv_i, gen_helper_vbsll_v)
>> +TRANS(vbsrl_v, gen_vv_i, gen_helper_vbsrl_v)
>
> These can use tcg_gen_extract2_i64, with imm * 8 bit shift.
>
>
> r~


