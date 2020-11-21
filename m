Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6597D2BC1E7
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 21:05:34 +0100 (CET)
Received: from localhost ([::1]:40262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgZ8X-0007oA-FN
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 15:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZ7Y-0007MM-Nx
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:04:32 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:47097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZ7X-00031g-1y
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:04:32 -0500
Received: by mail-pg1-x543.google.com with SMTP id w4so10453235pgg.13
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 12:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C8iVqf4Jr/+BhgkMAx8QNa+A1u1n/je5yjCWaqYz8FM=;
 b=EF9l1zCMv15KNg27dWDOXu2+6/peuRE7rPrMEnkbLtP48gOT0D78RLLZQAjDudjS76
 OK3XKkQFRSevm64URa/kEGh1ow2M53xpvtVOL0PYnGVDxhGkzmFunKCvwfZ6vkuV54st
 6/Kdh47dXqnQIAOOGE/9Qere3sYmCArB3G6F9YVoundAqYMfRUCcQItP9Hq6OyrVjpb9
 TseQz3EsqqLsNlflNQYyX7v2eGcg8eYu1DD/8MP8YYEGHz9nA2ONcLbpn1oN32Ftbs5u
 3Kb+yvkuPoeSdawvF+sQ9lhIaUL8I8+zjdpXqJXWIx3CZdRIZ9E43rIkS1kRRoJBbMig
 UCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C8iVqf4Jr/+BhgkMAx8QNa+A1u1n/je5yjCWaqYz8FM=;
 b=hnDmZb5QDsG40/WKgnG2q1K1fveLWiQPn353062Meb5o9dfKyJWmt9VPytxK5+HihV
 IADBOBp4fO/JhRpw7NkprTxGVfPo0i29mPMuEBu98E0OpZin/18ZvCzJT2ZwmaVsihNj
 SWzYYkw9MPvk+5JknfJ4ugYQWyLvr9XDjSrIUekKkr/MUg1xqK8mKdgs5dMofCHklklX
 gtooM9fiWOEvOuxNtOh3yS7yzPtqfrOucIn6lWnWpxYD6GNdLCUQnJxxUr9ZIWUJIvYj
 B7hXY/wDvf27yBnqg8SPsHClqKd2kVH2VFwMqH9YOPso5V5+9nfPiIiebq1OxA2ZxH0/
 /cTg==
X-Gm-Message-State: AOAM530/9Gr/0Wfehlswn7QSB8KtErdMDdHeWBhJM2qnXVFHu3YLTIY5
 OuoBeHzyfrmqHQAG5NX4k1Ofgw==
X-Google-Smtp-Source: ABdhPJz144MDq87/M/p2Jcm8RH2SxQXgJ7j1bD1NnSwxmKpsQ3d+1cFeM/St+sGbG7w5EzFZeZKN2g==
X-Received: by 2002:a62:d0c6:0:b029:196:1cad:6ebe with SMTP id
 p189-20020a62d0c60000b02901961cad6ebemr19480661pfg.63.1605989069639; 
 Sat, 21 Nov 2020 12:04:29 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j19sm2080748pff.74.2020.11.21.12.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 12:04:29 -0800 (PST)
Subject: Re: [PATCH 12/26] target/mips: Extract nanoMIPS ISA translation
 routines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <06d540e7-43ed-9674-be5f-6a6f0b249a39@linaro.org>
Date: Sat, 21 Nov 2020 12:04:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
> Extract 4800 lines from the huge translate.c to a new file,
> 'isa-nanomips_translate.c.inc'. As there are too many inter-
> dependencies we don't compile it as another object, but
> keep including it in the big translate.o. We gain in code
> maintainability.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c                  | 4838 +--------------------
>  MAINTAINERS                              |    1 +
>  target/mips/isa-nanomips_translate.c.inc | 4839 ++++++++++++++++++++++
>  3 files changed, 4841 insertions(+), 4837 deletions(-)
>  create mode 100644 target/mips/isa-nanomips_translate.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


