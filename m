Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F096C4502
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 09:34:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1petto-0002JE-4j; Wed, 22 Mar 2023 04:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pettk-0002Ir-Oy
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 04:32:44 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1petti-0004cc-Ea
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 04:32:44 -0400
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8BxMMwkvRpkHeQPAA--.23850S3;
 Wed, 22 Mar 2023 16:32:36 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxjb4jvRpkaoUJAA--.27403S3; 
 Wed, 22 Mar 2023 16:32:35 +0800 (CST)
Subject: Re: [RFC PATCH 40/43] target/loongarch: Implement vreplve vpack vpick
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-41-gaosong@loongson.cn>
 <f47ae8f2-9563-750a-d190-d6ad90600be6@linaro.org>
 <9191ffdb-9bd7-97f4-232b-fa8f5f4d240c@loongson.cn>
 <5fa5ed5d-b263-ddeb-7f97-e25a56bd27cb@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <ed23677d-da3d-a04d-9460-1504da02028c@loongson.cn>
Date: Wed, 22 Mar 2023 16:32:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5fa5ed5d-b263-ddeb-7f97-e25a56bd27cb@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8Dxjb4jvRpkaoUJAA--.27403S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uFWxZFy5JFy3Gr1fuw48WFg_yoW8AFWfpr
 1rtr10vFZYgF4rCw1UGr1kK347Kw1DAa45AwsakFy5GrWUJF1jqr40gF4Yg345Crs7Zw4U
 Jr1rXr1j93W5JaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU25EfUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


在 2023/3/21 下午11:55, Richard Henderson 写道:
> On 3/21/23 04:31, gaosong wrote:
>> but for this case.
>> e.g
>> vreplve_b  vd vj, rk
>> index  = gpr[rk] % (128/8);
>> Vd->B(i) = Vj->B(index);
>> tcg_gen_gvec_dup_mem(MO_8, vreg_full_offset(a->vd), 
>> offsetof(CPULoongArchState, fpr[a->vj].vreg.B(index))), 16, 16 );
>>
>> How can we get the index with cpu_env? or  need env->gpr[rk]?
>> The index type is not TCGv.
>
> For this case you would load the value Vj->B(index) into a TCGv_i32,
>
>     tcg_gen_andi_i64(t0, gpr_src(rk), 15);
>
>     // Handle endian adjustment on t0, e.g. xor 15 for big-endian?
>
>     tcg_gen_trunc_i64_ptr(t1, t0);
>     tcg_gen_add_ptr(t1, t1, cpu_env);
>     tcg_gen_ld8u_i32(t2, t1, vreg_full_offset(vj));
>
>     // At this point t2 contains Vj->B(index)
>
>     tcg_gen_gvec_dup_i32(MO_8, vreg_full_offset(vd), 16, 16, t2);
>
>
It's weird. this is no problem  for vreplve_b,   but for vreplve_h/w/d 
is not correct.

e.g vreplve h
index = gpr[rk] % 8
Vd->H(i) = Vj->H(index);

like this:
{
     tcg_gen_andi_i64(t0, gpr_src(ctx, a->rk, EXT_NONE), 7);
     if (HOST_BIG_ENDIAN) {
         tcg_gen_xori_i64(t0, t0, 7);
     }

     tcg_gen_trunc_i64_ptr(t1, t0);
     tcg_gen_add_ptr(t1, t1, cpu_env);
     tcg_gen_ld16u_i32(t2, t1, vreg_full_offset(a->vj));
     tcg_gen_gvec_dup_i32(MO_16, vreg_full_offset(a->vd), 16, 16, t2);
}

vreplve.h    vr25,  vr31, r30
   r30    : 000000007aab5617
   v31    : {efd0efc1efd0efc1, efd0efc1efd0efc1}
result:  {efd0efd0efd0efd0, efd0efd0efd0efd0},
and we get result is :  {c1efc1efc1efc1ef, c1efc1efc1efc1ef}.
my host is little-endian.

Thanks.
Song Gao


