Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3101F3D1587
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 19:52:23 +0200 (CEST)
Received: from localhost ([::1]:44798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6GOM-0002LR-7k
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 13:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m6GNF-0000nR-9k
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:51:13 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m6GND-0002RV-Uu
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:51:13 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 14-20020a05600c028eb0290228f19cb433so42716wmk.0
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 10:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g2YSY1ugD5EkZu/5APy4FMZ5aFvRbiPa6emTTDM3S68=;
 b=ZS4FThp37F/vdnGyd40G2bkBKv9j+1aStHzF75+gyDnIG+NO+K7obGMsbsscqEYYvz
 uqscWDp16GT/jV1Yf9mGrhK86tw6yYGcJqvV4jzzpvPJQ0LXSIWaWI7J1Nd7M0V0sLaZ
 kSRsMf1MldgqMB45mPB5mv/hwBOBboe1BJmzCjB9iTVLOnaioVnyPsyIRavFoG9ShUth
 zzMMli2pN4kn4+NuJuAzAcpElMH6ILrHFlMnb3jAlPSUZQdwrlbur5TNoUzM10B6nvWX
 f17R9V6BqbXW3Wk1lLnIes3kBg6clbxJ4TVSR60uQZpEWQHaU07uMnasdqD8iIZzXizD
 f65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g2YSY1ugD5EkZu/5APy4FMZ5aFvRbiPa6emTTDM3S68=;
 b=aglZw+xUG0IPa3iqPeq7pWxcZtZAqrdJjW7m6Su4pMjxdOv9gARHHJH6BJcb9HNHzV
 bMLNmilzj+GzACFFGDJG2Xw56cZ2OOCnMQY1fzFUyRhBA6RuiufxqFfXFVISHIYZw91G
 bzXL/GEVCDqciV9mvDqgFtR5wlnNHtKcLrNeyL8ganOdGLD7HpkdyYLRKFN8f+EnshKj
 fvpiyuM4pDCXrF5/mnClee0B6nhVY2wTNdD9ZsyDNaXhXRGE2pzrQ4DqbbkDM50S1qpd
 ZspyThVYtHL1JL0Kr1KQudcSJRjqSMpaK0M9h/xP6aCR+MJKTggdPxCZXk8r/C16y48M
 vL+Q==
X-Gm-Message-State: AOAM533yWNgZjTKolu9bmgsGC4AZ9rsTH9SpyXVyL7GQ0Esb+3Hjvz6D
 uN/4Od0ausxKITCIedECnPgDjV8tgsYSWA==
X-Google-Smtp-Source: ABdhPJyLyQlBKW419FDUHpRVWUY4yEzF4iJ5MFEjiU+sCrN7AKI65Ln29VAvrZi0xamXvnM5hN0AnA==
X-Received: by 2002:a05:600c:4ba1:: with SMTP id
 e33mr5144942wmp.81.1626889870394; 
 Wed, 21 Jul 2021 10:51:10 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id r2sm1512811wmh.34.2021.07.21.10.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 10:51:09 -0700 (PDT)
Subject: Re: [PATCH for-6.2 14/23] target/mips: Drop exit checks for
 singlestep_enabled
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210721064155.645508-1-richard.henderson@linaro.org>
 <20210721064155.645508-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f3667855-7ee8-f8e1-58ee-13333ecba684@amsat.org>
Date: Wed, 21 Jul 2021 19:51:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721064155.645508-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.117,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/21 8:41 AM, Richard Henderson wrote:
> GDB single-stepping is now handled generically.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/mips/tcg/translate.c | 50 +++++++++++++------------------------
>  1 file changed, 18 insertions(+), 32 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

