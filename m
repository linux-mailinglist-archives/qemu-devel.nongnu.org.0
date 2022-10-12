Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C968E5FC892
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 17:41:21 +0200 (CEST)
Received: from localhost ([::1]:58196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oidrE-0004LM-Kz
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 11:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oidoD-0006ia-HX
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:38:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oido8-0001E5-C8
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:38:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665589086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vu2BDGvGheYQIOeqRYZ1hohehzucKNLtNnhUERa5vag=;
 b=c+lPyJVkoGQUi7sCm1WTC+Ri2/GTsKK6ZyzDFUJS4lvLdVGdbEgqdXmuU93XIogBsWIW4N
 zdb3XwwFcCnzqxolIyJZB2Dym8P/sK2dHAZ5YIGPGyHUIeMKKzcJvn3/cSEeMAHozGHd6M
 IQTzS7gqKfd31tRcS80Wg33EL5aU/F4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-vZZZFTI4PyWhAb4x1vliSw-1; Wed, 12 Oct 2022 11:38:03 -0400
X-MC-Unique: vZZZFTI4PyWhAb4x1vliSw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D415381A722;
 Wed, 12 Oct 2022 15:38:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1CC92156897;
 Wed, 12 Oct 2022 15:38:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 735CF21E6939; Wed, 12 Oct 2022 17:38:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com, lvivier@redhat.com, amit@kernel.org,
 mst@redhat.com, pbonzini@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, thuth@redhat.com, david@redhat.com
Subject: [PATCH 3/4] qtest: Improve error messages when property can not be
 set right now
Date: Wed, 12 Oct 2022 17:38:00 +0200
Message-Id: <20221012153801.2604340-4-armbru@redhat.com>
In-Reply-To: <20221012153801.2604340-1-armbru@redhat.com>
References: <20221012153801.2604340-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When you try to set qtest property "log" while the qtest object is
active, the error message blames "insufficient permission":

    $ qemu-system-x86_64 -S -display none -nodefaults -monitor stdio -chardev socket,id=chrqt0,path=qtest.socket,server=on,wait=off -object qtest,id=qt0,chardev=chrqt0,log=/dev/null
    QEMU 7.1.50 monitor - type 'help' for more information
    (qemu) qom-set /objects/qt0 log qtest.log
    Error: Insufficient permission to perform this operation

This implies it could work with "sufficient permission".  It can't.
Change the error message to:

    Error: Property 'log' can not be set now

Same for property "chardev".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 softmmu/qtest.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index f8acef2628..afea7693d0 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -977,7 +977,7 @@ static void qtest_set_log(Object *obj, const char *value, Error **errp)
     QTest *q = QTEST(obj);
 
     if (qtest == q) {
-        error_setg(errp, QERR_PERMISSION_DENIED);
+        error_setg(errp, "Property 'log' can not be set now");
     } else {
         g_free(q->log);
         q->log = g_strdup(value);
@@ -997,7 +997,7 @@ static void qtest_set_chardev(Object *obj, const char *value, Error **errp)
     Chardev *chr;
 
     if (qtest == q) {
-        error_setg(errp, QERR_PERMISSION_DENIED);
+        error_setg(errp, "Property 'chardev' can not be set now");
         return;
     }
 
-- 
2.37.2


