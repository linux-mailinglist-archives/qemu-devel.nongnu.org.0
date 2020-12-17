Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199802DD282
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 14:59:45 +0100 (CET)
Received: from localhost ([::1]:48636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kptom-0008Eu-4X
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 08:59:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kptnY-0007La-Jn
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:58:28 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:37135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kptnM-0003T9-9a
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:58:28 -0500
Received: by mail-oi1-x229.google.com with SMTP id l207so32272264oib.4
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 05:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uiRoCLzv9/s/EN0X3jILm2hVkQkHrupiJPU0fjC3L74=;
 b=ND/KK4PsrBNF9UIkPJK936xc0cP2h+zvPIONsV4rViiI3FeyawaSNNycr80e4slfLh
 Y8ohzupIMb83ral6u7H2PUyzS99EVhHDarfJDFwgwvh/Eockndf9Snokq7CPOBIyZ/Ne
 0wNt5jI7ex4ZpZNnyS81pJXS0dKPNrDFqxCZamNEGz0hTjmwgW+b1QGQUv0rHIFah8he
 RohgWBxSPy3Fant1gsdBMe+5EePOOx+IMrMnumMzgbHMxEd7zj02F+D3xzrWGB42zfyw
 k6doKzyThGmfQgI00gzp4duJk5q5/JK88srgJ7AEBhEcB5sVrIq1HL+VCXCR3J4fddup
 BWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uiRoCLzv9/s/EN0X3jILm2hVkQkHrupiJPU0fjC3L74=;
 b=BHA12aOpKK5wjFv/myf9ckHoBYkGqMMlgplvT5ixk9AXIywE4nF6oZlPOwZuR28YDa
 Ke3jMGQQK647GvEwPoPqdSzY/P+2Hw13x+Zxcxesqd6qgbxT9RLGCw3JR4l87/j4hBRy
 nHGtBG2nXZl2dWnId/UwAIQfo/TNuXfezPzxvRtqJ1IUc7XYGFf0J3kVin9dDgj4rpXY
 uqmwfK8idiOXiPFhTofJHyQJ6d1Yvo1RGE8cV7zgeQMqQSkQPQMxedz8N4FiPXtCLj91
 rVbBITlDXXWDY4Ay+BvGCGV0T+rmrippVsDEhOC7P3nCQsOakIj9Z9YsJ78/shjKeqM8
 aV1g==
X-Gm-Message-State: AOAM533zGC7KiwQjeWbThPPzLMEB920sOulC7zrvQIkfEO9gMOC7FdYb
 cVt0Gy3hACNXML+OheNDcIye5A==
X-Google-Smtp-Source: ABdhPJypQvbO8Ljh0YUNHnzw2Ia0OrRuAQHZW853pmVz/UlfCgv05OMyvVCvjk74a8VC2GUi5emxHQ==
X-Received: by 2002:aca:5dd7:: with SMTP id r206mr4938552oib.130.1608213494840; 
 Thu, 17 Dec 2020 05:58:14 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id r25sm1217792otp.23.2020.12.17.05.58.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 05:58:14 -0800 (PST)
Subject: Re: [PATCH v4 16/16] hw/riscv: Use the CPU to determine if 32-bit
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
References: <cover.1608142916.git.alistair.francis@wdc.com>
 <8ab7614e5df93ab5267788b73dcd75f9f5615e82.1608142916.git.alistair.francis@wdc.com>
 <CAEUhbmWbCVnEYRAmaQOpfBmnRtOzFrs-85S+g-AfGhy65bTWXQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7d2b4053-dbca-faf8-04b2-8da0aab70f29@linaro.org>
Date: Thu, 17 Dec 2020 07:58:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWbCVnEYRAmaQOpfBmnRtOzFrs-85S+g-AfGhy65bTWXQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/20 12:44 AM, Bin Meng wrote:
> What happens if something like ARM big.LITTLE needs to be supported on RISC-V?

I'd say it's the board's job to pass the boot heart.
(Though even big.LITTLE doesn't mix 64 and 32-bit cores.)


r~

