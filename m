Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0742DB725
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:33:20 +0100 (CET)
Received: from localhost ([::1]:33110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJol-00012J-AV
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:33:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJfW-00072b-ST
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:23:48 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJfR-0008PZ-63
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:23:46 -0500
Received: by mail-oi1-x243.google.com with SMTP id 15so25310434oix.8
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 15:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sQqMKuQ7CHnUfOJ+ZBis3l7U0odZUHPj0hUrZtu2A7k=;
 b=dfTyLtaKB9N+IA8BtIFl4WXa4ErO9RHXvN4u5rpRzbPUYGdtyoKqBOFY53CPTAaycn
 KV4mAnQt4BHdUprC9OwtbROx0dBnp0rRR+zsf2TllcromJtx5w7+u/VMtQFNjsX9Bkjq
 jhvnK/J9REr8F4+C4OZnig0yeFQGkPZykFsYoQO1pfL3QzQGfz4aBAwGv0V2aOTMzpHt
 xctZvmJZ3wI25fkA0YhWd8BmAnnPNfd+2EkLwPRy9tGoZWK6jOseVfQZHN2Hnhje0Tp+
 8sQE8QNHJZOuMXGR3oFkRynM5CKvIku0UtvuOGw8kn9HT600utkivkjmScuV3Si/P+iR
 86RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sQqMKuQ7CHnUfOJ+ZBis3l7U0odZUHPj0hUrZtu2A7k=;
 b=m57fOh9ZI5VRTfPYcdLcatdvh83GMp4bZmrLa4ERJqz8Nk3pslZE3x2HwefBPQPaVc
 KOJSthVXganBxlE9GMHnywcBhBeTgwm5YoUvuyg5wQGFYCUb2fAZ25iWiQLaaEtXp1Jh
 VOi7w/NJsvgZZ/eMwLo1aAuGlr3owahDlmGCxJH3wr7bnL6uQScIKv9Db0ba2N8F534q
 UHTNDFWBwZNP73omlzFKtOoIjOteJJi50LyBWf1XaQA8P0OQGhunR/vmJqjdGB2BDkb8
 icVksGKhv9n++E8nBukqZJCQ/xZduaOdtYkSGxVShvNOPCzgXx3l41I7fObHLpjOhrCE
 4tOg==
X-Gm-Message-State: AOAM5334vogr0jAajx04fkyHcNGFhTYvMW8LrJXLQ5GexeBtOH8W6h4t
 9RCfO1qHCBm7zSoFt2LRAUKUEA==
X-Google-Smtp-Source: ABdhPJwE3csrCfXnCBlIB+XnBAFMswLppNI7jP4IWvWjAwKE/pfqzW97nn0HFeW3T5XEKNcYi7xcOQ==
X-Received: by 2002:aca:6103:: with SMTP id v3mr648232oib.64.1608074620013;
 Tue, 15 Dec 2020 15:23:40 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v17sm52883oou.41.2020.12.15.15.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 15:23:39 -0800 (PST)
Subject: Re: [PATCH v2 01/24] target/mips/translate: Extract
 decode_opc_legacy() from decode_opc()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201215225757.764263-1-f4bug@amsat.org>
 <20201215225757.764263-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <60c6202a-06d6-81ca-0c41-a023bebf4110@linaro.org>
Date: Tue, 15 Dec 2020 17:23:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215225757.764263-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 4:57 PM, Philippe Mathieu-Daudé wrote:
> As we will slowly move to decodetree generated decoders,
> extract the legacy decoding from decode_opc(), so new
> decoders are added in decode_opc() while old code is
> removed from decode_opc_legacy().
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 45 ++++++++++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

