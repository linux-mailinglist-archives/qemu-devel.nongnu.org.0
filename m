Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF326E5CE7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 11:04:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pohFp-00073l-Uv; Tue, 18 Apr 2023 05:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pohFm-00073a-Mi
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 05:03:58 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pohFk-0005V9-9V
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 05:03:58 -0400
Received: from loongson.cn (unknown [10.20.42.57])
 by gateway (Coremail) with SMTP id _____8Bxok7xXD5kK2AeAA--.35766S3;
 Tue, 18 Apr 2023 17:03:45 +0800 (CST)
Received: from [10.20.42.57] (unknown [10.20.42.57])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxX+TvXD5kRaYsAA--.23092S3; 
 Tue, 18 Apr 2023 17:03:43 +0800 (CST)
Subject: Re: [RFC PATCH v2 43/44] target/loongarch: Implement vldi
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-44-gaosong@loongson.cn>
 <339954b6-8d79-406a-32fb-7f8b9c0eb93b@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <c6d6180e-9a28-1c1f-98dd-19088041ba29@loongson.cn>
Date: Tue, 18 Apr 2023 17:03:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <339954b6-8d79-406a-32fb-7f8b9c0eb93b@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8BxX+TvXD5kRaYsAA--.23092S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvdXoW7Jr4rAF1Uur4rZry8KF4fGrg_yoWktrb_J3
 yUWr1UXF15J3yUAr1Dtr15Z34xXr1jyw1UJrs8ArWUWF17Jws5Jr15Gwn5Jr1UGr47Jr1U
 Grn8X3W3JFyUXjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
 xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
 x7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
 AFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
 6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
 xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
 0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
 AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1l
 Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
 8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UWHqcUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.284,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

在 2023/4/4 上午11:39, Richard Henderson 写道:
> On 3/27/23 20:06, Song Gao wrote:
>> +static bool trans_vldi(DisasContext *ctx, arg_vldi *a)
>> +{
>> +    int sel, vece;
>> +    uint64_t value;
>> +    CHECK_SXE;
>> +
>> +    sel = (a->imm >> 12) & 0x1;
>> +
>> +    if (sel) {
>> +        /* VSETI.D */
>> +        value = vldi_get_value(ctx, a->imm);
>> +        vece = MO_64;
>> +    } else {
>> +       /*
>> +        * VLDI.B/H/W/D
>> +        *  a->imm bit [11:10] is vece.
>> +        *  a->imm bit [9:0] is value;
>> +        */
>> +       value = ((int32_t)(a->imm << 22)) >> 22;
>> +       vece = (a->imm >> 10) & 0x3;
>> +    }
>> +
>> +    tcg_gen_gvec_dup_i64(vece, vreg_full_offset(a->vd), 16, 16,
>> +                         tcg_constant_i64(value));
>> +    return true;
>> +}
>
> I think you should finish this decode in insns.decode,
> especially since we are using that for disassembly.
>
You can ignore these comments, I will drop them. We only have vldi, no 
vseti.d, vldi.xxx insns.

Thanks.
Song Gao


