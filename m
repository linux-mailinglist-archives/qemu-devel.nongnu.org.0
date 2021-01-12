Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3642F2F2340
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 01:11:36 +0100 (CET)
Received: from localhost ([::1]:49212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz7Ha-0008RP-5I
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 19:11:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7Bs-00053C-0N
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:05:40 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:46786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7Bp-0004Ei-PM
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:05:39 -0500
Received: by mail-pf1-x42a.google.com with SMTP id w2so256043pfc.13
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 16:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ulNC+wVGmUmcJ5b/YZvDBl+z1bvwMpgx0vSChiFkux0=;
 b=lXt8gsepYT6nura0aTzs6RE3ABWLYv0Km8GmGBiCogpFfpHO+0z5JkDOp5r/61bzdC
 8O6Osupb12v/geKOY+kiV4OWWUSWLpwrDkAwYMagvUGZXBMHIxl6nVMjlmXcZKkZ961m
 CLbMsEtV9s8khVj0g1ptsQpAkDoh+CdVU90XsKcYKnF9n2q8uEiDVx5StVmqaOFmIo5g
 eUjLYgpzUw6xF8OwVYf0fWnXTDyL1iKXOfg5YnzOeNitHpkx7GrLJb4Hlf2X3vfXbaGk
 ZeObHLlVuk0YbUVRxl/NSpl6xYaJbZ9eUngAC643q4nU8iKRjm9ND6fRcAALWT/r+4J5
 zH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ulNC+wVGmUmcJ5b/YZvDBl+z1bvwMpgx0vSChiFkux0=;
 b=T8s5Hbe9cRTvs9Y5JspME8MH3jGaI78zNnaz1/12Bc/aylzx0IDS0whRmyshN7RfcT
 mJfAc/7JsNrZJFgtX7KTI8shN0NYkI2YsCjqCpeNZzqt9gTDslFRNavQNo7I9T+s7/LV
 iREbE2J+VOJU8f0Pn9rfIZdCEr/HPed9WtLiaVouI9j1ldmg6royb5V/ey3L7aRBS1aT
 fVUmZ0jQrMlQXK0U2erirAfs/eaKw/3COzWCeOzbcvRwq7UKzqWhcABrn6B1f+RUnleV
 zeFiE0VMQCi/ao6DtFkKyBV5wEEXH2dqF6s0LkEUYSk9UtRNtujlFAs9+cm/lMrdVTnH
 vvBw==
X-Gm-Message-State: AOAM53134Cu0J0vlWmdfL2a9aVApCQduIFS9wK7Nagws4wmK/iMHjZLz
 xsXXSqmApnnV6rfCWsIV9An+4mlLOZmBVg==
X-Google-Smtp-Source: ABdhPJyPEH8JkdwOtOytQKQJ1fIl7VbRc/kM+F1udWXNkgeysDNiGKAA3xpaxdHMQTYWVp/5vB0psw==
X-Received: by 2002:a65:488d:: with SMTP id n13mr1828443pgs.315.1610409935972; 
 Mon, 11 Jan 2021 16:05:35 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id a131sm810273pfd.171.2021.01.11.16.05.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 16:05:35 -0800 (PST)
Subject: Re: [PATCH 09/18] target/arm: add ARMv8.4-SEL2 system registers
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-9-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7179fb23-01b9-83d3-3aac-64ed3d4649d1@linaro.org>
Date: Mon, 11 Jan 2021 14:05:32 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218103759.19929-9-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu.h    |  7 +++++++
>  target/arm/helper.c | 24 ++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

