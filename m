Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 933BE6A996E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 15:32:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY6SF-0007wq-7l; Fri, 03 Mar 2023 09:32:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pY6SC-0007ut-5r
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 09:32:12 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pY6SA-0007m2-7N
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 09:32:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=toWykX+XX7lOfN0193lKamfLWEB+kSE4XhK+jr+rle0=; b=rZN+6Kf9q2Le1K/+UWbsCanFC5
 R6d7onRyU1szDKn8MRrm3DVqACtqbxJWR+Oy621TBg2adSzgKxxXJZv7QYCWGbkKk0fSFa3bnFwg9
 RX1j/UYO/8R8zQhmQpuglHtO3ktep6JIyT3tVvryvQ99QJAGHZs7TC4L3nxdSSxznVJc=;
Message-ID: <4c181663-5ec3-cd94-1e0f-f6551823fac4@rev.ng>
Date: Fri, 3 Mar 2023 15:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] tcg: `reachable_code_pass()` remove empty else-branch
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "ale@rev.ng" <ale@rev.ng>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>
References: <20230301142221.24495-1-anjo@rev.ng>
 <SN4PR0201MB8808E80B0AD000E394223813DEAD9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <SN4PR0201MB8808E80B0AD000E394223813DEAD9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 3/1/23 23:37, Taylor Simpson wrote:
>> diff --git a/tcg/tcg.c b/tcg/tcg.c
>> index a4a3da6804..531bc74231 100644
>> --- a/tcg/tcg.c
>> +++ b/tcg/tcg.c
>> @@ -2664,21 +2664,40 @@ static void reachable_code_pass(TCGContext *s)
>>                   dead = false;
>>                   remove = false;
>>
>> -                /*
>> -                 * Optimization can fold conditional branches to unconditional.
>> -                 * If we find a label with one reference which is preceded by
>> -                 * an unconditional branch to it, remove both.  This needed to
>> -                 * wait until the dead code in between them was removed.
>> -                 */
>> -                if (label->refs == 1) {
>> -                    TCGOp *op_prev = QTAILQ_PREV(op, link);
> Can't we just insert a while loop here to move op_prev back across labels?
>
>      while (op_next->opc == INDEX_op_set_label) {
>          op_prev = QTAILQ_PREV(op, op_prev);
>      }
>
>> -                    if (op_prev->opc == INDEX_op_br &&
>> -                        label == arg_label(op_prev->args[0])) {
Ah I see, you're thinking something like

     dead = false;
     remove = false;

     if (label->refs == 1) {
         TCGOp *op_prev = NULL;
         do {
             op_prev = QTAILQ_PREV(op_prev, link);
         } while (op_prev->opc == INDEX_op_set_label);

         if (op_prev->opc == INDEX_op_br &&
             label == arg_label(op_prev->args[0])) {
             tcg_op_remove(s, op_prev);
             remove = true;
         }
     }

to handle

     br
     set_label
     ...
     set_label

I do like being able to combine both branches, and we're no longer 
relying on
the next iteration of the loop to clean up the final set_label. Since we 
won't
ever encounter more than one intermediate set_label this might be overkill,
but either way I think it's an improvement.

Thanks for the feedback, I'll resubmit with this change! :)

-- 
Anton Johansson,
rev.ng Labs Srl.


