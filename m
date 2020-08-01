Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E732235381
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Aug 2020 18:52:50 +0200 (CEST)
Received: from localhost ([::1]:32924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1ukb-0003mb-9u
	for lists+qemu-devel@lfdr.de; Sat, 01 Aug 2020 12:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1k1ufL-00031b-Ci
 for qemu-devel@nongnu.org; Sat, 01 Aug 2020 12:47:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1k1ufJ-0004sn-De
 for qemu-devel@nongnu.org; Sat, 01 Aug 2020 12:47:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 25ECA4000B;
 Sat,  1 Aug 2020 19:47:11 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id 478A2C3;
 Sat,  1 Aug 2020 19:47:12 +0300 (MSK)
Subject: Re: [PATCH v2 0/4] target-hppa fixes
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
References: <20200801131357.17379-1-deller@gmx.de>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <21ec077f-b3aa-b755-7191-fc12985714bc@msgid.tls.msk.ru>
Date: Sat, 1 Aug 2020 19:47:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200801131357.17379-1-deller@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/01 12:47:11
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
Cc: Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

01.08.2020 16:13, Helge Deller wrote:
> A few late fixes for target-hppa:
> 
> * Fix the SeaBIOS-hppa firmware build with gcc-10 on Debian

It looks like you forgot the above change somehow.  And me too,
I forgot to send you a proper [PATCH] for this.  This is what
I use in Debian:

From: Michael Tokarev <mjt@tls.msk.ru>
Subject: seabios-hppa: add -fno-ipa-sra to the compiler flags
Date: Wed, 22 Jul 2020 22:15:46 +0300

This allows seabios-hppa to build with gcc-10. Or else the
compiler generates eg memset.isra.0 symbols instead of memset,
and the final link step fails due to missing memset.

Previous versions of gcc, for quite some time already, recognizes
this option but it does nothing since apparently no-ipa-sra is the
default. So there's no harm in adding it unconditionally, it seems.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

index c0d5d958..1b7757e8 100644
--- a/Makefile.parisc
+++ b/Makefile.parisc
@@ -76 +76 @@ COMMONCFLAGS := -I$(OUT) -Isrc -Ivgasrc -Os -MD -g \
-    -fno-builtin-printf
+    -fno-builtin-printf -fno-ipa-sra


This should not be required for the actual binary once it is built,
however.

Thanks,

/mjt

