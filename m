Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 248FB31EE36
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 19:25:42 +0100 (CET)
Received: from localhost ([::1]:40560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCnzh-0004JO-6c
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 13:25:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCnxi-0003Sd-Ld; Thu, 18 Feb 2021 13:23:38 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCnxg-0000F8-Q4; Thu, 18 Feb 2021 13:23:38 -0500
Received: by mail-wm1-x32e.google.com with SMTP id o82so4639051wme.1;
 Thu, 18 Feb 2021 10:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+O+WulaEMz8MZyaOxDHoBBz/B1rRxsStq5oIwajaOvA=;
 b=pBxF+RZCzjKRl99LrUlPwvEQ9gAXKWFV+tjp/Ps9rN5VzsyP1MjZbbCTg883vpFcDr
 oKQ/YMWJwNSHShKYtRnzczPELHsaOpT+vnt83eZxpwoAmRRqORM+ALGXA+Bv5IJkC0KO
 +qubeOuNVwNthj2AGlOJfAij6okmOUJbqTrSZH5sl2sR4vzWNJOzxAXuheE6qqDyODLf
 w+bNEyR8LH7zsRDo/O6GTb3HpFZqzAntEKOh6u7f1C6Eq5Jvw2E+JGHzzEYCccx5ovVE
 XFxHB2s+v/jrisYMEmEalTgz4p0hsPsUFP+IaC3d97c0ldU2HDZtSGvW7g98+k6vSpjO
 pRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+O+WulaEMz8MZyaOxDHoBBz/B1rRxsStq5oIwajaOvA=;
 b=TsY6AR5viX6uZ+FkNasfFCvAvksoBpR/DMkqIwzzeFVSoZaNSkq5tcjJYbbC6f1F/A
 H/j9ySUX0kMyoAVHBKLgl2hZYPUzKjAO4aYgqA+eOUcdpzIQnuXP/GLOn0CePVxZ1quk
 yXc+edqGBED3DdNejBQxIzayhFj33P/e6vhArAxX/0VbtQzw1EXoWlBlxfpFKCUljk72
 FJe98QcMaUJkqb7oM4xWe/55PKCrSWCfwSHgJbqU5B1gW1nBpqfULx+MDbDRbI2ztRw3
 jo+VXXcBtWjX6d/EaX5z376ShxH6mC3gd4X/1TrF3cKY51kPqhYLNwvNq29daoWsswFM
 5xtA==
X-Gm-Message-State: AOAM5312OcWUXfDP+9rdKfSxkBMCQwvgP+dKXGjuLQEN/nlFVbNtnNdU
 H4aliKCOwSW8aeXVkk3GAKlqOfXEQIU=
X-Google-Smtp-Source: ABdhPJy1PGQHnjwsSXW2JQLDBgCqyBLi3t7+LIsS9ZHnsrLNxwFJziPeg1fqFvuuSc8ztJBry4Adqg==
X-Received: by 2002:a1c:105:: with SMTP id 5mr4794741wmb.89.1613672613918;
 Thu, 18 Feb 2021 10:23:33 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f14sm8588193wmc.32.2021.02.18.10.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 10:23:33 -0800 (PST)
Subject: Re: [PATCH v2 2/6] hw/sd: sdhci: Don't write to SDHC_SYSAD register
 when transfer is in progress
To: Bin Meng <bmeng.cn@gmail.com>, Mauro Matteo Cascella
 <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
 <1613447214-81951-3-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <277459ba-f35c-31fb-c088-def282c841d4@amsat.org>
Date: Thu, 18 Feb 2021 19:23:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1613447214-81951-3-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 4:46 AM, Bin Meng wrote:
> Per "SD Host Controller Standard Specification Version 7.00"
> chapter 2.2.1 SDMA System Address Register:
> 
> This register can be accessed only if no transaction is executing
> (i.e., after a transaction has stopped).
> 
> With this fix, the following reproducer:
> 
> https://paste.debian.net/plain/1185137
> 
> cannot be reproduced with the following QEMU command line:
> 
> $ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
>        -nodefaults -device sdhci-pci,sd-spec-version=3 \
>        -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
>        -device sd-card,drive=mydrive -qtest stdio

Without the rest applied, I still can :(

AddressSanitizer: heap-buffer-overflow

