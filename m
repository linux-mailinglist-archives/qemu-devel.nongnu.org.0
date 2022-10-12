Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9661F5FC338
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 11:44:08 +0200 (CEST)
Received: from localhost ([::1]:43738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiYHX-00059C-9F
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 05:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1oiYFY-0003mI-BR
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:42:04 -0400
Received: from mail.xen0n.name ([115.28.160.31]:49670
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1oiYFU-0006LN-NQ
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1665567700; bh=zDFyIkl+Eb10XEo/vf45CTlzpu/kaoUIBgcJ/QrWtUg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ldfD/XD8vGPINBWEBRRV9F1M/jTvEUmVO9u+FMhmQcXK6KTOo2Y8YgkNfCNt5k32N
 VOIym5R74FO6mqeNtRxmBBCPN9j8O2jWVJhvq8qnqWTQDOAFr3IlIXn4MDwpA2zdAs
 U8I8h8e5omsMdnHYYWCV3LKYgckcRc/yg4LHBY4Q=
Received: from [100.100.57.122] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id F1366600CF;
 Wed, 12 Oct 2022 17:41:39 +0800 (CST)
Message-ID: <6e6600c7-352f-2dc3-4513-db07f40bc6a4@xen0n.name>
Date: Wed, 12 Oct 2022 17:41:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:107.0)
 Gecko/20100101 Thunderbird/107.0a1
Subject: Re: [PATCH 1/2] tcg/loongarch64: Implement INDEX_op_neg_i{32,64}
Content-Language: en-US
To: Qi Hu <huqi@loongson.cn>, WANG Xuerui <git@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
References: <cover.1665405913.git.huqi@loongson.cn>
 <04454bbe9695bd7e5d56f4003ead653fb5719099.1665405913.git.huqi@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <04454bbe9695bd7e5d56f4003ead653fb5719099.1665405913.git.huqi@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.934,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi,

On 2022/10/12 17:13, Qi Hu wrote:
> Signed-off-by: Qi Hu <huqi@loongson.cn>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 9 +++++++++
>   tcg/loongarch64/tcg-target.h     | 4 ++--
>   2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
> index a3debf6da7..f5a214a17f 100644
> --- a/tcg/loongarch64/tcg-target.c.inc
> +++ b/tcg/loongarch64/tcg-target.c.inc
> @@ -1125,6 +1125,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>           tcg_out_opc_nor(s, a0, a1, TCG_REG_ZERO);
>           break;
>   
> +    case INDEX_op_neg_i32:
> +        tcg_out_opc_sub_w(s, a0, TCG_REG_ZERO, a1);
> +        break;
> +    case INDEX_op_neg_i64:
> +        tcg_out_opc_sub_d(s, a0, TCG_REG_ZERO, a1);
> +        break;
> +
>       case INDEX_op_nor_i32:
>       case INDEX_op_nor_i64:
>           if (c2) {
> @@ -1503,6 +1510,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>       case INDEX_op_ext_i32_i64:
>       case INDEX_op_not_i32:
>       case INDEX_op_not_i64:
> +    case INDEX_op_neg_i32:
> +    case INDEX_op_neg_i64:
>       case INDEX_op_extract_i32:
>       case INDEX_op_extract_i64:
>       case INDEX_op_bswap16_i32:
> diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
> index d58a6162f2..67380b2432 100644
> --- a/tcg/loongarch64/tcg-target.h
> +++ b/tcg/loongarch64/tcg-target.h
> @@ -114,7 +114,7 @@ typedef enum {
>   #define TCG_TARGET_HAS_bswap16_i32      1
>   #define TCG_TARGET_HAS_bswap32_i32      1
>   #define TCG_TARGET_HAS_not_i32          1
> -#define TCG_TARGET_HAS_neg_i32          0
> +#define TCG_TARGET_HAS_neg_i32          1
>   #define TCG_TARGET_HAS_andc_i32         1
>   #define TCG_TARGET_HAS_orc_i32          1
>   #define TCG_TARGET_HAS_eqv_i32          0
> @@ -150,7 +150,7 @@ typedef enum {
>   #define TCG_TARGET_HAS_bswap32_i64      1
>   #define TCG_TARGET_HAS_bswap64_i64      1
>   #define TCG_TARGET_HAS_not_i64          1
> -#define TCG_TARGET_HAS_neg_i64          0
> +#define TCG_TARGET_HAS_neg_i64          1
>   #define TCG_TARGET_HAS_andc_i64         1
>   #define TCG_TARGET_HAS_orc_i64          1
>   #define TCG_TARGET_HAS_eqv_i64          0
The whole change is not necessary, if target doesn't have neg then the 
target-independent logic already makes sure a sub with the same 
semantics is emitted. This is explained in the commit message of that 
commit introducing add/sub support.

