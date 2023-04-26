Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B396EEDD5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 07:59:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prYAZ-0006LR-KD; Wed, 26 Apr 2023 01:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA6-00065t-F1
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA3-0002lm-Ax
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682488670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TwSYfDyBRyKjYd0qorhEVRpu+/fW7H3hiS6a+ZmTNO8=;
 b=FlzbeMSVtfKQZdlrO+I+cX6Mo/Wsx9NvXtPB9bjwyhWyLZ7GLaHsIjkI6RyIbz07NkDi9Z
 LhuiZpDBdFlORrx6x/fIKz3sVpm5UJ3mkbfRIGtMt0SyveaBIUWfPdlG3sA6O9WIH1Lo0b
 N/USKE1C1CSQ1ozB3ExczOf1L2c3vkM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-RO7iImjANg-daR-jRfXUwg-1; Wed, 26 Apr 2023 01:57:46 -0400
X-MC-Unique: RO7iImjANg-daR-jRfXUwg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D04987A9E2;
 Wed, 26 Apr 2023 05:57:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D25C2166B41;
 Wed, 26 Apr 2023 05:57:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 31BC121F9818; Wed, 26 Apr 2023 07:57:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Eric Blake <eblake@redhat.com>
Subject: [PULL 09/17] tests/qapi-schema: Improve union discriminator coverage
Date: Wed, 26 Apr 2023 07:57:36 +0200
Message-Id: <20230426055744.1041930-10-armbru@redhat.com>
In-Reply-To: <20230426055744.1041930-1-armbru@redhat.com>
References: <20230426055744.1041930-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

A union's 'discriminator' must name one of the common members.
QAPISchemaVariants.check() looks it up by its c_name(), then checks
the name matches exactly (because c_name() is not injective).

Tests union-base-empty and union-invalid-discriminator both cover the
case where lookup fails.  Repurpose the latter to cover the case where
it succeeds and the name check fails.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230316071325.492471-10-armbru@redhat.com
Reviewed-by: Eric Blake <eblake@redhat.com>
[Commit message typo fixed]
---
 tests/qapi-schema/union-invalid-discriminator.err  | 2 +-
 tests/qapi-schema/union-invalid-discriminator.json | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qapi-schema/union-invalid-discriminator.err b/tests/qapi-schema/union-invalid-discriminator.err
index 38efb24b98..6bd774c156 100644
--- a/tests/qapi-schema/union-invalid-discriminator.err
+++ b/tests/qapi-schema/union-invalid-discriminator.err
@@ -1,2 +1,2 @@
 union-invalid-discriminator.json: In union 'TestUnion':
-union-invalid-discriminator.json:10: discriminator 'enum_wrong' is not a member of 'base'
+union-invalid-discriminator.json:10: discriminator 'type_tag' is not a member of 'base'
diff --git a/tests/qapi-schema/union-invalid-discriminator.json b/tests/qapi-schema/union-invalid-discriminator.json
index c4fce97362..f315f36e37 100644
--- a/tests/qapi-schema/union-invalid-discriminator.json
+++ b/tests/qapi-schema/union-invalid-discriminator.json
@@ -8,7 +8,7 @@
   'data': { 'integer': 'int' } }
 
 { 'union': 'TestUnion',
-  'base': { 'enum1': 'TestEnum' },
-  'discriminator': 'enum_wrong',
+  'base': { 'type-tag': 'TestEnum' },
+  'discriminator': 'type_tag',
   'data': { 'value1': 'TestTypeA',
             'value2': 'TestTypeB' } }
-- 
2.39.2


