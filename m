Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8174BED76
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 23:54:15 +0100 (CET)
Received: from localhost ([::1]:37736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMHZO-0005Dz-Vh
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 17:54:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHGm-00016K-2o
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:35:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHGd-0008F8-NJ
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:34:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645482891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LiD4YEi7R+Kp81+XXVy12vrabiJJ9ekRqulYi65vols=;
 b=ghKUjbDWGyxMqg6xG+pZs+W7VswTnduWO67tdhS7jA359Di94SAvGNScrCR7aFkCCe34RZ
 lPY1HW4KWSSwwAqV8oJLsSsNSNxVdfxDQVsVp5zV2ZQcayQRAifCBjns4jzQF6XEoaxvOc
 0g54P6zvGiA8PEE/5pgRjy69HJmvNdU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-0HihfAz5OpeT9haWgX7U8A-1; Mon, 21 Feb 2022 17:34:50 -0500
X-MC-Unique: 0HihfAz5OpeT9haWgX7U8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F05D9180CBFE;
 Mon, 21 Feb 2022 22:34:48 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEF061038AAF;
 Mon, 21 Feb 2022 22:34:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/18] iotests: reimplement img_info_log in terms of
 qemu_img_log
Date: Mon, 21 Feb 2022 17:34:13 -0500
Message-Id: <20220221223413.2123003-19-jsnow@redhat.com>
In-Reply-To: <20220221223413.2123003-1-jsnow@redhat.com>
References: <20220221223413.2123003-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now every last call to qemu_img is certifiably either checked or logged.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 0519b2a8019..473173324d6 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -347,15 +347,20 @@ def qemu_img_info(*args: str) -> Any:
 def qemu_img_map(*args: str) -> Any:
     return qemu_img_json('map', "--output", "json", *args)
 
-def qemu_img_log(*args: str) -> subprocess.CompletedProcess[str]:
+def qemu_img_log(
+        *args: str,
+        filters: Iterable[Callable[[str], str]] = (),
+) -> subprocess.CompletedProcess[str]:
     """
     Logged, unchecked variant of qemu_img() that allows non-zero exit codes.
 
     If logging is perceived to be disabled, this function will behave
     like qemu_img() and prohibit non-zero return codes.
+
+    By default, output will be filtered through filter_testfiles().
     """
     result = qemu_img(*args, check=not logging_enabled())
-    log(result.stdout, filters=[filter_testfiles])
+    log(result.stdout, filters=filters or [filter_testfiles])
     return result
 
 def img_info_log(filename: str, filter_path: Optional[str] = None,
@@ -369,10 +374,11 @@ def img_info_log(filename: str, filter_path: Optional[str] = None,
     args += extra_args
     args.append(filename)
 
-    output = qemu_img(*args, check=False).stdout
     if not filter_path:
         filter_path = filename
-    log(filter_img_info(output, filter_path))
+    qemu_img_log(
+        *args,
+        filters=[lambda output: filter_img_info(output, filter_path)])
 
 def qemu_io_wrap_args(args: Sequence[str]) -> List[str]:
     if '-f' in args or '--image-opts' in args:
-- 
2.34.1


