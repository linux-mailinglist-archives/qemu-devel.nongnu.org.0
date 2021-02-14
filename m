Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B158731B21D
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:52:25 +0100 (CET)
Received: from localhost ([::1]:46508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMVK-0002xK-Vg
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBMBP-0000Wh-1c
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:31:52 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBMBM-0001XV-Kg
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:31:46 -0500
Received: by mail-pj1-x102d.google.com with SMTP id d2so2559992pjs.4
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ktI0PrMmidXz3cuW853JbsG+r8TT8TaZNA7jH+GU86k=;
 b=B5Uh8DS8d5qlYal7VpnIiQkuokaZNAJhvoORXtp2nI9QnSjIEe44anirZ4IlUxzpb+
 a4THBZduT0UW/en2FRPWdnc69dVAKJIgIloPmQSNcEZXlCBNMUKmeixhhiri6C9OTIAn
 1TW/2y4siQ2d/VMiPxhHBtUBOUfRTmyHDY7IViN1Sep0HhafpNz3MkjXj/nxtrkqAZFP
 PeQ8+v8CivRdaQPaRR3AiTlpoqWGIk7RupbTMrz7+vOdVndmJvgDjZaIl2DlxhZjncuy
 S1Vf5O79I5cShfvXP/MuyTOyRZJCgJFe+h60osWiJSK+ObxkmnN1AhyDrbnL760OIGjv
 Gi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ktI0PrMmidXz3cuW853JbsG+r8TT8TaZNA7jH+GU86k=;
 b=Xstlo6przJQpzhbrEfysF9kG7GUniUAaaURudtT3wIhDE7aNqdHGq0oQRsAzAu1Z/t
 fyaLrzKmMbnvQUSV5pM61ltRhbMmhsW8THwWnQLlrs5+vb3yILjDt5mUB/nR9ZV0MFvy
 sC03WeSPvvG3RRyaVS1T35P12WPz8fahuctFmz/0TtUC+ldH5K7dwTdRJS0oiLZ45HH6
 TNPb0M47tGQAtpKN3gf4qojfv29lpQgTj+SzqNtUtKGu7OnIuP2lO9IPyimYtFVg940K
 41IHBP8KwH8cEUPgAOtBdk6N61wsK/DgPzeeBnU+ugYiX7EYLqrGRtx50pNLcQfNQ5CY
 WpxA==
X-Gm-Message-State: AOAM530eETWL+mewmtjyezxXsmfyMf2gnBY0c3oRR4JxXLmlsSJ8A4qr
 MbJfkl1nKTRyE5mYkYrIazw+VQ==
X-Google-Smtp-Source: ABdhPJxCz45autl19jPGzfFbM+r4mNBZB66jv52Jw2/XnTuE3MSLPjhVBraGq6VGdfM5oBL5HjLdmA==
X-Received: by 2002:a17:90b:1bd2:: with SMTP id
 oa18mr12079327pjb.80.1613327503117; 
 Sun, 14 Feb 2021 10:31:43 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 z11sm15020390pjn.5.2021.02.14.10.31.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 10:31:42 -0800 (PST)
Subject: Re: [PATCH v8 13/35] Hexagon (target/hexagon) instruction/packet
 decode
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-14-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <93f02942-fd1b-ddb2-0060-48b6dfdf687b@linaro.org>
Date: Sun, 14 Feb 2021 10:31:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-14-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, alex.bennee@linaro.org, philmd@redhat.com, laurent@vivier.eu,
 bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 9:46 PM, Taylor Simpson wrote:
> +#define DECODE_MAPPED_REG(REGNO, NAME) \
> +    insn->regno[REGNO] = DECODE_REGISTER_##NAME[insn->regno[REGNO]];

The macro argument is not a regno, but an operand number.

> +static inline int decode_opcode_can_jump(int opcode)
> +{
> +    if ((GET_ATTRIB(opcode, A_JUMP)) ||
> +        (GET_ATTRIB(opcode, A_CALL)) ||
> +        (opcode == J2_trap0) ||
> +        (opcode == J2_pause)) {
> +        /* Exception to A_JUMP attribute */
> +        if (opcode == J4_hintjumpr) {
> +            return 0;
> +        }
> +        return 1;
> +    }
> +
> +    return 0;
> +}
> +
> +static inline int decode_opcode_ends_loop(int opcode)
> +{
> +    return GET_ATTRIB(opcode, A_HWLOOP0_END) ||
> +           GET_ATTRIB(opcode, A_HWLOOP1_END);
> +}

You can drop the inline markers.
You should use bool for booleans.

> +/*
> + * Shuffle for execution
> + * Move stores to end (in same order as encoding)
> + * Move compares to beginning (for use by .new insns)
> + */
> +static void decode_shuffle_for_execution(Packet *packet)
> +{
> +    int changed = 0;
> +    int i;
> +    int flag;    /* flag means we've seen a non-memory instruction */

Both changed and flag should be bool.  Please have another look through and use
bool as reasonable.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

