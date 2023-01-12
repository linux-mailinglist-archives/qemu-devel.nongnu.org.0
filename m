Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 372F5668807
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 00:58:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG7SH-00025S-1N; Thu, 12 Jan 2023 18:57:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pG7SF-00025F-Ad; Thu, 12 Jan 2023 18:57:55 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pG7SD-00049V-FK; Thu, 12 Jan 2023 18:57:55 -0500
Received: by mail-oi1-x235.google.com with SMTP id h185so16580418oif.5;
 Thu, 12 Jan 2023 15:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=12vlNogeAjPeZ5vEuK5DcrEwh/Fjwxuilk73/GGjPfg=;
 b=NMVFE/A599F2BmvazvkAXKstwrTfcd5YqVr6z2ammKU/XWwFhhjW2BL1oZwB7fo3mS
 lzhV8DG89EWJaMUsZcuPxD+7DuWk5X4ArFf4ZxIv8Bltw94BPIZAeLiikb1Vh8EeAYwv
 3ED4vcEXvMRXExDirSDGvqiLdQHn9Z6bJ8y31nJqPiND3xf2MjBt1VT7EQiQfOH/nnSP
 e6CZXERsKTdQrryg1EIwXqNVDqFa+tmSVWg34DZ77VlPFLLBSh3KT80r8Gg/N3QV+vFt
 63cKqpGiE9lEkiHt4jg8tMqALlkRA/BI5k7DXBbfmoW1esam2MUU1P+CCcdaF60w3fDi
 Dt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=12vlNogeAjPeZ5vEuK5DcrEwh/Fjwxuilk73/GGjPfg=;
 b=w03UcDEOGnWislVIqNTYS7mwpipf4zXHGIb0IrDqfrS2PAmGhXoxWuvNwaqLj3u7ig
 3YHlp6T0ztoz+mRzXOsHQDLAtR+Zkb39QYyHHfI2buKoSZ5lH3KMG5rzs+XcBoHHFvaZ
 NUIl7U/PpKP98sqYjz2ooVNMhvsq4aTRsbD3p/BNKaL8PMyMW2ARl3B76rVqNlNqSdsD
 fuzKwN0y7g7zB1Ksf6EPmIHFuR8+/CeEo0W1BsSPt5TX4MVhl/wJxP01y/zcFfNuqQd3
 cDxZiEkwH8h6LPHbwP3pppsSSJSQl76SXw8NJzlvzP2yAzhzM0ZQ3u6I7E60wvYQhVdP
 OWoQ==
X-Gm-Message-State: AFqh2ko3Z5AgYXsDeDjLQZ1xBQ8SlfPC7ECzQZmu1y++GH5LmNB+qTWg
 1tX+ZiBUSLCRSP191RDYJPI=
X-Google-Smtp-Source: AMrXdXvkyOv9cX1CPAsyCOn4OyE7FHGXX+1a1Tj3qa6RccP7w8XcQw5nDA9BhkSU/8Dnp9lxA6w4Fg==
X-Received: by 2002:a54:4e83:0:b0:363:b918:6467 with SMTP id
 c3-20020a544e83000000b00363b9186467mr16877321oiy.10.1673567871747; 
 Thu, 12 Jan 2023 15:57:51 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 3-20020aca0f03000000b0035acd0a6eb2sm8568038oip.41.2023.01.12.15.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 15:57:50 -0800 (PST)
Message-ID: <c42afb39-db63-eeb4-3f53-e9684dca5938@roeck-us.net>
Date: Thu, 12 Jan 2023 15:57:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8A2qdbDZPicuZfL@kbusch-mbp.dhcp.thefacebook.com>
 <Y8BHUzcbdQ/SFBY9@cormorant.local>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
In-Reply-To: <Y8BHUzcbdQ/SFBY9@cormorant.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.067, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/12/23 09:45, Klaus Jensen wrote:
> On Jan 12 09:34, Keith Busch wrote:
>> On Thu, Jan 12, 2023 at 02:10:51PM +0100, Klaus Jensen wrote:
>>>
>>> The pin-based interrupt logic in hw/nvme seems sound enough to me, so I
>>> am wondering if there is something going on with the kernel driver (but
>>> I certainly do not rule out that hw/nvme is at fault here, since
>>> pin-based interrupts has also been a source of several issues in the
>>> past).
>>
>> Does it work if you change the pci_irq_assert() back to pci_irq_pulse()?
>> While probably not the "correct" thing to do, it has better results in
>> my testing.
>>
> 
> A simple s/pci_irq_assert/pci_irq_pulse broke the device. However,
> 
> 	diff --git i/hw/nvme/ctrl.c w/hw/nvme/ctrl.c
> 	index 03760ddeae8c..0fc46dcb9ec4 100644
> 	--- i/hw/nvme/ctrl.c
> 	+++ w/hw/nvme/ctrl.c
> 	@@ -477,6 +477,7 @@ static void nvme_irq_check(NvmeCtrl *n)
> 		 return;
> 	     }
> 	     if (~intms & n->irq_status) {
> 	+        pci_irq_deassert(&n->parent_obj);
> 		 pci_irq_assert(&n->parent_obj);
> 	     } else {
> 		 pci_irq_deassert(&n->parent_obj);
> 
> 
> seems to do the trick (pulse is the other way around, assert, then
> deassert).
> 
> Probably not the "correct" thing to do, but I'll take it since it seems
> to fix it. On a simple boot loop I got the timeout about 1 out of 5. I'm
> on ~20 runs now and have not encountered it.
> 
> I'll see if I can set up a mips rootfs and test that. Guenter, what MIPS
> machine/board(s) are you testing?

So, for mipsel, two sets of results for the above:

First, qemu v7.2 is already much better than qemu v7.1. With qemu v7.1,
the boot test fails roughly every other test. Failure rate with qemu v7.2
is much less.

Second, my nvme boot test with qemu 7.2 fails after ~5-10 iterations.
After the above change, I did not see a single failure in 50 boot tests.

I'll test the other suggested change next.

Guenter


