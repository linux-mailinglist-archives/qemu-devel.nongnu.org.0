Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA38C334272
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:08:18 +0100 (CET)
Received: from localhost ([::1]:33844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1Nh-0000by-Li
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:08:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lK1F1-0003CB-0S
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:59:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lK1Ez-00023Y-5j
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615391956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bbw36JNdEnPmtaYTK3y+jnAxy9/kxpnUxf30UWWTNxY=;
 b=FDuLhEXIrvXvV3n5A8V02h6yYRnc0IH1INNOocyCqu4eFSnelU2tQ9NGJ3JsJTN2OB9JlO
 rWZndJaFQVinwwIEFikbDJHclzKnFlRHnAw1fncm5gjqCdmcyc8n4d17bJxAqQbYxKujHR
 Y2Vak2ZLQpd8NiSRSiYcNtzGqFbh624=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-8-YZqb68P7WwjlHsGHvvGA-1; Wed, 10 Mar 2021 10:59:14 -0500
X-MC-Unique: 8-YZqb68P7WwjlHsGHvvGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D8B3108BD09;
 Wed, 10 Mar 2021 15:59:13 +0000 (UTC)
Received: from localhost (ovpn-115-159.ams2.redhat.com [10.36.115.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2061C5C1A1;
 Wed, 10 Mar 2021 15:59:12 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/4] iotests/common.qemu: Add _cleanup_single_qemu
Date: Wed, 10 Mar 2021 16:59:04 +0100
Message-Id: <20210310155906.147478-3-mreitz@redhat.com>
In-Reply-To: <20210310155906.147478-1-mreitz@redhat.com>
References: <20210310155906.147478-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

_cleanup_qemu cleans up all qemu instances, which sometimes is not very
useful.  Pull out _cleanup_single_qemu, which does the same only for a
single instance.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/common.qemu | 55 +++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/tests/qemu-iotests/common.qemu b/tests/qemu-iotests/common.qemu
index 0fc52d20d7..56c1ea1bac 100644
--- a/tests/qemu-iotests/common.qemu
+++ b/tests/qemu-iotests/common.qemu
@@ -365,37 +365,50 @@ _launch_qemu()
 }
 
 
-# Silently kills the QEMU process
+# Silently kills all QEMU processes
 #
 # If $wait is set to anything other than the empty string, the process will not
 # be killed but only waited for, and any output will be forwarded to stdout. If
 # $wait is empty, the process will be killed and all output will be suppressed.
+#
+# To cleanup a single process, use _cleanup_single_qemu instead.
 _cleanup_qemu()
 {
     # QEMU_PID[], QEMU_IN[], QEMU_OUT[] all use same indices
     for i in "${!QEMU_OUT[@]}"
     do
-        local QEMU_PID
-        if [ -f "${QEMU_TEST_DIR}/qemu-${i}.pid" ]; then
-            read QEMU_PID < "${QEMU_TEST_DIR}/qemu-${i}.pid"
-            rm -f "${QEMU_TEST_DIR}/qemu-${i}.pid"
-            if [ -z "${wait}" ] && [ -n "${QEMU_PID}" ]; then
-                kill -KILL ${QEMU_PID} 2>/dev/null
-            fi
-            if [ -n "${QEMU_PID}" ]; then
-                wait ${QEMU_PID} 2>/dev/null # silent kill
-            fi
-        fi
+        _cleanup_single_qemu $i
+    done
+}
 
-        if [ -n "${wait}" ]; then
-            cat <&${QEMU_OUT[$i]} | _filter_testdir | _filter_qemu \
-                                  | _filter_qemu_io | _filter_qmp | _filter_hmp
+# The same as _cleanup_qemu, but for a single instance.
+#
+# Input parameters:
+# $1: qemu handle
+_cleanup_single_qemu()
+{
+    i=$1
+
+    local QEMU_PID
+    if [ -f "${QEMU_TEST_DIR}/qemu-${i}.pid" ]; then
+        read QEMU_PID < "${QEMU_TEST_DIR}/qemu-${i}.pid"
+        rm -f "${QEMU_TEST_DIR}/qemu-${i}.pid"
+        if [ -z "${wait}" ] && [ -n "${QEMU_PID}" ]; then
+            kill -KILL ${QEMU_PID} 2>/dev/null
         fi
-        rm -f "${QEMU_FIFO_IN}_${i}" "${QEMU_FIFO_OUT}_${i}"
-        eval "exec ${QEMU_IN[$i]}<&-"   # close file descriptors
-        eval "exec ${QEMU_OUT[$i]}<&-"
+        if [ -n "${QEMU_PID}" ]; then
+            wait ${QEMU_PID} 2>/dev/null # silent kill
+        fi
+    fi
 
-        unset QEMU_IN[$i]
-        unset QEMU_OUT[$i]
-    done
+    if [ -n "${wait}" ]; then
+        cat <&${QEMU_OUT[$i]} | _filter_testdir | _filter_qemu \
+                              | _filter_qemu_io | _filter_qmp | _filter_hmp
+    fi
+    rm -f "${QEMU_FIFO_IN}_${i}" "${QEMU_FIFO_OUT}_${i}"
+    eval "exec ${QEMU_IN[$i]}<&-"   # close file descriptors
+    eval "exec ${QEMU_OUT[$i]}<&-"
+
+    unset QEMU_IN[$i]
+    unset QEMU_OUT[$i]
 }
-- 
2.29.2


