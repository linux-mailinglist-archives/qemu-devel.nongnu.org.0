Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2071E3C1821
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:29:50 +0200 (CEST)
Received: from localhost ([::1]:41768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XqP-0006Cy-4S
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1Xmg-0007qJ-Np
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:26:00 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:41925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1Xme-0005dP-MO
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:25:58 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 oj10-20020a17090b4d8ab0290172f77377ebso4329805pjb.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M5vcKKDVZQYms4uOR9JQB2etWe+O1TO8Yu2POyfw0g0=;
 b=NX7UGSW1heDex1AJovAXg7y5EroxRzxoxAnCdlixyLfh2KQpbqPdiwEmmfIka8Nm7w
 7JIpyZFwPt8p+z2rEE2BZqQ2os6kkDdPPyLZFI/GeVGub8Xllc9cAFsowVeWbC818PUL
 UYFMKkOv5yHJjuZeQ5RZoruxtNd+4XE12I5oZfV66uhPCUirIermFaV/2Booz4vEYs0T
 eAflu0kIF5tdFDgPeDF58DF5Yqxx3Z8MMXpmL4RzBhqY3xgViQJRshuGEb9G+ZE0Kwva
 CbMT/A1KR8QmP8nyOAX505EOouDSz2vDDtoJTow4GTLxbeEmooKJovTEANMuD7mCV/Yd
 8fnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M5vcKKDVZQYms4uOR9JQB2etWe+O1TO8Yu2POyfw0g0=;
 b=lcWQfQlRIHGedGsd7T9DsN/ejqGtjeBu6mFXQupWMNGgyH5JY2AWdzrPKNNP7iyusM
 m3IrkHX2YC2h93Sq/yoGj9e3fqTowjbaB3dulYRzDp1+9XmLJJode8hPSCcVyo6SWGMq
 P6XlUViQzVamaFLSSXyOtu3XhcapRdFOfwS9fr1rSOHMa+5ZfEoBThBMsteRM1v2vbYy
 SQqp/pWbxcXh/rby8R6oGUt0/gxRe9DtKKMkdZcZb6Hj1Eb8J16TYzMPXpsHc3M2GhBX
 HXkBIhD4CPkuaw3blRZY9YGdvxWJrESS8d9wnutpwG5wVy88I/n5Vi2pCvx7zLL3oPsa
 c32g==
X-Gm-Message-State: AOAM530d9AGWtuNLbSngFgqpAvkwlRpTDq2X05vmLwXUPirtqChw2IOL
 X4/tKXrPq/Ie793D087qBJVlJpHdIsJagw==
X-Google-Smtp-Source: ABdhPJxIMBk6Lf81WqrzEstEOdxWev/pGnCYDOs1olR91Np1uhMj8wDiCJ5b2I6+t/w2MnIiNEbPtQ==
X-Received: by 2002:a17:902:7b8c:b029:129:5733:2e3b with SMTP id
 w12-20020a1709027b8cb029012957332e3bmr26854128pll.4.1625765155333; 
 Thu, 08 Jul 2021 10:25:55 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:7947:37f7:fd02:9c0c])
 by smtp.gmail.com with ESMTPSA id c20sm3579429pfd.64.2021.07.08.10.25.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Jul 2021 10:25:55 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 4/4] net: Use bundle mechanism
Date: Fri,  9 Jul 2021 02:25:41 +0900
Message-Id: <20210708172541.29530-4-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210708172541.29530-1-akihiko.odaki@gmail.com>
References: <20210708172541.29530-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 configure         | 1 +
 include/net/net.h | 2 +-
 meson.build       | 1 +
 net/tap.c         | 6 +++++-
 qemu-options.hx   | 4 ++--
 5 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index a9f746849ec..aa8e096faaa 100755
--- a/configure
+++ b/configure
@@ -5069,6 +5069,7 @@ done
 
 symlink $source_path/ui/icons/qemu.svg qemu-bundle/share/icons/hicolor/scalable/apps/qemu.svg
 symlink ../../pc-bios qemu-bundle/share/qemu
