Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECA42262FA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 17:08:41 +0200 (CEST)
Received: from localhost ([::1]:50016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxXPD-0007RF-SW
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 11:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1jxXJD-0003eh-42
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 11:02:27 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1jxXJB-0001Dv-6U
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 11:02:26 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id AFBC740547;
 Mon, 20 Jul 2020 18:02:22 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id BA0B975;
 Mon, 20 Jul 2020 18:02:21 +0300 (MSK)
Subject: Re: another invalid memory access, now xen: acpi-cnt
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <8f1da289-56be-912d-597e-d0fa3c953894@msgid.tls.msk.ru>
Message-ID: <e13238f7-50ff-9349-9e52-c325b1a06ec1@msgid.tls.msk.ru>
Date: Mon, 20 Jul 2020 18:02:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8f1da289-56be-912d-597e-d0fa3c953894@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 10:57:00
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

20.07.2020 17:56, Michael Tokarev wrote:
> See https://bugs.launchpad.net/qemu/+bug/1886318 , in particular
> the #13 in there (the patch) - I applied this to qemu which crashes
> after revert-memory-accept-mismatching-sizes-in-memory_region_access_valid-CVE-2020-13754.patch
> when run as the device model for Xen HVM domU.  Here's the output:
> 
> invalid size: acpi-cnt addr 0 size: 1
> invalid size: acpi-cnt addr 0 size: 1
> 
> after this it just dies.
> 
> This is another incarnation of LP#1886318 .
> What can we do here?

This fixes it:

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 45cbed49abd..2cfb9bdc177 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -602,7 +602,8 @@ static void acpi_pm_cnt_write(void *opaque, hwaddr addr, uint64_t val,
 static const MemoryRegionOps acpi_pm_cnt_ops = {
     .read = acpi_pm_cnt_read,
     .write = acpi_pm_cnt_write,
-    .valid.min_access_size = 2,
+    .impl.min_access_size = 2,
+    .valid.min_access_size = 1,
     .valid.max_access_size = 2,
     .endianness = DEVICE_LITTLE_ENDIAN,
 };

But this time it's qemu itself - apparently - who tries to access this register.

/mjt

