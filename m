Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9235793D2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:08:01 +0200 (CEST)
Received: from localhost ([::1]:56496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhKq-0007Zi-Jb
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHM-00025I-Ui
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHL-0002yU-FK
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658214262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OI5mO5LZQ5/mmpwpAUKU/P6EZRhdpxebFDszEb7tRss=;
 b=L2wKk9v+EKjllRmsZ3TvR0tENRYliXy8SyMx/VF5qxxc5wo9aWEjr4hU67exVY4e9P5ZJC
 bJK6Ud4HFJMD4OytGzfL608gN5mGNFpQcTzgPxBoU4pkTA7aV7GL8zxmYVIwX6uk7LPB1L
 CZPZC45GZE6BCgC+Oru4Yw3iH/uvxIg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-Hx1-qLKHOU-kQyPv9s30sQ-1; Tue, 19 Jul 2022 03:04:15 -0400
X-MC-Unique: Hx1-qLKHOU-kQyPv9s30sQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F58D85A585;
 Tue, 19 Jul 2022 07:04:15 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E02A404754B;
 Tue, 19 Jul 2022 07:04:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 01/14] qga: treat get-guest-fsinfo as "best effort"
Date: Tue, 19 Jul 2022 09:03:59 +0200
Message-Id: <20220719070412.16757-2-thuth@redhat.com>
In-Reply-To: <20220719070412.16757-1-thuth@redhat.com>
References: <20220719070412.16757-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: John Snow <jsnow@redhat.com>

In some container environments, there may be references to block devices
witnessable from a container through /proc/self/mountinfo that reference
devices we simply don't have access to in the container, and cannot
provide information about.

Instead of failing the entire fsinfo command, return stub information
for these failed lookups.

This allows test-qga to pass under docker tests, which are in turn used
by the CentOS VM tests.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220708153503.18864-2-jsnow@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qga/commands-posix.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index f18530d85f..954efed01b 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -1207,7 +1207,15 @@ static void build_guest_fsinfo_for_device(char const *devpath,
 
     syspath = realpath(devpath, NULL);
     if (!syspath) {
-        error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
+        if (errno != ENOENT) {
+            error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
+            return;
+        }
+
+        /* ENOENT: This devpath may not exist because of container config */
+        if (!fs->name) {
+            fs->name = g_path_get_basename(devpath);
+        }
         return;
     }
 
-- 
2.31.1


