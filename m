Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569D65AE6E6
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:52:40 +0200 (CEST)
Received: from localhost ([::1]:59074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVX8B-0002W9-E0
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org>)
 id 1oVVyY-0007UY-QF
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:38:38 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:43542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org>)
 id 1oVVyW-0000gC-PJ
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:38:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 629EFB815F8;
 Tue,  6 Sep 2022 10:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4549DC433C1;
 Tue,  6 Sep 2022 10:38:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="n11uCKDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1662460686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+589JaX73rA3Fr/Ij7ofECbPNDxTX6gvt9o8oskIqXk=;
 b=n11uCKDKzvxnQLAnPevPF5jd6G7nr/VaDc/4QTMVD9y7GnVun7skmTmnt3oB0D/pNbNRLT
 kkDhHeJAAgY9a3Vulyvg8eT75uMAzn6IkDgE0HtdmORZS4zpxmAxsTZmkth8hr8V+kGz06
 0NMBdiGSTmB1FRMKZtfTdFz2FhIm9m0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id aab725e6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 6 Sep 2022 10:38:06 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v2 1/2] x86: only modify setup_data if the boot protocol
 indicates safety
Date: Tue,  6 Sep 2022 12:37:59 +0200
Message-Id: <20220906103800.285176-1-Jason@zx2c4.com>
In-Reply-To: <CAHmME9prkBV6WkbXrKWTFzZbeAsGHLZqqps3ieChj6ZF9S_v7A@mail.gmail.com>
References: <CAHmME9prkBV6WkbXrKWTFzZbeAsGHLZqqps3ieChj6ZF9S_v7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

It's only safe to modify the setup_data pointer on newer kernels where
the EFI stub loader will ignore it. So condition setting that offset on
the newer boot protocol version. While we're at it, gate this on SEV too.
This depends on the kernel commit linked below going upstream.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Link: https://lore.kernel.org/linux-efi/20220904165321.1140894-1-Jason@zx2c4.com/
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/i386/x86.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 050eedc0c8..fddc20df03 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1088,8 +1088,15 @@ void x86_load_linux(X86MachineState *x86ms,
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
     }
 
-    /* Offset 0x250 is a pointer to the first setup_data link. */
-    stq_p(header + 0x250, first_setup_data);
+    /*
+     * Only modify the header if doing so won't crash EFI boot, which is the
+     * case only for newer boot protocols, and don't do so either if SEV is
+     * enabled.
+     */
+    if (protocol >= 0x210 && !sev_enabled()) {
+        /* Offset 0x250 is a pointer to the first setup_data link. */
+        stq_p(header + 0x250, first_setup_data);
+    }
 
     /*
      * If we're starting an encrypted VM, it will be OVMF based, which uses the
-- 
2.37.3


