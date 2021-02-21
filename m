Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DAA320D87
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 21:16:47 +0100 (CET)
Received: from localhost ([::1]:47638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDv9q-0006mb-Gh
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 15:16:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDv0Z-0008IW-3g
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 15:07:12 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDv0W-0001Hs-8m
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 15:07:09 -0500
Received: by mail-wm1-x32a.google.com with SMTP id o82so11668716wme.1
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 12:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kReJNdjV1xWO7HIzpejXtwmvF8ZdUieNjYiPSseqXBk=;
 b=X2EFicWqzTz6esmV0Lk38eDDzwZ/RFWgb7d3uxndWQG9X30UP3vV/5sebpjdwPJYQH
 1T3262Axj7krQXutgNXiHina4Gc4ofvUaVRNcqnnroTxAytRggMzXXxj24EgNrk00oJL
 i2MiE1zQ9D4489/VV18XRb1LcK3l7v+psyhWYGd5scC6AmqYQvnjksuTsxBXFIIwfIiT
 u0zO2VGjlLBqI+d1pZRQQJC3/JsZQG/eQ7vfcKngZnh6CXCsZAl1bf3Pe1Vm3Tqh4HbS
 zF1uVm6+q4h5eMaTSiClPhPiX1yk/grEkHLLNaadMwF1KCh9loHI+0xaYrpnk6WBhAKx
 ovyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kReJNdjV1xWO7HIzpejXtwmvF8ZdUieNjYiPSseqXBk=;
 b=qMewKF2y7srUC0hBEgZQIeeae8a9goTF2TTd3HHbo6B+9/UtZYTJ/1D22KonZSWUjZ
 MSbJoW+gop2/bdjtCBrkBUMDRX6D89obVXgeiXwEMddSTq+WSyCwO+jyAYucmsZN4tyx
 hBFdaph9eARB8YvioSOgujZDUlPz2MSEvCLFrpNbJpuAZbypiEyVZ5+7r+O4/dyOTjZM
 Hx1oGTLHzXGzc5Fh6cK7ovxNP+t9wN2PtcHQxO9QqkWCDRgx/aZ8kXuuiYOL2NZgtZ1/
 htQMOdxHDKNQCA2ibJ9MQ6LdSHtcSdpza++WqB7NBEHwWbGwqmkQ08g2mC6S9z1H5TZm
 dWSw==
X-Gm-Message-State: AOAM531TzqoaKd7+frBZTikujGM7ssDPZQhwAmDdc2WeQvkivogAgkaf
 esZDeTwRbUiWEF5Tctl4FHs=
X-Google-Smtp-Source: ABdhPJzr7PWI8w7lTD6WS/3wpDI7L0O3j/CtvEPazL2Q7GmjS+weGlQUhlaah3urQpDYJ2jRCTWoNQ==
X-Received: by 2002:a7b:c5d6:: with SMTP id n22mr16770233wmk.70.1613938026360; 
 Sun, 21 Feb 2021 12:07:06 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v9sm21620519wrn.86.2021.02.21.12.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 12:07:05 -0800 (PST)
Subject: Re: [RFC PATCH] target/mips/cp0_timer: Use new clock_ns_to_ticks()
To: qemu-devel@nongnu.org
References: <20210210234334.3750022-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b2c64763-f341-60ff-0467-d95a4daab968@amsat.org>
Date: Sun, 21 Feb 2021 21:07:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210210234334.3750022-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
Cc: Hao Wu <wuhaotsh@google.com>, Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 12:43 AM, Philippe Mathieu-Daudé wrote:
> Use the new clock_ns_to_ticks() function in cp0_timer where
> appropriate. This allows us to remove CPUMIPSState::cp0_count_ns
> and mips_cp0_period_set().
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Based-on: <20210209132040.5091-1-peter.maydell@linaro.org>
> 
> RFC because this is just a starter patch to test Peter's series
> providing a handy function which "tells me how many times this
> clock would tick in this length of time".
> 
> Also because we could rethink the MIPS CP0 timer logic to avoid
> too frequent divu128 calls (painful on 32-bit hosts).
> 
> The style should be updated, using more variables for easier
> review. env_archcpu() could eventually be dropped (by passing
> MIPSCPU* instead of CPUMIPSState*).

I guess it is better to wait for Peter patches to get merged
before posting the updated patches (not much, just one previous
patch MIPSCPU* instead of CPUMIPSState*).

Regards,

Phil.

