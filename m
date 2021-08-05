Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA323E1C41
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 21:16:13 +0200 (CEST)
Received: from localhost ([::1]:38610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBiqh-0000aI-P3
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 15:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1mBipJ-0007c0-4M
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:14:45 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1mBipH-0004Td-Ki
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:14:44 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z4so7918370wrv.11
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 12:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KHqPM+kMUaBWQ8uLjdZla+l+HWJKT90+z6PtlYMja7Y=;
 b=UqOJxqhPdfpc5rtxfIwMqXBjK5M8UhpeJsZR957HwBGPlzkaOHgY8+S4o48AxXl16W
 Tmo+Zx7fMsHBMw0TxYI/LbRSKCWWjtykfkd86Oi4KHy1XyGENK/4Jk9o9FgQ9dANSe8/
 6Nb0tjZqaX1abxsj0jQMjDRM0h7mAQ4Aek9EaPyaMxKqp8sa8554q63B5pi2+RcDldzD
 kBg5d4apj7giD/WIZZtw8SW3KLeJmLbIgaMyW54tlTX3Xkd5BOCWVPNEDRuXj1DRXcEr
 vnzKZ2ydpbrqAzmskE/MzFedX7cPdJCdhxyt/mRwktGGvMR5jzsayNkOJlYKn4IByw7F
 UNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KHqPM+kMUaBWQ8uLjdZla+l+HWJKT90+z6PtlYMja7Y=;
 b=iJH6ZrGTvzh+lTc+ZLyAt6IpycmelLTFQ1F1PTGywFMAp4uqIR1BKec8765Ry4rQsz
 va9/VJcmmbMH0MI8OT8KGZlu/BR5zTxtKGIRYO9ZwGnJ9jrqp7uBHffKkjapOjWPmnLN
 MKFwumahUUQAwh1AEldoAzPnczOXwBC/S2fUb3WeI/+mfSu5R3Ynf6wCoVDDm91RDvCw
 KK4eBgoqmthcdaasSuwxd5Rrm/4Vdk6dFJIizipeCKS/Lliq2jt9yRdxld9cdZaokxlO
 PPhon2uy+4izgcw8DKmQk35a2yXBgp3/7Tger7Tv6kkODllWVbmOttPEfzPM4IJJiolS
 X7UQ==
X-Gm-Message-State: AOAM533GoSRs3gGcjbRBykHIVfw8RZV+MyNfQAbaE1/WKlegNp+U/ehg
 X1FetsxPmqCNXojl7ZPa9y593g==
X-Google-Smtp-Source: ABdhPJxXYWT0piysfvD6QE6DArzxEgo9vGgrXuoZJuNTxXv7beUE3BA8SPcjYQlmulzq6xbPZFm7Ow==
X-Received: by 2002:a5d:620d:: with SMTP id y13mr6938284wru.45.1628190881409; 
 Thu, 05 Aug 2021 12:14:41 -0700 (PDT)
Received: from Jessicas-MacBook-Pro.local
 (trinity-students-nat.trin.cam.ac.uk. [131.111.193.104])
 by smtp.gmail.com with ESMTPSA id w1sm9789666wmc.19.2021.08.05.12.14.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 05 Aug 2021 12:14:41 -0700 (PDT)
Received: by Jessicas-MacBook-Pro.local (Postfix, from userid 501)
 id 8BA183680124; Thu,  5 Aug 2021 20:14:40 +0100 (BST)
From: Jessica Clarke <jrtc27@jrtc27.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Partially revert "build: -no-pie is no functional linker flag"
Date: Thu,  5 Aug 2021 20:14:30 +0100
Message-Id: <20210805191430.37409-1-jrtc27@jrtc27.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=jrtc27@jrtc27.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jessica Clarke <jrtc27@jrtc27.com>,
 qemu-stable@nongnu.org, Christian Ehrhardt <christian.ehrhardt@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This partially reverts commit bbd2d5a8120771ec59b86a80a1f51884e0a26e53.

This commit was misguided and broke using --disable-pie on any distro
that enables PIE by default in their compiler driver, including Debian
and its derivatives. Whilst -no-pie is not a linker flag, it is a
compiler driver flag that ensures -pie is not automatically passed by it
to the linker. Without it, all compile_prog checks will fail as any code
built with the explicit -fno-pie will fail to link with the implicit
default -pie due to trying to use position-dependent relocations. The
only bug that needed fixing was LDFLAGS_NOPIE being used as a flag for
the linker itself in pc-bios/optionrom/Makefile.

Note this does not reinstate exporting LDFLAGS_NOPIE, as it is unused,
since the only previous use was the one that should not have existed. I
have also updated the comment for the -fno-pie and -no-pie checks to
reflect what they're actually needed for.

Fixes: bbd2d5a8120771ec59b86a80a1f51884e0a26e53
Cc: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
 configure | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure b/configure
index 9a79a004d7..b8b29e1eee 100755
--- a/configure
+++ b/configure
@@ -2249,6 +2249,7 @@ EOF
 # Check we support --no-pie first; we will need this for building ROMs.
 if compile_prog "-Werror -fno-pie" "-no-pie"; then
   CFLAGS_NOPIE="-fno-pie"
+  LDFLAGS_NOPIE="-no-pie"
 fi
 
 if test "$static" = "yes"; then
@@ -2264,6 +2265,7 @@ if test "$static" = "yes"; then
   fi
 elif test "$pie" = "no"; then
   CONFIGURE_CFLAGS="$CFLAGS_NOPIE $CONFIGURE_CFLAGS"
+  CONFIGURE_LDFLAGS="$LDFLAGS_NOPIE $CONFIGURE_LDFLAGS"
 elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
   CONFIGURE_CFLAGS="-fPIE -DPIE $CONFIGURE_CFLAGS"
   CONFIGURE_LDFLAGS="-pie $CONFIGURE_LDFLAGS"
-- 
2.17.1


