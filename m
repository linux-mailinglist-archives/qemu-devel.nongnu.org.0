Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3CE48F9A7
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 23:24:53 +0100 (CET)
Received: from localhost ([::1]:60704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8rTh-0003A8-0F
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 17:24:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n8rR0-0000LE-Gy; Sat, 15 Jan 2022 17:22:06 -0500
Received: from [2a00:1450:4864:20::32c] (port=34566
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n8rQw-0000ex-FL; Sat, 15 Jan 2022 17:22:06 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so5603115wmb.1; 
 Sat, 15 Jan 2022 14:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ltaiY5u20TfA3hXvAel5LXqN/1DsxwrhOAowQF2omaM=;
 b=TO79unu2eApykPtXNJNx+QQSqjbiOfmdpOUR0jV2L3nCdHpHGr359xwNPxWq8xygVh
 zCCD49BkjHYQK4b6MlsbsEz2wyQjYO+KufxImS/hE9ZizWLTGbhpR85AxP+VThTZ2sld
 ILoMTIOF2UOmWTWNsXXJ1llCBl3ZPB/wEHcwi57G2uFxrFX8JtdsczSaxUEMUBg7tzWe
 qlQ6kcZ1rlALg2DaI/aOkEVMPpXtQ3QrspkgWQPUk8f3xiwPZvtkLS4Qpwi24mU0RQOA
 mqA+HzeIhEZhWvCNUBgf2OY+HMo4PkNEpvZWwyAGgJ3BGQfuERRdJAFG6D78l0KuVnEZ
 Pu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ltaiY5u20TfA3hXvAel5LXqN/1DsxwrhOAowQF2omaM=;
 b=d9zSGGaUDERp9U7fdpNa3hr7q/P8zleR8qfpCILELk+I0Rl3djN7F2EagoIqb3Od5h
 S17asrbCCHpKzbabVWVfa4DFlr/hHzyFA1nUkmZKyDPB50VnZ4BK0Nu2vELcdGkomg3G
 ULRe3yKVYNkTLztdiV17Wp6qYeeXjuA7TVxolpLDmsAO3+ACJV68AKe+lr5hogWz64qE
 qezdZ5n8Nsot8tg/r6lRMt4q6oXf4/MGKeh3c93gVMOD/cj41LbYo8ivUzHucj9t+pr0
 s0v7c93pWtxuZXn5kX8vGAjHapDBDDrYJOvH9+zG0e+cDvGlA/6bXv4w4nLTO3pgNNi/
 pkpw==
X-Gm-Message-State: AOAM530JlcU4cIggIM32DNKnZ5g4rQo/zvUk6xEzaf6prORKq+zP9e2E
 EHC+FGOGuMPlW3kNmAQGEV6bDWiFcMg=
X-Google-Smtp-Source: ABdhPJwtnzjaNWHo80ufAQW//nE8Ie6LZcpcNsZH9estVJ2VTRI+vIPbhMa3PBj8dT6198lUuCXmMg==
X-Received: by 2002:a1c:a747:: with SMTP id q68mr20842103wme.98.1642285318833; 
 Sat, 15 Jan 2022 14:21:58 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id s1sm8929616wrv.38.2022.01.15.14.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 14:21:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] scripts/mtest2make: add support for SPEED=thorough
Date: Sat, 15 Jan 2022 23:21:51 +0100
Message-Id: <20220115222154.341628-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220115222154.341628-1-pbonzini@redhat.com>
References: <20220115222154.341628-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build           |  5 +++--
 scripts/mtest2make.py | 10 +++++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index 762d7cee85..c9004bd25e 100644
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



