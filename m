Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E5C22A977
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jul 2020 09:18:33 +0200 (CEST)
Received: from localhost ([::1]:47732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyVUt-0008Vj-H7
	for lists+qemu-devel@lfdr.de; Thu, 23 Jul 2020 03:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1jyVE3-0005iy-Ph
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 03:01:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1jyVE0-0004K7-HI
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 03:01:07 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 3DDA240688;
 Wed, 22 Jul 2020 22:11:33 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id DCB5D9C;
 Wed, 22 Jul 2020 22:11:33 +0300 (MSK)
To: qemu-devel@nongnu.org, Helge Deller <deller@gmx.de>
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: roms/seabios-hppa can't be built with gcc-10: -fno-ipa-sra
Message-ID: <9614340c-8a36-3e2e-40db-61ac9273661e@msgid.tls.msk.ru>
Date: Wed, 22 Jul 2020 22:11:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 15:11:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NO_DNS_FOR_FROM=0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Switching to gcc-10 makes seabios-hppa unbuildable.
It fails at the final linking step with a lot of
missing references to memcpy & memcmp all over the
places.

The notable difference between gcc-10 and previous
gcc is that ccode32flat.o does _not_ have the text
for these two functions but have two .isra.0:

$ hppa-linux-gnu-nm ccode32flat.o | grep mem[sc]
000003e0 t memcmp
         U memcpy
00002f38 t memcpy.isra.0
         U memset
00003a84 t memset.isra.0


while previous version of the compiler did have them:

$ hppa-linux-gnu-nm ccode32flat.o | grep mem[sc]
000002fc t memcmp
0000370c t memcpy
0000036c t memset

After adding -fno-ipa-sra to the gcc flags, the firmware
is built successfully.

I don't know what to make out of this. Previous versions
of gcc apparently accepts -fno-ipa-sra too, for quite some
time.  So maybe add this to the flags unconditionally?

Thanks,

/mjt

