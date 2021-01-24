Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D4F301912
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 01:28:13 +0100 (CET)
Received: from localhost ([::1]:54838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3TGG-0006rf-OK
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 19:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3TFW-0006Sy-Qw
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 19:27:26 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3TFU-00055p-WD
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 19:27:26 -0500
Received: by mail-wr1-x433.google.com with SMTP id g10so8710363wrx.1
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 16:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R66+r8p5pR7AyJocNh+ogBzsoeh6QMn63fF5NINv1Ws=;
 b=ONY/38ed8yNVbiLYbZsc9iLziilRa2G7g3ST9CchgOeb1I0hlajN011zV30BDUMfL5
 SEgaI1DkOHwA9XPJ50sXZBtQBm3QpLR1vDEUwiwfTLPcGScv6Z7Ujn47MptQdOsAsCCW
 4+PyFAguHYvGOpvvtIg1MI+obktLl/5gK5v/G6BwAUdIsgJQt3NP9QcEDMw8A/USI+Ap
 f2eeTb7b/C61p3Tk0QtIjN3NBRjjbOWsYpc7Sj+Q0PcjDG1CaFGegg7/8fWaKqy8r+YX
 awXvRT444Ds0H5psg9AnVjwmQoxTC5HEOkFJ9KjmQn0scCngHuslju/GhHPAkwSPeZi2
 dqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R66+r8p5pR7AyJocNh+ogBzsoeh6QMn63fF5NINv1Ws=;
 b=Bpxm4GeeX70QYmyn298qx+vjwLXNadnkfbAm8FfWYgvXnD63cXmIRivTuLcj3UX6Nd
 v1yA+1CSc3Sz9APQEQAXyDS+3PmnrZnm3QMcNt6tSmcMre+NOqAI3DPC6goFjsZLz/R9
 C1+94RhkeZwZmv6hTv1EKtuhPDyVA6i/oBNJNFu//yZoV42bNAWENkGdLtPfisPBZ1sC
 oIT/6o0c3DTaC1gbnbLsF7MAgGeQP4dPr3jd7C14KsfC8ZXpK/Yd+VEM6A4oTqG8DjJI
 3oa2zgy5NMDPeNvVj0taXBohjGBMnb1MZWiw1IxFnbnND1B12WHUvcwEN51gAta5K5lF
 KTiQ==
X-Gm-Message-State: AOAM532YO6mW5RvD7FgGertfAVMnF6yZiv6YoLsowDFHjSrHtHs/wffc
 n2+wSQvKsTEmtdpPfOYNA/M=
X-Google-Smtp-Source: ABdhPJxynYuW8XBUFv6ley8RHHqAUXt2JBQrnf1PThQPMZLGjF6LyNN/Ss/bJ4Z/pjL0VN3FyFtuxA==
X-Received: by 2002:a5d:6884:: with SMTP id h4mr797913wru.106.1611448043525;
 Sat, 23 Jan 2021 16:27:23 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id n6sm15878208wmi.23.2021.01.23.16.27.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 16:27:22 -0800 (PST)
Subject: Re: [PATCH] tcg: Restart code generation when we run out of temps
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210123230105.2076270-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ac08bcf3-4c2f-c74f-9135-f7e21f728e54@amsat.org>
Date: Sun, 24 Jan 2021 01:27:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210123230105.2076270-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: lvivier@redhat.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/24/21 12:01 AM, Richard Henderson wrote:
> Some large translation blocks can generate so many unique
> constants that we run out of temps to hold them.  In this
> case, longjmp back to the start of code generation and
> restart with a smaller translation block.

Clever and way nicer.
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Buglink: https://bugs.launchpad.net/bugs/1912065
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> This replaces both the patch to increase the number of temps,
> and the buggy patch set that dynamically allocated the temps.
> 
> 
> r~
> 
> ---
>  include/tcg/tcg.h         |  3 +++
>  accel/tcg/translate-all.c | 15 ++++++++++++++-
>  tcg/tcg.c                 | 11 ++++++++---
>  3 files changed, 25 insertions(+), 4 deletions(-)

