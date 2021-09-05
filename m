Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFED5400EDA
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 11:40:34 +0200 (CEST)
Received: from localhost ([::1]:37080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mModd-0004Q8-FY
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 05:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMoc9-0003fI-Uh
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 05:39:01 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMoc8-0008RU-Ey
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 05:39:01 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso2684772wmc.5
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 02:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QzL5hnEGcgZeztGd1BAb3AY/GIwQ2vUKvf1UyfO/GSA=;
 b=JHSCYkoi+d1Hrzqstp3Ub36DRQcDE01p/Q7G+Rj3sKvwn6kkaOFAypgqtbJhHr4xzi
 1UFmsltlxAdoakueTx5VN1M0Svr79Fbl6WohmVhSL79VAIVDZQ7n49hnx1dK/HzEh/Ct
 FEOlHMJB1armLtBbbdKVy5qs9tYnEMVUOBP7gs/5Kt49gmG12D7oOFwYk8P37POpit/l
 iu/JCbGd13XYG0T5TprbIcWkvUEil9r2Yblt1OP88cuqf/uWLEJ3DhfZybCMY34ZI0Kd
 GMasvCIiB0UtwNNNwvC4z8mEwbMzPJuxzVAiGN4PNqQPUdG/LOCUa4CpEQblKmByMJ6t
 ByLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QzL5hnEGcgZeztGd1BAb3AY/GIwQ2vUKvf1UyfO/GSA=;
 b=DjO87IdMDqUCQ4tEJwqezCmRU18TR/DGc9ckCovoWbTPuoivJOydBdOSqf3bX3Nqoc
 WN3eJPVcQ/iQ6G3ACKNa2CVszFBRDT15MwHVP+YPNDMaNTwjehom5U+o8hjndwwgJ3iJ
 R0PBrQVuAsXDz/ikuB8FQGG8fHIjVVNAckCRpjRQNUmw8lPh8nQWz4fZmBHRhzdpXZuC
 oXYzwyndBMfplGRTp8gBuMAd2IWeQ4DTFXa0uqaVPImeDYavvfIOTFY3nU7i+SCGjOMv
 YDg0F3dz4JrjzG95iscLaZ7+DAIn6LdXotH/SWOisOh9uvylhm2Or/1YyFy26F7u2hXH
 EMvQ==
X-Gm-Message-State: AOAM530/VqaAUEmIMF4pRAnPupnYA0aA2+VAXPC7qQgC0D9IgNRI/DiR
 fEjiGfwtIUG6nU0zbSc86dqdvg==
X-Google-Smtp-Source: ABdhPJxcj7rJsaKidSK2TWyFSiUhBhQlvlfQW2F0dD2Ib4jfel6QH1fZbvJn85UK5dP8OxiHKQ2Svw==
X-Received: by 2002:a7b:c843:: with SMTP id c3mr6362752wml.76.1630834739000;
 Sun, 05 Sep 2021 02:38:59 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id u25sm4050852wmj.10.2021.09.05.02.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 02:38:58 -0700 (PDT)
Subject: Re: [PATCH v4 13/21] target/loongarch: Add floating point move
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-14-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <968491ce-c706-466b-2845-f59d98d66864@linaro.org>
Date: Sun, 5 Sep 2021 11:38:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630586467-22463-14-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 groug@kaod.org, maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 2:40 PM, Song Gao wrote:
> +static bool gen_mov(DisasContext *ctx, arg_fmt_fdfj *a,
> +                    void (*func)(TCGv, TCGv))
> +{
> +    TCGv dest = cpu_fpr[a->fd];
> +    TCGv src = cpu_fpr[a->fj];

Maybe clearer as gen_f2f, to match the others?

> +static void gen_movfrh2gr_s(TCGv dest, TCGv src)
> +{
> +    TCGv t0 = tcg_temp_new();
> +
> +    tcg_gen_extract_tl(dest, src, 32, 32);
> +
> +    tcg_temp_free(t0);
> +}

t0 is unused.
Use sextract_tl, or sari_tl...

> +TRANS(movfr2gr_s, gen_f2r, EXT_NONE, tcg_gen_ext32s_tl)
> +TRANS(movfr2gr_d, gen_f2r, EXT_NONE, tcg_gen_mov_tl)
> +TRANS(movfrh2gr_s, gen_f2r, EXT_SIGN,  gen_movfrh2gr_s)

... which then means you don't need the EXT_SIGN here, and can drop the parameter entirely.


r~

