Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B88044E275
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 08:42:35 +0100 (CET)
Received: from localhost ([::1]:48530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlRCk-0001vG-Or
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 02:42:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlRAL-0000Ip-2P
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 02:40:05 -0500
Received: from [2a00:1450:4864:20::433] (port=34436
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlRA5-0004n7-6f
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 02:40:04 -0500
Received: by mail-wr1-x433.google.com with SMTP id d5so14008582wrc.1
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 23:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OJGXOt+4wXnDF80iQyk6ZaFOwM6eUIB5gU1+pv84LZA=;
 b=myJ0Qh2VtH6eI45YDaJjcnL4mwFCur8vACAlhjnLglGxgKQpEIJN8XTU035hHKAtkH
 8P0qxiSDTrAU6MKSPkk83IoKU3z/72ynpdSMijiZSmSw0OxKjW66/xYmvOaOi0r3sMXu
 XAh3mTzLt9PBfUb8XV434KyWaYaR19VRiNkGajhu9xo9rH0zyRIuq7fsfbGBDlVAg5w0
 sNJkxNZRlAw9S0n4QVY6YP6swwZe7j0J+vM5CjK/ZNqf56ouO17WzBIbZXXbDVoDOQi+
 JubX7A6yIPvbY3mvHH6PWmwFLvq4Ymj4oFupet0nYa9riuaj83vadODv0ktGdUBF5IFY
 gi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OJGXOt+4wXnDF80iQyk6ZaFOwM6eUIB5gU1+pv84LZA=;
 b=jUSJEIMk107P+/UYhElSI5/bdAivxS0MU7Xh/Q0wAWuuD7mkKxug9UGtcSLcP3G1h+
 DQuma1X3OT32QsgmqXgDnBLXEUPkP6CNGEw5WGFEIJP6/HQ2a0yPtO5354lo49e3DxBO
 lYgfHKTbsTbUyhKCr9czMKCnbwFEdkRm2Nl/0iVCkMkvcmsFJpUO1WzKgOHfpeAYOyZ6
 x6dY77TDv8U0o4wrVngEwfQm91d31FbvPHtdZG74FZv9nKfkLh9QwzIJ1gKkGHm1y0xN
 qS6FbXEZNLtbsjp+SyAon6TlMi3K7EBQeoKHKBE0U8AxTwJAcUKBsqqKhTjEVHK2Y5+i
 HzYw==
X-Gm-Message-State: AOAM533SFpi7h1B1chwKKVxZwh+wb7hSSRWHva3MjzoYpCyHa531/t4Y
 8cDgPEU9VAlcfYvfGOGlXhaNrg==
X-Google-Smtp-Source: ABdhPJzJ4V8nsfNi2EdW2ZeuSOT/CqS0AnSoYRXQPZe6bH8x0K7ADc8P2WDaKVDTT7CBgJmrXgiTpA==
X-Received: by 2002:a5d:5147:: with SMTP id u7mr3490573wrt.233.1636702787567; 
 Thu, 11 Nov 2021 23:39:47 -0800 (PST)
Received: from [192.168.8.106] (18.red-2-142-115.dynamicip.rima-tde.net.
 [2.142.115.18])
 by smtp.gmail.com with ESMTPSA id h16sm5866802wrm.27.2021.11.11.23.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 23:39:47 -0800 (PST)
Subject: Re: [PATCH v10 16/26] target/loongarch: Add disassembler
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1636700049-24381-1-git-send-email-gaosong@loongson.cn>
 <1636700049-24381-17-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <22148b72-1696-2420-c937-7e0ce083f963@linaro.org>
Date: Fri, 12 Nov 2021 08:39:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1636700049-24381-17-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.449,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/21 7:53 AM, Song Gao wrote:
> +const char * const fccregnames[8] = {
> +  "$fcc0", "$fcc1", "$fcc2", "$fcc3", "$fcc4", "$fcc5", "$fcc6", "$fcc7",
> +};

static.

> +static void output_fcsrdrj(DisasContext *ctx, arg_fmt_fcsrdrj *a,
> +                           const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "%s, %s", regnames[a->fcsrd], regnames[a->rj]);
> +}
> +
> +static void output_rdfcsrs(DisasContext *ctx, arg_fmt_rdfcsrs *a,
> +                           const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "%s, %s", regnames[a->rd], regnames[a->fcsrs]);
> +}

Wrong names for fcsr[ds].  Probably easiest to just use "fcsr%d" rather than having an 
array of strings.

> +static void output_rdrjsi12(DisasContext *ctx, arg_fmt_rdrjsi12 *a,
> +                            const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "%s, %s, 0x%x",
> +           regnames[a->rd], regnames[a->rj], (a->si12) & 0xfff);
> +}

Surely printing the signed value is more useful.

