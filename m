Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51833651C7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 07:20:32 +0200 (CEST)
Received: from localhost ([::1]:35196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYioJ-0000eh-Ab
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 01:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lYinC-0008Fr-7I
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 01:19:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lYin7-0008S3-Gy
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 01:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618895956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZhCa7l2wiQmUTGU224g+Kh7PEm05KfAd05S38f/j5q8=;
 b=fk4mokWgBOU2Vo9kbUlnMdjXAZrppvMCxI2xFUwWBENVPOIYgX4rNeRzstbk5lAkw5PlAU
 jOoTu5lgWiuAI/FA7kjzP8h584xWFok3uX2OgBFWuRZvRM0JzirPXGDuxgOhpau+YEkg/d
 Po+pBdgQSYQUJqbNjvrLjXbm3nge/u0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-mRH4ujwgN_Gi0lZyKYCjQw-1; Tue, 20 Apr 2021 01:19:12 -0400
X-MC-Unique: mRH4ujwgN_Gi0lZyKYCjQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D65A501EC;
 Tue, 20 Apr 2021 05:19:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C91C8614F5;
 Tue, 20 Apr 2021 05:19:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 59350113525D; Tue, 20 Apr 2021 07:19:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] migration: Deprecate redundant query-migrate result @blocked
Date: Tue, 20 Apr 2021 07:19:06 +0200
Message-Id: <20210420051907.891470-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, dgilbert@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Result @blocked is true when and only when result @blocked-reasons is
present.  It's always non-empty when present.  @blocked is redundant.
It was introduced in commit 3af8554bd0 "migration: Add blocker
information", and has not been released.  This gives us a chance to
fix the interface with minimal fuss.

Unfortunately, we're already too close to the release to risk dropping
it.  Deprecate it instead.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
This is alternative to "[PATCH v2] migration: Drop redundant
query-migrate result @blocked".

 qapi/migration.json | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 9bf0bc4d25..0b17cce46b 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -224,9 +224,14 @@
 #        only returned if VFIO device is present, migration is supported by all
 #        VFIO devices and status is 'active' or 'completed' (since 5.2)
 #
+# @blocked-reasons: A list of reasons an outgoing migration is blocked.
+#                   Present and non-empty when migration is blocked.
+#                   (since 6.0)
+#
 # @blocked: True if outgoing migration is blocked (since 6.0)
 #
-# @blocked-reasons: A list of reasons an outgoing migration is blocked (since 6.0)
+# Features:
+# @deprecated: Member @blocked is deprecated.  Use @blocked-reasons instead.
 #
 # Since: 0.14
 ##
@@ -241,7 +246,7 @@
            '*setup-time': 'int',
            '*cpu-throttle-percentage': 'int',
            '*error-desc': 'str',
-           'blocked': 'bool',
+           'blocked': { 'type': 'bool', 'features': [ 'deprecated' ] },
            '*blocked-reasons': ['str'],
            '*postcopy-blocktime' : 'uint32',
            '*postcopy-vcpu-blocktime': ['uint32'],
-- 
2.26.3


