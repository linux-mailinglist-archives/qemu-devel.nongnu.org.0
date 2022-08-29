Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D23D5A45C1
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 11:09:14 +0200 (CEST)
Received: from localhost ([::1]:52566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSalX-0000oi-Up
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 05:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oSaiM-0007an-5T; Mon, 29 Aug 2022 05:05:51 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:13728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oSaiI-0003mJ-JN; Mon, 29 Aug 2022 05:05:48 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E700A74637E;
 Mon, 29 Aug 2022 11:05:39 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BDD7A74633D; Mon, 29 Aug 2022 11:05:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BB91C7462D3;
 Mon, 29 Aug 2022 11:05:39 +0200 (CEST)
Date: Mon, 29 Aug 2022 11:05:39 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Henderson <richard.henderson@linaro.org>
cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp, alex.bennee@linaro.org, 
 qemu-stable@nongnu.org
Subject: Re: [PATCH] target/sh4: Fix TB_FLAG_UNALIGN
In-Reply-To: <20220829021325.154978-1-richard.henderson@linaro.org>
Message-ID: <c2c0edec-c93b-f6fa-b148-9452e4e7b7@eik.bme.hu>
References: <20220829021325.154978-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

On Sun, 28 Aug 2022, Richard Henderson wrote:
> The value previously chosen overlaps GUSA_MASK.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 4da06fb3062 ("target/sh4: Implement prctl_unalign_sigbus")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/856
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> target/sh4/cpu.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
> index 9f15ef913c..e79cbc59e2 100644
> --- a/target/sh4/cpu.h
> +++ b/target/sh4/cpu.h
> @@ -84,7 +84,7 @@
> #define DELAY_SLOT_RTE         (1 << 2)
>
> #define TB_FLAG_PENDING_MOVCA  (1 << 3)
> -#define TB_FLAG_UNALIGN        (1 << 4)
> +#define TB_FLAG_UNALIGN        (1 << 13)

Is it worth a comment to note why that value to avoid the same problem if 
another flag is added in the future?

Regards,
BALATON Zoltan

>
> #define GUSA_SHIFT             4
> #ifdef CONFIG_USER_ONLY
>

