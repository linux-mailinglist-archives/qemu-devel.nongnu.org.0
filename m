Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E093B206F11
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 10:39:10 +0200 (CEST)
Received: from localhost ([::1]:39426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo0w2-0002nz-16
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 04:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo0uh-0000YZ-1x
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 04:37:47 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23849
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo0ue-00023t-Vx
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 04:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592987864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d/zNBLVNetSddXJjo9hxS9J+W0d8hwauSV+gbhSfTCE=;
 b=C7aQnuPLJwon4mLqO9K2cB7IXHTzxOi5ey3TRYrZSm2DFMBGG/uisxwXzS9NtznvFd1UKH
 hcjRUo6jOF8/xtAvMLah+9mNGYOIOuAOur+s1A6ddhYSjP+1RYyESNQRc9kFBQ07ywB36Z
 s0q67ESES5escJ5hhjPyNMtl6449W28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-WtYsYTXpN6m1AxWlJlCM0w-1; Wed, 24 Jun 2020 04:37:42 -0400
X-MC-Unique: WtYsYTXpN6m1AxWlJlCM0w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92163805EE3
 for <qemu-devel@nongnu.org>; Wed, 24 Jun 2020 08:37:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61C581A836;
 Wed, 24 Jun 2020 08:37:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9D10F1138478; Wed, 24 Jun 2020 10:37:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/25] test-util-filemonitor: Plug unlikely memory leak
Date: Wed, 24 Jun 2020 10:37:22 +0200
Message-Id: <20200624083737.3086768-11-armbru@redhat.com>
In-Reply-To: <20200624083737.3086768-1-armbru@redhat.com>
References: <20200624083737.3086768-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 01:59:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

test_file_monitor_events() leaks an Error object when
qemu_file_monitor_add_watch() fails, which seems unlikely.  Plug it.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/test-util-filemonitor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/test-util-filemonitor.c b/tests/test-util-filemonitor.c
index 45009c69f4..8f0eff3d03 100644
--- a/tests/test-util-filemonitor.c
+++ b/tests/test-util-filemonitor.c
@@ -495,6 +495,7 @@ test_file_monitor_events(void)
             if (*op->watchid < 0) {
                 g_printerr("Unable to add watch %s",
                            error_get_pretty(local_err));
+                error_free(local_err);
                 goto cleanup;
             }
             if (debug) {
-- 
2.26.2