+symlink ../../qemu-bridge-helper qemu-bundle/libexec/qemu-bridge-helper
 
 (for i in $cross_cc_vars; do
   export $i
diff --git a/include/net/net.h b/include/net/net.h
index 5d1508081f9..5f701e942b3 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -221,7 +221,7 @@ NetClientState *net_hub_port_find(int hub_id);
 
 #define DEFAULT_NETWORK_SCRIPT CONFIG_SYSCONFDIR "/qemu-ifup"
 #define DEFAULT_NETWORK_DOWN_SCRIPT CONFIG_SYSCONFDIR "/qemu-ifdown"
-#define DEFAULT_BRIDGE_HELPER CONFIG_QEMU_HELPERDIR "/qemu-bridge-helper"
+#define DEFAULT_BUNDLE_BRIDGE_HELPER CONFIG_QEMU_BUNDLE_HELPERDIR "/qemu-bridge-helper"
 #define DEFAULT_BRIDGE_INTERFACE "br0"
 
 void qdev_set_nic_properties(DeviceState *dev, NICInfo *nd);
diff --git a/meson.build b/meson.build
index 6d90fe92bf1..ecfc5bd8c72 100644
--- a/meson.build
+++ b/meson.build
@@ -1200,6 +1200,7 @@ config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_c
 config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_DATADIR', qemu_datadir)
 config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', get_option('prefix') / qemu_desktopdir)
 config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('qemu_firmwarepath'))
+config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_HELPERDIR', get_option('libexecdir'))
 config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_ICONDIR', qemu_icondir)
 config_host_data.set_quoted('CONFIG_QEMU_LOCALEDIR', get_option('prefix') / get_option('localedir'))
 config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('prefix') / get_option('localstatedir'))
diff --git a/net/tap.c b/net/tap.c
index f5686bbf771..be80f29b96b 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -508,7 +508,11 @@ static int net_bridge_run_helper(const char *helper, const char *bridge,
     sigprocmask(SIG_BLOCK, &mask, &oldmask);
 
     if (!helper) {
-        helper = default_helper = get_relocated_path(DEFAULT_BRIDGE_HELPER);
+        helper = default_helper = find_bundle(DEFAULT_BUNDLE_BRIDGE_HELPER);
+        if (!helper) {
+            error_setg(errp, "birdge helper not found");
+            return -1;
+        }
     }
 
     if (socketpair(PF_UNIX, SOCK_STREAM, 0, sv) == -1) {
diff --git a/qemu-options.hx b/qemu-options.hx
index 8965dabc83e..2f40169e8e9 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2528,7 +2528,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "                to configure it and 'dfile' (default=" DEFAULT_NETWORK_DOWN_SCRIPT ")\n"
     "                to deconfigure it\n"
     "                use '[down]script=no' to disable script execution\n"
-    "                use network helper 'helper' (default=" DEFAULT_BRIDGE_HELPER ") to\n"
+    "                use network helper 'helper' (default=" DEFAULT_BUNDLE_BRIDGE_HELPER ") to\n"
     "                configure it\n"
     "                use 'fd=h' to connect to an already opened TAP interface\n"
     "                use 'fds=x:y:...:z' to connect to already opened multiqueue capable TAP interfaces\n"
@@ -2547,7 +2547,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "-netdev bridge,id=str[,br=bridge][,helper=helper]\n"
     "                configure a host TAP network backend with ID 'str' that is\n"
     "                connected to a bridge (default=" DEFAULT_BRIDGE_INTERFACE ")\n"
-    "                using the program 'helper (default=" DEFAULT_BRIDGE_HELPER ")\n"
+    "                using the program 'helper (default=" DEFAULT_BUNDLE_BRIDGE_HELPER ")\n"
 #endif
 #ifdef __linux__
     "-netdev l2tpv3,id=str,src=srcaddr,dst=dstaddr[,srcport=srcport][,dstport=dstport]\n"
-- 
2.30.1 (Apple Git-130)


