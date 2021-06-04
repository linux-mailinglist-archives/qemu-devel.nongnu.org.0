Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC06C39BBA2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:19:38 +0200 (CEST)
Received: from localhost ([::1]:52962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpBbl-000296-RP
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa5-0007mP-Q2
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:53 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:34721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa3-0008DS-82
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:53 -0400
Received: by mail-ed1-x534.google.com with SMTP id cb9so11615262edb.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PjUTCXCnxwAcJKYCDMyAMuStN1x2DBiriMNfDrPFCPg=;
 b=LeSCSxgBbCM/8lxCi6h8l7Y53wIESzK0wpCe33YliSU9fdLsRZqoCfGCoMKQvvYj4w
 Odqa2FolQjmO+PFxOm4wOFiwHnpPiHYGRGk9DwQaijU/doR2i0F/mBoSgSyhOCNYD1S3
 cE7eq7wgir5WDBR1LdUp+a+ifxugelWmmXSebxsALb0Qfq13badvUh4SUMYv3T/pRxgs
 nGg9AnDwD3iASavD5xFVmQRjlsVTOHXzaowX5croDyckpJIOSkQM7TFDwAG4dhH9dM3W
 VVLmSHznjrrqtkm+sXWzCRP97mK4HT48V7Zjx0VoQIjpOjpb9ci3Vo+SCMyUMZ4Fjdct
 /KLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PjUTCXCnxwAcJKYCDMyAMuStN1x2DBiriMNfDrPFCPg=;
 b=jFEw9b73/DePjHIGOJp18TWduBICWp3bxD8SKasJEcay0Xioo9swym9DW4Mfs0hZMF
 gx1L5PCIw+JmOLdtP4rmaQs7wUS9lJ3f+D4JffcD1bta5P35pqx0RSMLmJU3ch25lp5s
 ZW4WlRzH8hd0EnjJxAMwyWs+6c349S7IAa82G7zX0xt2mcUrR5w0L882DIcwaBG2xQ1x
 yUB5Or3P6KImJEhnqmVcun9SWfpWkRCzG/y0CwvVEgjZpD7JNVdo2SdY7pGh7Z3b8sT7
 uB4SRyB0JnheD5iwVoQKjotIFEKwtN+3tyyv5rfwUQULF6e3GPRK3EHhIjYYX82Fr/V/
 EGvA==
X-Gm-Message-State: AOAM530IL8iwieUlHcb4NgX6hXn6PieZG4WdAPqevtmy3m/MnA2zmxDJ
 WCqZDfgi+iwCXwntX21SW5tAfwioLxmtXA==
X-Google-Smtp-Source: ABdhPJwgTljB7IZK8lGbWA2j7i0a+f0jBt2DjKOEoC3YxCJ1gvGVSho7hYSFRuZ2XQwrh6kJnwwhCA==
X-Received: by 2002:a05:6402:1d38:: with SMTP id
 dh24mr5358474edb.18.1622819868124; 
 Fri, 04 Jun 2021 08:17:48 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 w1sm2402451eds.37.2021.06.04.08.17.47 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:17:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/13] meson: allow optional dependencies for block modules
Date: Fri,  4 Jun 2021 17:17:33 +0200
Message-Id: <20210604151745.310318-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604151745.310318-1-pbonzini@redhat.com>
References: <20210604151745.310318-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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



