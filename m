Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54CA44446D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:12:31 +0100 (CET)
Received: from localhost ([::1]:60948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHwE-0008PS-U4
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHos-0003Dc-Fd; Wed, 03 Nov 2021 11:04:55 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:33305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHop-0000Pe-8R; Wed, 03 Nov 2021 11:04:54 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso3601976wmh.0; 
 Wed, 03 Nov 2021 08:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4TrkEf6RZdbASiD3tvojLTbg4WPtkYm2UJl3+lm45aU=;
 b=Rb7YCLsgOu7Q09EydHdpkim1sEjAyPC/uaL1eqUIyryXktpmq/y2XleAEGbjiaB8b7
 R/Q6Fm+7AaC4YPoMxuDAJMlFsFxcp61GVcIkyFSsjIFJHtKUiKLpfyyEouSizU+oyOA6
 rxFwX8NbsjKPz6NSVaML3dfWU+xgbwp3QTNXimFCPHGWm/pqd5ikf2qe6I8UW4KIo7RM
 pYLWuWHOoLYvcGsSNCYu6dxvjiQyFNZ+19lLFr96kDhALPVa8h1QBeoCqK/R9Q2zy/oL
 Z6YZy6aY/QtE4gbB8jDWFsi2wcbQq7s5H6Vmw8+r0j0pfw2ol7NwwRYyCgJdCiWE8i0B
 nYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4TrkEf6RZdbASiD3tvojLTbg4WPtkYm2UJl3+lm45aU=;
 b=b/1z8XCZXMMNdK1qBfWerZEitxS4AdMLdxbF2YFJNgBAQuKr8LxX5qeQPMLwBtdY/H
 cC0tCI/fDpznGMPbfq0vO4i3PkomY9JNuNjEZIjm5IwwDFF33yLUItHA9pGiNF9eRbPr
 KQz7oCDL+gflo10v+KnZcAbW4aV20dso6d6aKSi9P7oI0mhf4Zc+PXrSUoW3jBQ9FuSG
 NHLIo97SNyeyGBlccs/ubQux9k7Q5v/iESwrsZmBV0lLMuen6omeYGg91OFdd1cIge1R
 RO8fq8eu88OuhpZ3PCW0FPwR2aYxSt3RNXoQRvkuoDuv7tjst0MmLejNkCjPz1elHdjO
 mQCg==
X-Gm-Message-State: AOAM533kQmnz9YDr6KPIqDefZWNEH2EzcLB3Fdh7O1lsDLOTK7XMhlkS
 kjKrYdCGVu5fbKZXPUHRVvUFC42CJ2Q=
X-Google-Smtp-Source: ABdhPJzCrU2/KZC1RD4xfpXJoGE033K/LRtW2hVJa6IMBlHHxNOwoYgLQ4d+qQulj3g5YrzIhZnN+Q==
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr15931631wmb.1.1635951888779;
 Wed, 03 Nov 2021 08:04:48 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:04:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/27] Partially revert "build: -no-pie is no functional linker
 flag"
Date: Wed,  3 Nov 2021 16:04:18 +0100
Message-Id: <20211103150442.387121-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jessica Clarke <jrtc27@jrtc27.com>, qemu-stable@nongnu.org,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jessica Clarke <jrtc27@jrtc27.com>

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
Message-Id: <20210805192545.38279-1-jrtc27@jrtc27.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 039467c04b..07cb7b412a 100755
--- a/configure
+++ b/configure
@@ -1771,9 +1771,11 @@ static THREAD int tls_var;
 int main(void) { return tls_var; }
 EOF
 
-# Check we support --no-pie first; we will need this for building ROMs.
+# Check we support -fno-pie and -no-pie first; we will need the former for
+# building ROMs, and both for everything if --disable-pie is passed.
 if compile_prog "-Werror -fno-pie" "-no-pie"; then
   CFLAGS_NOPIE="-fno-pie"
+  LDFLAGS_NOPIE="-no-pie"
 fi
 
 if test "$static" = "yes"; then
@@ -1789,6 +1791,7 @@ if test "$static" = "yes"; then
   fi
 elif test "$pie" = "no"; then
   CONFIGURE_CFLAGS="$CFLAGS_NOPIE $CONFIGURE_CFLAGS"
+  CONFIGURE_LDFLAGS="$LDFLAGS_NOPIE $CONFIGURE_LDFLAGS"
 elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
   CONFIGURE_CFLAGS="-fPIE -DPIE $CONFIGURE_CFLAGS"
   CONFIGURE_LDFLAGS="-pie $CONFIGURE_LDFLAGS"
-- 
2.31.1



