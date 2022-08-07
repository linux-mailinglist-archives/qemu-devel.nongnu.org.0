Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10DF58B912
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Aug 2022 05:23:37 +0200 (CEST)
Received: from localhost ([::1]:38926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKWt6-0001oy-Cw
	for lists+qemu-devel@lfdr.de; Sat, 06 Aug 2022 23:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1oKWrt-0000DP-Qh
 for qemu-devel@nongnu.org; Sat, 06 Aug 2022 23:22:21 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53490 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1oKWrr-0000FW-C6
 for qemu-devel@nongnu.org; Sat, 06 Aug 2022 23:22:21 -0400
Received: from smtpclient.apple (unknown [124.126.138.235])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxGszcL+9inSUJAA--.2047S3;
 Sun, 07 Aug 2022 11:22:04 +0800 (CST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: huqi <huqi@loongson.cn>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] target/loongarch: Fix "movfcsr2gr" gets wrong value
Date: Sun, 7 Aug 2022 11:22:03 +0800
Message-Id: <B2906C35-BB6C-453D-BF86-7FA98FB5A5D9@loongson.cn>
References: <26f5be99-e9be-df9d-be50-1a2f2cd64986@linaro.org>
Cc: Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 Feiyang Chen <chenfeiyang@loongson.cn>
In-Reply-To: <26f5be99-e9be-df9d-be50-1a2f2cd64986@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: iPhone Mail (19E241)
X-CM-TRANSID: AQAAf9AxGszcL+9inSUJAA--.2047S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Gry3AFWUCrWUGw4xtr47Arb_yoWDuFc_WF
 yF9F97Cr1Ut3W0ya4vqr1Fvry7WrZFqr15Z3WqyFWfJryftFn8JryDJws3Xw15urs0qrnx
 Wr1xXFW8Cw4xtjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbc8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
 Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
 1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8GwCF
 04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
 18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
 r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
 1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
 cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU84SoDUUUU
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQAKCV3QvP-KYwAUsx
Received-SPF: pass client-ip=114.242.206.163; envelope-from=huqi@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



> On Aug 7, 2022, at 00:18, Richard Henderson <richard.henderson@linaro.org>=
 wrote:
>=20
> =EF=BB=BFOn 8/6/22 06:34, Qi Hu wrote:
>> In follow sequence:
>>   movgr2fcsr $r0,$r0
>>   movgr2fr.d $f0,$r0
>>   fdiv.d     $f0,$f0,$f0
>>   movfcsr2gr $r12,$r0
>> The value of $r12 is "0x00000000", but it should be "0x10100000"(V flag).=

>> These fp helpers are definded with wrong flag "TCG_CALL_NO_WG" (but the
>> helpers write the globle "fcsr"). This causes the "fdiv" helper updates
>> the "fcsr" into mem, but "movfcsr2gr" does not load it from mem.
>> Reported-by: Feiyang Chen<chenfeiyang@loongson.cn>
>> Signed-off-by: Qi Hu<huqi@loongson.cn>
>> ---
>>  target/loongarch/helper.h | 64 +++++++++++++++++++--------------------
>>  1 file changed, 32 insertions(+), 32 deletions(-)
>=20
> That's one solution, though it may perform less well.
>=20
> The other is to remove cpu_fcsr0, and instead access that value with expli=
cit loads and stores in the two (!) instructions that use that tcg temporary=
.
>=20
This solution is better. Thanks for your advice. :)

Qi
>=20
> r~


