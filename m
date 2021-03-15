Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C193B33C970
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 23:32:37 +0100 (CET)
Received: from localhost ([::1]:51794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLvlM-0007VK-5V
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 18:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@13thmonkey.org>)
 id 1lLvgU-0006ei-Oa
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 18:27:34 -0400
Received: from 13thmonkey.org ([80.100.255.32]:59132
 helo=dropje.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@13thmonkey.org>) id 1lLvgS-0007sB-CS
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 18:27:34 -0400
Received: by dropje.13thmonkey.org (Postfix, from userid 103)
 id B9ECDC1EE9A; Mon, 15 Mar 2021 23:27:29 +0100 (CET)
Date: Mon, 15 Mar 2021 23:27:29 +0100
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <YE/fUQRiFBfrWi5W@dropje.13thmonkey.org>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
 <20210315185302.29b0d90d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210315185302.29b0d90d@redhat.com>
Received-SPF: pass client-ip=80.100.255.32;
 envelope-from=reinoud@13thmonkey.org; helo=dropje.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 06:53:02PM +0100, Igor Mammedov wrote:
> Windows 10 1607x64 boots fine when I test it with default machine.
> 
> So
>   1) can you provide full QEMU command line used
>   2) What Windows build do you use
>   3) is it existing guest image (i.e. installed in older QEMU version)

I've used:

qemu-system-x86_64 -m 4G -smp cores=2 -accel nvmm \
	-snapshot \
	-drive file=/home/reinoud/Downloads/Win10-demo.raw,format=raw \
	-rtc base=localtime,clock=host \
	-spice port=5924,disable-ticketing=on \
	-vga qxl \
	-usb -device usb-tablet \
	-net nic -net tap,ifname=tap0,script=no &

If I add in '-M pc-i440fx-5.2' it works again with the accelerator. If I add
in '-M q35' it does work fine with or without the accelerator.

Surprisingly without accelerator ie with tcg the default machine does seem to
get to the login prompt. Is the ACPI data tailored to indicate an
accelerator/VM or is it static? Could it be that the CPU reported by my
machine is causing the issue? With the NVMM accelerator it passes on the hosts
CPU:

cpu0: "Intel(R) Celeron(R) 2957U @ 1.40GHz"
cpu0: Intel 4th gen Core, Xeon E3-12xx v3 (Haswell) (686-class), 1396.77 MHz
cpu0: family 0x6 model 0x45 stepping 0x1 (id 0x40651)

Running with NVMM gives the following warnings that might be relevant though
doesn't seem to bother the BSDs nor Linux last time I tried and Google tells
me they are power saving related MSRs:

qemu-system-x86_64: NVMM: Unexpected RDMSR 0x611, ignored
qemu-system-x86_64: NVMM: Unexpected RDMSR 0x641, ignored
qemu-system-x86_64: NVMM: Unexpected RDMSR 0x606, ignored
qemu-system-x86_64: NVMM: Unexpected RDMSR 0x606, ignored
qemu-system-x86_64: NVMM: Unexpected RDMSR 0x641, ignored
qemu-system-x86_64: NVMM: Unexpected RDMSR 0x611, ignored

I am not sure if that makes ACPI take a different route or not.

The Windows used is
	Windows 10 Enterprise Evaluation
	Build 17763.rs5_release.180914-1434
	version 1809

The image file was downloaded pre-installed from Microsoft for Edge browser
evaluation. I used it first on Qemu 5.1 IIRC and it kept working in Qemu 5.2.

The NVMM accelerator was presented here before but is not yet committed. Its
API/construction is similar to WHPX.

As for the cause, I don't know; q35-6.0 works so why isn't pc-i440fx-6.0 ?

With regards,
Reinoud


