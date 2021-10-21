Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA7C4358A3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 04:29:40 +0200 (CEST)
Received: from localhost ([::1]:45796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdNpr-0006Vo-Ji
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 22:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lrwei@bupt.edu.cn>) id 1mdNoh-0005qZ-Ps
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 22:28:27 -0400
Received: from smtpbg156.qq.com ([15.184.82.18]:43664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lrwei@bupt.edu.cn>) id 1mdNoa-0005Hi-OK
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 22:28:26 -0400
X-QQ-mid: bizesmtp38t1634783289t9m55m1e
Received: from [10.128.193.39] (unknown [223.72.75.170])
 by esmtp6.qq.com (ESMTP) with SMTP id 0
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 10:28:08 +0800 (CST)
X-QQ-SSF: 01400000002000B0Z000B00Z0000000
X-QQ-FEAT: J5JfekO1Wsikq0z9CKyPaDzA5xrme5abWoOYH1mYb48taoSTZts4tWvwav7aX
 O/5esYrouHc+IXRqZD/7roFVSqGghDVnYRh7zQ7drXsA/k+zaPD674U8gcguh2cmiZsFn5d
 f1v/3jBVC0hGNQC1Xqlaajizyxi7ZikTqpfr/NikOerYpkSkWXCVvP4PfE3Fz0rASQ7GBus
 LF+kEMTDOxGM/p9wh6vQdt9PNA2y0aSFzDfuLA0YttG7gUqllJarXLVdBMOhMcN6MPRvr3/
 nAlk1bqBKMWh6kiL7ZzAgLRkbNnBGg0owIrl+4KaazpQVy8x1rVph3tlas61JIJzys8ukFE
 0waEUy3mEccleD5hEMxk9B7uQ06/36B9tOckw7TPV8AxhSbR6P+LJn4ngZ6zfVl7Xt++Bgx
 QaXa+0jBOMA=
X-QQ-GoodBg: 2
Message-ID: <cac008cd-535c-881f-6c72-ce2f7c6d7410@bupt.edu.cn>+E56D42B9122EFBD5
Date: Thu, 21 Oct 2021 10:28:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] Fix constant folding logic of setcond2_i32
Content-Language: en-US
From: Liren Wei <lrwei@bupt.edu.cn>
To: qemu-devel@nongnu.org
References: <20211021021314.16746-1-lrwei@bupt.edu.cn>
In-Reply-To: <20211021021314.16746-1-lrwei@bupt.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:bupt.edu.cn:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
Received-SPF: pass client-ip=15.184.82.18; envelope-from=lrwei@bupt.edu.cn;
 helo=smtpbg156.qq.com
X-Spam_score_int: 21
X-Spam_score: 2.1
X-Spam_bar: ++
X-Spam_report: (2.1 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 INVALID_MSGID=0.568, NICE_REPLY_A=-2.267, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, RCVD_IN_PBL=3.335, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 10/21/21 10:13, Liren Wei wrote:
> For setcond2_i32 DST, A_low, A_high, B_low, B_high, TCG_COND_EQ,
> DST should be 0 as long as either half of A and B are not equal.
>
> Signed-off-by: Liren Wei <lrwei@bupt.edu.cn>
> ---
>   tcg/optimize.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tcg/optimize.c b/tcg/optimize.c
> index c239c3bd07..45a10e5e72 100644
> --- a/tcg/optimize.c
> +++ b/tcg/optimize.c
> @@ -1492,7 +1492,7 @@ void tcg_optimize(TCGContext *s)
>                                                  op->args[2], op->args[4],
>                                                  TCG_COND_EQ);
>                   if (tmp == 0) {
> -                    goto do_setcond_high;
> +                    goto do_setcond_const;
>                   } else if (tmp != 1) {
>                       goto do_default;
>                   }
Just noticed that this has been fixed in new patch series by others, 
please ignore this. Sorry about that...




