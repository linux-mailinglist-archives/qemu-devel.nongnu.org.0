Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30025C36CF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 16:15:38 +0200 (CEST)
Received: from localhost ([::1]:42692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFIwD-0008Ua-70
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 10:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36776)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iFIv6-00082I-NH
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 10:14:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iFIv5-0007XE-Dg
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 10:14:28 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35525)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iFIv5-0007WE-8E
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 10:14:27 -0400
Received: by mail-wr1-x443.google.com with SMTP id v8so15773292wrt.2
 for <qemu-devel@nongnu.org>; Tue, 01 Oct 2019 07:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=9FxYLphVXY4uST+nxeWKafzobQ3LpK2O54/JNRyeh/U=;
 b=fdCv/Q/dTLgezGEhIPLvhVJlLd9+DpFU6sk0HKZYpk8TKeeCZ4pDSuhTnNphjuQPaI
 ZQNLK7MaiEq303/2SO/a8Jl2l+cmB9yDAugNbcDCbdZ6zJ+3CuFmuNC9SBN8Ii94/VHM
 aUig1EUAvWNVXICxl5bdxvoYoYqLSdsUtGm1LH/hwGeq4K5/2quT4RegL+DLzsmssIZC
 fNCNmze4DOZH8ZFxqHYsiuIkkTXJWuG0lFiD6B39iLKuO+Bb4h5fT5KZxtm3uXYtQU6f
 6ly+5sGke04tu4/92WJYmk23Z0DVxURRRGpsxioLtai9AbRbB+Kbffv99R+j3ckDHpFL
 89HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=9FxYLphVXY4uST+nxeWKafzobQ3LpK2O54/JNRyeh/U=;
 b=k+aw6t4HdSkhiTPd6Snw8VvDahKtPEZd5S/WA2dBS63/Ybhkr7KNHrWBn0ZixoTS+n
 UUdy/DsVopAGiFPZu/5qcfq+Z/JK13R+z649x4J1C1v+vRT1yAY1mi5qZL5NFtORFbal
 kIGuvsXpa+w0c5s2QBKYtavpnwryLwV5EArHoiElXwOwTF167P62h/7HMgtKU/LbIGb+
 Y6NLXk2S8kECzOz7DHCqzXRnVBA46qW5SsnfflzPwpXIXIRnXXSdXkngaVagOZD0hs7h
 gF8Gjf59yl9fQynsfKLwRasbbHS3tiAu+8ngQT/5rJbcR0IteAByn6/iqvt8+Z7e7qe+
 HYBA==
X-Gm-Message-State: APjAAAVp4VgoJJkcudLV642vKII3G/S4s7fg+2yv/QaWuxi2xI4VvHiS
 UNmZPCTonSIR8epZlyU1f4Pnj8Bv
X-Google-Smtp-Source: APXvYqzSPwv8F2Zg9b1wO5PHkvp3DttgQ6kUJxXijqcqr4zxacsIAyRlMNmpOR1Hrw+0rCzxCOZRnw==
X-Received: by 2002:adf:f00d:: with SMTP id j13mr2429087wro.140.1569939265725; 
 Tue, 01 Oct 2019 07:14:25 -0700 (PDT)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id g185sm4003903wme.10.2019.10.01.07.14.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Oct 2019 07:14:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/docker: only enable ubsan for test-clang
Date: Tue,  1 Oct 2019 16:14:24 +0200
Message-Id: <1569939264-12539-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: alex.bennee@linaro.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

-fsanitize=undefined is not the same thing as --enable-sanitizers.  After
commit 47c823e ("tests/docker: add sanitizers back to clang build", 2019-09-11)
test-clang is almost duplicating the asan (test-debug) test, so
partly revert commit 47c823e5b while leaving ubsan enabled.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/test-clang | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/docker/test-clang b/tests/docker/test-clang
index db9e697..8c51ead 100755
--- a/tests/docker/test-clang
+++ b/tests/docker/test-clang
@@ -17,7 +17,9 @@ requires clang
 
 cd "$BUILD_DIR"
 
-OPTS="--cxx=clang++ --cc=clang --host-cc=clang --enable-sanitizers"
+OPTS="--cxx=clang++ --cc=clang --host-cc=clang"
+OPTS="$OPTS --extra-cflags=-fsanitize=undefined \
+    --extra-cflags=-fno-sanitize=float-divide-by-zero"
 build_qemu $OPTS
 check_qemu
 install_qemu
-- 
1.8.3.1


