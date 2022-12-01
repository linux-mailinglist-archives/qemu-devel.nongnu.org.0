Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2E363ED8C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 11:21:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ggF-0004DM-H2; Thu, 01 Dec 2022 05:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p0gfo-0004A3-CJ
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:20:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p0gfm-0006zz-FJ
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669890005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BPZJf5zp+vLhlwNhFFgRjX0pW2FfO0Ou2P4DPGMvnhA=;
 b=eQ5YisRYwamf6d/QkmOvwfdpARGFXP6rgzekXM5r6kiPKMjfSYghQZB4cy+ALc1BVno+n7
 EWzqPSwTn7X8Buk2Gjt6o9M+9LXGoK1inP0FqdXHfHLliEIzCIlaCGvrJWLe3xKKZGOQ6u
 hb44CmTKmWgAOZe5zDfam0RoijpnQAs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-Bik7iZrYOwCnRbHpfyMrPQ-1; Thu, 01 Dec 2022 05:20:02 -0500
X-MC-Unique: Bik7iZrYOwCnRbHpfyMrPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 963111C068C5;
 Thu,  1 Dec 2022 10:20:01 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4897B2166B49;
 Thu,  1 Dec 2022 10:20:01 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Lieven <pl@kamp.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, libvir-list@redhat.com,
 Kevin Wolf <kwolf@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/3] block: deprecate iSCSI 'password' in favour of
 'password-secret'
Date: Thu,  1 Dec 2022 05:19:58 -0500
Message-Id: <20221201101959.419545-3-berrange@redhat.com>
In-Reply-To: <20221201101959.419545-1-berrange@redhat.com>
References: <20221201101959.419545-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Support for referencing secret objects was added in

  commit b189346eb1784df95ed6fed610411dbf23d19e1f
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Thu Jan 21 14:19:21 2016 +0000

    iscsi: add support for getting CHAP password via QCryptoSecret API

The existing 'password' option is overdue for deprecation and
subsequent removal.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/iscsi.c             |  3 +++
 docs/about/deprecated.rst | 11 +++++++++++
 2 files changed, 14 insertions(+)

diff --git a/block/iscsi.c b/block/iscsi.c
index a316d46d96..58c0623052 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -1352,6 +1352,9 @@ static void apply_chap(struct iscsi_context *iscsi, QemuOpts *opts,
     } else if (!password) {
         error_setg(errp, "CHAP username specified but no password was given");
         return;
+    } else {
+        warn_report("iSCSI block driver 'password' option is deprecated, "
+                    "use 'password-secret' instead");
     }
 
     if (iscsi_set_initiator_username_pwd(iscsi, user, password)) {
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 93affe3669..2cc8924fe9 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -267,6 +267,17 @@ Options are:
     - move backing file to NVDIMM storage and keep ``pmem=on``
       (to have NVDIMM with persistence guaranties).
 
+Block driver options
+--------------------
+
+``iscsi,password=xxx`` (since 8.0)
+''''''''''''''''''''''''''''''''''
+
+Specifying the iSCSI password in plain text on the command line using the
+``password`` option is insecure. The ``password-secret`` option should be
+used instead, to refer to a ``--object secret...`` instance that provides
+a password via a file, or encrypted.
+
 Device options
 --------------
 
-- 
2.38.1


