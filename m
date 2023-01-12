Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D807667ED7
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 20:16:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG32G-0007VO-RG; Thu, 12 Jan 2023 14:14:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pG32B-0007TB-D1; Thu, 12 Jan 2023 14:14:44 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pG329-000809-AY; Thu, 12 Jan 2023 14:14:43 -0500
Received: by mail-oi1-x22b.google.com with SMTP id h185so16073876oif.5;
 Thu, 12 Jan 2023 11:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NsOBWIJteC0VRYZtDbjr5jj3gIxlOseLxW6/1XxZLe0=;
 b=eNPG6S5fUjVw+Ey08QFTQkOynPTzVj+KWmMnw69e3fHXBA7HCzsbBwjbTPJfIZ7Kb/
 gX70piwIMpzm/h3nFNeOQkp4yHwCTinh59sNUMy8hde6dVNtyK+41cd/BB0LZiT4iJiU
 cjbUwdN8VFXclu2NH/V+oGaJ4GsKnS3nJw5yQyGfmVVJ+N6C8w6B9Wr2bvqE8G9vBUG0
 gZ+E2Pa6VTBu3zca6Zp1EuIBuEsg2Owv1cQmuBG1/tNsObhFL/jeXuQE3gdcdI9IvPjT
 n4o/6CxtuTAC1up/zZXQcv297Q7bpaWQ/42sa/ftnmb3kKW5Sw9Bz/mIxg7rFuyAaqw0
 yEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NsOBWIJteC0VRYZtDbjr5jj3gIxlOseLxW6/1XxZLe0=;
 b=H01C2j5b7ylr19lmWc7K/zrUKV0k0+kRPEBStX8vwDrvnYtVYt/tx/I+AtIDCHFsmH
 tIgxGMAZ+Nw7CuIqL7w36tTRlQ+6tXOL7zaGBLlbKqA5U4YcGiBwEsi2x7+cWe9E3b4X
 1BTooZ2IyYXoFAOOPJJkvniX94qTe77An4Ux6/TPwDIcCjUUvbJtRsArNFl2AccRNolG
 NMXbUAmp2DWLKFXkMvhvMke15KRVWS9TY24jf2jqeciXYx5yoNutDmnj+7BUa3LBeAmH
 xhaF3fxFGNqwnf9DaGAMfG0XZ0kFvJWHPZC846XRfdO4UXOS0o3kcmD2SPRhfL6iYJzH
 oqtQ==
X-Gm-Message-State: AFqh2kpljASjzlonaDWI4RzJ5zqFA3OWISfnCudUZtxnf5xfOmOhKRve
 My1dhZ5WXaGsQXKzTWINqjw=
X-Google-Smtp-Source: AMrXdXuSM6vAPiDC3hYPl1UXoJfs7PQQsJthqXYogK1JY80jp3kRsns6XlEKhceAuNUVrXtTT2wd0Q==
X-Received: by 2002:a05:6808:8e4:b0:363:8f75:a1bc with SMTP id
 d4-20020a05680808e400b003638f75a1bcmr23328385oic.15.1673550879738; 
 Thu, 12 Jan 2023 11:14:39 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a9d6542000000b0067088ff2b45sm9381708otl.37.2023.01.12.11.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 11:14:39 -0800 (PST)
Message-ID: <3044a2d0-9e77-c936-b6e3-dfd9ad7d2c06@roeck-us.net>
Date: Thu, 12 Jan 2023 11:14:36 -0800
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x22b.google.com
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

See
https://github.com/groeck/linux-build-test/blob/master/rootfs/mips/run-qemu-mips.sh
and
https://github.com/groeck/linux-build-test/blob/master/rootfs/mipsel/run-qemu-mipsel.sh

I'll apply the change suggested above to my version of qemu (7.2.0)
and give it a try.

Guenter


