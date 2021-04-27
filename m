Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACD336C6A2
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 15:02:25 +0200 (CEST)
Received: from localhost ([::1]:50514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbNM8-0005hW-Dm
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 09:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbNIj-0004ZA-9i; Tue, 27 Apr 2021 08:58:53 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbNIh-0001BD-Rg; Tue, 27 Apr 2021 08:58:53 -0400
Received: by mail-wr1-x42b.google.com with SMTP id h15so7124914wre.11;
 Tue, 27 Apr 2021 05:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7lHlJyLio7ufel2C2saCOuJrLaOyuncjS5LK3PkOxZI=;
 b=NEvkP3Ga6NnF/ddEt1ewWscvp6I70Q5+Q7CfUcS6dSVc/HTCfmjIuS3AH3yZVbhJv3
 bPMPWXZ+crxNAbPG5PN/rfy0qywLv+jeVIx1B0LP1RxP0R7BMZm1m116erVH5rGnVXHn
 97TNHHO2EPm5OuAG23de+TwVGm9vrpS+u8T9A7u+/hYeSZAhhlM5JnVnf7mhuH68gKSi
 zrPOWaSri/Dl2eyVtcAhgMI56apQgE3yodxDsKPdwjfDpYPYMRe5R7L224H5+HVVSL95
 qTKG2bAStq3dOSBQIKlBQzZIpneVp+mzjJsXATYcKZ1v7A0T/RmowHGbxPEIwPJr6elj
 kkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7lHlJyLio7ufel2C2saCOuJrLaOyuncjS5LK3PkOxZI=;
 b=VlhzPB/MsPFNzLiosDOKs8VOyzUlSwKgSOEnzlUExQOtKwdL48uvzSfJUx/qExMLLT
 ZZ85VuZjw9+ZKxfEnEcEBEUaKqBi60RhsIvfCiV/8Kn7uF8oNPXcZHBZuJq2uSYZD5r9
 cBJy7SnNeBvqnfa3IqqLwmv00usyjiXmFt1oJXk9rqOfj27vfZ9uIlk/Y6Q8XEqQLoot
 Sqd3RSRfj3OYCangeZ+6oBFAw2si0CWH9G23PQhdlrno2crwx8tM1o74m3cwhGc/E8JG
 wOnAygWM9R/0SiOAGoQB9p3WUMIri3Zx4s5dIy/HkUiYAQsXQawO7USM0xgCEGHOdqOD
 2obA==
X-Gm-Message-State: AOAM533zmbnAr/CTZGyZwHQyK2nGgQF/3sCY7Om2Kvwx2JJzkj8TBAoH
 VJXJe05tOHriD6EPgJq4o10=
X-Google-Smtp-Source: ABdhPJyvSDxLJ5atBIevUaA5UN6PdFUaP3I6TMm7GPoFz4wsMc/O5mM14pb3ha0pzPrzyAIgXhwt5w==
X-Received: by 2002:adf:ead2:: with SMTP id o18mr29388726wrn.101.1619528330171; 
 Tue, 27 Apr 2021 05:58:50 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x17sm20469264wmi.46.2021.04.27.05.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 05:58:49 -0700 (PDT)
Subject: Re: [PATCH 0/6] hw/isa: Remove unuseful qemu_allocate_irqs() call
To: qemu-devel@nongnu.org
References: <20210323231358.396520-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9aea349a-4095-a06c-9125-874ef9dc5e46@amsat.org>
Date: Tue, 27 Apr 2021 14:58:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323231358.396520-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping (for series or simply patch 6).

On 3/24/21 12:13 AM, Philippe Mathieu-Daudé wrote:
> I started to fix the LeakSanitizer error in piix4_realize(),
> then looked for similar pattern and found 2 other places.
> The older is i82378 (historically the first one) which then
> spread.
> 
> Philippe Mathieu-Daudé (6):
>   hw/isa/i82378: Name output IRQ as 'intr'
>   hw/isa/i82378: Simplify removing unuseful qemu_allocate_irqs() call
>   hw/isa/i82378: Rename output IRQ variable
>   hw/isa/vt82c686: Name output IRQ as 'intr'
>   hw/isa/vt82c686: Simplify removing unuseful qemu_allocate_irqs() call
>   hw/isa/piix4: Fix leak removing unuseful qemu_allocate_irqs() call
> 
>  hw/isa/i82378.c     | 13 +++----------
>  hw/isa/piix4.c      | 10 +---------
>  hw/isa/vt82c686.c   | 12 ++----------
>  hw/mips/fuloong2e.c |  2 +-
>  hw/ppc/prep.c       |  4 ++--
>  5 files changed, 9 insertions(+), 32 deletions(-)
> 

