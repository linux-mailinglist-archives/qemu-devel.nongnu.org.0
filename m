Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E656E9406
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:15:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppT84-0002Cc-9J; Thu, 20 Apr 2023 08:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ppT7M-0001eN-B5
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:10:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ppT7K-0003iB-CW
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681992623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eqZK9/+gQ+RYD/sl35HuMKvZlCTpzsr62KI4FGTu1OM=;
 b=VvdercLURN/SvpX6KgaxyAq1MBrIcTvhTpliBEeb08eDQ/Ov2jaayrur0m+rUidD2yGwaE
 xSX3RQrkIeNDYoxUM6jL0bWPEei9Ye+2Xk0HnzMlYhM+fgT/6qzi1iWPS/SREi52yEx5/y
 SuuDObUFf1807h46KqmFOeRV6NokwlQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-xidT4ylsMWO2qjKet-XB9g-1; Thu, 20 Apr 2023 08:10:19 -0400
X-MC-Unique: xidT4ylsMWO2qjKet-XB9g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CF1C185A78B;
 Thu, 20 Apr 2023 12:10:19 +0000 (UTC)
Received: from localhost (unknown [10.39.193.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FFC42026D16;
 Thu, 20 Apr 2023 12:10:18 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, kvm@vger.kernel.org,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Subject: [PULL 10/20] tracetool: use relative paths for '#line' preprocessor
 directives
Date: Thu, 20 Apr 2023 08:09:38 -0400
Message-Id: <20230420120948.436661-11-stefanha@redhat.com>
In-Reply-To: <20230420120948.436661-1-stefanha@redhat.com>
References: <20230420120948.436661-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The event filename is an absolute path. Convert it to a relative path when
writing '#line' directives, to preserve reproducibility of the generated
output when different base paths are used.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20230406080045.21696-1-thomas.de_schampheleire@nokia.com>
---
 scripts/tracetool/backend/ftrace.py | 4 +++-
 scripts/tracetool/backend/log.py    | 4 +++-
 scripts/tracetool/backend/syslog.py | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/tracetool/backend/ftrace.py b/scripts/tracetool/backend/ftrace.py
index 5fa30ccc08..baed2ae61c 100644
--- a/scripts/tracetool/backend/ftrace.py
+++ b/scripts/tracetool/backend/ftrace.py
@@ -12,6 +12,8 @@
 __email__      = "stefanha@redhat.com"
 
 
+import os.path
+
 from tracetool import out
 
 
@@ -45,7 +47,7 @@ def generate_h(event, group):
         args=event.args,
         event_id="TRACE_" + event.name.upper(),
         event_lineno=event.lineno,
-        event_filename=event.filename,
+        event_filename=os.path.relpath(event.filename),
         fmt=event.fmt.rstrip("\n"),
         argnames=argnames)
 
diff --git a/scripts/tracetool/backend/log.py b/scripts/tracetool/backend/log.py
index 17ba1cd90e..de27b7e62e 100644
--- a/scripts/tracetool/backend/log.py
+++ b/scripts/tracetool/backend/log.py
@@ -12,6 +12,8 @@
 __email__      = "stefanha@redhat.com"
 
 
+import os.path
+
 from tracetool import out
 
 
@@ -53,7 +55,7 @@ def generate_h(event, group):
         '    }',
         cond=cond,
         event_lineno=event.lineno,
-        event_filename=event.filename,
+        event_filename=os.path.relpath(event.filename),
         name=event.name,
         fmt=event.fmt.rstrip("\n"),
         argnames=argnames)
diff --git a/scripts/tracetool/backend/syslog.py b/scripts/tracetool/backend/syslog.py
index 5a3a00fe31..012970f6cc 100644
--- a/scripts/tracetool/backend/syslog.py
+++ b/scripts/tracetool/backend/syslog.py
@@ -12,6 +12,8 @@
 __email__      = "stefanha@redhat.com"
 
 
+import os.path
+
 from tracetool import out
 
 
@@ -41,7 +43,7 @@ def generate_h(event, group):
         '    }',
         cond=cond,
         event_lineno=event.lineno,
-        event_filename=event.filename,
+        event_filename=os.path.relpath(event.filename),
         name=event.name,
         fmt=event.fmt.rstrip("\n"),
         argnames=argnames)
-- 
2.39.2


