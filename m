Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D152478695
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 09:55:49 +0100 (CET)
Received: from localhost ([::1]:37268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my91o-0007Jk-ED
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 03:55:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1my8zd-0005j4-P2
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 03:53:33 -0500
Received: from [2a00:1450:4864:20::52f] (port=36590
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1my8zc-0000VW-Dm
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 03:53:33 -0500
Received: by mail-ed1-x52f.google.com with SMTP id z5so5162486edd.3
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 00:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=81V16xIX0JIhefl7mz7PS6r5kdj/GpKG7VRFOhSofSU=;
 b=fC/X97iFE5gFtNZNFokse7Mx89YnVEWcb5X9cj1khnOQzWcBnXMYUClGBpVRCrIbBG
 XuZskiMTCm2mWuEzhgQvO5xGUoovBFkv66cru+cRsUdYPtJQPty4Cu0bIAY76BGo+mV1
 rXxQUYg/kNGtcrN08OcxRy8+TkohZ8GIxo7YdbfFitoKHJtuO1nLGcVUWOdxRPrcE17F
 cs0y/sGW3vfwgM3S7alncrBXLNv9MXfVlMFUdo+Z8nJSH3bHfbjGpwr4cSUP3USdwrUp
 jf/G7xEO5Ws4N3iT8Bsh6SEuyfheAlGThO/aAsOd1IgdXwh8Mv1tR0ArZn2GwuIdZ1KB
 rdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=81V16xIX0JIhefl7mz7PS6r5kdj/GpKG7VRFOhSofSU=;
 b=v5fSPmgJFjR02sz+h5fciEIwkGiVYy7u2AEx9RPS8ZnbFhB1Q4Vv48Mvajy5xj2oFq
 HAerAkbdwn17aQ9/78TA5/7DcU2mZtEa+Gf9AZ09Ki7hP8TlM5C2ZGDzhfgcxe9gOUIl
 V+1S+goRxzjAAHXRhpyUJs0xH4Q8nY6ZrDnv1WJjcNELGIjZ+RoTLsXl2rY2NBvv5MFl
 I8F60VjYN1+a2AwKLIlRPt94vE+xmhv5z4aha1C6ePxFj9gL+/U5jTSHgxkb89GyVdjk
 /3t9IUnnp/KlNjrh4OgRJylUPtufDHnHzU7/UXZ8k2pD5ynustsDKo6/Uh/TvoeXAHbU
 TSjw==
X-Gm-Message-State: AOAM533GYn3qg1IfKnM0A9hZMl477nJWxP4KIYo/oc6WAmGQwKqRyfEP
 bvuFKWBJzMuCiiLd1rYl9Y2QtI8W/gY=
X-Google-Smtp-Source: ABdhPJyTtHdK/K3vxEKKp4B2rEzlPpmbI2V1lSs7iOSnfJ6Ol78U3iTKsl/jbIQskWRTyq1b0/I0TQ==
X-Received: by 2002:a17:906:e118:: with SMTP id
 gj24mr1836027ejb.138.1639731210445; 
 Fri, 17 Dec 2021 00:53:30 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 nc21sm2596378ejc.100.2021.12.17.00.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 00:53:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: add "check" argument to run_command
Date: Fri, 17 Dec 2021 09:53:20 +0100
Message-Id: <20211217085320.131533-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson is planning to change the default of the "check" argument to
run_command (from false to true).  Be explicit and include it in
all invocations.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/meson.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/meson.build b/docs/meson.build
index 27c6e156ff..57b28a3146 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -18,12 +18,12 @@ if sphinx_build.found()
   # This is a bit awkward but works: create a trivial document and
   # try to run it with our configuration file (which enforces a
   # version requirement). This will fail if sphinx-build is too old.
-  run_command('mkdir', ['-p', tmpdir / 'sphinx'])
-  run_command('touch', [tmpdir / 'sphinx/index.rst'])
+  run_command('mkdir', ['-p', tmpdir / 'sphinx'], check: true)
+  run_command('touch', [tmpdir / 'sphinx/index.rst'], check: true)
   sphinx_build_test_out = run_command(SPHINX_ARGS + [
     '-c', meson.current_source_dir(),
     '-b', 'html', tmpdir / 'sphinx',
-    tmpdir / 'sphinx/out'])
+    tmpdir / 'sphinx/out'], check: false)
   build_docs = (sphinx_build_test_out.returncode() == 0)
 
   if not build_docs
-- 
2.33.1


