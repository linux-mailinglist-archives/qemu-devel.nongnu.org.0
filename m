Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 035CB2D7CB2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:21:44 +0100 (CET)
Received: from localhost ([::1]:56160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knm6w-00006y-UC
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlv4-0004Fh-CF
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluY-0002Fz-UL
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k1UzbfO3esCOtQrbuwUM6xMVpKO+Rjw+LLbfQ3Nxrv0=;
 b=BRsOCCWIJcwF8Losefx5/8l3zRD3/KiPANZWYWh8sLI+nViZEKCe8uciPOwKJbjOJhiMQf
 kP9W+cH3x3xCUAyDVz56prQCvTSr3XQwAsMK10haJIhh3fmBZi0T6gYNxv+QpZh25Cn0WF
 3VQdLlwfKmGoc50cJa5j7dXZXdKDeEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-XBEnQNNMMCKWmDU_l0x1pg-1; Fri, 11 Dec 2020 12:08:47 -0500
X-MC-Unique: XBEnQNNMMCKWmDU_l0x1pg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0F7B107ACE3;
 Fri, 11 Dec 2020 17:08:46 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D0A75D6A8;
 Fri, 11 Dec 2020 17:08:45 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 21/34] iotests: Give access to the qemu-storage-daemon
Date: Fri, 11 Dec 2020 18:07:59 +0100
Message-Id: <20201211170812.228643-22-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201027190600.192171-18-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/check     | 11 +++++++++++
 tests/qemu-iotests/common.rc | 17 +++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 678b6e4910..3c1fa4435a 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -644,6 +644,17 @@ if [ -z $QEMU_NBD_PROG ]; then
 fi
 export QEMU_NBD_PROG="$(type -p "$QEMU_NBD_PROG")"
 
+if [ -z "$QSD_PROG" ]; then
+    if [ -x "$build_iotests/qemu-storage-daemon" ]; then
+        export QSD_PROG="$build_iotests/qemu-storage-daemon"
+    elif [ -x "$build_root/storage-daemon/qemu-storage-daemon" ]; then
+        export QSD_PROG="$build_root/storage-daemon/qemu-storage-daemon"
+    else
+        _init_error "qemu-storage-daemon not found"
+    fi
+fi
+export QSD_PROG="$(type -p "$QSD_PROG")"
+
 if [ -x "$build_iotests/socket_scm_helper" ]
 then
     export SOCKET_SCM_HELPER="$build_iotests/socket_scm_helper"
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 23f46da2db..20589e59a5 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -124,6 +124,7 @@ fi
 : ${VALGRIND_QEMU_IMG=$VALGRIND_QEMU}
 : ${VALGRIND_QEMU_IO=$VALGRIND_QEMU}
 : ${VALGRIND_QEMU_NBD=$VALGRIND_QEMU}
+: ${VALGRIND_QSD=$VALGRIND_QEMU}
 
 # The Valgrind own parameters may be set with
 # its environment variable VALGRIND_OPTS, e.g.
@@ -211,6 +212,21 @@ _qemu_nbd_wrapper()
     return $RETVAL
 }
 
+_qemu_storage_daemon_wrapper()
+{
+    local VALGRIND_LOGFILE="${TEST_DIR}"/$$.valgrind
+    (
+        if [ -n "${QSD_NEED_PID}" ]; then
+            echo $BASHPID > "${QEMU_TEST_DIR}/qemu-storage-daemon.pid"
+        fi
+        VALGRIND_QEMU="${VALGRIND_QSD}" _qemu_proc_exec "${VALGRIND_LOGFILE}" \
+            "$QSD_PROG" $QSD_OPTIONS "$@"
+    )
+    RETVAL=$?
+    _qemu_proc_valgrind_log "${VALGRIND_LOGFILE}" $RETVAL
+    return $RETVAL
+}
+
 # Valgrind bug #409141 https://bugs.kde.org/show_bug.cgi?id=409141
 # Until valgrind 3.16+ is ubiquitous, we must work around a hang in
 # valgrind when issuing sigkill. Disable valgrind for this invocation.
@@ -223,6 +239,7 @@ export QEMU=_qemu_wrapper
 export QEMU_IMG=_qemu_img_wrapper
 export QEMU_IO=_qemu_io_wrapper
 export QEMU_NBD=_qemu_nbd_wrapper
+export QSD=_qemu_storage_daemon_wrapper
 
 if [ "$IMGOPTSSYNTAX" = "true" ]; then
     DRIVER="driver=$IMGFMT"
-- 
2.29.2


