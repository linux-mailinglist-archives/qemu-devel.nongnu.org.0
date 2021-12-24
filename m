Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BD647EB09
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 05:00:04 +0100 (CET)
Received: from localhost ([::1]:54078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0bkR-0003B9-VP
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 23:00:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0bes-0004bW-Sc
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 22:54:18 -0500
Received: from [2607:f8b0:4864:20::634] (port=34804
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0ber-0002sI-9V
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 22:54:18 -0500
Received: by mail-pl1-x634.google.com with SMTP id x15so5799523plg.1
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 19:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=I/t74AFUfbn/zGIBwh82lr4lwJ0MHU/GQUYqefAcWYQ=;
 b=XRhypeRtCN6NouZRE3sWLLG/E5s0DMTpF+m4TeTiPJRh3FTB/vBjeil8sarflSbXTY
 AC9njQbo1JTCaIt2FddkNGNXOkFc6dC7KfAD7ZI0kL/a1twgE52cFcpYFj0d9lLo5nj5
 JH4qO5jAPBhtT28bdwJWKzabcz7bii5/xQ0I6ZVzdcZPM/1Zg0r4NF0EThqWGSTKgzMH
 uslumtGlyKvzdmGiE4IayauMcriQt2KD8orINw2It/PfuBHfSjY74RNbQxnTuTKRywrz
 QgQavxUBC7MFu1G038fnvCJM+d8aBdUzvZRiBxe5fc7HdKilJjJV/ig9+HqBhXkIvD8W
 Ggpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I/t74AFUfbn/zGIBwh82lr4lwJ0MHU/GQUYqefAcWYQ=;
 b=r6p1neOhOiPRZAIPsyO6n8mnXcrQ5IInDq+lTZrWSJiEjuREdt//8j+WwHB4EnfJ9i
 4pBK5asaH2Es8D+tXdAGG5xV28VZzFSZLRaOPFZ7xWMu5SnkMxMI+SfMcNdlZx77+b42
 yrjOF/v/1SVlRCf7g4a7eD73kcdi6h4hNI0cp9KvyU6YMEb8+T1FOnlBxKXiUdlHtElQ
 9yD7PKikhG8GAJsD9R59gHSEbLAp8XECQWXmL3DckG/QiqMS2/UbaEBsE+L0JNeqbrTO
 60fYpsVE4i9vEL3n4SfqUbePuVT37c5GCpMIjZ5mhtM/voBTX1SMMGY5uRvbTtBI0u08
 W7Sw==
X-Gm-Message-State: AOAM533k7KV1LyvV0KGUv12BgYtqj7PNBvM/sJNuXtX3QUFvP50KqvvW
 3pEs4xeYNLkrKXTdI/iEbcHQli5RiM1cfA==
X-Google-Smtp-Source: ABdhPJwvadaJJgNxOEmQpC+Y5mUoXkiGcMFE9STZKB/OZ6zoc0an081gfcNbu3Wzje6aYpemJxKgqQ==
X-Received: by 2002:a17:90b:1c91:: with SMTP id
 oo17mr6115874pjb.193.1640318055801; 
 Thu, 23 Dec 2021 19:54:15 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id u8sm7817818pfg.157.2021.12.23.19.54.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 19:54:15 -0800 (PST)
Subject: Re: [PULL 0/1] target/hppa: Fix deposit assert from trans_shrpw_imm
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211224015159.2155441-1-richard.henderson@linaro.org>
Message-ID: <f9762a91-d4b0-7364-be7e-a827eb637554@linaro.org>
Date: Thu, 23 Dec 2021 19:54:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211224015159.2155441-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/23/21 5:51 PM, Richard Henderson wrote:
> The following changes since commit f18155a207dbc6a23f06a4af667280743819c31e:
> 
>    Merge tag 'for-upstream-mtest' of https://gitlab.com/bonzini/qemu into staging (2021-12-23 11:35:48 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-pa-20211223
> 
> for you to fetch changes up to 05bfd4db08608bc4c22de729780c1f74612fbc0e:
> 
>    target/hppa: Fix deposit assert from trans_shrpw_imm (2021-12-23 17:47:01 -0800)
> 
> ----------------------------------------------------------------
> Fix target/hppa #635
> 
> ----------------------------------------------------------------
> Richard Henderson (1):
>        target/hppa: Fix deposit assert from trans_shrpw_imm
> 
>   target/hppa/translate.c | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)

Applied.

r~


