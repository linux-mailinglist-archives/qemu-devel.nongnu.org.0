Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C475932765E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 04:15:35 +0100 (CET)
Received: from localhost ([::1]:46642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGZ1y-0004wh-PY
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 22:15:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGZ17-0004Na-O9
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 22:14:41 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:37194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGZ16-0007ff-Be
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 22:14:41 -0500
Received: by mail-pf1-x42e.google.com with SMTP id i10so1363243pfk.4
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 19:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5sXuT9U0OZtBJIA+BNIFxAaQwnORxOI+ahqWUDy3kZM=;
 b=OPQJPCpRUQRj20gyBJnD0uZQeoBUDoRDFS350W1AX9N7+uzwZCQzZXutJymTpjvrgN
 qEzsFz/rI5t4od+kztaayt1xsxqqDDVrdhzPYTmi9zxfIEFabLro76RfpduHPgABBkHL
 23uMTGwKHHjJP48L7jfPov1Y9HHuhDNgSb++1DDI/LcEk1mkesg+OfkMoZ5R4XDeU/Rq
 +W21uJkGdXlckNcnewFUHvhozwtjd1ExXw330plnSlKQ74IL+t1QJv/PKZkJzzrOOWyG
 IH142iA0VdtjGFBY6D0VB2tEin6JkVskEh+FQsA22/NA4wGJI7WN/EPJN02zXnDSzBy6
 gW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5sXuT9U0OZtBJIA+BNIFxAaQwnORxOI+ahqWUDy3kZM=;
 b=EVz+5CmrgeOtUbOlrZY6kBOjNtkIJtG9TLWDZNQS1NcUEfIxznlLFXUZqyryM2C8pz
 Lt5gsHFjTWZV/SwsS38JcmVs3HFGjzPfqZe8+4la5aoe1ouHqb7cRX4Kr//xaYtDGYaj
 7Sq7OtzUeqnAhzrdq/oXntedvz1Gs7a63Mh3+Ht7PPU+0O8SoLZjkX1A+aQYqp9NvEcS
 vh00G/NRyAWY7+2PoinbDJ2KkqQIDq16ux13FQUeDIAw7zKHNqfIS0ZzyV0CSP0od8tB
 69x/zDmazD3iOQQjn752Ceiae2jc+TKQwRH3Qexg0NlpC8DT8363srdM3xe1078Q7lEQ
 KACA==
X-Gm-Message-State: AOAM533GVE7U/2dnaVZG+oeeQF2aAFdo+ABtSk4n+UH1XPdgyLQiP5c3
 +ZpSKTPeDn/SqZv34Jlr1WBetA==
X-Google-Smtp-Source: ABdhPJzeNSo3fIx9FT4m0cq4IDwzbBzNbvIhEzrKPhn3bpMGa7aQ3mHxeFox/6/pMlQDiqDntmD1nQ==
X-Received: by 2002:a65:6207:: with SMTP id d7mr12458379pgv.92.1614568478851; 
 Sun, 28 Feb 2021 19:14:38 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 184sm14210100pgj.93.2021.02.28.19.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 19:14:38 -0800 (PST)
Subject: Re: [PATCH v2 07/24] hw/arm/mps2-tz: Make FPGAIO switch and LED
 config per-board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08ae148d-4ce8-f763-84f0-68b351418955@linaro.org>
Date: Sun, 28 Feb 2021 19:14:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> Set the FPGAIO num-leds and have-switches properties explicitly
> per-board, rather than relying on the defaults.  The AN505 and AN521
> both have the same settings as the default values, but the AN524 will
> be different.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/arm/mps2-tz.c | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


