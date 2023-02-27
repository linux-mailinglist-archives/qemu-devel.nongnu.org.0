Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A506A4212
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:56:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWd2f-0001Pf-IB; Mon, 27 Feb 2023 07:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pWd27-0001Cy-Ce
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:55:19 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pWd24-00068d-Ra
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:55:11 -0500
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8AxJEwqqPxjnBsGAA--.5947S3;
 Mon, 27 Feb 2023 20:55:06 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxTuQpqPxjegI_AA--.12447S3; 
 Mon, 27 Feb 2023 20:55:06 +0800 (CST)
Subject: Re: [RFC PATCH 10/43] target/loongarch: Implement vaddw/vsubw
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-11-gaosong@loongson.cn>
 <268ef762-fce5-ca47-d5f7-bd60955a3a0f@linaro.org>
 <f5c0796d-62c9-691a-c2ba-e4dd9e654831@loongson.cn>
 <e75fd2b7-9955-ad2b-62d2-30d7b85d7e7b@linaro.org>
 <f484b933-8f9f-6f0b-0d81-7202bed31d83@loongson.cn>
 <1ad204fc-8f7e-0f1c-e8f6-163d11f3880b@linaro.org>
 <c795a157-21a8-a8d7-bbc1-ed33e7f32747@loongson.cn>
 <c5913a52-e5de-4fb5-688c-6d3fb3215353@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <5ce46e81-b2c3-8b45-1bd9-9705520f4557@loongson.cn>
Date: Mon, 27 Feb 2023 20:55:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c5913a52-e5de-4fb5-688c-6d3fb3215353@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8DxTuQpqPxjegI_AA--.12447S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uw47JFW7AF1ftF4fur45ZFb_yoW8GF1kpr
 1kGr47CryUGr1kJr1UGr1UWryUJw18Jw15Jr4UJFyUGryUJr1jqr17Xr1j9F1UCr48Wr1U
 Jr1UJr1Uur1Dt3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bakYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
 0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
 AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1l
 Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1l
 x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
 v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
 x2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
 Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
 yTuYvjxU7pnQUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
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


在 2023/2/25 上午3:24, Richard Henderson 写道:
>>          {
>>              .fniv = gen_vaddwev_s,
>>              .fno = gen_helper_vaddwev_q_d,
>>              .opt_opc = vecop_list,
>>              .vece = MO_128
>>          },
>
> There are no 128-bit vector operations; you'll need to do this one 
> differently.
>
> Presumably just load the two 64-bit elements, sign-extend into 
> 128-bits, add with tcg_gen_add2_i64, and store the two 64-bit elements 
> as output.  But that won't fit into the tcg_gen_gvec_3 interface.
>
'sign-extend into 128-bits,'   Could you give a example?

I see a example at target/ppc/translate/vmx-impl.c.inc
     static bool do_vx_vprtyb(DisasContext *ctx, arg_VX_tb *a, unsigned 
vece)
     {
             ...
             {
             .fno = gen_helper_VPRTYBQ,
             .vece = MO_128
             },
             tcg_gen_gvec_2(avr_full_offset(a->vrt), 
avr_full_offset(a->vrb),
                                16, 16, &op[vece - MO_32]);
         return true;
     }
TRANS(VPRTYBQ, do_vx_vprtyb, MO_128)
...

do_vx_vprtyb  fit the fno into the tcg_gen_gvec_2.
I am not sure this  example is right.

Thanks.
Song Gao


