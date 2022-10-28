Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD42610A13
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 08:12:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooIYd-00055S-E3; Fri, 28 Oct 2022 02:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ooIXt-0004sr-P7
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 02:08:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ooIXa-0006yi-48
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 02:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666937299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HQIOg0IJDrsVSSxvGbrVgwvlQSv57Iyq/aXrNe8zlEs=;
 b=KHd/h+ic5Z453hAYo5EL5whq0USXvpl/+gepBjc87GCYhquBDFunbakDgAyAl+PN5lnyHn
 Px6ShEKtt2PHWQsD7YcDxz8U/UeNjU549DDaLgn31GOPi463WA3fxyTAJPveJPYznPwnYy
 elwVJ2nAxJVilthE9Duq/8CkEPNwwaE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-tQ3ra5ltPXORxAzS1NzyWw-1; Fri, 28 Oct 2022 02:08:17 -0400
X-MC-Unique: tQ3ra5ltPXORxAzS1NzyWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98BF9800B23
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 06:08:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AE9BC15BA8;
 Fri, 28 Oct 2022 06:08:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5BB5821E688F; Fri, 28 Oct 2022 08:08:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com
Subject: [PULL 3/4] qtest: Improve error messages when property can not be set
 right now
Date: Fri, 28 Oct 2022 08:08:15 +0200
Message-Id: <20221028060816.641399-4-armbru@redhat.com>
In-Reply-To: <20221028060816.641399-1-armbru@redhat.com>
References: <20221028060816.641399-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
Message-Id: <20221012153801.2604340-4-armbru@redhat.com>
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
2.37.3


