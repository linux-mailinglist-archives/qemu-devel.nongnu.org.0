Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D4E400F26
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 12:36:19 +0200 (CEST)
Received: from localhost ([::1]:59848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMpVZ-0008HT-W9
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 06:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMpTg-0005so-MB
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:34:20 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMpTf-0004h2-7e
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:34:20 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so2769646wme.1
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 03:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eaI+XA/q61Uz/C8UuvRq+wCDMfROurjNeEhq3NFY2Z4=;
 b=V/mZXXqM4XRuYFwVz2MtsEud3mdXkGtx01Zx+pC9Wzp/x2MSAZnZPr2yFN34UG00E+
 a25DpjkXk/uqlk5/JAn6+nMTQdS/am7mh1E5bSnkZZEln60dBjXxL/c7ooE8NEs235IX
 5OGXOWuWwU9/qUbmQPsUwGQbE4udtA8BEnZ16dulPpPLGrWby+goZ3I16HtddpapOuJD
 SIeLi/iK7M0LraRtHPBetyDFFimi2f4nz+QE5ry8/WA4WCnm79W2YO8jjmwZagrFrZ+T
 r2Y6jwlNrdZS5u56Bef9uigI+src7Y9XhVSWImSL0GGlIQCHAW0q11xkbhOMDzCj+7VV
 SycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eaI+XA/q61Uz/C8UuvRq+wCDMfROurjNeEhq3NFY2Z4=;
 b=o3DFe5J7EzVp4Sv4kTs1NY+PChSOg7t0G5t93Yi484VNCI89Vt86EOvSYy6B/upoSm
 /n8dwgVpBIfkwWRTSn07qrrBCE3zL1aG30aRQee2AAPnnjmSRf97ce5SB6dJru5IDbzL
 JYWuPEalVTZrG3eOl4+A2Rp4zXfDuelp+ph5+XO2yKXs/hFIsmpyDl7mnYpgPin6RY8O
 p1GfFIZ1y+TAjxVefiY8XEJnu8tOBtvwuTFRxD9jXGFIVY/W+L+NoBhHhG+ha92v8e9h
 hufnZGG2inJOu3OK6ymlCzqTUbyDycm8COPRo1wXFslJkwabmcy2SMobu23GqvihWdr1
 nQ+g==
X-Gm-Message-State: AOAM5312ZOEfqU4lq/emZVr+59We2qMgURv1Ne/lZNgxV0TeKUTAg6h/
 qLMJE3yHTghdymhCMXWZIhq3Cw==
X-Google-Smtp-Source: ABdhPJwI8V7SOT6u9oVP/+LzTX//UUCSGOy0dbEO6Brt63eb3QtDlp+Zi5Oiz4uhI2a9bKECbzfhJg==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr6677071wmk.135.1630838057747; 
 Sun, 05 Sep 2021 03:34:17 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id m186sm4274663wme.48.2021.09.05.03.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 03:34:17 -0700 (PDT)
Subject: Re: [PATCH v3 37/43] bsd-user: add stubbed out core dump support
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-38-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <db5e3f9a-9ca9-c4a0-06fe-a90fba989e8a@linaro.org>
Date: Sun, 5 Sep 2021 12:34:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902234729.76141-38-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 1:47 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> Add a stubbed-out version of the bsd-user fork's core dump support. This
> allows elfload.c to be almost the same between what's upstream and
> what's in qemu-project upstream w/o the burden of reviewing the core
> dump support.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/elfcore.c | 10 ++++++++++
>   bsd-user/elfload.c | 22 ++++++++++++++++++++--
>   bsd-user/qemu.h    |  6 ++++++
>   3 files changed, 36 insertions(+), 2 deletions(-)
>   create mode 100644 bsd-user/elfcore.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

