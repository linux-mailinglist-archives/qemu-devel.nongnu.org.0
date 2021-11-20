Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7093D457CC5
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 10:55:09 +0100 (CET)
Received: from localhost ([::1]:37332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moN5Q-0007bS-3k
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 04:55:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moN4M-0006Yu-6x
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 04:54:02 -0500
Received: from [2a00:1450:4864:20::336] (port=41753
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moN4K-0002JO-4W
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 04:54:01 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso9405416wmf.0
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 01:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pLB7PSqKHKJrxvvyfJjOpvt8se8liKN7YPH7ATtgbps=;
 b=wOvdJrd14cM1cOpZ2IA2zyqrUWQKx9c27B5YVHOY0tvRaQj7+xHvVTazgJyiI8pLIw
 CtWDuvcyeJDzRiOAXvipdUUytgmOlgAUOAbcAYG7nJP8MgKauD0YsDUmPEESMfEoGS1d
 uDzvRWYsXJXH+f+qV6TS8pzM4KIvYzhTPicBQfhXL2yd8Igrp7xUDZO893NOn7cFKHwn
 O9eIYcRxT31LhS/BKNkjfP6awgA9kTSYdtKHyMhZjEAs1euC6hTvNFNVl4UBFDtxha9G
 XH/i0RJsbmpdL0s2Nb+dFDUR2nIJ7gfdasH2NclLkb04C8Ia7ln/rLrSmh/WmSxQQIyg
 vEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pLB7PSqKHKJrxvvyfJjOpvt8se8liKN7YPH7ATtgbps=;
 b=7TJyIyWU64FxBxrQLfnVdQm7DiG7xiTITJFY/9HW/RCPfFsO5coXHW37mbjIg3HmW6
 Bxm1fJVWKx05ofPEkRe6Jec1BkSxsHJUOEYJskVXbE1PmIl9uX3cbTqrG9D85jJKY891
 woNsO0dbNhU1p0HElPhB8+vjCSXRZUKDHEh2bvFKpSkK2mcJjrFewlzw0/uqzJHFk9kF
 F/qsTUDqXO+hGs75EjzrFCtjNHgyCMVzwhXDeai1HgF/riC6Q/0KRS8KbpdvoI2rj8zz
 BghOuGjvhJvbIqGLbUEdZIkfCqOOGENLMO9b33+s9dpU5mG4lNsBveqUXj+byCuXrJ2+
 ONvQ==
X-Gm-Message-State: AOAM533l6wDLw0WPc1e6aAJTQj3Jw7QpFUECc3L2brviQY3BNwrd+Fws
 +/Zu7bJzNqc4uxJURw+v7WsSUQ==
X-Google-Smtp-Source: ABdhPJwCQUIOP5TdlZ8FBli3pgtgQy/dWpEv2uzMTFJUcoBO0gum0BVegRxkeGiQcrjMntPY+uYnvw==
X-Received: by 2002:a05:600c:1987:: with SMTP id
 t7mr8509221wmq.24.1637402038102; 
 Sat, 20 Nov 2021 01:53:58 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id b11sm14637237wmj.35.2021.11.20.01.53.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 01:53:57 -0800 (PST)
Subject: Re: [PATCH v11 16/26] target/loongarch: Add disassembler
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-17-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2cad6c1d-6a82-15e3-8b4a-68630a2c2f9d@linaro.org>
Date: Sat, 20 Nov 2021 10:53:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637302410-24632-17-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 7:13 AM, Song Gao wrote:
> +static void output_r_offs(DisasContext *ctx, arg_r_offs *a,
> +                          const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "r%d, %d # 0x%lx", a->rj, a->offs,

%lx is wrong; use PRIx64.
Many instances.

If you use

     make docker-test-build@fedora-i386-cross

you should see errors here.


r~

