Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA2D58D20E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 04:43:38 +0200 (CEST)
Received: from localhost ([::1]:36982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLFDV-0006Ud-A1
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 22:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLFC2-00052p-8R
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 22:42:06 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:34322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLFC0-0000Uw-41
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 22:42:05 -0400
Received: by mail-pf1-x42d.google.com with SMTP id f28so9682066pfk.1
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 19:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FqDqmrdGTnZdPd0yveRC5RstC2a7Mqf3VOvFn7icu/s=;
 b=zRNR3ViMHAiistP2k3sS6yAoUGSXFFkwZR4TsOIBWDSu7/Hwd819a2kLX6bHscsgq4
 KKErUvh0+hDntbRt/Z5Sz4qX09k6NhYhn9ikE1fioId89CqS3K3hN9MpvtLz5wwESipl
 5Xo/EER5jbQw2LSqV9GP4XG3c2MNvir2q/0UyKpfPfUTPGNrhW2pjgtUlCjl7TLm2FaZ
 P8Hwq1HeWXCuJfcyAqGT1L9wTtyiqzdCUsPYl1Db7ZtGtMk7N7L2PCHRR69f+1ylTUQU
 oWdVTbNzV7TVRxIfNEQV+4SGPFZXZn2g5OEBU3mn7WnE9m/QLFDzD66W7sKPeNn8mFkX
 vHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FqDqmrdGTnZdPd0yveRC5RstC2a7Mqf3VOvFn7icu/s=;
 b=BJlOq2N8EXbaeITyzXMqPTOvR7kTTgfLFynWFk2hRKM6fyKrtvkw1b86E8u70kLItz
 2ZP6n44gFenG/3qDMiWbhz+8a/7tPGG/bOCprYcFyuoh2HMVJhdR4yEp2pCYSwRIYB4k
 7Q6za1I3pqK/S4dIfd+DPUQHE9WwGvnnMXgClOAFWnPt0ZjCbykizHRMVz3DJR5UYzbG
 trrflsSpD+5/9opMF8JlSCI5EwhJdSTqxJv6MQuc7azmFG7b27/tQeOokwmo0Lr2ZmMW
 3nlmXDyDjz7Nn1lcBD9ZBTJCoJyXiSNzz7++FPw/mX/4GoA2Fjaf9lPeCypd6Xoyp0aX
 5ZWg==
X-Gm-Message-State: ACgBeo0H84msrs2FNOpIcQ+gpJsRcpvLB6asuenmsFGlZuIXFWTKRlz6
 hn+6XhL2HEXeSDyKf4jc2QMAxg==
X-Google-Smtp-Source: AA6agR5uYX2g8woAxJxXdbm2LS+XQc5rzE+2gZscHa3JHZ2JQ6j/7+RI3bXdUJOLz+0HZpjEXr1VXA==
X-Received: by 2002:a63:6a46:0:b0:41a:3e67:67cd with SMTP id
 f67-20020a636a46000000b0041a3e6767cdmr17978636pgc.94.1660012922009; 
 Mon, 08 Aug 2022 19:42:02 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:8c1b:1e6f:caf3:a217?
 ([2602:ae:154e:e201:8c1b:1e6f:caf3:a217])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a170902e80c00b0015e8d4eb26esm9575711plg.184.2022.08.08.19.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 19:42:01 -0700 (PDT)
Message-ID: <246489c0-be91-1834-ba30-21c067f65808@linaro.org>
Date: Mon, 8 Aug 2022 19:41:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/3] MIPS/SPARC patches for 2022-08-09
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20220808223312.53720-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220808223312.53720-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/8/22 15:33, Philippe Mathieu-Daudé via wrote:
> The following changes since commit 8a1337e60400ef54432e063164faf5043a55555d:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-08-08 09:57:37 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git tags/mips-20220809
> 
> for you to fetch changes up to 09d12c81ec5d8dc9208e5739d17a56c34be96247:
> 
>    hw/misc/grlib_ahb_apb_pnp: Support 8 and 16 bit accesses (2022-08-08 23:43:11 +0200)
> 
> ----------------------------------------------------------------
> MIPS/SPARC patches queue
> 
> - target/mips: Handle lock_user failure in UHI_plog semihosting (Peter Maydell)
> - hw/mips/malta: Turn off x86 specific features of PIIX4 PM (Igor Mammedov)
> - hw/misc/grlib_ahb_apb_pnp: Support 8 and 16 bit accesses (Peter Maydell)

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Igor Mammedov (1):
>    hw/mips/malta: turn off x86 specific features of PIIX4_PM
> 
> Peter Maydell (2):
>    target/mips: Handle lock_user() failure in UHI_plog semihosting call
>    hw/misc/grlib_ahb_apb_pnp: Support 8 and 16 bit accesses
> 
>   hw/mips/malta.c                    |  9 +++++++++
>   hw/misc/grlib_ahb_apb_pnp.c        | 10 ++++++----
>   hw/misc/trace-events               |  4 ++--
>   target/mips/tcg/sysemu/mips-semi.c |  3 +++
>   4 files changed, 20 insertions(+), 6 deletions(-)
> 


