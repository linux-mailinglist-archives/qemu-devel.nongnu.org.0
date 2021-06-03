Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109CF39A1DB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 15:09:42 +0200 (CEST)
Received: from localhost ([::1]:55852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lon6T-0000Em-2b
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 09:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lon4f-0006lF-2q; Thu, 03 Jun 2021 09:07:49 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lon4b-0004Ke-H2; Thu, 03 Jun 2021 09:07:48 -0400
Received: by mail-ej1-x635.google.com with SMTP id jt22so9137109ejb.7;
 Thu, 03 Jun 2021 06:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PjUTCXCnxwAcJKYCDMyAMuStN1x2DBiriMNfDrPFCPg=;
 b=uoPHpjDYiu49RLQyosQbgmTNGi5rgSvjap2bPvzIwFdKGkpRbQEFsYfIFqeRt90bCy
 JmMZvRiGFYXa17ri9mMGL1o1Hxq3zY2P1JgfynltlOvrz/d2Vp6oIu4CU+fxMei6xqyI
 /lKQhyhpgxsIlTrgGjoYpO4UG6Is+Vlxh3FIhTp/7YS9kEfogd18/uNVX+kXx02QUfv2
 EGZwgfvI2zBjKtj/Qp/pGkpi7iFviesfeqoebuU/SHgTugAWVAKM/9qbmNuUld4/ayDJ
 cbq8ySeciNnVKUEJRqzJFXFVdWGOO9CZ3tcWs5gj5QP0OGNjhyGSMdaOWE24uiH8+ert
 VjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PjUTCXCnxwAcJKYCDMyAMuStN1x2DBiriMNfDrPFCPg=;
 b=VbTWm2ILuPLOHUMMcbMJm1MtAWurMZQF4y9z4zQPW7H03EMxZuk5kEj65WMgKWDMfa
 lm0yL0e0LnNHyPQTTyI4ifCsawuU2tpIiEaPhXgLJR0ygnI9L7ntBotdbT84IVCbQu0J
 z94jTit3scuLvcGnIMmtdbu880+gVDLkPzwxJrnCri7s9ZqYlt8K6tbpBuKEENNmrKoN
 qdB1G9rkwRffbxzDBurMbxjCpyWLOVkJoSHdHmoLvKpMc0f4eFECdgqrpr64QCFbZM/L
 2/ADoj+yucVj+1S78LpHFsAExFbInjqM4xrpGZzffna/sLVBXleo3wlMweM6GtmvhA2c
 kovg==
X-Gm-Message-State: AOAM53020sg8M/nFFPhmgaPP8MNUcA6VSrzq65OKmBbcNRfigIe1659X
 pVMzO9+OjjDYIEWdKJrR+QGxE6m2BHseJA==
X-Google-Smtp-Source: ABdhPJzdCITPj+JvRIkrqn6N9yeiByZaOqg/K6U5iLkC6MpkgJCh0OTzFy8WyML/MGPcPjipjZKkFQ==
X-Received: by 2002:a17:906:5495:: with SMTP id
 r21mr39734072ejo.471.1622725662759; 
 Thu, 03 Jun 2021 06:07:42 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dh18sm1734855edb.92.2021.06.03.06.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 06:07:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] meson: allow optional dependencies for block modules
Date: Thu,  3 Jun 2021 15:07:31 +0200
Message-Id: <20210603130732.208065-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603130732.208065-1-pbonzini@redhat.com>
References: <20210603130732.208065-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Right now all dependencies for block modules are passed to
module_ss.add(when: ...), so they are mandatory.  In the next patch we
will need to add a libm dependency to a module, but libm does not exist
on all systems.  So, modify the creation of module_ss and modsrc so that
dependencies can also be passed to module_ss.add(if_true: ...).

While touching the array, remove the useless dependency of the curl
module on glib.  glib is always linked in QEMU and in fact all other
block modules also need it, but they don't have to specify it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/meson.build | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/block/meson.build b/block/meson.build
index e687c54dbc..9e3388f633 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -71,19 +71,19 @@ block_modules = {}
 
 modsrc = []
 foreach m : [
-  [curl, 'curl', [curl, glib], 'curl.c'],
-  [glusterfs, 'gluster', glusterfs, 'gluster.c'],
-  [libiscsi, 'iscsi', libiscsi, 'iscsi.c'],
-  [libnfs, 'nfs', libnfs, 'nfs.c'],
-  [libssh, 'ssh', libssh, 'ssh.c'],
-  [rbd, 'rbd', rbd, 'rbd.c'],
+  [curl, 'curl', files('curl.c')],
+  [glusterfs, 'gluster', files('gluster.c')],
+  [libiscsi, 'iscsi', files('iscsi.c')],
+  [libnfs, 'nfs', files('nfs.c')],
+  [libssh, 'ssh', files('ssh.c')],
+  [rbd, 'rbd', files('rbd.c')],
 ]
   if m[0].found()
+    module_ss = ss.source_set()
+    module_ss.add(when: m[0], if_true: m[2])
     if enable_modules
-      modsrc += files(m[3])
+      modsrc += module_ss.all_sources()
     endif
-    module_ss = ss.source_set()
-    module_ss.add(when: m[2], if_true: files(m[3]))
     block_modules += {m[1] : module_ss}
   endif
 endforeach
-- 
2.31.1



