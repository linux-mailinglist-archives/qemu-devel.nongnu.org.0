Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DEC5B6BCD
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 12:43:05 +0200 (CEST)
Received: from localhost ([::1]:38816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY3Ng-0002Sq-OY
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 06:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY3Fb-00031b-T9
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:34:45 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY3FH-0006ok-Ri
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:34:43 -0400
Received: by mail-wr1-x435.google.com with SMTP id cc5so10223110wrb.6
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 03:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=5KDToREZenWn6KWsc6Ng3P23itGs8QtYeR3kI7NAjzA=;
 b=DF6BsPDqoJvX/E6bNp9XDb+vr7Ylea5yXIG/BIuf4/ZlcUaWScfLRsRGIFO2E6OJxS
 aoX/Nv7Dh/cAaLHXmGhHGVG0+fuDoT3/ABq8U2ETbbeyfHOJj7UVrAwjMMJRF0Cguoc8
 iqTqNaTnkd3P8UFR1ptSEnnHGVBbJzmW6RAX39c6j8ba4VFGcq0/vyi9lGHy8G7I8AUr
 KnC3FgAAZT6ZbjLZc2ilTQ8JQQ6JsoJWXZEfR4SwtGufBBZFA6whTVgMSCmIU7kPASYo
 vphlCAvdRzRFZbmwUOWr/MhmqgMsJp3nVqgl+ey9u+PvkiuehnO66SsERGcdE87Ccc+k
 9OXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5KDToREZenWn6KWsc6Ng3P23itGs8QtYeR3kI7NAjzA=;
 b=IgK0NIi7CiZITiFZDNoG6v64FWThrn5VNnBaekyYpbwG0q2qypkmNEKxr0twTx9DON
 1D2Uv922MVZU5yNPaCg5bVB29qi/HR7GrTDOGRBY0xk7DFGb3frr5QYQwZVEksvjFaYR
 MHk8gnHF7LdcAK/wzM9r3JtXuB+PzXL2RFdacwWXy224ug0YtOoIifrTnYr25w0d/4bK
 N54+R76ce9R+WaQ3npqYn0YPKF+/OCTd9tQWOYPyUItgQYYG0FP2p9huQtBgf5Z5evyx
 gFt2GFRg7M0yzzIF/Q0dDokSoErXk/Vx1BgyGjU2oT50+8fgvI/ptHcw+ClakGSM3WXh
 YJog==
X-Gm-Message-State: ACgBeo0WX0VNNpLYQLm2PJvjBmUNPrQgfhUg0qw88mzlmgoEbqmzQobe
 D8YBu5CeztFBx8n++kIvh32v3y4s7HZlvbEt
X-Google-Smtp-Source: AA6agR62M2xjgrshT8/na7spZ3WLMbqmBmtWadTQCq1Rx5fzEtV+TGwf9m0d8c2nAde2cIAJ74mqaA==
X-Received: by 2002:a5d:6e91:0:b0:226:ea99:7d06 with SMTP id
 k17-20020a5d6e91000000b00226ea997d06mr17916004wrz.220.1663065261968; 
 Tue, 13 Sep 2022 03:34:21 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c359000b003b486027c8asm7674098wmq.20.2022.09.13.03.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 03:34:21 -0700 (PDT)
Message-ID: <825a2e9f-0c74-9885-804a-95b0a51a4d00@linaro.org>
Date: Tue, 13 Sep 2022 11:34:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 36/37] target/i386: move 3DNow completely out of gen_sse
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-37-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-37-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/12/22 00:04, Paolo Bonzini wrote:
> Everything else has been converted to the new decoder, so separate the
> part that survives.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/translate.c | 104 +++++++++++++++++++++++-------------
>   1 file changed, 68 insertions(+), 36 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

