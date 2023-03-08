Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2733A6B12A3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 21:06:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa01b-00011w-3X; Wed, 08 Mar 2023 15:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pa01Y-000114-Tl
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:04:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pa01X-0006xY-0I
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:04:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678305870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SR7Nzf/Ynf6gDendfnPnQChtOMCFkbv6WT+Z7RsIV44=;
 b=fCZDSx6ykEQReyhG9mpvvLMlf7CKC7Ga87Lqb1wm7rtDdpCoJF3ubEyAusy4P9+dyBOsbW
 EE2D+K5ZLfTpzY4+xr26drVgDke2rPumTf4z1wOuo8ZsLPFipp4v+0CoAPGueHDqZ9x3ZE
 eysLk2yg73vi+WxxY8PhADkbXECy97M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-s47-NiY7Nd-A6-5ZtTt-1w-1; Wed, 08 Mar 2023 15:04:28 -0500
X-MC-Unique: s47-NiY7Nd-A6-5ZtTt-1w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41F8A811E6E;
 Wed,  8 Mar 2023 20:04:28 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.45.224.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 801212026D4B;
 Wed,  8 Mar 2023 20:04:27 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 4/5] qga/win/vss: query VSS backup type
Date: Wed,  8 Mar 2023 22:04:18 +0200
Message-Id: <20230308200419.453688-5-kkostiuk@redhat.com>
In-Reply-To: <20230308200419.453688-1-kkostiuk@redhat.com>
References: <20230308200419.453688-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kfir Manor <kfir@daynix.com>

Query VSS backup type number (DWORD) from QEMU Guest Agent VSS Provider registry key registry value VssOption

Translate the VSS backup type number (DWORD) into its VSS backup type (VSS_BACKUP_TYPE)

Returns the queried VSS backup type if the program encounters unexpected behaviors or values return default VSS backup type VSS_BT_FULL instead

Signed-off-by: Kfir Manor <kfir@daynix.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/vss-win32/requester.cpp | 38 +++++++++++++++++++++++++++++++++++++
 qga/vss-win32/vss-handles.h |  3 +++
 2 files changed, 41 insertions(+)

diff --git a/qga/vss-win32/requester.cpp b/qga/vss-win32/requester.cpp
index b371affeab..e06d516675 100644
--- a/qga/vss-win32/requester.cpp
+++ b/qga/vss-win32/requester.cpp
@@ -23,6 +23,8 @@
 /* Call QueryStatus every 10 ms while waiting for frozen event */
 #define VSS_TIMEOUT_EVENT_MSEC 10
 
+#define DEFAULT_VSS_BACKUP_TYPE VSS_BT_FULL
+
 #define err_set(e, err, fmt, ...)                                           \
     ((e)->error_setg_win32_wrapper((e)->errp, __FILE__, __LINE__, __func__, \
                                    err, fmt, ## __VA_ARGS__))
@@ -234,6 +236,42 @@ out:
     }
 }
 
+DWORD get_reg_dword_value(HKEY baseKey, LPCSTR subKey, LPCSTR valueName,
+                          DWORD defaultData)
+{
+    DWORD regGetValueError;
+    DWORD dwordData;
+    DWORD dataSize = sizeof(DWORD);
+
+    regGetValueError = RegGetValue(baseKey, subKey, valueName, RRF_RT_DWORD,
+                                   NULL, &dwordData, &dataSize);
+    if (regGetValueError  != ERROR_SUCCESS) {
+        return defaultData;
+    }
+    return dwordData;
+}
+
+bool is_valid_vss_backup_type(VSS_BACKUP_TYPE vssBT)
+{
+    return (vssBT > VSS_BT_UNDEFINED && vssBT < VSS_BT_OTHER);
+}
+
+VSS_BACKUP_TYPE get_vss_backup_type(
+    VSS_BACKUP_TYPE defaultVssBT = DEFAULT_VSS_BACKUP_TYPE)
+{
+    VSS_BACKUP_TYPE vssBackupType;
+
+    vssBackupType = static_cast<VSS_BACKUP_TYPE>(
+                            get_reg_dword_value(HKEY_LOCAL_MACHINE,
+                                                QGA_PROVIDER_REGISTRY_ADDRESS,
+                                                "VssOption",
+                                                defaultVssBT));
+    if (!is_valid_vss_backup_type(vssBackupType)) {
+        return defaultVssBT;
+    }
+    return vssBackupType;
+}
+
 void requester_freeze(int *num_vols, void *mountpoints, ErrorSet *errset)
 {
     COMPointer<IVssAsync> pAsync;
diff --git a/qga/vss-win32/vss-handles.h b/qga/vss-win32/vss-handles.h
index 0f8a741ad2..1a7d842129 100644
--- a/qga/vss-win32/vss-handles.h
+++ b/qga/vss-win32/vss-handles.h
@@ -6,6 +6,9 @@
 #define QGA_PROVIDER_NAME "QEMU Guest Agent VSS Provider"
 #define QGA_PROVIDER_LNAME L(QGA_PROVIDER_NAME)
 #define QGA_PROVIDER_VERSION L(QEMU_VERSION)
+#define QGA_PROVIDER_REGISTRY_ADDRESS "SYSTEM\\CurrentControlSet"\
+                                      "\\Services"\
+                                      "\\" QGA_PROVIDER_NAME
 
 #define EVENT_NAME_FROZEN  "Global\\QGAVSSEvent-frozen"
 #define EVENT_NAME_THAW    "Global\\QGAVSSEvent-thaw"
-- 
2.25.1


