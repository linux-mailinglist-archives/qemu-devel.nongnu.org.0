Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFAE303A3E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 11:29:59 +0100 (CET)
Received: from localhost ([::1]:49934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Lbi-0005cu-Le
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 05:29:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l4LZi-0004Nx-0F
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:27:54 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:45332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l4LZg-0007l5-J5
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:27:53 -0500
Received: by mail-ed1-x52a.google.com with SMTP id f1so19048253edr.12
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 02:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vpbJczO3PVsciaR6dMpar4XfrjbgrNpROnA6WnjqUUQ=;
 b=BVdWHnjWq17R82pb9/LD2X7vu8go+rsDgHnYi5v9Ueqmp9Anuj+8vSdR/nyeFlFRT6
 izlCAVZGQ7FrVRMT9alRtgt4zNVhkc9jgS4aE2K1uP7Nh7KkAebpy0U18njY/PBNx3P0
 QFwdDeVqsr6/OTVwOGJxP40tfNx7EKWJZAed38Wl/Ojq+IKiymTm3sRd8x7bRh1ipdAQ
 f/bUt0PLZKYVIylcZSyEM/qM5K4a6Hn3HM9J7hhbE+NnmMIRFDRzsGopjh8Cwdk2KHWb
 BmxqlTOmJCim4tUIrHTF0o+ORBNGRbQHddNlkpa9ZW5jKusJqX5sLoMmIt+v/clxuOnZ
 xHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=vpbJczO3PVsciaR6dMpar4XfrjbgrNpROnA6WnjqUUQ=;
 b=EVTKBVns+sYUWp8BxfJyf1NsKS6qH/cOFnNYgRMjwN1z/e+4pz9KUs8tB5rwHiwwaD
 5yFBIsWq0TlIgKiVElR2aVwwysv+DUXBrRgwqyPd28KTtqRm0jkXFSnqsXmb8FdZiIF6
 pw01u2cuZy0LwdHwUjr3sQX/Pqn4k7iD9sqDHQ1Zwgk6Vum7/IUu3H0jL9Gk/FgntH3n
 1DQCp4+ne5VO3C0TjjRdJi6qSKZUo2U3+reLnM7M6ec6QodotfU154sQ2AL0eWsUKUk1
 OIezhO3Gixj50musb2gs0olRDeCF18La3psAnqSqgVpi11v1x5UE4oY6OTzhCWnXqihT
 NPdA==
X-Gm-Message-State: AOAM533Yhk8XLS/fD+QePojULlZg0RxQocTQ5gRa7Rdv6O3WCink6KYT
 H75ncwNFG8VRpaHsdFe8vvqE8DD9qZk8hw==
X-Google-Smtp-Source: ABdhPJxAS4ktkAOcxPB2divLg5e1QE/8QTmfsNUzBlmhs8PPm1KYWXOIH4f3nmCBpg/mKKuhCJYHTA==
X-Received: by 2002:aa7:d44c:: with SMTP id q12mr3994390edr.368.1611656870819; 
 Tue, 26 Jan 2021 02:27:50 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 bo12sm9447907ejb.93.2021.01.26.02.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 02:27:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: honor --enable-rbd if cc.links test fails
Date: Tue, 26 Jan 2021 11:27:48 +0100
Message-Id: <20210126102748.341403-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pl@kamp.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the link test failed, compilation proceeded with RBD disabled,
even if --enable-rbd was used on the configure command line.
Fix that.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/meson.build b/meson.build
index f991d4274d..5943aa8a51 100644
--- a/meson.build
+++ b/meson.build
@@ -690,15 +690,21 @@ if not get_option('rbd').auto() or have_block
   librbd = cc.find_library('rbd', has_headers: ['rbd/librbd.h'],
                            required: get_option('rbd'),
                            kwargs: static_kwargs)
-  if librados.found() and librbd.found() and cc.links('''
-    #include <stdio.h>
-    #include <rbd/librbd.h>
-    int main(void) {
-      rados_t cluster;
-      rados_create(&cluster, NULL);
-      return 0;
-    }''', dependencies: [librbd, librados])
-    rbd = declare_dependency(dependencies: [librbd, librados])
+  if librados.found() and librbd.found()
+    if cc.links('''
+      #include <stdio.h>
+      #include <rbd/librbd.h>
+      int main(void) {
+        rados_t cluster;
+        rados_create(&cluster, NULL);
+        return 0;
+      }''', dependencies: [librbd, librados])
+      rbd = declare_dependency(dependencies: [librbd, librados])
+    elif get_option('rbd').enabled()
+      error('could not link librados')
+    else
+      warning('could not link librados, disabling')
+    endif
   endif
 endif
 
-- 
2.29.2


