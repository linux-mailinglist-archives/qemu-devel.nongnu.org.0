Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950E96982A7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:48:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLsb-0005Kn-FL; Wed, 15 Feb 2023 12:47:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSLsY-0005Gt-Ng
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:47:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSLsX-0005Et-9Z
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:47:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676483256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0e1HLlzsJGEHoE0lVggAi5If9lXbDs+2yHmSIZimhp8=;
 b=KV6x2uNWsIUWjs1j8E+IkAf+UmY5kG01y0+lXVYnDSjk08I2g9G2KpcbFLM7AvZ39VOURM
 vtLDEmaR71M6Q+vLRijenKF95DuEhvNbggf4m+y15UKzZRzoGZ5spsKl02Vb9xnujTyRCj
 y8bZ2cnjxGtfmmI8/IrtjYK5rVUCU8o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-6hB9qYd-PryJ9Jvm9aCmYg-1; Wed, 15 Feb 2023 12:47:26 -0500
X-MC-Unique: 6hB9qYd-PryJ9Jvm9aCmYg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69C9E817077;
 Wed, 15 Feb 2023 17:47:24 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F9424014D03;
 Wed, 15 Feb 2023 17:47:22 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, libvir-list@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Lieven <pl@kamp.de>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PULL 4/5] block: deprecate iSCSI 'password' in favour of
 'password-secret'
Date: Wed, 15 Feb 2023 17:47:11 +0000
Message-Id: <20230215174712.1894516-5-berrange@redhat.com>
In-Reply-To: <20230215174712.1894516-1-berrange@redhat.com>
References: <20230215174712.1894516-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/iscsi.c             | 3 +++
 docs/about/deprecated.rst | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/block/iscsi.c b/block/iscsi.c
index b3e10f40b6..ed3e87a548 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -1353,6 +1353,9 @@ static void apply_chap(struct iscsi_context *iscsi, QemuOpts *opts,
     } else if (!password) {
         error_setg(errp, "CHAP username specified but no password was given");
         return;
+    } else {
+        warn_report("iSCSI block driver 'password' option is deprecated, "
+                    "use 'password-secret' instead");
     }
 
     if (iscsi_set_initiator_username_pwd(iscsi, user, password)) {
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index cb1ec72347..d31ffa86d4 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -301,6 +301,14 @@ The above, converted to the current supported format::
 
   json:{"file.driver":"rbd", "file.pool":"rbd", "file.image":"name"}
 
+``iscsi,password=xxx`` (since 8.0)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Specifying the iSCSI password in plain text on the command line using the
+``password`` option is insecure. The ``password-secret`` option should be
+used instead, to refer to a ``--object secret...`` instance that provides
+a password via a file, or encrypted.
+
 Backwards compatibility
 -----------------------
 
-- 
2.39.1


