Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AE52C4C02
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 01:26:35 +0100 (CET)
Received: from localhost ([::1]:35296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki57K-0004K3-4U
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 19:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ki561-0003oS-Ow
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 19:25:13 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ki55t-0002ek-H6
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 19:25:11 -0500
Received: by mail-oi1-x243.google.com with SMTP id h3so347015oie.8
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 16:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=nTlqoA7HmLdCb/DVv2WjS0xCB/EBZ5s8nyJqea4UUSs=;
 b=npR1O+ogSgwHcMnqLBmgbUjffZ59FQ7Bvf4vAfYx4KnTCpLEYulRzXvA+0gd6arlQh
 ibW2h57NDFKabwyeO5VKaPln8DomY1zq4elaoKSFk/UgnZFoAQQFqMfYYK+q/S82evuU
 nfQPMZh8YE3y6ADbc+smlXd01xO/u4NOD7HVBI0uv4mFjrxKuxu3m/vqinbqIGCsyVtC
 iLOoIWthD5qHxiCFO2Aze1kgd5BECj8o/l4loEQsrrGob9B2hMIXFSJWM7p89NaE+bHD
 igHzyoYTTOTmvgjifatp32/Lx/SFU+j4ogKoIAttk7KPb5/Um2B5Q+wqE0VALkEpWF0B
 xodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nTlqoA7HmLdCb/DVv2WjS0xCB/EBZ5s8nyJqea4UUSs=;
 b=K8coOJUyeW0/z3VQVZCQAbSDKmB5TVT9wX7wubzYqXWSSCQbta/jmJISPXh9YJbv8p
 HLn/gfNxdpSKoUH36dexyvvkaKvd1klbILiBxt8vjcrTpMVwGm5K/bx8O4zeg0vsuwIy
 ZdtzJVHsBfQVkmi/5oCMWzGIVAW1L0YKZMIZ0iB0rXBHL+V25SO7os8kjJlJgD+az29K
 rF1WXLmfRud9Zv+Vt8o3N5UkmT4qn5oB382r9hkTWPwE4JpJuTtKWuYubFuYaV9BMm3M
 ETd2ujJjIP6QIOP+7TS8sGYo45cN9dyAxnfHMSOpE2YGAmhVEdu7BnJR47py5olfmMEs
 d0rw==
X-Gm-Message-State: AOAM533NP+LcHb2LbNscMdKnBHj2/3P4jIXpBBbAbSB2YRCoZai9QveL
 4sDi8Jy2Y4xRZ7rSj5jpdPCx95b2Pbvw6g==
X-Google-Smtp-Source: ABdhPJzaU0rslLLwEAIPEpySEd5mvBhiUlvMOUIPXkmGc4vdHXutxnO8pBA/lX+2qdwTHsOjOJTR1A==
X-Received: by 2002:aca:5212:: with SMTP id g18mr434668oib.145.1606350303788; 
 Wed, 25 Nov 2020 16:25:03 -0800 (PST)
Received: from [192.168.20.233] ([12.220.158.163])
 by smtp.gmail.com with ESMTPSA id w21sm2313254ooj.32.2020.11.25.16.25.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 16:25:03 -0800 (PST)
Subject: Re: [PATCH v2 21/28] target/mips: Extract Loongson EXTensions
 translation routines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201123204448.3260804-1-f4bug@amsat.org>
 <20201123204448.3260804-22-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e2937b24-9bc5-99fc-1cf8-526838d1f4b6@linaro.org>
Date: Wed, 25 Nov 2020 16:25:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201123204448.3260804-22-f4bug@amsat.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/20 12:44 PM, Philippe Mathieu-Daudé wrote:
> LoongEXTs are general-purpose extensions from the LoongISA.
> 
> Extract 650 lines of translation routines to
> 'vendor-loong-ext_translate.c.inc'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c                      | 652 +-----------------
>  target/mips/vendor-loong-ext_translate.c.inc | 665 +++++++++++++++++++
>  2 files changed, 666 insertions(+), 651 deletions(-)
>  create mode 100644 target/mips/vendor-loong-ext_translate.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


