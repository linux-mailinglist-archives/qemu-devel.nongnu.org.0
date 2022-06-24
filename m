Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A3B558C72
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 02:50:43 +0200 (CEST)
Received: from localhost ([::1]:50802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4XX0-00081L-47
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 20:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1o4XSb-00047x-Tl
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 20:46:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46386 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1o4XSW-0000vf-4D
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 20:46:08 -0400
Received: from [10.20.42.170] (unknown [10.20.42.170])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_09DCbVit9tXAA--.2130S3;
 Fri, 24 Jun 2022 08:45:55 +0800 (CST)
Message-ID: <2fc368ce-7323-b49b-20f1-54a449a40ce4@loongson.cn>
Date: Fri, 24 Jun 2022 08:45:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v19 02/13] linux-user: Add LoongArch signal support
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220623085526.1678168-1-gaosong@loongson.cn>
 <20220623085526.1678168-3-gaosong@loongson.cn>
 <fe3d36d7-2ad1-94d1-dd06-e650916b37fd@linaro.org>
From: maobibo <maobibo@loongson.cn>
In-Reply-To: <fe3d36d7-2ad1-94d1-dd06-e650916b37fd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_09DCbVit9tXAA--.2130S3
X-Coremail-Antispam: 1UD129KBjvdXoWrZryfWFykZr4UWFyxtF1kZrb_yoWkCrb_Cw
 4UGr4xXr1UJrW7J3ZFkrn8Zry7Ja1jvr1UJr45Ar18G34fJrn5Jrn5Xwn5Zr17Kr4UJrnr
 Gr1UZFy3Jr1UWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbIAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
 026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
 JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
 vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280
 aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
 uYvjfU5WlkUUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2022/6/24 07:34, Richard Henderson 写道:
> On 6/23/22 01:55, Song Gao wrote:
>> +static void setup_sigcontext(CPULoongArchState *env,
>> +                             struct target_sigcontext *sc,
>> +                             struct extctx_layout *extctx)
>> +{
>> +    int i;
>> +
>> +    if (extctx->flags & SC_USED_FP) {
>> +        __put_user(extctx->fpu.addr, &sc->sc_extcontext[0]);
>> +    } else {
>> +        __put_user(extctx->end.addr, &sc->sc_extcontext[0]);
>> +    }
> 
> This is incorrect.  Where did this come from?  It certainly doesn't appear in the kernel's version of setup_sigcontext.  The only reason the result works for you is that this is overwritten by copy_fpu_to_sigframe within setup_sigframe.

The val of flags is SC_USED_FP alway in function setup_extcontext in this version. We want to optimization in future if FP is not used for application where sigcontext for FP is not necessary. Also it can will be extended for 128bit/256bit vector FPU. 

regards
bibo,mao
> 
> 
> r~


