Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 919E154A8FE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 07:58:52 +0200 (CEST)
Received: from localhost ([::1]:43840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0zZj-0000RW-6V
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 01:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1o0zXa-0007Ba-Bb
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:56:40 -0400
Received: from mail.ispras.ru ([83.149.199.84]:51540)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1o0zXY-0006Ce-5M
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:56:37 -0400
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 2043D40737A8;
 Tue, 14 Jun 2022 05:55:19 +0000 (UTC)
Message-ID: <1e5f6355-61a2-28e9-27c7-2930d128153d@ispras.ru>
Date: Tue, 14 Jun 2022 08:55:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] target/mips: implement Octeon-specific arithmetic
 instructions
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, jiaxun.yang@flygoat.com, aurelien@aurel32.net,
 aleksandar.rikalo@syrmia.com
References: <165476301211.40568.5713018312386387782.stgit@pasha-ThinkPad-X280>
 <165476302832.40568.14732977026786901317.stgit@pasha-ThinkPad-X280>
 <5f8a2a73-dc3b-821c-8ee3-127d4e0c78d2@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <5f8a2a73-dc3b-821c-8ee3-127d4e0c78d2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 09.06.2022 18:53, Richard Henderson wrote:
> On 6/9/22 01:23, Pavel Dovgalyuk wrote:
>> +static bool trans_BADDU(DisasContext *ctx, arg_BADDU *a)
>> +{
>> +    TCGv t0, t1;
>> +
>> +    if (a->rt == 0) {
>> +        /* nop */
>> +        return true;
>> +    }
> 
> I believe that we're standardizing on using gen_store_gpr, and not 
> checking for r0 everywhere.

I didn't remove this condition for making translation a bit faster.
Now there are no jumps or helpers, and I believe that optimizer
can remove everything in case of r0.
But if you insist, I'll remove this check.

> 
> 
>> +static bool trans_EXTS(DisasContext *ctx, arg_EXTS *a)
>> +{
>> +    TCGv t0;
>> +
>> +    if (a->rt == 0) {
>> +        /* nop */
>> +        return true;
>> +    }
>> +
>> +    t0 = tcg_temp_new();
>> +    gen_load_gpr(t0, a->rs);
>> +    tcg_gen_sextract_tl(t0, t0, a->p, a->lenm1);
> 
> a->lenm1 + 1.
> 
>> +    tcg_gen_deposit_z_tl(t0, t0, a->p, a->lenm1);
> 
> Likewise.
> 
> 
> r~


