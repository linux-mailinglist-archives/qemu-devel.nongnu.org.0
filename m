Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FB960072D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 08:59:47 +0200 (CEST)
Received: from localhost ([::1]:34850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okK6E-0001vl-Fb
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 02:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okJe7-0001Ru-VF
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:30:55 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:39655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okJe5-0001be-6v
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:30:43 -0400
Received: by mail-pl1-x62e.google.com with SMTP id f23so9899164plr.6
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 23:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M8oBwRhMctV8rKAHKo/hIeOoHjcazlQZahCq5+vw/os=;
 b=j3ut9FczCcSYERcXu/NBgsYscCy/BaT/mer4SMi88JRfin4GZJ2yW4DEmnXpKdG9DN
 5TUbYEepSzvC3scXFM9FVC7zAXnbBUS+80qgcZP/wxJ9roDhSAJZqWbVW5tvuMuWX/hg
 AQnzeDCsKHM74nAJRHKns+5ORkh91LEwT/Tj2DiRRxzrDBhcJHt/yEPy+nXv/Qp5pc/x
 G8GU2B4ONTUhKN9kln72uQrgOX7zfYDjXDIAZyUwj3Fxouj2LTNTBAPQloNVNzm3sHA5
 iPujr1JLEz7zj2ZqIS5D8jIc/gTVyDsGx3De3ZW8wxznjoCz9IpYBhlv736Nqo5zogMW
 gUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M8oBwRhMctV8rKAHKo/hIeOoHjcazlQZahCq5+vw/os=;
 b=kVbtoZXjnQIN/JwBDSiY96AW36XA3LkNyCs3D5TZ+CdsG87N0vM5Rk2+yMFrLDJHch
 1mrjqgjvehyGVO8BWmxvu6VQd5b4QHD+HoYS8GV2bo5/rgLpnkJ02CbIQMNr6H+m0mye
 JeuFIcOTsnVNe0ZK/aa2iDrVx8DOMUCHQA2bbi/AqaofT1VnAFkl39TQGFyvNaU0KnP0
 PrkKobWYzGoTuHvqDKsBAH5IzouX1u2TGXFgnjbi1wTZKjZbbZaUlv8G+nKoYcbXqCA3
 TOXWE3g0M2VwKKj+77vuqMQyQcehMq+Mq28fTrxb0qytnQ9wlN8xE2s6n3fKZr1P6bk4
 kLLg==
X-Gm-Message-State: ACrzQf1R9150oGSodOelYM4ZEQjTp7R/iUmcieQROB2C1vm8D5ZMELif
 h+FRsaPxl7yRIyTsldaPNvrmRg==
X-Google-Smtp-Source: AMsMyM7jOZ1CAR/WEc623lr0BS++vMRggeRhKl67z60/dtrBy2vixbNVGVmzYstWE8FALqXXZu6YGw==
X-Received: by 2002:a17:902:b708:b0:184:3921:df30 with SMTP id
 d8-20020a170902b70800b001843921df30mr10545193pls.43.1665988239431; 
 Sun, 16 Oct 2022 23:30:39 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a170902684f00b00176b0dec886sm5764171pln.58.2022.10.16.23.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Oct 2022 23:30:38 -0700 (PDT)
Message-ID: <3bf06161-c99a-8b9a-d6c0-ed8af7cf78f1@linaro.org>
Date: Mon, 17 Oct 2022 16:30:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] tcg/aarch64: Remove unused code in tcg_out_op
Content-Language: en-US
To: Qi Hu <huqi@loongson.cn>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, WANG Xuerui <git@xen0n.name>
References: <20221017020826.990729-1-huqi@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221017020826.990729-1-huqi@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/17/22 12:08, Qi Hu wrote:
> AArch64 defines the TCG_TARGET_HAS_direct_jump. So the "else" block is
> useless in the case of "INDEX_op_goto_tb" in function "tcg_out_op". Add
> an assertion and delete these codes for clarity.
> 
> Suggested-by: WANG Xuerui<git@xen0n.name>
> Signed-off-by: Qi Hu<huqi@loongson.cn>
> ---
>   tcg/aarch64/tcg-target.c.inc | 31 ++++++++++++++-----------------
>   1 file changed, 14 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

