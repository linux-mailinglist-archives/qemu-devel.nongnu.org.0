Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9C22D8E20
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 16:07:34 +0100 (CET)
Received: from localhost ([::1]:44838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koSyD-0002QZ-8K
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 10:07:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koSwH-0001LC-0l
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 10:05:33 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koSwE-00050G-7s
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 10:05:32 -0500
Received: by mail-wr1-x441.google.com with SMTP id w5so10138373wrm.11
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 07:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n1hpv7apuzlGt2dfFEifwvZwbTxtQ+ndnmTuXA0JC78=;
 b=EXNQ5cs67LCnSSFCAg4XOgXlBL5T6zGdZuW9zt4JCt9X3gKd600aL1NaWXCGcy9x6t
 3tbAJAxgQ2gsWgttdNPMkB4WsKFZQMY3KuHVAvX57suStP++uOMT6fn+GRf9p0ZUFg71
 B9sDa8Wpyuwg6uQRevsZqekfmMaMmjv859kugpe8Dacv0rvHSkQhJm8YHiRB5IOI8E5i
 f8+5hB4pOX+bDr98YuujCbrCy8OmywYHohPPw10mR/ICFevuoAiI1f+lg4kJg3NN+f63
 903MDC1XNzy3fL46rCdQ+d84Qx+N0aZ0NdEFd91tNGmosWt9LSiAN2+lrL5eXVRHbHXQ
 /42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n1hpv7apuzlGt2dfFEifwvZwbTxtQ+ndnmTuXA0JC78=;
 b=T8hSAP3X3g1TdKvDX6A61YZV2lgLH72D9uJ9sC1mII+bt66uqjmN588jBrUNv6rk2X
 bYjFmhR1u2aM49nGwqSugg7BoRHXQeQqt8HL0xzaHk33pFMOHZkxnW92UOYkQdY8r/bU
 kSeQ89o0N+6N02eS7ylPm5N9/pC6nPzIxr9lH+6A3N7ooWXEv2kfH6epA+LZMT6wMriu
 AMUWqO5tHcooo4aYBa7lINNmJSiUTI6NMwHqvGwabSxwgmJtSFEYGM5aZecDTuFjLCEU
 sZT9M2HTGnVD1IIEtvHZP7YhPtBxrLdRCcYkmPdf6pgHyx4Y9Jdu0bbr9Xtx9PVL4eSB
 RE2Q==
X-Gm-Message-State: AOAM5308WhxwuLkpjKTV5BWdwfzdfU5He/DXwSCMeCkaHWgXzYzntoXq
 UuSyt4B3i59KosERpQvJoII=
X-Google-Smtp-Source: ABdhPJxHLQyht6sjRaqQ3FmBoD7DYEYXvPSS8RLJBhHtWOguIO4E44aL05uM/HHmFIG5CARV2Cx0Uw==
X-Received: by 2002:a05:6000:101:: with SMTP id
 o1mr24190080wrx.211.1607871928696; 
 Sun, 13 Dec 2020 07:05:28 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id z15sm28195341wrv.67.2020.12.13.07.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 07:05:27 -0800 (PST)
Subject: Re: [PATCH 0/2] target/mips: Let cpu_supports_isa() take CPUMIPSState
 argument
To: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20201207215257.4004222-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a444475c-b898-2670-4e95-2a47e267249b@amsat.org>
Date: Sun, 13 Dec 2020 16:05:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201207215257.4004222-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 10:52 PM, Philippe Mathieu-Daudé wrote:
> Hi Jiaxun,
> 
> Here goes the cpu_supports_isa() helper for your bootloader API:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg764582.html
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (2):
>   target/mips: Rename cpu_supports_FEAT() as cpu_type_supports_FEAT()
>   target/mips: Introduce cpu_supports_isa() taking CPUMIPSState argument
> 
>  target/mips/cpu.h       | 5 +++--
>  hw/mips/boston.c        | 4 ++--
>  hw/mips/malta.c         | 4 ++--
>  target/mips/cpu.c       | 5 +++++
>  target/mips/translate.c | 4 ++--
>  5 files changed, 14 insertions(+), 8 deletions(-)

Thanks, series applied to mips-next tree.

