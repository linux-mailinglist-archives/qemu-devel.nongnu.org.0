Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC6D2D3621
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:25:01 +0100 (CET)
Received: from localhost ([::1]:35308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlPo-00005t-EU
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmkNy-0004WS-4u
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:19:02 -0500
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35]:35030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmkNv-00055O-B0
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:19:00 -0500
Received: by mail-oo1-xc35.google.com with SMTP id s1so1117168oon.2
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 13:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oEbp8XIFc0TWpCJp6TP5hH+/y1SX+fxWecNXtN+yOqw=;
 b=sDn+DDse+7UKNNMYUUD6OLPm2PszSYj6kHeDT6Yc3o/niDYUacsb+VcttcZYI2BK04
 CFm/Rvq1tRO76eDhhEu8nuYcggLJ395pcLvRBfx+r8NdzJJ6OZCcFsNHYiLwrGk7u4E3
 wC4XApRqkpVRSEPRYsiyx04GlJ7wmOkwjVOM73FR2SheAcA454FVjQHLc+1etV5U0nMg
 InCVVLUcI9RLakdT3+TtIil6/5knK0hzVc+w6Q1za2h5w7lbbtK1jaLBf4Gw52AT6PiM
 eZ6Qtk/4iOfHaC/F0mmkthVhuEcchsdE21SHp56iHx4/bzcvXmRaGTeF4BC438anaRFL
 TE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oEbp8XIFc0TWpCJp6TP5hH+/y1SX+fxWecNXtN+yOqw=;
 b=FtfVdJ2idHHkiMb7kCpdVa8KYpGI/xRopWrHfCvdSOKPMzp2svCR/U3gX0ivXjvuri
 0rdwej3+TwlQb9O0m0RviDYaZ3Eivs2WeUkPXWlxYKCPoaTAZv5o7CcJTKBrEEa+/Brz
 h3GCbw5YSm3NpqD+cDWiPkynC7UtH2rXQjndGhiJiU5xMIFJ/uoBJgjNvhInAGp3Z1Wq
 YHaqhBMFkfYNyYh1Dgc3aaWLOAWyOZ8jj6qBllWXR660qlvUbm54KnZqvd2hy2hAyqB7
 OWth32sjkW4HeG3Fo4OBoZM8N1C+QANw0ndMDfRZExsIztvv6YMwCmvttUXUh5RjB6AC
 QRuQ==
X-Gm-Message-State: AOAM530OjDi7aL8oBramKtt1obfLqiHEJHn1BYuUGOs0SW/jlEbacvat
 zGGIS9VlWRpHN+CNAPtFo09AZQ==
X-Google-Smtp-Source: ABdhPJxcdHxnO0udZm3oTT6H9sX9z2WQzN1Zt6fSBf4wFdMxF5fCRssTzE0X7OAG5x+BUd0T3a0Vjw==
X-Received: by 2002:a4a:d396:: with SMTP id i22mr9050427oos.55.1607462337064; 
 Tue, 08 Dec 2020 13:18:57 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 100sm3920713otm.27.2020.12.08.13.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 13:18:56 -0800 (PST)
Subject: Re: x86 TCG helpers clobbered registers
To: Stephane Duverger <stephane.duverger@free.fr>, qemu-devel@nongnu.org
References: <20201204153446.GA66154@wise>
 <1d246e29-b364-099f-440c-5b644087b55f@linaro.org>
 <20201205013402.GA69224@wise>
 <5718f49e-8e17-17ae-45ec-94347f0a009d@linaro.org>
 <20201207101029.GA96540@wise>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4ee3b75a-c778-3cf5-2516-9c9290d96b44@linaro.org>
Date: Tue, 8 Dec 2020 15:18:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201207101029.GA96540@wise>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc35.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 4:10 AM, Stephane Duverger wrote:
> This leads me to that simple reflection:
> 
> If we want to filter on every memory accesses, *out of the fast-path*,
> the most natural place to do so would be in store_helper() and
> load_helper() from accel/tcg/cputlb.c. By doing so, every target would
> benefit from filtering, and even specific helpers using cpu_ldst
> functions would be intercepted. No ?
> 
> For the remaining fast-path case, it could be interesting to generate
> it this time at IR level (tlb_load, jne to slow_path, direct
> load/store) ? Again every target would benefit from filtering without
> the need for a specific fast-path implementation in
> tcg/<arch>/tcg-target.c.inc
> 
> Wouldn't it be simplier than actual mem plugin implementation, which
> generate fitler callback *after* load/store and has specific extra
> work for tracking memory accesses performed from helpers (afaiu) ?
> 

As for modifying store_helper(), the reason not to do it there is that it
misses the fast-path cases.

As for modifying the fast path cases, the code is quite delicate, and you run
into problems with live registers.  Which could be worked around in each
backend, but... why?

Which naturally suggests separate instrumentation separate from the above,
which is exactly what we do.  So, no, I don't think it would be simpler any
other way.


r~

