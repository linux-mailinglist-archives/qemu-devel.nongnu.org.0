Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FECD30CDA3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 22:09:56 +0100 (CET)
Received: from localhost ([::1]:60738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l72vr-0006cD-Hd
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 16:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72m1-0002q6-IK
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:59:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72lx-0007Jb-AQ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:59:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612299580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dCfyGHzbfzBUDJy/U9zdNX3uk8PQFIhBr0LUrgPgKnQ=;
 b=WQ41MlHSXRiaiqJOJS90tYS8mkc5tp6nJOr3yYtN8kAsboKrGtYYdZSmUGhApEBu6UKR/O
 WDjp0VTMeP8C7GGmh4kYDLuDzVsITVAjhzPptWIVxxJbMCnt6J+hjjjJndA2dQXQn73qfZ
 BTRRRHm4r5DJJ68HA5S3OF6zcZV8Bi8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-ik44NzFQOciqJrc3tcwRXQ-1; Tue, 02 Feb 2021 15:59:38 -0500
X-MC-Unique: ik44NzFQOciqJrc3tcwRXQ-1
Received: by mail-ed1-f72.google.com with SMTP id f4so10206631eds.5
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 12:59:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dCfyGHzbfzBUDJy/U9zdNX3uk8PQFIhBr0LUrgPgKnQ=;
 b=ZYxLwkyaHKfq+36Xeg9uOBGkWHluwBHaiWyy4JNBc8aFysZA+nCzMWK1UQ9Yvc61fS
 Cx+b7/9G0mnuHPFPZnEcyzIINPyRpoa/KgjMmUsb5fny+LIimUR5BE4BdF4+3vG4hCGl
 oZHElHlirtYfLVvCUBn4+i7sblW0wdkRw4v2KrhH/PN7cj8P4SPi3qhC88XpbN2NJAao
 ymSloBG95iZ2gflPhOA9Dhi3u1lv0I41yoZfmbrCa71jO8qQeldK5Ysw+m/tUO4VYHi0
 y3USS9GsBu9/PcRR3Z3lq0j+x4w+nhT1MFDUJ07PQYLkYJRodttsfsQwHuu2myKMVrqy
 H+qQ==
X-Gm-Message-State: AOAM531kzjK7oZDrLdXrWNnFXzcI0idy5WzpmOkxofB9gRKRwLUcpY2H
 Jp1Uaxp0Qs8kvJwMUmI1rS5DFayyXlIwGGO5z2qB0meHPCtCxOhvnQHifOhfgqdrxy1R145BxKF
 3hsxi+Kitwb++/lI5vD6qTLq0o7voRbDa67FcMGUtZ1jf6PB0e7mDe2+VFXfBeaUR
X-Received: by 2002:a17:907:78d5:: with SMTP id
 kv21mr11594792ejc.461.1612299577127; 
 Tue, 02 Feb 2021 12:59:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0uC8KACyPZfRQ8o/TZNen5kFDDAgF1ARFaqFYyBX32kGh5iUulVnTzasyloiiyZbFHyj0yw==
X-Received: by 2002:a17:907:78d5:: with SMTP id
 kv21mr11594764ejc.461.1612299576867; 
 Tue, 02 Feb 2021 12:59:36 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id g9sm5662ejp.55.2021.02.02.12.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 12:59:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/12] tests/qemu-iotests: Replace the words
 'blacklist/whitelist'
Date: Tue,  2 Feb 2021 21:58:22 +0100
Message-Id: <20210202205824.1085853-11-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210202205824.1085853-1-philmd@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the words "blacklist"
and "whitelist" appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qemu-iotests/149     | 14 +++++++-------
 tests/qemu-iotests/149.out |  8 ++++----
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/tests/qemu-iotests/149 b/tests/qemu-iotests/149
index 328fd05a4c9..b1d3f5fad67 100755
--- a/tests/qemu-iotests/149
+++ b/tests/qemu-iotests/149
@@ -500,7 +500,7 @@ configs = [
 
 ]
 
-blacklist = [
+denylist = [
     # We don't have a cast-6 cipher impl for QEMU yet
     "cast6-256-xts-plain64-sha1",
     "cast6-128-xts-plain64-sha1",
@@ -510,17 +510,17 @@ blacklist = [
     "twofish-192-xts-plain64-sha1",
 ]
 
-whitelist = []
+allowlist = []
 if "LUKS_CONFIG" in os.environ:
-    whitelist = os.environ["LUKS_CONFIG"].split(",")
+    allowlist = os.environ["LUKS_CONFIG"].split(",")
 
 for config in configs:
-    if config.name in blacklist:
-        iotests.log("Skipping %s in blacklist" % config.name)
+    if config.name in denylist:
+        iotests.log("Skipping %s in denylist" % config.name)
         continue
 
-    if len(whitelist) > 0 and config.name not in whitelist:
-        iotests.log("Skipping %s not in whitelist" % config.name)
+    if len(allowlist) > 0 and config.name not in allowlist:
+        iotests.log("Skipping %s not in allowlist" % config.name)
         continue
 
     test_once(config, qemu_img=False)
diff --git a/tests/qemu-iotests/149.out b/tests/qemu-iotests/149.out
index 6877ab6c4a4..19ae092987b 100644
--- a/tests/qemu-iotests/149.out
+++ b/tests/qemu-iotests/149.out
@@ -478,7 +478,7 @@ sudo cryptsetup -q -v luksClose qiotest-145-cast5-128-cbc-plain64-sha1
 # Delete image
 unlink TEST_DIR/luks-cast5-128-cbc-plain64-sha1.img
 
-Skipping cast6-256-xts-plain64-sha1 in blacklist
+Skipping cast6-256-xts-plain64-sha1 in denylist
 # ================= dm-crypt aes-256-cbc-plain-sha1 =================
 # Create image
 truncate TEST_DIR/luks-aes-256-cbc-plain-sha1.img --size 4194304MB
@@ -1319,7 +1319,7 @@ sudo cryptsetup -q -v luksClose qiotest-145-twofish-128-xts-plain64-sha1
 # Delete image
 unlink TEST_DIR/luks-twofish-128-xts-plain64-sha1.img
 
-Skipping twofish-192-xts-plain64-sha1 in blacklist
+Skipping twofish-192-xts-plain64-sha1 in denylist
 # ================= dm-crypt serpent-128-xts-plain64-sha1 =================
 # Create image
 truncate TEST_DIR/luks-serpent-128-xts-plain64-sha1.img --size 4194304MB
@@ -1560,8 +1560,8 @@ sudo cryptsetup -q -v luksClose qiotest-145-serpent-192-xts-plain64-sha1
 # Delete image
 unlink TEST_DIR/luks-serpent-192-xts-plain64-sha1.img
 
-Skipping cast6-128-xts-plain64-sha1 in blacklist
-Skipping cast6-192-xts-plain64-sha1 in blacklist
+Skipping cast6-128-xts-plain64-sha1 in denylist
+Skipping cast6-192-xts-plain64-sha1 in denylist
 # ================= dm-crypt aes-256-xts-plain64-sha224 =================
 # Create image
 truncate TEST_DIR/luks-aes-256-xts-plain64-sha224.img --size 4194304MB
-- 
2.26.2


