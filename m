Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1894434FF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:01:25 +0100 (CET)
Received: from localhost ([::1]:53858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhy68-0004nq-1I
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy34-0000hr-Tv
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:58:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy30-0006so-Bq
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:58:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635875888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E8xP4TFA+SkUhN43ePFmTDplYC3Z2HmWfReBP8FSBw0=;
 b=XKVbUCe4yel+1g3MhytoQ4A3E6lLSN4eIUwdg6xsHQzYpceIl6oi+Zr05rMXsz3cCijwTO
 f10mFtJebWzSCG8i1c1YbOMRLOvTf0Oe5olFFVvqSfnB93g3oZjwIO+XgiK0m0Mv0FnXf4
 tFRYoDPAEZ+Kd2dG/Dey+OGWtT1YjGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-2nZz00eDOw6TO00UXoxVFw-1; Tue, 02 Nov 2021 13:58:05 -0400
X-MC-Unique: 2nZz00eDOw6TO00UXoxVFw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BF9D8070F0;
 Tue,  2 Nov 2021 17:58:04 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA61019C59;
 Tue,  2 Nov 2021 17:57:46 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/18] docs/devel: update error handling guidance for HMP
 commands
Date: Tue,  2 Nov 2021 17:56:47 +0000
Message-Id: <20211102175700.1175996-6-berrange@redhat.com>
In-Reply-To: <20211102175700.1175996-1-berrange@redhat.com>
References: <20211102175700.1175996-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Best practice is to use the 'hmp_handle_error' function, not
'monitor_printf' or 'error_report_err'. This ensures that the
message always gets an 'Error: ' prefix, distinguishing it
from normal command output.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/devel/writing-monitor-commands.rst | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing-monitor-commands.rst
index a973c48f66..a381b52024 100644
--- a/docs/devel/writing-monitor-commands.rst
+++ b/docs/devel/writing-monitor-commands.rst
@@ -293,9 +293,7 @@ Here's the implementation of the "hello-world" HMP command::
      Error *err = NULL;
 
      qmp_hello_world(!!message, message, &err);
-     if (err) {
-         monitor_printf(mon, "%s\n", error_get_pretty(err));
-         error_free(err);
+     if (hmp_handle_error(mon, err)) {
          return;
      }
  }
@@ -307,9 +305,10 @@ There are three important points to be noticed:
 1. The "mon" and "qdict" arguments are mandatory for all HMP functions. The
    former is the monitor object. The latter is how the monitor passes
    arguments entered by the user to the command implementation
-2. hmp_hello_world() performs error checking. In this example we just print
-   the error description to the user, but we could do more, like taking
-   different actions depending on the error qmp_hello_world() returns
+2. hmp_hello_world() performs error checking. In this example we just call
+   hmp_handle_error() which prints a message to the user, but we could do
+   more, like taking different actions depending on the error
+   qmp_hello_world() returns
 3. The "err" variable must be initialized to NULL before performing the
    QMP call
 
@@ -466,9 +465,7 @@ Here's the HMP counterpart of the query-alarm-clock command::
      Error *err = NULL;
 
      clock = qmp_query_alarm_clock(&err);
-     if (err) {
-         monitor_printf(mon, "Could not query alarm clock information\n");
-         error_free(err);
+     if (hmp_handle_error(mon, err)) {
          return;
      }
 
@@ -607,9 +604,7 @@ has to traverse the list, it's shown below for reference::
      Error *err = NULL;
 
      method_list = qmp_query_alarm_methods(&err);
-     if (err) {
-         monitor_printf(mon, "Could not query alarm methods\n");
-         error_free(err);
+     if (hmp_handle_error(mon, err)) {
          return;
      }
 
-- 
2.31.1


