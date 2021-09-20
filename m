Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9684128D9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:25:35 +0200 (CEST)
Received: from localhost ([::1]:47572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRjC-0002EE-5e
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSRNm-0000Ex-K0
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 18:03:26 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:55264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSRNl-0007Ws-1h
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 18:03:26 -0400
Received: by mail-pj1-x1032.google.com with SMTP id me1so4353217pjb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 15:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=2dyGC4xaWz58kyHdkMZvfOAJX6kAl3htXhAZEdXAcgQ=;
 b=ByLCMvEnd7cwGiXOdoE9fvstMYBVa2XqpNmtWBvFZ+1rr9ifKmHi/lJC01MXIJ/YLF
 utiWnPo3uqaUaAiTbUG7N6XkZ6th2GEd1GsX6wdZ+JHrDMqJFgs4eVsqJidZ+PiSSUs7
 f6dFc/974KtEui7JwRA/ix+uY/hTWRI+Aw1egn2LaQS1xYHyvnlCpOdfJNg7Bxji9ir6
 Z912Y6/PY/EWMMS7uEnJX5Irk/hDa4lXHZWwAt/FQ/Bv40w08lEgIbfj8j97PvaNd5vD
 IKEPQbArvwHOSEe5/nDhg4+ws3WHTCJBWm9WBDtvwGBeOcNAjueQxGWAj8+KZsOcVoZE
 smVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2dyGC4xaWz58kyHdkMZvfOAJX6kAl3htXhAZEdXAcgQ=;
 b=56bfXJLV2RSxASyi8hwLnHWOdw24ciVyTk5E5nKQuA51+bIEBYMcJquLKV/vOsJ7f6
 ocyeTuhLE3hFSLio3/pS5ZEbRCn1uaojIvebcEYGu4bUO+L0vP4ypBSjX8ZDT69LbS0z
 92fggdzrjtH9TtlgL3lZwgcq/azLMlxmvlo7plXIheg8X1l8ofwQh8dhTmJqOwdKiPSP
 0epHprvGjEs4feJuBzTHgDMmYCzy0gJLQ3WMDh+xdtlQD4dOYVQfsUADQePBrmq/OSIL
 A9Le6NEQxA1QgTau4osWWeyS/VeE7XjADTo23gIQTQJNVbGE+fPIN2obxbwKCemKbVWd
 L/8Q==
X-Gm-Message-State: AOAM533Z70hEQ3ymdDoJ9rS8f3TrKWzhAMGq83iCQ+e+to9zLRiUXJRW
 msH2mdaag45u2La8Bta4h1Yg1JwgHtyNcA==
X-Google-Smtp-Source: ABdhPJzUucFKCMhbqoaRjbs0Y060CwTwyCnaOw/6+04pscmvBjhkpjjxKKDjc1NJpqV7y50x3WyaFA==
X-Received: by 2002:a17:90b:a4a:: with SMTP id
 gw10mr1317026pjb.245.1632175402589; 
 Mon, 20 Sep 2021 15:03:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id f16sm8134915pfk.110.2021.09.20.15.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 15:03:22 -0700 (PDT)
Subject: Re: [PATCH v5 10/31] target/arm: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210920214447.2998623-1-f4bug@amsat.org>
 <20210920214447.2998623-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c0029199-869b-00c4-813e-bf1f3b22c4a4@linaro.org>
Date: Mon, 20 Sep 2021 15:03:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920214447.2998623-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 2:44 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/cpu.c     | 7 +++++--
>   target/arm/cpu_tcg.c | 2 +-
>   2 files changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

