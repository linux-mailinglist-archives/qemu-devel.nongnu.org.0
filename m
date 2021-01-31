Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655B6309C4F
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 14:22:10 +0100 (CET)
Received: from localhost ([::1]:41480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Cg5-0003dU-03
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 08:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6CdW-0002o5-HO; Sun, 31 Jan 2021 08:19:30 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:56225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6CdT-0007wn-Ub; Sun, 31 Jan 2021 08:19:29 -0500
Received: by mail-wm1-x332.google.com with SMTP id f16so10353789wmq.5;
 Sun, 31 Jan 2021 05:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZWVjQmOzOo31gjwOed15eO6KmnxJ4qYWXIj7LLayrKs=;
 b=W/pXgnGjXVmVJ1Ovv9LKb66UxdvloCeXPt29gEVL7ZxIQpyMbcRgZ44EBO3PR7LH9d
 wBzyub/L3X+V6VX90yM++kTXysHMiZhA/1kiua/5z8yFhB37HEwiXG3lIoQqWkOralgw
 CxfHemUBD9jNbBpdd59m793Y1IR+3cS+FU2kFE7Vpvw1q5VtCoqTFhbaEeG8iI21R8DF
 05LCybsH9r/CtlS18DlIMFb5TWUERE8UEcjDn0W3K80qva/IgibgOPKCTvBB43xrbXgO
 IkV8R3piXuqvBoBpUF35NbT7ohuCJSAnuHZGBe/YBz5l32q0d4TS8GHODNWl1rU6pP9G
 iwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZWVjQmOzOo31gjwOed15eO6KmnxJ4qYWXIj7LLayrKs=;
 b=n+KP1dC0sHdP0kXBfXAF9ZCSWlb2x6vHjSsPWssy9jsQnHu0PiZ5tC9285afEh3CSp
 esFiXiATNmIG9XykGUZvaKon8PZA1zvuKUQ5dh3KBDP5vFSU6CRhcEXn1ZuhZylisEab
 A/3GUstvRJ0v0WuAAvK85//xPcyONUKW9aPkRR07sT5C8DLaeQGogzzgSNoCM0oN9ujG
 FvY573NdhsuXMlUjoWZqLYqrcJtScoVohYAsD6TK0oRjWeuW6deQDQgkfEA9yCQFqpJS
 I9btGH7ZcbXDUAlHtes7EIfDcWYmQhzDth4JvXhz+VRNyAv7vPE+gTgfZi9h3iCcAtKh
 NyJg==
X-Gm-Message-State: AOAM531iyS1OXkcVxgiQOpmpelp68ApEdq6VflkVXx6x6guGQeStZWW7
 fOePuaXCNJPpFPMKlrCnJe0=
X-Google-Smtp-Source: ABdhPJxlW3yTFwDLkdBa32CdmyF4M0bmTzYYm4ZlUdTVIE4Pv5cNIJtQCCtFDFb7I2ceoB1iZiVZFg==
X-Received: by 2002:a1c:29c6:: with SMTP id
 p189mr11264364wmp.110.1612099164914; 
 Sun, 31 Jan 2021 05:19:24 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id h207sm15947682wme.18.2021.01.31.05.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 05:19:23 -0800 (PST)
Subject: Re: [PATCH] hw/intc/arm_gic: Fix interrupt ID in GICD_SGIR register
To: P J P <ppandit@redhat.com>, QEMU Security <qemu-security@nongnu.org>
References: <20210131103401.217160-1-f4bug@amsat.org>
 <3a94e327-0454-bf43-552a-1c84407e1d7d@amsat.org>
 <20p82p5p-ns25-n434-37os-n55013s6313@erqung.pbz>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6d29aa57-2e6e-e81d-831f-803d9aae798f@amsat.org>
Date: Sun, 31 Jan 2021 14:19:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20p82p5p-ns25-n434-37os-n55013s6313@erqung.pbz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.079,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Bulekov <alxndr@bu.edu>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Li Qiang <liq3ea@gmail.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forwarding to qemu-security@ to see if this issue is worth a CVE.

On 1/31/21 12:57 PM, P J P wrote:
> +-- On Sun, 31 Jan 2021, Philippe Mathieu-Daudé wrote --+
> | On 1/31/21 11:34 AM, Philippe Mathieu-Daudé wrote:
> | > Per the ARM Generic Interrupt Controller Architecture specification
> | > (document "ARM IHI 0048B.b (ID072613)"), the SGIINTID field is 4 bit,
> | > not 10:
> | > 
> | >     - Table 4-21 GICD_SGIR bit assignments
> | > 
> | >     The Interrupt ID of the SGI to forward to the specified CPU
> | >     interfaces. The value of this field is the Interrupt ID, in
> | >     the range 0-15, for example a value of 0b0011 specifies
> | >     Interrupt ID 3.
> | > 
> | > diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> | > index af41e2fb448..75316329516 100644
> | > --- a/hw/intc/arm_gic.c
> | > +++ b/hw/intc/arm_gic.c
> | > @@ -1476,7 +1476,7 @@ static void gic_dist_writel(void *opaque, hwaddr offset,
> | >          int target_cpu;
> | >  
> | >          cpu = gic_get_current_cpu(s);
> | > -        irq = value & 0x3ff;
> | > +        irq = value & 0xf;
> | >          switch ((value >> 24) & 3) {
> | >          case 0:
> | >              mask = (value >> 16) & ALL_CPU_MASK;
> | > 
> 
> * Looks okay.
> 
> 
> | > Correct the irq mask to fix an undefined behavior (which eventually
> | > lead to a heap-buffer-overflow, see [Buglink]):
> | > 
> | >    $ echo 'writel 0x8000f00 0xff4affb0' | qemu-system-aarch64 -M virt,accel=qtest -qtest stdio
> | >    [I 1612088147.116987] OPENED
> | >   [R +0.278293] writel 0x8000f00 0xff4affb0
> | >   ../hw/intc/arm_gic.c:1498:13: runtime error: index 944 out of bounds for type 'uint8_t [16][8]'
> | >   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/intc/arm_gic.c:1498:13
> | > 
> | > Cc: qemu-stable@nongnu.org
> | > Fixes: 9ee6e8bb853 ("ARMv7 support.")
> | > Buglink: https://bugs.launchpad.net/qemu/+bug/1913916
> | > Buglink: https://bugs.launchpad.net/qemu/+bug/1913917
> | 
> | > ---
> | > Isnt it worth a CVE to help distributions track backports?
> | > ---
> 
> * Please send such report(s) to 'qemu-security' list to be triaged as 
>   potential security ones.
> 
> 
> Thank you.
> --
> Prasad J Pandit / Red Hat Product Security Team
> 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
> 

