Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDC26FFECA
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 04:13:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxIFT-0004ml-Hk; Thu, 11 May 2023 22:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxIFP-0004lR-U9
 for qemu-devel@nongnu.org; Thu, 11 May 2023 22:11:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxIF9-0000Q7-5o
 for qemu-devel@nongnu.org; Thu, 11 May 2023 22:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683857448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gnWQxk7uaPyBjtV7rz/3P+R/jSo6CjVEF/x5fuKyeK8=;
 b=ZtJ3JX/b/Pi3SdlwPW4oRaAlSgpa4FBq12IPrbUTXk3Q9yX+FXZ9GQXpyt/yY85yFes9r1
 DR1lF1JL940fYtP3omsRx/2dcMRwJ5O9W7/vGdflYHfOoXJDbkN8LY5GDOxTRK9p/lbgoe
 PwVhsO5Vi62g9HegPAuXJw5hPLZjPxA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-lJcjhc_YO_6fg9-a9INcMA-1; Thu, 11 May 2023 22:10:45 -0400
X-MC-Unique: lJcjhc_YO_6fg9-a9INcMA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D90BE101A54F;
 Fri, 12 May 2023 02:10:44 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A9942024CDC;
 Fri, 12 May 2023 02:10:44 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com,
	armbru@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v2 12/19] cutils: Allow NULL str in qemu_strtosz
Date: Thu, 11 May 2023 21:10:26 -0500
Message-Id: <20230512021033.1378730-13-eblake@redhat.com>
In-Reply-To: <20230512021033.1378730-1-eblake@redhat.com>
References: <20230512021033.1378730-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

All the other qemu_strto* and parse_uint allow a NULL str.  Having
qemu_strtosz crash on qemu_strtosz(NULL, NULL, &value) is an easy fix
that adds some consistency between our string parsers.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/unit/test-cutils.c | 3 +++
 util/cutils.c            | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index 5c9ed78be93..1936c7b5795 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -3260,6 +3260,9 @@ static void test_qemu_strtosz_float(void)

 static void test_qemu_strtosz_invalid(void)
 {
+    do_strtosz(NULL, -EINVAL, 0xbaadf00d, 0);
+
+    /* Must parse at least one digit */
     do_strtosz("", -EINVAL, 0xbaadf00d, 0);
     do_strtosz(" \t ", -EINVAL, 0xbaadf00d, 0);
     do_strtosz("crap", -EINVAL, 0xbaadf00d, 0);
diff --git a/util/cutils.c b/util/cutils.c
index e599924a0c4..91c90673aba 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -306,7 +306,7 @@ static int do_strtosz(const char *nptr, const char **end,
 out:
     if (end) {
         *end = endptr;
-    } else if (*endptr) {
+    } else if (nptr && *endptr) {
         retval = -EINVAL;
     }
     if (retval == 0) {
-- 
2.40.1


