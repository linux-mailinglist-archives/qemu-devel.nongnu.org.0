Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCD249512B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 16:14:50 +0100 (CET)
Received: from localhost ([::1]:46558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAZ9F-0004XD-Cb
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 10:14:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nAVjq-0007MY-SH; Thu, 20 Jan 2022 06:36:24 -0500
Received: from [2a00:1450:4864:20::329] (port=38726
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nAVjo-0001pb-79; Thu, 20 Jan 2022 06:36:22 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso14515175wmb.3; 
 Thu, 20 Jan 2022 03:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4n8YX6duwnriKZKmbthkv+dt+z7zVqKii17JMYGRe8k=;
 b=nZAbIhpv37md8UbGEyjm/1RTpMDe4JJyqz7x0A6Vg9kJzfag87A7HI9HACeVThzKEf
 UElg5rWTbFXE7KoSxqum1M4OoEYOjSMEivIIYs1NGqKgK/buyFC+MZ0Xn9kPu+ihfDPZ
 ZXMc/W5zSGDzMj3aeqD+cCq7j6BvFeUplXFK4dOfTPHWsFab3bhoQbnnWpm5ufX8h54n
 PhULhT9IY1CE7p8IZyiqM3zaxG//fKZuxNfP8Q97u1jq5+fQJvDyWc7tMo49krQrND2O
 CIQFuDSsfNb2GoqEbEMZ4XwXTl9OxfhvIt2Ouvkhjed4FF5xDkNEWwODQiboDUQKq2Ni
 nIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4n8YX6duwnriKZKmbthkv+dt+z7zVqKii17JMYGRe8k=;
 b=oufuCRqikXpAqlnCgP8GRmN36gm+GkmQbxvGpHktSuFKMpUXo3l1CBvaToBN9O1c3g
 qf3pV5W74jUp/xubkbwRvx2EqNMWUffu8FAYPB0mDyOJMLEuSvB/GitLFBQJveg/w3ba
 YbhT5mCQUBD6ovilUrDLBYF2A8v72hCXG8KvGmOwnZ3inGof1pvJpMquk9FVBoL4WGzG
 eJs5XUg8HNTbQLQkL4QyFYJaLlSv4cqMSHA127qh/HMddne7WnGtWNQvgHO0XhUkbhWL
 Je4CsZ0JpghtZu4oX3p/GkuZQTvs/KGFexHllfHTdgsvN4HAIOggpZrxvbLngXd29d0H
 9xRA==
X-Gm-Message-State: AOAM530N9NqTRWzKGLXfPq2IfarqE2sdTD8huVCqPjDtuFvHD+bjN4Qr
 NR3QYIaqK/EPYXGeoHLYlqAw+0gVmZk=
X-Google-Smtp-Source: ABdhPJycDdD43eKdd2s8w/uk8YeNCdCdiT4xR2MPZaIn3V3VYdeHZlG9VyWigLiwgUfxLTJxjreLrw==
X-Received: by 2002:adf:dc45:: with SMTP id m5mr10100131wrj.625.1642678567315; 
 Thu, 20 Jan 2022 03:36:07 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w8sm2653423wrq.3.2022.01.20.03.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:36:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] scripts/mtest2make: add support for SPEED=thorough
Date: Thu, 20 Jan 2022 12:36:00 +0100
Message-Id: <20220120113603.276144-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220120113603.276144-1-pbonzini@redhat.com>
References: <20220120113603.276144-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: thuth@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build           |  5 +++--
 scripts/mtest2make.py | 10 +++++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index 97c6fd6f1b..dcd2a1d5e3 100644
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
2.33.1