> +static void output_rdrjsi16(DisasContext *ctx, arg_fmt_rdrjsi16 *a,
> +                            const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "%s, %s, 0x%x",
> +           regnames[a->rd], regnames[a->rj], (a->si16) & 0xffff);
> +}
> +
> +static void output_rdsi20(DisasContext *ctx, arg_fmt_rdsi20 *a,
> +                          const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "%s, 0x%x", regnames[a->rd], (a->si20) & 0xfffff);
> +}
> +
> +static void output_rdrjsi14(DisasContext *ctx, arg_fmt_rdrjsi14 *a,
> +                            const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "%s, %s, 0x%x",
> +           regnames[a->rd], regnames[a->rj],  (a->si14) & 0x3fff);
> +}
> +
> +static void output_hintrjsi12(DisasContext *ctx, arg_fmt_hintrjsi12 *a,
> +                              const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "0x%x, %s, 0x%x",
> +           a->hint, regnames[a->rj], (a->si12) & 0xfff);
> +}
> +
> +static void output_fdrjsi12(DisasContext *ctx, arg_fmt_fdrjsi12 *a,
> +                            const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "%s, %s, 0x%x",
> +           fregnames[a->fd], regnames[a->rj], (a->si12) & 0xfff);
> +}

Likewise.

> +static void output_rjoffs21(DisasContext *ctx, arg_fmt_rjoffs21 *a,
> +                            const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "%s, 0x%x", regnames[a->rj], (a->offs21) & 0x1fffff);
> +}
> +
> +static void output_cjoffs21(DisasContext *ctx, arg_fmt_cjoffs21 *a,
> +                            const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "%s, 0x%x",
> +           fccregnames[a->cj], (a->offs21) & 0x1fffff);
> +}
> +
> +static void output_rdrjoffs16(DisasContext *ctx, arg_fmt_rdrjoffs16 *a,
> +                              const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "%s, %s, 0x%x",
> +           regnames[a->rd], regnames[a->rj], (a->offs16) & 0xffff);
> +}
> +
> +static void output_offs(DisasContext *ctx, arg_fmt_offs *a,
> +                        const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "0x%x", (a->offs) & 0x3ffffff);
> +}

These are signed, but they're also pc-relative.  It's probably most helpful to have stored 
the address into ctx and compute the final address.

> +static void output_rdfj(DisasContext *ctx, arg_fmt_rdfj *a,
> +                        const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "%s, %s", regnames[a->rd], regnames[a->fj]);
> +}

Wrong name for fj.

> +#define output_fcmp(C, PREFIX, SUBFFIX)                                     \

SUFFIX

> +static void output_cdfjfkfcond(DisasContext *ctx, arg_fmt_cdfjfkfcond * a,
> +                               const char *suffix)
> +{
> +    switch (a->fcond) {
> +    case 0x0:
> +        output_fcmp(ctx, "fcmp_caf_", suffix);
> +        break;
> +    case 0x1:
> +        output_fcmp(ctx, "fcmp_saf_", suffix);
> +        break;
> +    case 0x2:
> +        output_fcmp(ctx, "fcmp_clt_", suffix);
> +        break;
> +    case 0x3:
> +        output_fcmp(ctx, "fcmp_slt_", suffix);
> +        break;
> +    case 0x4:
> +        output_fcmp(ctx, "fcmp_ceq_", suffix);
> +        break;
> +    case 0x5:
> +        output_fcmp(ctx, "fcmp_seq_", suffix);
> +        break;
> +    case 0x6:
> +        output_fcmp(ctx, "fcmp_cle_", suffix);
> +        break;
> +    case 0x7:
> +        output_fcmp(ctx, "fcmp_sle_", suffix);
> +        break;
> +    case 0x8:
> +        output_fcmp(ctx, "fcmp_cun_", suffix);
> +        break;
> +    case 0x9:
> +        output_fcmp(ctx, "fcmp_sun_", suffix);
> +        break;
> +    case 0xA:
> +        output_fcmp(ctx, "fcmp_cult_", suffix);
> +        break;
> +    case 0xB:
> +        output_fcmp(ctx, "fcmp_sult_", suffix);
> +        break;
> +    case 0xC:
> +        output_fcmp(ctx, "fcmp_cueq_", suffix);
> +        break;
> +    case 0xD:
> +        output_fcmp(ctx, "fcmp_sueq_", suffix);
> +        break;
> +    case 0xE:
> +        output_fcmp(ctx, "fcmp_cule_", suffix);
> +        break;
> +    case 0xF:
> +        output_fcmp(ctx, "fcmp_sule_", suffix);
> +        break;
> +    case 0x10:
> +        output_fcmp(ctx, "fcmp_cne_", suffix);
> +        break;
> +    case 0x11:
> +        output_fcmp(ctx, "fcmp_sne_", suffix);
> +        break;
> +    case 0x14:
> +        output_fcmp(ctx, "fcmp_cor_", suffix);
> +        break;
> +    case 0x15:
> +        output_fcmp(ctx, "fcmp_sor_", suffix);
> +        break;
> +    case 0x18:
> +        output_fcmp(ctx, "fcmp_cune_", suffix);
> +        break;
> +    case 0x19:
> +        output_fcmp(ctx, "fcmp_sune_", suffix);
> +        break;
> +    default:
> +        break;

Here you're going to print nothing at all, which is wrong.

> +    }
> +}
> +
> +#define FCMP_INSN(insn, suffix, type)                           \
> +static bool trans_##insn(DisasContext *ctx, arg_fmt_##type * a) \
> +{                                                               \
> +    output_##type(ctx, a, #suffix);                             \
> +    return true;                                                \
> +}

I think you should drop "insn" and "type" from this define and use output_cdfjfkfcond 
directly.

I think that FCMP_INSN should return output_cdfjfkfcond, which should return false for the 
default case, so that decodetree returns false, so that we print "invalid".


r~

