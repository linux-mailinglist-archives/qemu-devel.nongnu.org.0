Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8676D3BD2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 04:29:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj9vX-0002T1-Tr; Sun, 02 Apr 2023 22:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pj9vV-0002Sr-Jm
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 22:28:09 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pj9vS-0004vn-P7
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 22:28:09 -0400
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8Axu5erOSpkEeAVAA--.33788S3;
 Mon, 03 Apr 2023 10:27:55 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxAeWpOSpkSSEUAA--.53855S3; 
 Mon, 03 Apr 2023 10:27:53 +0800 (CST)
Subject: Re: [RFC PATCH v2 33/44] target/loongarch: Implement vfrstp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-34-gaosong@loongson.cn>
 <1fdc07f3-4e0b-8bd9-3ff4-474c4df6425f@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <3d397ea8-2d36-786c-c930-1daf4f084681@loongson.cn>
Date: Mon, 3 Apr 2023 10:27:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1fdc07f3-4e0b-8bd9-3ff4-474c4df6425f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8DxAeWpOSpkSSEUAA--.53855S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvdXoW7XryrJFy7tw18JFW5Jr1xGrg_yoWDuFb_Jr
 48GryDZr10qa1UGFy5tw1UX34UAr4UtF1YkF4qvw17Xry5Jrn8Grn0grn5ZF1xKr48Zr1q
 yFyxXr1fCr15JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
 xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
 c7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
 AFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
 6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
 xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
 62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
 CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvj
 eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw2
 8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
 x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrw
 CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
 42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUrNtxDUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.37,
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


在 2023/4/2 下午1:17, Richard Henderson 写道:
> On 3/27/23 20:06, Song Gao wrote:
>> This patch includes:
>> - VFRSTP[I].{B/H}.
>>
>> Signed-off-by: Song Gao<gaosong@loongson.cn>
>> ---
>>   target/loongarch/disas.c                    |  5 +++
>>   target/loongarch/helper.h                   |  5 +++
>>   target/loongarch/insn_trans/trans_lsx.c.inc |  5 +++
>>   target/loongarch/insns.decode               |  5 +++
>>   target/loongarch/lsx_helper.c               | 41 +++++++++++++++++++++
>>   5 files changed, 61 insertions(+)
>
> This one's obscure.  Find first negative element in Vj,
> store that value in Vd element indexed by Vk?
>
Yes,  but the value is  the first negative element index  or  max index + 1.

e.g   vfrstp.b  vd, vj, vk.
     idx = 0;
     for  i in range(16);
         if Vj->B[i]  < 0; break;
         idx = idx +1;
     m = Vk->B(0) % 16;
     Vd->B(m) = idx;

Thanks.
Song Gao


