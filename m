Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5246F158E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:31:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLLq-0006KL-Mb; Fri, 28 Apr 2023 06:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLLj-0006HY-Aa
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:29:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLLh-0007LS-EY
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:29:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682677747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jp8mTGBqHpqbEeTVZ+cx0ZldVkRObCyxgoVbA5vW9dY=;
 b=DViII9Uk6RNQmVpGUK3oHKOVPu6hxfMQCcezp0d40g7XgpbwzmXAO4s8TmeCzslVP9ALcj
 g+MFyo54zgZ55Cf31fL07+FJ6QZzDUuOyYvKMmWEn8v4FcIAcNUwgA9lLPyaMoHaS0NFKb
 e3BwgSVxqnGjqgDkJtY9PNMbqWlNAGg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-RwsA6zvBM6umeENTH4KhdA-1; Fri, 28 Apr 2023 06:29:03 -0400
X-MC-Unique: RwsA6zvBM6umeENTH4KhdA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DA69102F22D;
 Fri, 28 Apr 2023 10:29:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49F22492C13;
 Fri, 28 Apr 2023 10:29:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4CC3A21D191A; Fri, 28 Apr 2023 12:29:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 08/17] qapi: Delete largely misleading "Stability
 Considerations"
Date: Fri, 28 Apr 2023 12:28:52 +0200
Message-Id: <20230428102901.1685375-9-armbru@redhat.com>
In-Reply-To: <20230428102901.1685375-1-armbru@redhat.com>
References: <20230428102901.1685375-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230425064223.820979-9-armbru@redhat.com>
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


