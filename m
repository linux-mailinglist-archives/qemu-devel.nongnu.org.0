Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10C22E858C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 21:36:31 +0100 (CET)
Received: from localhost ([::1]:38128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvR9y-0005ZJ-A5
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 15:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvR90-00053L-Dm
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 15:35:31 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvR8x-000517-Ab
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 15:35:30 -0500
Received: by mail-wr1-x435.google.com with SMTP id d26so22657505wrb.12
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 12:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3DenVH95OETFXF3tS0CU05ViS2HGOzgh/iXDjGgIrdk=;
 b=oXiueCbztSufcNXX7aGyw5kzTLd9AmigB5ODYSFfw7wOlvjx5+7bvBQn4yP9yboq7t
 7/N1r11iA6YYlOAB3SpHrxdltsAnSwZsQYIJ9i59pJwiPMloxRuvuQrI2Ab6kTtyUG9y
 TG1fOlcC9mNtIcIs9ymYvY0Qfo12GuANbf37NwbhFIYobsofZH26GkrqE2WE3+joqFyf
 6HwpKJ+fVCvPJZNX8PiouAfZ+Lb6qCkl8PMQEQu1lb61azR9ed1FV2jXVGC3A1tyNQ3+
 UFTEvjUwbIkZ73yks9k2DukcaY7mHkvsG3PyBvmda+ZbWqUe+2dTz+lAUQ92KAE5dXyt
 BQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3DenVH95OETFXF3tS0CU05ViS2HGOzgh/iXDjGgIrdk=;
 b=n8IBWw8We/YI7HLUNFWDBKfc6kIdARUiRLDm9MwLki5UWMQU7PaNi99jjxZm441U4B
 4kzJ8bEi45SrFD6M/DxZiogudH4x2PzQRusQh6T1d3OpHDG/+1EtwbMUI8VtCjDk5YtA
 bqECzGkA2YciBBCoCbRkz0KZFQt702a7htjUQR+WVq5DcWue+wm4F8fW5NYH8ZDJMkxa
 QLKtzuy02IELmWCzo+O2OqlMe5DVZSOj7Yb7HBWs3JkJDIl1SkEqV/kAjPS70Qws0p+B
 xpiWUZWJbQLawnfV/faFAlzZLjo9UE0QZy/2sd75SxtcQg7UWDtUVDHX4Quy7S6nhSnZ
 J7bQ==
X-Gm-Message-State: AOAM530AAcw0J7YCL6Glt0wgg1pwIu5ESUY19leokZsyaMpZefnLotXj
 kck4K6CYbO7NdNrk4TF94VM=
X-Google-Smtp-Source: ABdhPJzsFxr9AuCoHPgkPlil/Rc7CX0710dfE+g4SpxB5LgSXMRgWIMTo8LDaZPzYp/3i47jeAgw3g==
X-Received: by 2002:adf:b1ca:: with SMTP id r10mr70284491wra.252.1609533325568; 
 Fri, 01 Jan 2021 12:35:25 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id z2sm18698078wml.23.2021.01.01.12.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 12:35:24 -0800 (PST)
Subject: Re: [PATCH v2 0/4] clock: Get rid of clock_get_ns()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201215150929.30311-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2ab2c1f3-8c3c-5534-a45d-2250843dc262@amsat.org>
Date: Fri, 1 Jan 2021 21:35:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201215150929.30311-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.749,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 4:09 PM, Peter Maydell wrote:
> This patchseries makes some changes to the clock API:
>  * Remove clock_get_ns()
>  * Add clock_ticks_to_ns() to return number of nanoseconds
>    it will take the clock to tick N times
>  * clock_display_freq() to return prettily-formatted string
>    for showing humans the approximate clock frequency
> 
> This is based on discussions we had about these APIs a little while
> back.  The core driver here is that the clock objects internally
> store the period in units of 2^-32 ns, so both clock_get_ns() and
> clock_get_hz() are inherently returning a rounded-off result, which
> can be badly inaccurate for fast clocks or if you want to multiply it
> by a large tick count.
...
> Peter Maydell (4):
>   clock: Introduce clock_ticks_to_ns()
>   target/mips: Don't use clock_get_ns() in clock period calculation
>   clock: Remove clock_get_ns()
>   clock: Define and use new clock_display_freq()
> 
>  docs/devel/clocks.rst  | 51 ++++++++++++++++++++++++++++++++++++----
>  include/hw/clock.h     | 53 +++++++++++++++++++++++++++++++++++++++---
>  hw/core/clock.c        |  6 +++++
>  softmmu/qdev-monitor.c |  6 ++---
>  target/mips/cpu.c      |  4 ++--
>  5 files changed, 108 insertions(+), 12 deletions(-)

Until someone else prefers otherwise, I plan to queue this series
via the MIPS tree, as I can add the patch which increases the
Loongson3v frequency to 2GHz on top (the unique machine using
a frequency over 1GHz).

Thanks,

Phil.

