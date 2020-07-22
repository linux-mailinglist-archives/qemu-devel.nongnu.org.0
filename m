Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE1A2297DB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 14:06:28 +0200 (CEST)
Received: from localhost ([::1]:37228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyDVy-0000Rv-1E
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 08:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1jyDQ6-0007aN-Pc
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 08:00:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1jyDQ3-00056b-UD
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 08:00:22 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 66F3A40657;
 Wed, 22 Jul 2020 15:00:15 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id 2060B71;
 Wed, 22 Jul 2020 15:00:16 +0300 (MSK)
Subject: Re: [PATCH for-5.1] acpi: accept byte and word access to core ACPI
 registers
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200720160627.15491-1-mjt@msgid.tls.msk.ru>
 <20200722072414-mutt-send-email-mst@kernel.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <f928d1ed-d71a-c02b-bc4c-8049589aca2a@msgid.tls.msk.ru>
Date: Wed, 22 Jul 2020 15:00:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722072414-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 08:00:16
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.07.2020 14:24, Michael S. Tsirkin wrote:
> On Mon, Jul 20, 2020 at 07:06:27PM +0300, Michael Tokarev wrote:
>> All ISA registers should be accessible as bytes, words or dwords
>> (if wide enough).  Fix the access constraints for acpi-pm-evt,
>> acpi-pm-tmr & acpi-cnt registers.
>>
>> Fixes: 5d971f9e67 (memory: Revert "memory: accept mismatching sizes in memory_region_access_valid")
>> Fixes: afafe4bbe0 (apci: switch cnt to memory api)
>> Fixes: 77d58b1e47 (apci: switch timer to memory api)
>> Fixes: b5a7c024d2 (apci: switch evt to memory api)
>> Buglink: https://lore.kernel.org/xen-devel/20200630170913.123646-1-anthony.perard@citrix.com/T/
>> Buglink: https://bugs.debian.org/964793
>> BugLink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=964247
>> BugLink: https://bugs.launchpad.net/bugs/1886318
>> Reported-By: Simon John <git@the-jedi.co.uk>
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> 
> Queued, thanks!

Michael, please add Cc: stable@ for this. Many people suffered due to
this already, it's enough of that ;)

Thanks,

/mjt

