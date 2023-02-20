Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849C469C620
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 08:49:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU0uG-00053b-Tv; Mon, 20 Feb 2023 02:48:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pU0tw-00052F-FN
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:48:01 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pU0tu-0003zV-14
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:47:56 -0500
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8DxldigJfNjs7gCAA--.5298S3;
 Mon, 20 Feb 2023 15:47:44 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxD7+gJfNj2AU3AA--.63565S3; 
 Mon, 20 Feb 2023 15:47:44 +0800 (CST)
Subject: Re: [RFC PATCH 10/43] target/loongarch: Implement vaddw/vsubw
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-11-gaosong@loongson.cn>
 <268ef762-fce5-ca47-d5f7-bd60955a3a0f@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <f5c0796d-62c9-691a-c2ba-e4dd9e654831@loongson.cn>
Date: Mon, 20 Feb 2023 15:47:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <268ef762-fce5-ca47-d5f7-bd60955a3a0f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8DxD7+gJfNj2AU3AA--.63565S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGr1UKFW7tF1xWFWDGF1xXwb_yoW5ur1rp3
 yUKw1xt3WjkaykZ3W09anI9wsxKrsIgw1j9w4kJryqyrWUXrnFvryxtws0gFW5Kw4Fq3Wx
 Jw12yr4jyr1DArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8czVUUUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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

在 2022/12/25 上午1:48, Richard Henderson 写道:
> On 12/24/22 00:16, Song Gao wrote:
>> +TRANS(vaddwev_h_b, gen_vvv, gen_helper_vaddwev_h_b)
>> +TRANS(vaddwev_w_h, gen_vvv, gen_helper_vaddwev_w_h)
>> +TRANS(vaddwev_d_w, gen_vvv, gen_helper_vaddwev_d_w)
>> +TRANS(vaddwev_q_d, gen_vvv, gen_helper_vaddwev_q_d)
>> +TRANS(vaddwod_h_b, gen_vvv, gen_helper_vaddwod_h_b)
>> +TRANS(vaddwod_w_h, gen_vvv, gen_helper_vaddwod_w_h)
>> +TRANS(vaddwod_d_w, gen_vvv, gen_helper_vaddwod_d_w)
>> +TRANS(vaddwod_q_d, gen_vvv, gen_helper_vaddwod_q_d)
>> +TRANS(vsubwev_h_b, gen_vvv, gen_helper_vsubwev_h_b)
>> +TRANS(vsubwev_w_h, gen_vvv, gen_helper_vsubwev_w_h)
>> +TRANS(vsubwev_d_w, gen_vvv, gen_helper_vsubwev_d_w)
>> +TRANS(vsubwev_q_d, gen_vvv, gen_helper_vsubwev_q_d)
>> +TRANS(vsubwod_h_b, gen_vvv, gen_helper_vsubwod_h_b)
>> +TRANS(vsubwod_w_h, gen_vvv, gen_helper_vsubwod_w_h)
>> +TRANS(vsubwod_d_w, gen_vvv, gen_helper_vsubwod_d_w)
>> +TRANS(vsubwod_q_d, gen_vvv, gen_helper_vsubwod_q_d)
>
> These can be implemented with a combination of vector shift + vector add.
>
>> +TRANS(vaddwev_h_bu, gen_vvv, gen_helper_vaddwev_h_bu)
>> +TRANS(vaddwev_w_hu, gen_vvv, gen_helper_vaddwev_w_hu)
>> +TRANS(vaddwev_d_wu, gen_vvv, gen_helper_vaddwev_d_wu)
>> +TRANS(vaddwev_q_du, gen_vvv, gen_helper_vaddwev_q_du)
>> +TRANS(vaddwod_h_bu, gen_vvv, gen_helper_vaddwod_h_bu)
>> +TRANS(vaddwod_w_hu, gen_vvv, gen_helper_vaddwod_w_hu)
>> +TRANS(vaddwod_d_wu, gen_vvv, gen_helper_vaddwod_d_wu)
>> +TRANS(vaddwod_q_du, gen_vvv, gen_helper_vaddwod_q_du)
>> +TRANS(vsubwev_h_bu, gen_vvv, gen_helper_vsubwev_h_bu)
>> +TRANS(vsubwev_w_hu, gen_vvv, gen_helper_vsubwev_w_hu)
>> +TRANS(vsubwev_d_wu, gen_vvv, gen_helper_vsubwev_d_wu)
>> +TRANS(vsubwev_q_du, gen_vvv, gen_helper_vsubwev_q_du)
>> +TRANS(vsubwod_h_bu, gen_vvv, gen_helper_vsubwod_h_bu)
>> +TRANS(vsubwod_w_hu, gen_vvv, gen_helper_vsubwod_w_hu)
>> +TRANS(vsubwod_d_wu, gen_vvv, gen_helper_vsubwod_d_wu)
>> +TRANS(vsubwod_q_du, gen_vvv, gen_helper_vsubwod_q_du)
>
> These can be implemented with a combination of vector and + vector add.
>
>> +TRANS(vaddwev_h_bu_b, gen_vvv, gen_helper_vaddwev_h_bu_b)
>> +TRANS(vaddwev_w_hu_h, gen_vvv, gen_helper_vaddwev_w_hu_h)
>> +TRANS(vaddwev_d_wu_w, gen_vvv, gen_helper_vaddwev_d_wu_w)
>> +TRANS(vaddwev_q_du_d, gen_vvv, gen_helper_vaddwev_q_du_d)
>> +TRANS(vaddwod_h_bu_b, gen_vvv, gen_helper_vaddwod_h_bu_b)
>> +TRANS(vaddwod_w_hu_h, gen_vvv, gen_helper_vaddwod_w_hu_h)
>> +TRANS(vaddwod_d_wu_w, gen_vvv, gen_helper_vaddwod_d_wu_w)
>> +TRANS(vaddwod_q_du_d, gen_vvv, gen_helper_vaddwod_q_du_d)
>
> Likewise.
>
> For an example of how to bundle vector operations, see e.g. 
> gen_gvec_rax1 and subroutines in target/arm/translate-a64.c. There are 
> many others, but ask if you need more help.
>
I have some questions:
1 Should we need implement  GVecGen*  for simple gvec instructiosn?
     such as add, sub , or , xor..
2 Should we need implement all fni8/fni4, fniv,  fno?

Thanks
Song Gao


