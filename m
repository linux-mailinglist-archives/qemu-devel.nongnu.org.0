Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A338949E0C0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:25:54 +0100 (CET)
Received: from localhost ([::1]:53236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD2uX-0007IK-ON
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:25:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fy-0006ml-Lb
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:53 -0500
Received: from [2a00:1450:4864:20::332] (port=41979
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fv-00069I-Iv
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:48 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so1640462wme.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7qgRepnTuh1VaS7uEEW1RDvXztJIS2RU+qpAvNhpbPs=;
 b=VkTur3y53E2tIeE9ExNwihvsCR5AEU8xKsu88m3N06knF+0hU6eBI6NqRDLxE3Dn2E
 +kbUzRGs2jTBjLa6jeAAW+CAbBnWT/0W5cYklAZcI4KF7J1Wd175SbQCH8YFfCNc4BCk
 ab9VdwKogPWbr9+Qc2oubvUrHnHVvGM+ttnU+E9KxWIeVklBJW6ff/Ps3f/o0rxzWMSt
 Yw8X//jM5cF/uy8OyD8e7y5ZwJTC/36i3xwqDmyHMuCY7taTfVR3hJtRou1tYJPlkrzx
 z0cXGHlN0n6mwIJIGQsEmSSywEh3d9IWSlIXRfAdTzgmRxZuUSnBKaWoyNj30sGYuokT
 AZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7qgRepnTuh1VaS7uEEW1RDvXztJIS2RU+qpAvNhpbPs=;
 b=Aul7yV/L7b7zj2mTZOjBzm4yv/JNmYJzlZN+AGTZhn6JGw83ZZ4llen8XRQHCx/6ge
 mtTOd/7/c3WiOFGCW5s4XE15M00v6DrX9b9PYHnfNVO24FjV/sA909SeTjgOTnJkWGOu
 MgtGIXUcfif6qmCvMW8vI5zhzTO0KUYwqHEyJTyLd7HCIWX1TZVsRzcq3OIEYFuKPHbA
 rbU3Xt6RDo4X83cv1BB9QCdJybJn63XEzEb0SlCOF8747/xolhnE1oqG+o0+ZN9fkyS3
 aNtsaj7kGtxtvO/aWbdSOwCtesVLh1cIuD46vc4yOqGV/K2UOsl5FojVgR5t+hNh4ecr
 uu3g==
X-Gm-Message-State: AOAM53164odIX94K++wWbQvr972vhkj9ab+VEWSOsC+I+TPEt4Q/PP3y
 kyZ1RoYkAdHu9SmnJjllNLsBGHYSCDM=
X-Google-Smtp-Source: ABdhPJx6pgrr88ol5B3iSvJR1skMPWjj/LUvyPjGiq5JkSAqQ3y8A8gpgMB1VHFlOZ7Qn1zhZnQkAA==
X-Received: by 2002:a1c:a302:: with SMTP id m2mr2833719wme.84.1643281846210;
 Thu, 27 Jan 2022 03:10:46 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s17sm1825742wrm.62.2022.01.27.03.10.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:10:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/14] scripts/mtest2make: add support for SPEED=thorough
Date: Thu, 27 Jan 2022 12:10:32 +0100
Message-Id: <20220127111037.457901-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127111037.457901-1-pbonzini@redhat.com>
References: <20220127111037.457901-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build           |  5 +++--
 scripts/mtest2make.py | 10 +++++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index c69fbbd0cb..f3f7b9c191 100644
--- a/meson.build
+++ b/meson.build
@@ -3,8 +3,9 @@ project('qemu', ['c'], meson_version: '>=0.58.2',
                           'b_staticpic=false', 'stdsplit=false'],
         version: files('VERSION'))
 
-add_test_setup('quick', exclude_suites: 'slow', is_default: true)
-add_test_setup('slow', env: ['G_TEST_SLOW=1', 'SPEED=slow'])
+add_test_setup('quick', exclude_suites: ['slow', 'thorough'], is_default: true)
+add_test_setup('slow', exclude_suites: ['thorough'], env: ['G_TEST_SLOW=1', 'SPEED=slow'])
+add_test_setup('thorough', env: ['G_TEST_SLOW=1', 'SPEED=thorough'])
 
 not_found = dependency('', required: false)
 keyval = import('keyval')
diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index 7067bdadf5..4b9c561b30 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -23,8 +23,9 @@ def names(self, base):
 print('''
 SPEED = quick
 
-.speed.quick = $(foreach s,$(sort $(filter-out %-slow, $1)), --suite $s)
-.speed.slow = $(foreach s,$(sort $1), --suite $s)
+.speed.quick = $(foreach s,$(sort $(filter-out %-slow %-thorough, $1)), --suite $s)
+.speed.slow = $(foreach s,$(sort $(filter-out %-thorough, $1)), --suite $s)
+.speed.thorough = $(foreach s,$(sort $1), --suite $s)
 
 .mtestargs = --no-rebuild -t 0
 ifneq ($(SPEED), quick)
@@ -52,11 +53,14 @@ def process_tests(test, targets, suites):
     for s in test_suites:
         # The suite name in the introspection info is "PROJECT:SUITE"
         s = s.split(':')[1]
-        if s == 'slow':
+        if s == 'slow' or s == 'thorough':
             continue
         if s.endswith('-slow'):
             s = s[:-5]
             suites[s].speeds.append('slow')
+        if s.endswith('-thorough'):
+            s = s[:-9]
+            suites[s].speeds.append('thorough')
         suites[s].deps.update(deps)
 
 def emit_prolog(suites, prefix):
-- 
2.34.1



