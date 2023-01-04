Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D0765DB5A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 18:39:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD7iU-0006CF-Fd; Wed, 04 Jan 2023 12:38:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pD7iP-0006Bk-6C
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 12:38:13 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pD7iN-00056v-IQ
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 12:38:12 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 c2-20020a17090a020200b00226c762ed23so583119pjc.5
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 09:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EH5cNEJOarFKRe1pymIcyUBeOODo7k0erZOhVXkJN/Q=;
 b=AAaJehJ/BQZ6jtk1St4PSBrMqmQnjZk/U0qtVqxj64Jw7q17Ec3bhk44oN5ylbP8iI
 YmqHx26r26hIQj3sVG9w8dJDV/1jJwXou9xx26AQ2DZuP47oI+1ElEFC9eyDacGYXdA/
 L000nLxmxBA8GjRwrilKVU+CFv6KwOuzh7MAEtmle5qaW18hMJe31SRRvXtgx7Pl3rBL
 MFZgME8Wu4CU8OgHtKMBILsIx1BcUEUJ47UZbjnXbnUXbmWYuUG7dqROrV7FBm/7jNAk
 MpwrSwwUscGlb7pgJ6RlsTMVHgIU2Pvjz5ofpthbZrf8nF6TyyfWvs/FkjwvZY0xJstl
 U7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EH5cNEJOarFKRe1pymIcyUBeOODo7k0erZOhVXkJN/Q=;
 b=QtiqxrrdqXSoBc+rLv4UkiZcKmlP9aRBjT4LcLao/zpn284zU5VN427FrkWBjStEmv
 nzDvevqrIepLv3EbG3VNsQcJvnrficYIvA9e/0tcqWyyBxVELxit6MdQDKeXcWIbkS2p
 cYhGegImOoRGZrjGFaukkpLpWNqr0vTndqXKyX3+2PNJPj7wWzYDkm4gsFETqhqPsBdr
 fLhk7oytsrhfonMEq8hTotqIv3/Laa8VaPEAcVNyE1Wo/hlTImlR03HOO1DSHusHzBJg
 X5GXnrZhYffYxwZveoleSo5kRLexgqUmURFKuuul+M8Z7pBeLT4I65AvKryWYYZUVERY
 fj6w==
X-Gm-Message-State: AFqh2koMw97eTEXtsgYwE2JOZr3HmlUA+DO1uNIyf6zau8mUYdA3l3uJ
 bB+UlvNmxpdi1c4tuyEyPwV/cQ==
X-Google-Smtp-Source: AMrXdXvk0wZvLV3R94X2D10HxMYZSZoZk6J72lWUI73OkSH3re/DDNMAnXZqSXnSOtStfDOooJhR3A==
X-Received: by 2002:a17:902:8bc1:b0:191:2720:2ef6 with SMTP id
 r1-20020a1709028bc100b0019127202ef6mr52642720plo.21.1672853889771; 
 Wed, 04 Jan 2023 09:38:09 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:92be:ce91:1417:6686?
 ([2602:47:d48c:8101:92be:ce91:1417:6686])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a170902d2cf00b00192902287d1sm16443193plc.288.2023.01.04.09.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 09:38:09 -0800 (PST)
Message-ID: <904819ea-3094-f4e7-bbc4-2dc91484f41c@linaro.org>
Date: Wed, 4 Jan 2023 09:38:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/4] target/m68k: pass sign directly into
 make_quotient()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 qemu-devel@nongnu.org
References: <20230104134554.138012-1-mark.cave-ayland@ilande.co.uk>
 <20230104134554.138012-3-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104134554.138012-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/4/23 05:45, Mark Cave-Ayland wrote:
> This enables the quotient parameter to be changed from int32_t to uint32_t and
> also allows the extra sign logic in make_quotient() to be removed.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> ---
>   target/m68k/fpu_helper.c | 23 +++++++++++++----------
>   1 file changed, 13 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

