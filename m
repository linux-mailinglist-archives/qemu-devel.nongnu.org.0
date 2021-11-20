Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3423C457CAE
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 10:38:12 +0100 (CET)
Received: from localhost ([::1]:51476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moMp0-0005gA-Eb
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 04:38:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moMnj-0004GM-Jt
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 04:36:51 -0500
Received: from [2a00:1450:4864:20::42a] (port=36657
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moMnh-0002rC-5J
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 04:36:51 -0500
Received: by mail-wr1-x42a.google.com with SMTP id s13so22516484wrb.3
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 01:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aSw/OtUsjMNPkquvFDFT4opVkOJ6RxwvBCq67jRxDRQ=;
 b=GqotZqA+T8P2hIjV2whRAVDrUy7ZZwV5xd3cIdFxsOo9/kicu/KwYdj7UNxQOsqfiL
 tTW103fHVT9otqYMNze7UitxFjtB0RjQCi+rLOmVV8lD9LcfmLd1DG3aIBmfgpjGhC9Q
 7rL6jWh/Qp+EIOJ5TXhHXeQySa8ti3Lnqs+cAoUgvNgqE/nKsH19C33ShWbiF+DnZ6cC
 4xqSPafsf2SM8xIdXweRHupp/TQIy3RiV/Ffw+HULsR7/P/rnT8LEOZA8Th9SmwdMtrS
 cb/RDBvEI58qR5s9Ph87Qzy0LaRZlki4JvkFptg/Dd5yTQGcT55iXa+axKNfYGqQj+TI
 TUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aSw/OtUsjMNPkquvFDFT4opVkOJ6RxwvBCq67jRxDRQ=;
 b=WT12aWHNphx0JcsBy/cvOTginkvOxkxndkmvwtCyTxcjHfGiWK4Pa0twxxH8y5s1iz
 u9v8CMKfjFz4Kng1TpTU8qtrT65M0RczjQmt0V84JuvOr5/hvm8MQMVtvmxhzo+sE+Bk
 d0HKGv0yZlAjCaxed1eewKph5N6neZO5Yce5qgMeo7jCmyVkJZZhFu58ssy5uK+kLLKb
 kGEp0nvX3qsvjRDQkgDYOE/idmJQJq9yJJoKlA23cOH4R8cdWYG0CSJ18QufhIRnBcXQ
 JnN5C+HWHaJToeeBYzzyFIc6pWFMcec1juIK/+CJB0XA57D2lUBO2STcg+ICtXqJebju
 q9bg==
X-Gm-Message-State: AOAM533v4RDUX4S2hm3Se8/SrBLIHo25oxexMN4ZS/QlyMQCyTeMwVCS
 JSnE8hF3dcJnD03gPN2DlIE+Ng==
X-Google-Smtp-Source: ABdhPJx5bqMF8fnZboroWW+UGayhWpMlcY0EqEZhFfN2stv9AL27IN3/aFY8GVgSbjTLVZxH5+5o2Q==
X-Received: by 2002:a5d:65c7:: with SMTP id e7mr16123615wrw.319.1637401007475; 
 Sat, 20 Nov 2021 01:36:47 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id n32sm19222741wms.1.2021.11.20.01.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 01:36:46 -0800 (PST)
Subject: Re: [PATCH v11 14/26] target/loongarch: Add floating point load/store
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-15-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3983908-ea14-219e-0855-4b5ae878b126@linaro.org>
Date: Sat, 20 Nov 2021 10:36:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637302410-24632-15-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 7:13 AM, Song Gao wrote:
> +static bool gen_fload_imm(DisasContext *ctx, arg_fr_i *a,
> +                          MemOp mop, bool nanbox)

Don't pass nanbox, as it can be determined from mop.

I think you should split out

static void maybe_nanbox_load(TCGv freg, MemOp mop)
{
     if ((mop & MO_SIZE) == MO_32) {
         gen_nanbox_s(freg, freg);
     }
}

for use in the 4 different fload functions.

> +static bool gen_fstore_imm(DisasContext *ctx, arg_fr_i *a,
> +                           MemOp mop, bool nanbox)

Don't pass nanbox, because it's useless for stores.

> +    if (nanbox) {
> +        gen_nanbox_s(cpu_fpr[a->fd], cpu_fpr[a->fd]);
> +    }

(1) nanboxing not needed for store,
(2) incorrect to modify fd.

> +static bool gen_fload_tl(DisasContext *ctx, arg_frr *a,
> +                         MemOp mop, bool nanbox)

Similarly.

Since the integer version is called gen_loadx, should this one be called gen_floadx?

> +static bool gen_fstore_tl(DisasContext *ctx, arg_frr *a,
> +                          MemOp mop, bool nanbox)
...
> +static bool gen_fload_gt(DisasContext *ctx, arg_frr *a,
> +                         MemOp mop, bool nanbox)
...
> +static bool gen_fstore_gt(DisasContext *ctx, arg_frr *a,
> +                          MemOp mop, bool nanbox)
...
> +static bool gen_fload_le(DisasContext *ctx, arg_frr *a,
> +                         MemOp mop, bool nanbox)
...
> +static bool gen_fstore_le(DisasContext *ctx, arg_frr *a,
> +                          MemOp mop, bool nanbox)

Simiarly.

> +TRANS(fld_s, gen_fload_imm, MO_TESL, true)

Use TEUL for everything here, because you don't need sign extension.


r~

