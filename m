Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7866E6EEDD1
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 07:59:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prYA8-00065k-E3; Wed, 26 Apr 2023 01:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA3-00064m-D8
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prYA0-0002kc-Lo
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682488667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HkFgjMWt5KNaHGBR9CmQxE75XwMh5eMqRnxwnsHCttM=;
 b=LZxU53zPZUcN3msbHNrz9PYSlVIvCIdA3klA/mz5nFfNzYaP9PLXhlKaG6scNs2AC2lM+h
 9AkeLGtreqeBgKqoo5qSZ8dC0jaYvgN8w/fB6Jkmi8MszHWB8hzXOHyyeoK3Hc69GYHf1P
 M0WsY3GQZunjtoCt2ewqztwzpnbmXdQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-ESpqf9EbPLihiwjWtMEz6Q-1; Wed, 26 Apr 2023 01:57:45 -0400
X-MC-Unique: ESpqf9EbPLihiwjWtMEz6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C829811E7C;
 Wed, 26 Apr 2023 05:57:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B48E2027043;
 Wed, 26 Apr 2023 05:57:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 21EC321F1675; Wed, 26 Apr 2023 07:57:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 02/17] qapi/schema: Use super()
Date: Wed, 26 Apr 2023 07:57:29 +0200
Message-Id: <20230426055744.1041930-3-armbru@redhat.com>
In-Reply-To: <20230426055744.1041930-1-armbru@redhat.com>
References: <20230426055744.1041930-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

Commit 2cae67bcb5e (qapi: Use super() now we have Python 3) converted
the code to super().  Shortly after, commit f965e8fea6a (qapi: New
special feature flag "deprecated") neglected to use super().  Convert
it now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230316071325.492471-3-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 scripts/qapi/schema.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 207e4d71f3..719152fe49 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -259,7 +259,7 @@ def need_has_if_optional(self):
         return not self.c_type().endswith(POINTER_SUFFIX)
 
     def check(self, schema):
-        QAPISchemaEntity.check(self, schema)
+        super().check(schema)
         for feat in self.features:
             if feat.is_special():
                 raise QAPISemError(
-- 
2.39.2


