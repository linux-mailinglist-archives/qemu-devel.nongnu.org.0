Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B9860BE52
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 01:14:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on6dH-0007Rx-DI; Mon, 24 Oct 2022 19:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6d7-0006VW-1q
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:13:18 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6d5-0006i9-Da
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:13:12 -0400
Received: by mail-pl1-x630.google.com with SMTP id y4so9729966plb.2
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 16:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qHiPrZn+Mflm3y9Hx+JRi7to/jr3/UArcT1XskAm8B0=;
 b=rJJvi7vTTa5jV0Y5pM773Rp6DegJh+aMON/crWOdnfCYTfCECNewzjIP5qSf7NWXE7
 I9NQzJQ8BroKs8ke9qwPxRiqvUxkfPrhQNMTyJWOsNpG0PHNYcOLoQFwH6TvYjrCzOka
 mpiruLKmUnoyHjUujBMXsiokDKwX67wOXznWHToVaE26e+ZB3ewy1Fu3ncd6zYxgfQcV
 WOUkwsJ70RT9IJZbFz4Uw9pg+eJM0KICTqYZD6JOgVXZZs4QOYYGVl5T6jLy2o1GJFsQ
 zytzahCbhhv5xZ2L4CzrEnVGmtBcoX7i3Vr+tVDlsUvUOmHYfCjuq3mbKBASk7UskDuR
 0hKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qHiPrZn+Mflm3y9Hx+JRi7to/jr3/UArcT1XskAm8B0=;
 b=Ng3Nm79xTQr5Pu/M8rqkOd2fZZfgdmoXKjnOXgJqa1ID6Go5KUxkB/1P74Vg3h7A/i
 1u28Ti61z77nYF0bcy9QfkCpG1jtSFxo8urA0ZfkLiftNA3Ivwe+5MkqAX6ADvu70y0p
 4jVjew3Q75CX6TufqTFY3sKWZkWQb9WM3EmWMFSX+v1cKC3FXDtSCvbBpW1biHTRqYdQ
 2nrYBxicSXDm8kKXAzRtQ0qCo7MZomnqip4jxtymNHxXIdqCYCn4q50/lEdhT9LY7Gki
 x24DsEkjTw40TRzvVBM6FZ/4jfZ/R1ZIWgHH64RWWCXouTtmhR+2TsYK9h8iwxA3hUlP
 iDLg==
X-Gm-Message-State: ACrzQf2hZSUMFAEmAlb4N5vC4OM1DWpsgmEXdkuzt71licFbw6N0s5VK
 /+uZzDP5c9yK+XlzvzNtR7cwMg==
X-Google-Smtp-Source: AMsMyM5xsFJP361bVjcJrgXj1TeoQY6KVt2OV6fGzx1w17Sm7w581POeEQDiFnsERx/ihD8gXUVISg==
X-Received: by 2002:a17:90b:4d0d:b0:1fb:a86d:e752 with SMTP id
 mw13-20020a17090b4d0d00b001fba86de752mr40673576pjb.120.1666653189185; 
 Mon, 24 Oct 2022 16:13:09 -0700 (PDT)
Received: from [192.168.136.227] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a170903228700b00178b06fea7asm223044plh.148.2022.10.24.16.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 16:13:08 -0700 (PDT)
Message-ID: <29bf0d01-3776-8ae0-b256-d4ddac19ded8@linaro.org>
Date: Tue, 25 Oct 2022 09:13:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 03/11] chardev/baum: Avoid dynamic stack allocation
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20220819153931.3147384-1-peter.maydell@linaro.org>
 <20220819153931.3147384-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819153931.3147384-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 8/20/22 01:39, Peter Maydell wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> Use autofree heap allocation instead of variable-length
> array on the stack.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Reviewed-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> Reviewed-by: Samuel Thibault<samuel.thibault@ens-lyon.org>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   chardev/baum.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

