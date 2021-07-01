Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6003B981D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 23:23:28 +0200 (CEST)
Received: from localhost ([::1]:48468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz49f-0005uV-4V
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 17:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lz48D-0004fc-TQ
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:21:58 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lz48C-0000zz-5G
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:21:57 -0400
Received: by mail-wm1-x32f.google.com with SMTP id n33so5414419wms.2
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 14:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T6eXbFs/tU/LHUPFHZ+zqsk+dxBMcWkP7zJ/GSu2pQA=;
 b=Fsfaek2TStmEsH1zBqtfActATX/vC59d+HWJTolYrNdJYBdJiXSAmvSdhntWnuWRmy
 lOBnxwXtDklBtFtI7bYhPairpqqMlONvzKqgcoS5N5Yqjug0EIAuxeqCKa22UNHLC4Fb
 LjmSqDY4RDtDPRP07sjn8JNLfbIgFBSfhg4eBEOzjKmQhrQZQZd3l3pghl01X4IGtLFd
 oEGB6kQiVniRjX7dtZNR4KBtGIVVTMFYa6pQw19PcWufZIWaxnv8KFXLcRg3xw1KrOhp
 /R6iMH0eWaVQXX9btoGjit9A/5pnNfaHX5dMhtQnUyHqfreuq8KG2Ayj7eQXeiMG+FHk
 scSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T6eXbFs/tU/LHUPFHZ+zqsk+dxBMcWkP7zJ/GSu2pQA=;
 b=VZIR2/VzCCvRUCQCL4GDRT9UhGXf6OdzM7KJCAaqHo0aFKFlizgh6zquwI1YPYhebQ
 rZn5LSGiaoJl+jEWR2uUAJ+MP1q+9xKEykMw7tFukip44t18fxLRMdh4sUeEU3fXJ2e5
 Pvn0FpaNgYts4jnD2qpzRMSUiWwnaznUbyr+H3K/9VgzEplOSqpACfsWFWyKbDHHuW5q
 D2ky1dHW2OV/Pu5pLlyuN8kSKxkkiXXg3QxM59RjHp4hDQkSSUY9imqM5eoZFIadgJa6
 4cm5MXH5MZu5FhI36Xmih5da54w0PAUmNoKTRTLamdwCzYNjFD3Vx30Fa3AYFO0wLEfc
 HPsQ==
X-Gm-Message-State: AOAM531RnGcajKR/vrtYi07Tz+TSdss/NlKVi6zrZmP0qolG38AEnbO0
 RTdy0JCUy+JY6bXQBYGqIp8=
X-Google-Smtp-Source: ABdhPJwHU0x8zuCIKLXGTcfPAcaeKEyIh58UzM/1BElOsty3ktWnDndFjjMKBszNTgv7LCH4IkHDBA==
X-Received: by 2002:a05:600c:28d:: with SMTP id
 13mr7053755wmk.78.1625174513552; 
 Thu, 01 Jul 2021 14:21:53 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-151.mobile.abo.orange.fr.
 [92.184.108.151])
 by smtp.gmail.com with ESMTPSA id j18sm1025311wrw.41.2021.07.01.14.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 14:21:52 -0700 (PDT)
Subject: Re: [PATCH] hw/mips/jazz: Map the UART devices unconditionally
To: qemu-devel@nongnu.org
References: <20210629053704.2584504-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cd2c1fb2-200b-3f61-bc42-5cf24dcad751@amsat.org>
Date: Thu, 1 Jul 2021 23:21:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629053704.2584504-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/21 7:37 AM, Philippe Mathieu-Daudé wrote:
> When using the Magnum ARC firmware we can see accesses to the
> UART1 beeing rejected, because the device is not mapped:
> 
>   $ qemu-system-mips64el -M magnum -d guest_errors,unimp -bios NTPROM.RAW
>   Invalid access at addr 0x80007004, size 1, region '(null)', reason: rejected
>   Invalid access at addr 0x80007001, size 1, region '(null)', reason: rejected
>   Invalid access at addr 0x80007002, size 1, region '(null)', reason: rejected
>   Invalid access at addr 0x80007003, size 1, region '(null)', reason: rejected
>   Invalid access at addr 0x80007004, size 1, region '(null)', reason: rejected
> 
> Since both UARTs are present (soldered on the board) regardless there
> are character devices connected, map them unconditionally.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/mips/jazz.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)

Patch queued to mips-next (with Peter's corrections applied).

