Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9CA44D876
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:42:05 +0100 (CET)
Received: from localhost ([::1]:53794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlBHA-0005CS-Hg
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:42:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mlBCk-0008Qx-Rv
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:37:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mlBCj-0001hC-A5
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636641448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zWkGae6rIVOJoLjAY49KbgiBpJkjKg0h3oKuq815D2c=;
 b=Aw7HDBaABT7sRfFgezuY9ygYQqav8T/LDB/nR9fN4R9JEhF+BRXclTGMtcxaptAZUd8UjA
 rLQo9+8N6JTlhelM1vqe4pO/9dPXRLT1EaLzlKtZ5iVNid7JaH/QUqPacNbTRzlsshh3wZ
 ID6cy+Qhk38Eg2Rxd3ww/rod32zbEEg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-s7wmtOcTMpKQv_cd-O4ujw-1; Thu, 11 Nov 2021 09:37:27 -0500
X-MC-Unique: s7wmtOcTMpKQv_cd-O4ujw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AA631572B
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 14:37:26 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0BB360C17;
 Thu, 11 Nov 2021 14:37:25 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] scripts/device-crash-test: simplify Exception handling
Date: Thu, 11 Nov 2021 09:37:17 -0500
Message-Id: <20211111143719.2162525-4-jsnow@redhat.com>
In-Reply-To: <20211111143719.2162525-1-jsnow@redhat.com>
References: <20211111143719.2162525-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need to handle KeyboardInterruptError specifically; we can
instead tighten the scope of the broad Exception handlers to only catch
"Exception", which has the effect of allowing all BaseException classes
that do not inherit from Exception to be raised through.

KeyboardInterruptError and a few other important ones are
BaseExceptions, so this does the same thing with less code.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/device-crash-test | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 8331c057b8..d91e8616ef 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -317,9 +317,7 @@ class QemuBinaryInfo(object):
         try:
             vm.launch()
             mi['runnable'] = True
-        except KeyboardInterrupt:
-            raise
-        except:
+        except Exception:
             dbg("exception trying to run binary=%s machine=%s", self.binary, machine, exc_info=sys.exc_info())
             dbg("log: %r", vm.get_log())
             mi['runnable'] = False
@@ -360,9 +358,7 @@ def checkOneCase(args, testcase):
     exc_traceback = None
     try:
         vm.launch()
-    except KeyboardInterrupt:
-        raise
-    except:
+    except Exception:
         exc_traceback = traceback.format_exc()
         dbg("Exception while running test case")
     finally:
-- 
2.31.1


