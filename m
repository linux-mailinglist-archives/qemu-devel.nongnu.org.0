Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490914285B7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 06:22:11 +0200 (CEST)
Received: from localhost ([::1]:49876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZmpF-0004jC-Ri
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 00:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mZmny-00043a-9l
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 00:20:50 -0400
Received: from [115.28.160.31] (port=50100 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mZmnt-0001cS-UY
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 00:20:49 -0400
Received: from [100.100.57.93] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 33FDB60184;
 Mon, 11 Oct 2021 12:20:35 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1633926035; bh=30wq25GsUz4peDQA4LFE5KBELBjrKRNvwG5d6V6MpAY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iKJVT4MZI14OAHUAF8UGxXVipj2pczY7Llq8qQTDahkKEZi92tgRGracNnCa+tybI
 nuSSyDmJ/f2XWamsDSiORSY5UWxJfnHuEFkSddD0xFEFxkQwkwOATKfUJythnKIMLt
 j9yjz7GbW3fhQzmKfClwPQkbcT+IIWPsKlf2jnAc=
Message-ID: <768cf292-1393-2076-e10f-d0147ad325a6@xen0n.name>
Date: Mon, 11 Oct 2021 12:20:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:95.0)
 Gecko/20100101 Thunderbird/95.0a1
Subject: Re: [PATCH 7/8] target/mips: Support TCG_TARGET_SIGNED_ADDR32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211010174401.141339-1-richard.henderson@linaro.org>
 <20211010174401.141339-8-richard.henderson@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20211010174401.141339-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alistair.Francis@wdc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 2021/10/11 01:44, Richard Henderson wrote:
> All 32-bit mips operations sign-extend the output, so we are easily
> able to keep TCG_TYPE_I32 values sign-extended in host registers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/mips/tcg-target-sa32.h |  8 ++++++++
>  tcg/mips/tcg-target.c.inc  | 13 +++----------
>  2 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/tcg/mips/tcg-target-sa32.h b/tcg/mips/tcg-target-sa32.h
> index cb185b1526..51255e7cba 100644
> --- a/tcg/mips/tcg-target-sa32.h
> +++ b/tcg/mips/tcg-target-sa32.h
> @@ -1 +1,9 @@
> +/*
> + * Do not set TCG_TARGET_SIGNED_ADDR32 for mips32;
> + * TCG expects this to only be set for 64-bit hosts.
> + */
> +#ifdef __mips64
> +#define TCG_TARGET_SIGNED_ADDR32 1
> +#else
>  #define TCG_TARGET_SIGNED_ADDR32 0
> +#endif
It looks like we never want to set TCG_TARGET_SIGNED_ADDR32 on 32-bit
hosts; maybe a compile-time assert could be added somewhere for
statically guaranteeing this?
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index d8f6914f03..cc3b4d5b90 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -1161,20 +1161,13 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
>          tcg_out_ld(s, TCG_TYPE_I32, TCG_TMP0, TCG_TMP3, cmp_off + LO_OFF);
>          tcg_out_movi(s, TCG_TYPE_I32, TCG_TMP1, mask);
>      } else {
> -        tcg_out_ldst(s, (TARGET_LONG_BITS == 64 ? OPC_LD
> -                         : TCG_TARGET_REG_BITS == 64 ? OPC_LWU : OPC_LW),
> -                     TCG_TMP0, TCG_TMP3, cmp_off);
> +        tcg_out_ld(s, TCG_TYPE_TL, TCG_TMP0, TCG_TMP3, cmp_off);
>          tcg_out_movi(s, TCG_TYPE_TL, TCG_TMP1, mask);
>          /* No second compare is required here;
>             load the tlb addend for the fast path.  */
>          tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
>      }
>  
> -    /* Zero extend a 32-bit guest address for a 64-bit host. */
> -    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
> -        tcg_out_ext32u(s, base, addrl);
> -        addrl = base;
> -    }
>      tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
>  
>      label_ptr[0] = s->code_ptr;
> @@ -1456,7 +1449,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
>                          data_regl, data_regh, addr_regl, addr_regh,
>                          s->code_ptr, label_ptr);
>  #else
> -    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
> +    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
Is there precedent of extracting predicates like this into some header
for reuse? However I agree that the current expression conveys enough
meaning without being overly complicated.
>          tcg_out_ext32u(s, base, addr_regl);
>          addr_regl = base;
>      }
> @@ -1559,7 +1552,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
>                          s->code_ptr, label_ptr);
>  #else
>      base = TCG_REG_A0;
> -    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
> +    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS && !guest_base_signed_addr32) {
>          tcg_out_ext32u(s, base, addr_regl);
>          addr_regl = base;
>      }

