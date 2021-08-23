Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B526F3F4F7B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:27:24 +0200 (CEST)
Received: from localhost ([::1]:50158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDjH-0005OL-Ry
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDhU-0003hK-B1
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:25:32 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:56296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDhS-0001cZ-Q9
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:25:32 -0400
Received: by mail-pj1-x102f.google.com with SMTP id mq3so12392201pjb.5
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 10:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=btQy84JmL3sLy92zg4CBnl6jOeq3aSXf92/WewgUgZQ=;
 b=I19Z8ONOE4HmPoxWpnaLAkQvCEMtOEEPBkBmwOQH3dxXb4QfbZppnp2AcJ4ZSDrs8f
 9gMa6yqq4vy6YrTNGzJzzBuqkib9z0NIxgWO0d1Hw3QfgShdIKettjMhxy1vgwQy/Tpx
 mfFZFxkMnE/v81uayLmlfuQKhsJyu+Cb7Lu9i2xZK89yZF07hEjv0ukshb3HMpHISdOp
 pr6r3GvX1o4EK8SRk2k+/0nfugYrNli54/EnqKZSy4er9FZTqmUWtWK6TLJCBYhmiF+R
 +VjfwBK5zWXOrsZ6+oH7Y2vgvFn7qkSaMUhw4r9hy7fwhopgM0CHu4JazfJMLN2CbGho
 msXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=btQy84JmL3sLy92zg4CBnl6jOeq3aSXf92/WewgUgZQ=;
 b=oT7MHW25vrJTyRxJ/a5u9lCrPDUfAkII28Bo45rOsMV2wE+XGmahdAwWh54uXdXf6c
 /LQmMupgRAAnjNEw6S22EQ2iJ9OmrRyXJ8pOnlsUvQ7pvXoKlp3/265UdTLXNpGimCm6
 qjCRBX6aoj5BUsieKQp8BxhfLAYq9qG3B2BxB9GLUhVELqOUEKKWtVsgb5QDuDGrU38g
 t5fXbwdLm/sBrdSB5D/UUKWKa2QilQqSmwe+4n1XpfFcX3brw2tAqsBENZcH7DqQwgDu
 q7Hkr7461iz7UB0BdX4ced5sAOYNnMJpFJnOonJ/ndA2zaxd1ge4wE0W/L5a5GfuJ6gI
 L7Ow==
X-Gm-Message-State: AOAM533RQ150KzG+CCCPdIDFT/MuWk1a9sa1yViiJ2KvVG3XEXVC1zH9
 OXwdbnl+sH7sXW5GMIDz3cK2PQ==
X-Google-Smtp-Source: ABdhPJx0k/TFn1hVA7OF9FrrWNntXvLxLdW40aIcX954EQ27vgyjCpAB9Jlu0Elg2Z5iVePwIHDSMQ==
X-Received: by 2002:a17:90a:2ec6:: with SMTP id
 h6mr3754487pjs.79.1629739529428; 
 Mon, 23 Aug 2021 10:25:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id o14sm19247813pgl.85.2021.08.23.10.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 10:25:29 -0700 (PDT)
Subject: Re: [PATCH v3 10/15] target/riscv: Add a REQUIRE_32BIT macro
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
 <20210823164038.2195113-11-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1067830e-1fa7-3046-5453-cf162b75222f@linaro.org>
Date: Mon, 23 Aug 2021 10:25:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164038.2195113-11-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 9:40 AM, Philipp Tomsich wrote:
> With the changes to Zb[abcs], there's some encodings that are
> different in RV64 and RV32 (e.g., for rev8 and zext.h). For these,
> we'll need a helper macro allowing us to select on RV32, as well.
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> ---
> 
> Changes in v3:
> - Moved the REQUIRE_32BIT macro into a separate commit.
> 
>   target/riscv/translate.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

