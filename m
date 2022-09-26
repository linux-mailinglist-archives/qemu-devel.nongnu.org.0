Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63565EA523
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 13:58:59 +0200 (CEST)
Received: from localhost ([::1]:47014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocmlG-0004up-I4
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 07:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org>)
 id 1ocmSL-0006Jj-4y
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 07:39:31 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:42332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org>)
 id 1ocmSI-0003Ch-Hv
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 07:39:24 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6BE1BB80757;
 Mon, 26 Sep 2022 11:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF6FC433D7;
 Mon, 26 Sep 2022 11:39:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ocwElm7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664192349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/OaZBhlRIR9fYa/RVTcT+Hf8OTMyveUC57VEgu/MCqE=;
 b=ocwElm7B7cHETLZnQ5X+HgTtoeHMD4++KVVWDg1ouR2VJrCDxFlPD4Pn9Um2ZLnaKkMLEn
 e+yKSZB2OMCOe9Q1txasGQrxchFxfxL2zlpHxIxEhb5gz0o11vjOkVjaIG83/kFKv720GL
 JvcPXbkn1p5DQqweqD6suqXzEpfa0hc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a3e50d8a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 26 Sep 2022 11:39:09 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-m68k@lists.linux-m68k.org,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH qemu v2 2/2] m68k: align bootinfo strings and data to 4 bytes
Date: Mon, 26 Sep 2022 13:39:00 +0200
Message-Id: <20220926113900.1256630-2-Jason@zx2c4.com>
In-Reply-To: <20220926113900.1256630-1-Jason@zx2c4.com>
References: <20220926113900.1256630-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=WzR3=Z5=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Various tools, such as kexec-tools and m68k-bootinfo, expect each
bootinfo entry to be aligned to 4 bytes, not 2 bytes. So adjust the
padding to fill this out as such.

Also, break apart the padding additions from the other field length
additions, so that it's more clear why these magic numbers are being
added, and comment them too.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/m68k/bootinfo.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/m68k/bootinfo.h b/hw/m68k/bootinfo.h
index bd8b212fd3..897162b818 100644
--- a/hw/m68k/bootinfo.h
+++ b/hw/m68k/bootinfo.h
@@ -48,13 +48,14 @@
         stw_phys(as, base, id); \
         base += 2; \
         stw_phys(as, base, \
-                 (sizeof(struct bi_record) + strlen(string) + 2) & ~1); \
+                 (sizeof(struct bi_record) + strlen(string) + \
+                  1 /* null termination */ + 3 /* padding */) & ~3); \
         base += 2; \
         for (i = 0; string[i]; i++) { \
             stb_phys(as, base++, string[i]); \
         } \
         stb_phys(as, base++, 0); \
-        base = (base + 1) & ~1; \
+        base = (base + 3) & ~3; \
     } while (0)
 
 #define BOOTINFODATA(as, base, id, data, len) \
@@ -63,13 +64,14 @@
         stw_phys(as, base, id); \
         base += 2; \
         stw_phys(as, base, \
-                 (sizeof(struct bi_record) + len + 3) & ~1); \
+                 (sizeof(struct bi_record) + len + \
+                  2 /* length field */ + 3 /* padding */) & ~3); \
         base += 2; \
         stw_phys(as, base, len); \
         base += 2; \
         for (i = 0; i < len; ++i) { \
             stb_phys(as, base++, data[i]); \
         } \
-        base = (base + 1) & ~1; \
+        base = (base + 3) & ~3; \
     } while (0)
 #endif
-- 
2.37.3


