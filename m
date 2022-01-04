Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDD648445B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:13:40 +0100 (CET)
Received: from localhost ([::1]:37772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4lVL-0002PG-5O
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:13:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGW-0007AI-HO
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:22 -0500
Received: from [2a00:1450:4864:20::531] (port=35548
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGU-0004T7-Bc
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:19 -0500
Received: by mail-ed1-x531.google.com with SMTP id y22so149620533edq.2
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 06:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=owvX4P9y0f81YuJV9NBqPRhs+vGIQfiyyOxrzRSgqoI=;
 b=P2IZLHX0MDVM0UGjklPV3tWoFtC94wh9Vhxo2svWFuT3vjaFc5iZnvpPBvDim6rhMv
 FrFdbQ8GgLwwjSZM7eI2v+23d4nJrMhpxVR0JkFUCGnpwccaPoExndfY6x5aZphWzR4O
 bpcqATuxVLL9ErwRuh7PP+/dEAnkQl06GOTvxWu9BeoKu1lRqKp6GF/lViPKcsCzSRmF
 zMo7wI1oJ9gSYJKCYSOHxdl3Eztly9Jfft73rAAEr1QTvmBEx0M183elh/y/EJ5byAiM
 tvmq2NLK8vKTWWLHchIxXKKDgBfqkEK/xlGLSsbiEnCS0Xk58wspn7nipmPwRK7Hduks
 BEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=owvX4P9y0f81YuJV9NBqPRhs+vGIQfiyyOxrzRSgqoI=;
 b=7u9UGT5mlP0N1IZq2GgeLR4ry0nfYU4N5svIn0oTQ6X9drafklAEQSnVMhRdXVlF+Q
 28xzbkLN19T7rNFqQSdMMoPTlMAhBhLNCDsZOAibU4XOmRrMWF7Y69BANjhgKm7i97zv
 kPSCNd98JXY7xrcV+xY96GpxSKoiJlaOAvfq2YPtstRcEKqlFn0JsBHCoQCMhb1tKqUO
 Z/kq2qm/0+NMg/HrSbLq7Jp8nrfFUyXb2+HMCIytvYXwjSCb2WuBKP3o/uj26+I+IxO4
 /XfYyKHqN1wk0PBJHLW69kh687yRBGvKQxBgQ9vcARSbYnnVKC9t5V50ty1c0DLaVuir
 AIMA==
X-Gm-Message-State: AOAM532e6eYe7xPYNkOqki9Rom/RV15ikFrLW02kjKxfJ6hE2pzZ/h3Y
 V5NuGtsThiIhqMAowGvh6Z3tyt8eEJQ=
X-Google-Smtp-Source: ABdhPJyRukKyeosc/qhb4xpUahioiZhvojYpQE25STVuL0z64IpOiYu4eXy+DjGqnUS6y01RHrE36A==
X-Received: by 2002:a05:6402:2744:: with SMTP id
 z4mr49595120edd.68.1641308296855; 
 Tue, 04 Jan 2022 06:58:16 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id j21sm11475964ejj.133.2022.01.04.06.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 06:58:16 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/15] configure: move non-command-line variables away from
 command-line parsing section
Date: Tue,  4 Jan 2022 15:57:43 +0100
Message-Id: <20220104145749.417387-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104145749.417387-1-pbonzini@redhat.com>
References: <20220104145749.417387-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes it easier to identify candidates for moving to Meson.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/configure b/configure
index 9e01b2278e..e3d603d381 100755
--- a/configure
+++ b/configure
@@ -307,16 +307,12 @@ debug="no"
 sanitizers="no"
 tsan="no"
 fortify_source="$default_feature"
-mingw32="no"
 gcov="no"
 EXESUF=""
 modules="no"
 module_upgrades="no"
 prefix="/usr/local"
 qemu_suffix="qemu"
-bsd="no"
-linux="no"
-solaris="no"
 profiler="no"
 softmmu="yes"
 linux_user=""
@@ -330,8 +326,6 @@ opengl="$default_feature"
 cpuid_h="no"
 avx2_opt="$default_feature"
 guest_agent="$default_feature"
-guest_agent_with_vss="no"
-guest_agent_ntddscsi="no"
 vss_win32_sdk="$default_feature"
 win_sdk="no"
 want_tools="$default_feature"
@@ -526,6 +520,10 @@ fi
 
 # OS specific
 
+mingw32="no"
+bsd="no"
+linux="no"
+solaris="no"
 case $targetos in
 windows)
   mingw32="yes"
@@ -2548,6 +2546,7 @@ fi
 ##########################################
 # check if we have VSS SDK headers for win
 
+guest_agent_with_vss="no"
 if test "$mingw32" = "yes" && test "$guest_agent" != "no" && \
         test "$vss_win32_sdk" != "no" ; then
   case "$vss_win32_sdk" in
@@ -2578,7 +2577,6 @@ EOF
       echo "ERROR: The headers are extracted in the directory \`inc'."
       feature_not_found "VSS support"
     fi
-    guest_agent_with_vss="no"
   fi
 fi
 
@@ -2605,6 +2603,7 @@ fi
 
 ##########################################
 # check if mingw environment provides a recent ntddscsi.h
+guest_agent_ntddscsi="no"
 if test "$mingw32" = "yes" && test "$guest_agent" != "no"; then
   cat > $TMPC << EOF
 #include <windows.h>
-- 
2.33.1



