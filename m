Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310FC558CAB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 03:14:50 +0200 (CEST)
Received: from localhost ([::1]:57692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4XuK-0005sg-OA
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 21:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1o4XtP-00051b-4k
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 21:13:52 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57398 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1o4XtM-00054L-Qp
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 21:13:50 -0400
Received: from [10.20.42.170] (unknown [10.20.42.170])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj0zDD7ViV+lXAA--.2167S3;
 Fri, 24 Jun 2022 09:13:39 +0800 (CST)
Message-ID: <933763bb-f65e-ada6-fdf2-525e2229a51a@loongson.cn>
Date: Fri, 24 Jun 2022 09:13:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v19 02/13] linux-user: Add LoongArch signal support
Content-Language: en-US
From: maobibo <maobibo@loongson.cn>
To: Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220623085526.1678168-1-gaosong@loongson.cn>
 <20220623085526.1678168-3-gaosong@loongson.cn>
 <fe3d36d7-2ad1-94d1-dd06-e650916b37fd@linaro.org>
 <2fc368ce-7323-b49b-20f1-54a449a40ce4@loongson.cn>
In-Reply-To: <2fc368ce-7323-b49b-20f1-54a449a40ce4@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxj0zDD7ViV+lXAA--.2167S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr43Ww48Aw4DWF4kXF1fWFg_yoW8Gr45pr
 48JF48CryUJr1rCrnFk3WjqFy5AFn7J34UXw18XFyUGrZ8Zr12gryjgryq9FyUAa18Jr1j
 yr4UGF9xZrn8JFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
 8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
 xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
 8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2
 z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
 IFyTuYvjfU5WlkUUUUU
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



在 2022/6/24 08:45, maobibo 写道:
> 
> 
> 在 2022/6/24 07:34, Richard Henderson 写道:
>> On 6/23/22 01:55, Song Gao wrote:
>>> +static void setup_sigcontext(CPULoongArchState *env,
>>> +                             struct target_sigcontext *sc,
>>> +                             struct extctx_layout *extctx)
>>> +{
>>> +    int i;
>>> +
>>> +    if (extctx->flags & SC_USED_FP) {
>>> +        __put_user(extctx->fpu.addr, &sc->sc_extcontext[0]);
>>> +    } else {
>>> +        __put_user(extctx->end.addr, &sc->sc_extcontext[0]);
>>> +    }
>>
>> This is incorrect.  Where did this come from?  It certainly doesn't appear in the kernel's version of setup_sigcontext.  The only reason the result works for you is that this is overwritten by copy_fpu_to_sigframe within setup_sigframe.
> 
> The val of flags is SC_USED_FP alway in function setup_extcontext in this version. We want to optimization in future if FP is not used for application where sigcontext for FP is not necessary. Also it can will be extended for 128bit/256bit vector FPU. 

Oh, it is my fault. It is not necessary to set sc_extcontext[0], we will remove these sentences, and thank for your guidance.

> 
> regards
> bibo,mao
>>
>>
>> r~
> 


