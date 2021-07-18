Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707163CCA36
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 20:03:51 +0200 (CEST)
Received: from localhost ([::1]:40172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5B8n-0007o3-QT
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 14:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5B7m-00078v-A7
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 14:02:46 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:43560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5B7k-0000iS-K6
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 14:02:45 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 x13-20020a17090a46cdb0290175cf22899cso4521383pjg.2
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 11:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8ndO+46OOq3vr4Tm9oNHtljvMwFhIv5bFpDI7ZNaf44=;
 b=KLE7rTqhba/Ayu9eMY7+SwOiMzInduAV210sfgS7iUBhB7d4hmna2ghqklfHmB/wR8
 +C+W/QGUh3Vud+Palm1Ygg9U97gLEdgcfX5Cu2GBlq2LJiYuzDAzVLLJg+zsuHYKX1BK
 EE2suYH+xD+MJGOy/x5SyvYcT8S2QZryIJLyP36NpTSySmS3drXpdlcQZNPARGmqLbAl
 TWBk4admpRAQBal4pQJD4aRUBGv/rTkVjvod8CLbcSjImW3zDjFhkzGeDv3+bFHsHHcR
 WX2uFRMryU9oZMhgtXzz++Jr4u017NoTBSaravmxl6KMm4VIqtBSEJ2vSAvu0nQc97Tt
 rODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8ndO+46OOq3vr4Tm9oNHtljvMwFhIv5bFpDI7ZNaf44=;
 b=lePHF9Lu7IB6SmgSE9QOwCwj4VLYzYYfemrRbqUQqmzroRuq/50X4MulvRSkMKkIt1
 hDrX/H1H6WvR0xIDPFCww6MFMwve79Sqefo4URnfWCIOMKTw29Y2ZWHWZgjbbD2vEM2J
 HGSEoNMg38BEDT5oD6PXDaJrk/EN62LfqNE7zw1YLeBX5kDbwzxAdKejsHoe//Z0BEeE
 gr2NXZ4SBfeQO0HHMUvNkJwgyRTkNdMc9LEP8i2KPSE5UxQdb57uLRqU3l3JqripgZor
 afa6C/qrHsd6bMcjew5RrZgAjLbKN2JwLI9St19tjqSPVV+4EA8KB1u6jyZOdwEXTdDl
 YOQA==
X-Gm-Message-State: AOAM532RVhCCv6c5PFSjHWymwJGcVq36u7SAefcAHOVx9SWahJA9NFJq
 0CaMx4rtcHK1WGGp6ZJpJOH+bA==
X-Google-Smtp-Source: ABdhPJwOa1N0iRztuIsI0xVSBuxUmNkIrLkrf/9IHiDrf4JpyFpP9aNOcyRdBFUky1Wr0FidxW7vcQ==
X-Received: by 2002:a17:903:228c:b029:12b:7566:af5f with SMTP id
 b12-20020a170903228cb029012b7566af5fmr7519326plh.14.1626631362300; 
 Sun, 18 Jul 2021 11:02:42 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id x7sm17508263pfc.96.2021.07.18.11.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jul 2021 11:02:41 -0700 (PDT)
Subject: Re: [PATCH v3 10/13] target/riscv: Reduce riscv_tr_breakpoint_check
 pc advance to 2
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
 <20210717221851.2124573-11-richard.henderson@linaro.org>
 <CAFEAcA8C=8kAdsYeKqVwH=qeaWy3yoh+YgKm2Qi+SGcV7XWMtA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4d959bff-8c6b-e01b-a23b-6e17c062f85a@linaro.org>
Date: Sun, 18 Jul 2021 08:02:37 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8C=8kAdsYeKqVwH=qeaWy3yoh+YgKm2Qi+SGcV7XWMtA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.07,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/17/21 1:35 PM, Peter Maydell wrote:
> (What goes wrong if we just say "always use a TB size of 1 regardless
> of target arch" rather than having the arch return the worst case
> minimum insn length?)

Hmm, possibly nothing.  Perhaps I should try that and see what happens...


r~

