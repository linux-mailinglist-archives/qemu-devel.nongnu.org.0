Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319D547E907
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 22:21:43 +0100 (CET)
Received: from localhost ([::1]:41798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0VWu-0000jR-68
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 16:21:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0VUV-0008Ji-V3
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:19:11 -0500
Received: from [2607:f8b0:4864:20::536] (port=38552
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0VUU-0007fr-HJ
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:19:11 -0500
Received: by mail-pg1-x536.google.com with SMTP id s1so4433628pga.5
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 13:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SWjeGGwydMB+5R0jAoRuAXyQHzUcee6P/kcweTr+00g=;
 b=ZOtPU7N0lTcmBIajRZrNFBL/2dAOwK4Gl5N/a43Ih4fS3EwFjdsBZ/U2S6q0PBwNLa
 1fBF4tmK1HxRvc/68R0UZlVjRK3BZwsLap2ImnoXp78fHAJrv9z+7oaUzcKazWfWE4zc
 VuhiFtCFMlRsrmjrMHp+oOQrGPE+TODjtyX2+yT0/wlKmQOtBO191vm1AdUVBwPlbAz+
 5NrYPg1//goV4Kf65SPNZRJHnJUZZxG4cVocRNjvYSFQs3+ZZ17U6LtG6AeA1sOqLXpa
 XoNMt0Q43FyGrDB8ma+l9imCEvQiIpWGVn0VqwExspThCEtDJP062/4VAwnp6Bn3o3AS
 ZiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SWjeGGwydMB+5R0jAoRuAXyQHzUcee6P/kcweTr+00g=;
 b=0gsFJNvdePYSmmZjC0GUz/4MYD6EZY1jDC/W+vpxw0m6tp3/1kf9VLFCmsATaQn4SP
 pwBxaburqX6eOb/OcX8D2m1J14ENveJt9UOt1rRiILD/E93TArMkLxvZrUnxQLMDbScS
 wlqocCQCtW/MM2xLIvCq8mV8SCnN5kkHoyDN638llNHGlBfjoufI6vZrtI8XVRbqN14u
 xF9JNoVY4srOsqM6cBmWyfV/hbD8RqE2gfNJE+L21TFD+1t0X44IHFDzuzXDDQVwOPBF
 eW1W5Ig441x7/JkGJWEi380qrTylxqezlPd6Km4lgGqxvCFnbct46TsWyT/KHrqM+TxS
 zhQQ==
X-Gm-Message-State: AOAM5322oPuD6FpP7rW2gMyG0wtot5m2H8HOCV7ZMIdpvCIsrBBci3Za
 gZcBMUoGfm5OlKO8KkI1ZVZdSqbjIlI3Ng==
X-Google-Smtp-Source: ABdhPJwsUBZswbLKTmYLChpN0ffwXh//hvkTrCxudG2AROKpfe2x57hdgAL6lU+Bhb2dUKwagvrveA==
X-Received: by 2002:a63:2c10:: with SMTP id s16mr3602459pgs.173.1640294349139; 
 Thu, 23 Dec 2021 13:19:09 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id nk23sm9155832pjb.16.2021.12.23.13.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 13:19:08 -0800 (PST)
Subject: Re: [PATCH 0/3] Reorg ppc64 pmu insn counting
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20211223030149.1947418-1-richard.henderson@linaro.org>
 <1b988844-075d-beb3-7fd1-a26f30e9f5dc@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1928bc96-ace5-3e5b-2da2-723ef3071173@linaro.org>
Date: Thu, 23 Dec 2021 13:19:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1b988844-075d-beb3-7fd1-a26f30e9f5dc@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/23/21 12:36 PM, Daniel Henrique Barboza wrote:
> This reorg is breaking PMU-EBB tests, unfortunately. These tests are run from the kernel
> tree [1] and I test them inside a pSeries TCG guest. You'll need to apply patches 9 and
> 10 of [2] beforehand (they apply cleanly in current master) because they aren't upstream
> yet and EBB needs it.
> 
> The tests that are breaking consistently with this reorg are:
> 
> back_to_back_ebbs_test.c
> cpu_event_pinned_vs_ebb_test.c
> cycles_test.c
> task_event_pinned_vs_ebb_test.c

In which case perhaps drop my first patch for now, and instead simply replicate your tcg 
algorithm in c exactly -- using none of the helpers that currently exist.

We can improve the code, and the use of pmc_get_event from hreg_compute_hregs_value second.


r~

