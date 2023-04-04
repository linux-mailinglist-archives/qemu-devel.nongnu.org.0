Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A00C6D5FC8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 14:01:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjfKB-0002UO-4t; Tue, 04 Apr 2023 07:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjfJs-0002MX-E1
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 07:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjfJo-0007wm-5g
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 07:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680609559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VnxLbM0Va8S/aQQZYDkwlEv8fK9E2Nvu8w2kOcTXqAE=;
 b=Mf9Az/tIChW8ZGpV3QkPjxbEUJ+UWJZUJPLwW1OOY9jSv4sETu83n93wpgYyJ8ixwdYtS+
 IX5H4lu0yL1SwNtC1PbBEQUCgyW36HvG9F4+5sa/qdA1x5r9wQIWG7Sf/fNfIbZ16ZL2+n
 rN0X/8Z+lXyPjC/p2KHP9PRY5esUEVA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-T6TaEiYNOayTONUS51Qw8w-1; Tue, 04 Apr 2023 07:59:16 -0400
X-MC-Unique: T6TaEiYNOayTONUS51Qw8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83521100DEA9;
 Tue,  4 Apr 2023 11:59:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60E7AC158BA;
 Tue,  4 Apr 2023 11:59:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D407021E669A; Tue,  4 Apr 2023 13:59:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, eblake@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 arei.gonglei@huawei.com, pizhenwei@bytedance.com, jsnow@redhat.com,
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, quintela@redhat.com, jasowang@redhat.com,
 yuval.shaia.ml@gmail.com, stefanha@redhat.com, kraxel@redhat.com,
 kkostiuk@redhat.com, qemu-block@nongnu.org
Subject: [PATCH 08/16] qapi: Delete largely misleading "Stability
 Considerations"
Date: Tue,  4 Apr 2023 13:59:04 +0200
Message-Id: <20230404115912.2829251-9-armbru@redhat.com>
In-Reply-To: <20230404115912.2829251-1-armbru@redhat.com>
References: <20230404115912.2829251-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Documentation section "Stability Considerations" dates back to the
early days of QMP (commit 82a56f0d83d (Monitor: Introduce the
qmp-commands.hx file)).  It became largely misleading years ago.
Delete it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/qapi-schema.json | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 7c09af5cc8..e57d8ff801 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -28,28 +28,6 @@
 #
 # Please, refer to the QMP specification (docs/interop/qmp-spec.txt) for
 # detailed information on the Server command and response formats.
-#
-# = Stability Considerations
-#
-# The current QMP command set (described in this file) may be useful for a
-# number of use cases, however it's limited and several commands have bad
-# defined semantics, specially with regard to command completion.
-#
-# These problems are going to be solved incrementally in the next QEMU releases
-# and we're going to establish a deprecation policy for badly defined commands.
-#
-# If you're planning to adopt QMP, please observe the following:
-#
-#     1. The deprecation policy will take effect and be documented soon, please
-#        check the documentation of each used command as soon as a new release of
-#        QEMU is available
-#
-#     2. DO NOT rely on anything which is not explicit documented
-#
-#     3. Errors, in special, are not documented. Applications should NOT check
-#        for specific errors classes or data (it's strongly recommended to only
-#        check for the "error" key)
-#
 ##
 
 { 'include': 'pragma.json' }
-- 
2.39.2


