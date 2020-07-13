Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5645121D092
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 09:44:09 +0200 (CEST)
Received: from localhost ([::1]:49718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jut8C-0003QZ-4A
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 03:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1jut7V-00031w-2j
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 03:43:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1jut7S-0000wg-QN
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 03:43:24 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 96D2640462;
 Mon, 13 Jul 2020 10:43:19 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id 985B8AE;
 Mon, 13 Jul 2020 10:43:19 +0300 (MSK)
Subject: Re: [PATCH] Allow acpi-tmr size=2
From: Michael Tokarev <mjt@tls.msk.ru>
To: Simon John <github@the-jedi.co.uk>, qemu-devel@nongnu.org
References: <5f12377f-b640-c4c5-1bcd-858c622c6c31@the-jedi.co.uk>
 <4a5cfe21-d370-8ebf-b905-c37d39b68353@msgid.tls.msk.ru>
Message-ID: <33bd2c28-8671-a552-61b2-08f5cd1c082d@msgid.tls.msk.ru>
Date: Mon, 13 Jul 2020 10:43:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4a5cfe21-d370-8ebf-b905-c37d39b68353@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 03:20:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: imammedo@redhat.com, Gerd Hoffmann <kraxel@redhat.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

13.07.2020 10:20, Michael Tokarev пишет:
> 12.07.2020 15:00, Simon John wrote:
>> macos guests no longer boot after commit 5d971f9e672507210e77d020d89e0e89165c8fc9
>>
>> acpi-tmr needs 2 byte memory accesses, so breaks as that commit only allows 4 bytes.
>>
>> Fixes: 5d971f9e672507210e7 (memory: Revert "memory: accept mismatching sizes in memory_region_access_valid")
>> Buglink: https://bugs.launchpad.net/qemu/+bug/1886318
> 
> Actually this fixes 77d58b1e47c8d1c661f98f12b47ab519d3561488
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Thu Nov 22 12:12:30 2012 +0100
> Subject: apci: switch timer to memory api
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> because this is the commit which put min_access_size = 4 in there
> (5d971f9e672507210e7 is just a messenger, actual error were here
> earlier but it went unnoticed).
> 
> While min_access_size=4 was most likely an error, I wonder why
> we use 1 now, while the subject says it needs 2? What real min
> size is here for ACPI PM timer?

Actually it is more twisted than that. We can't just change the size,
we must update the corresponding code too.


static uint64_t acpi_pm_tmr_read(void *opaque, hwaddr addr, unsigned width)
{
    return acpi_pm_tmr_get(opaque);
}

note the actual read function does not even know neither the requested
address nor the requested width, it assumes the min/max constraints
are enforced and the read goes to all 4 bytes. If this pm timer can
be read byte-by-byte, we should return the right byte of the value,
not always the whole value.

/mjt

