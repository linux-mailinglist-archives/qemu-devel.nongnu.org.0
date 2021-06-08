Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EF13A07C0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 01:25:18 +0200 (CEST)
Received: from localhost ([::1]:47622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lql5x-0000AF-3x
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 19:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lql4T-0007RT-C7
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:23:47 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:39727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lql4N-0005ko-Qs
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:23:45 -0400
Received: by mail-pf1-x435.google.com with SMTP id k15so16929544pfp.6
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 16:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/9AUA9WzkqM48A4iE47lwzP9IdWQn2HoCmWiHE3XS8U=;
 b=pn/ULEbEhJthVDhkvNaojmqYlN1y8UpHEc7eFH4mW8ftFxhqJEUVIQq8+yY980pZv+
 rE9fwgK3QQ1pe5Tp+ORllszqmQFdfpG858xU/Dj/40wnjYt/lq7Zaga1F8DoISHM81y/
 bB1dz/S9YRxAvyHeuvE6MJ6VrcBLEzBixg3P+zYWkYAh0lX4K0sr3EsCLFzMnIsvGtVY
 cXotDvjvHtQGSowe7JZYiJ7z2yZazs1RNiFh3RzJSey1by3mLudauC0yNrqY2jvlnH0d
 8x/CD7JD3gCBNGG3tGYQBqCpWa1sHQsiCBFhGE908ZlzpADkKrhm/KEE6oIluhFZ9G3v
 ilYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/9AUA9WzkqM48A4iE47lwzP9IdWQn2HoCmWiHE3XS8U=;
 b=bYMms8+ukEoRLEFdveYgQQBpE0feQ+kuAyosnIWmQG0iS+nHjRd0gRxxBeNa3idJfH
 ry13eXdnueRtdLunABrbPnVRtExi8Mwe/SBmh3JvMeqiVNf+3guuqr0P/hHQoK993uGg
 o3qM5fT+rf/X7/vWfFPLIosscqznX/W45UNQQtPY53OzMuA7cX5tiTQz3r6DDubWHTUr
 xJIhhRS7nJBRerOXhmR8DW58iUUsWiXluW8EywC/gCwBgXHaU6Il630pXJJEHtTp2k7U
 1MjTL4DJRtS7Mp/aNBXwjK906QU71uneIPV2RS/CWkueLn1Tgx2JyDtf4P2CEWgn/FuH
 Q1Mg==
X-Gm-Message-State: AOAM533EC35NiC/vc2DeVGB8U+rV1/kpXmD7bXPaqbGDQLlJqt+aPxTO
 e6l64u/iaINjTzhi+oClWOxQ3sbrRvm5Lw==
X-Google-Smtp-Source: ABdhPJzpz+7kg54BFApqmoOVzE0WLN/PLHMqOUBXg5G/x7XdHLhuYsGtOfYDJ57FTkfpH9+GDfWW1w==
X-Received: by 2002:a05:6a00:1a41:b029:2ef:9721:879e with SMTP id
 h1-20020a056a001a41b02902ef9721879emr2162448pfv.74.1623194618111; 
 Tue, 08 Jun 2021 16:23:38 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 p24sm9904938pfh.17.2021.06.08.16.23.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 16:23:37 -0700 (PDT)
Subject: Re: [PATCH 21/55] target/arm: Implement MVE VAND, VBIC, VORR, VORN,
 VEOR
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <071318b3-21a6-f167-1e2c-567915e94a5b@linaro.org>
Date: Tue, 8 Jun 2021 16:23:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +DO_2OP(vand, 1, uint8_t, H1, DO_AND)
> +DO_2OP(vbic, 1, uint8_t, H1, DO_BIC)
> +DO_2OP(vorr, 1, uint8_t, H1, DO_ORR)
> +DO_2OP(vorn, 1, uint8_t, H1, DO_ORN)
> +DO_2OP(veor, 1, uint8_t, H1, DO_EOR)

Again, logicals should use uint64_t.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

