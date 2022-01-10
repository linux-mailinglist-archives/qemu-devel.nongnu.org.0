Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74672489BA8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:55:46 +0100 (CET)
Received: from localhost ([::1]:60010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6w5J-0006fw-GP
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:55:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vrR-0002lG-Ft
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:41:25 -0500
Received: from [2a00:1450:4864:20::529] (port=39579
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vrH-0000XL-5n
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:41:21 -0500
Received: by mail-ed1-x529.google.com with SMTP id c71so42889600edf.6
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=inTZD+4IypX7RqF+aT3fg6wUiP6db1LW/9x75xNzatk=;
 b=SFjZG3ti7zXbG7ROXYNan1DHMZarDOhXqe1wWIBV8nJFg0KUWS5DPK1HhsszImGTwP
 RhYYR6OG+nS1KbE2rNIVxMHbaihk4sJQJi2sm5X47GG7inpHb1A0xUujNSA+vdIiR3EQ
 gIawEw66hOzdV/vZA/Z9JZbfxsZfLT4dVho7U3oMJ7lqY861Vz2f6rtOZNQ2yogezoiS
 XegBZJZ40J6Wj603vNqLou0l+94IIClzXAp7ngd9ob2HMeudOVjJ57ReTgJNAqW8AX+L
 5XE/B0c8/Wr0Dezm3ITwjoa1hJ1sh5yBY9PPV33GmswD9jy31g4VDWi1H9xsRcBvFUK5
 wfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=inTZD+4IypX7RqF+aT3fg6wUiP6db1LW/9x75xNzatk=;
 b=Psar3dCFb3FjRhaBy+K2R2FF6sHUoQ3Iy8YYdL04sOch7ydcWq5TfK8mZa7W4anEPt
 dyKoPDtRJsszAZcC7nVGrYO6DNIn6V1mFWzo41Zny9YLas0xpX8K7FMDeMx4YPq3jAsI
 0DLSDNm6ktdmfp4eYkvfVYfvteNBsW95OoUBF9wQYIZcZ3Snv7Hm5S47GKsN7fsLeMO5
 HWoNruK93QmWVdBLeT7yCstwikBquOCKB96+Qs2bdAijknDKdTCuZbS9dfbNs9ikW+Nu
 GfTkhejLsiA4AExqJLfONT+Kjo8e7oOQNr/4Aq6uSrzzdUJnPZO5JYPKpznlcAgmFciE
 xUYw==
X-Gm-Message-State: AOAM533dsjAMrQ7Bb4BqxP4IeJAWQU6B1Aic1S2pSj9bF9dxSx+wcfXM
 e32mTHj89TkC+t3q6aC/kc8gZtKqfuE=
X-Google-Smtp-Source: ABdhPJxgBvSF/YiRjsmtpBqHbSqgn1L2VQn52ZyQHKYhYYJwLa10hcXwnm/R4bg/81nF4Y4+YTCI2w==
X-Received: by 2002:a17:907:2d9f:: with SMTP id
 gt31mr57180ejc.544.1641825667566; 
 Mon, 10 Jan 2022 06:41:07 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k25sm2549498ejk.179.2022.01.10.06.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:41:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/18] meson: build all modules by default
Date: Mon, 10 Jan 2022 15:40:33 +0100
Message-Id: <20220110144034.67410-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110144034.67410-1-pbonzini@redhat.com>
References: <20220110144034.67410-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Li Zhang <lizhang@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With more recent versions of Meson, the build.ninja file is more selective
as to what is built by default, and not building the modules results in test
failures.

Mark the modules as built-by-default and, to make the dependencies more
precise, also require them to be up-to-date before running tests.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/801
Tested-by: Li Zhang <lizhang@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build             | 4 +++-
 tests/qtest/meson.build | 3 +--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 6489ff8425..703eefea13 100644
--- a/meson.build
+++ b/meson.build
@@ -2866,8 +2866,10 @@ common_ss.add(hwcore)
 # Targets #
 ###########
 
+emulator_modules = []
 foreach m : block_mods + softmmu_mods
-  shared_module(m.name(),
+  emulator_modules += shared_module(m.name(),
+                build_by_default: true,
                 name_prefix: '',
                 link_whole: m,
                 install: true,
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 37e1eaa449..26937deb6d 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -335,10 +335,9 @@ foreach dir : target_dirs
         test: executable(test, src, dependencies: deps)
       }
     endif
-    # FIXME: missing dependency on the emulator binary and qemu-img
     test('qtest-@0@/@1@'.format(target_base, test),
          qtest_executables[test],
-         depends: [test_deps, qtest_emulator],
+         depends: [test_deps, qtest_emulator, emulator_modules],
          env: qtest_env,
          args: ['--tap', '-k'],
          protocol: 'tap',
-- 
2.33.1



