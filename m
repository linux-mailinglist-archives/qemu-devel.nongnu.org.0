Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5646B9B5E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 17:27:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc7TI-0004wI-Qf; Tue, 14 Mar 2023 12:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pc7TG-0004vr-7t
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:25:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pc7TE-0007Ol-No
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:25:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678811151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YEhKNNUpu43nt0FhEIjxrA8c7Ezo/43mhsjavc4XYZU=;
 b=Pn8G7OxAQVcyhd43Lg+IjiX8jeA0uBh0rSh1Yo+Xc0wpRZxL+ezs/UmmNeKni1SO8fpLGc
 4WXAEcnp9SD44dy/JlAn48WHLnqxVa7Ko5nQ6hkoDTEdGp0n+kyNftFe8D+/XtSVWQoor/
 rSXHRdHn2NT6ZczDH/i/h5LeFh3dfsg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-HJVhwIRUNyGVCVlkUm0Ffg-1; Tue, 14 Mar 2023 12:25:47 -0400
X-MC-Unique: HJVhwIRUNyGVCVlkUm0Ffg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B96C81B081;
 Tue, 14 Mar 2023 16:25:46 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 393CC4042AC4;
 Tue, 14 Mar 2023 16:25:44 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Lieven <pl@kamp.de>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, qemu-block@nongnu.org,
 libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Willem van de Velde <williamvdvelde@gmail.com>
Subject: [PULL 1/3] Add qemu qcode support for keys F13 to F24
Date: Tue, 14 Mar 2023 16:25:38 +0000
Message-Id: <20230314162540.385954-2-berrange@redhat.com>
In-Reply-To: <20230314162540.385954-1-berrange@redhat.com>
References: <20230314162540.385954-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

From: Willem van de Velde <williamvdvelde@gmail.com>

To be able to use the function keys F13 to F24 these should be defined in de keycodemapdb and added to the qapi.
The keycodemapdb is updated in its own repository, this patch enables the use of those keys within qemu.

Signed-off-by: Willem van de Velde <williamvdvelde@gmail.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qapi/ui.json    | 15 ++++++++++++++-
 ui/keycodemapdb |  2 +-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 0abba3e930..98322342f7 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -886,6 +886,19 @@
 # @lang1: since 6.1
 # @lang2: since 6.1
 #
+# @f13: since 8.0
+# @f14: since 8.0
+# @f15: since 8.0
+# @f16: since 8.0
+# @f17: since 8.0
+# @f18: since 8.0
+# @f19: since 8.0
+# @f20: since 8.0
+# @f21: since 8.0
+# @f22: since 8.0
+# @f23: since 8.0
+# @f24: since 8.0
+#
 # 'sysrq' was mistakenly added to hack around the fact that
 # the ps2 driver was not generating correct scancodes sequences
 # when 'alt+print' was pressed. This flaw is now fixed and the
@@ -918,7 +931,7 @@
             'volumeup', 'volumedown', 'mediaselect',
             'mail', 'calculator', 'computer',
             'ac_home', 'ac_back', 'ac_forward', 'ac_refresh', 'ac_bookmarks',
-            'lang1', 'lang2' ] }
+            'lang1', 'lang2','f13','f14','f15','f16','f17','f18','f19','f20','f21','f22','f23','f24' ] }
 
 ##
 # @KeyValueKind:
diff --git a/ui/keycodemapdb b/ui/keycodemapdb
index d21009b1c9..f5772a62ec 160000
--- a/ui/keycodemapdb
+++ b/ui/keycodemapdb
@@ -1 +1 @@
-Subproject commit d21009b1c9f94b740ea66be8e48a1d8ad8124023
+Subproject commit f5772a62ec52591ff6870b7e8ef32482371f22c6
-- 
2.39.2


