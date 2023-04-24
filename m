Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5176ECC41
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 14:49:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqvce-0003ak-OA; Mon, 24 Apr 2023 08:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pqvcV-0003Z5-4y
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 08:48:39 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pqvcT-0008Pf-Mt
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 08:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=smNyn11LhV+eWdhVcp1yYF7S5zSnDzRZqlkx7SSce5A=; b=hrl861qJ/pmKcJd8CkbzaGp4ym
 SZKxzVEu7cgRVbdOT44OfO6qP1mpwul3Y3LyKDlS4v/om9llpvo0oyr6dOHYt1m8aq9BRE6dmSbJL
 saUKTBI8NZqUaRS0oDj1/9drFZ3NGIeN6KmnYyUT0Okiqyu3q140Sxo4UzrtaQ41RX+4=;
Message-ID: <0695f221-8615-7825-64e1-d92ac118f708@rev.ng>
Date: Mon, 24 Apr 2023 14:48:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 4/8] accel/tcg: Replace target_ulong with vaddr in
 helper_unaligned_*()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230420212850.20400-1-anjo@rev.ng>
 <20230420212850.20400-5-anjo@rev.ng>
 <6f98eae8-30b6-9253-38b9-0663a6861f4e@linaro.org>
Organization: rev.ng
In-Reply-To: <6f98eae8-30b6-9253-38b9-0663a6861f4e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 4/23/23 11:10, Richard Henderson wrote:
> On 4/20/23 22:28, Anton Johansson wrote:
>> Updates helper_unaligned_[ld|st] to take the store/load address as a
>> vaddr instead of a target_ulong.
>>
>> Signed-off-by: Anton Johansson<anjo@rev.ng>
>> ---
>>   accel/tcg/user-exec.c  | 4 ++--
>>   include/tcg/tcg-ldst.h | 4 ++--
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> I've got patches posted to remove these functions.
Nice, I'll remove this patch then!

-- 
Anton Johansson,
rev.ng Labs Srl.


