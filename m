Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BAE690282
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 09:51:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ2dP-0006z2-LO; Thu, 09 Feb 2023 03:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1pQ2dF-0006y6-QH
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:50:22 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1pQ2dD-0007iC-4p
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:50:17 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso924923wms.4
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 00:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VrYWLwdpop3m2KNW8eg+gDmihIX9bgIE0wBNkGgT27I=;
 b=y+mzMTm6sfjkNPI1aAccx6Sq1RH8gJ+cFvJZGqjy2lHV8toYhXGDz6x4FQ7YFhtekh
 uE9oYrhBv/wvBI1TBEFAZJ8gARZ/gUx2BZ4tEfLXZedaoXlCdF0W00TdOlCvLHsIUNai
 5bRZUX0guZaI98FMLfNmNPGvBMl4ZuAldwDNIjHW8Y5qpCJnsj4ZV00fwf4fHG7HsBjN
 o+ZpGqPHg2cGy/RRuW/4N0tWLcizVeFNuSD5mpEbDKWaJYNPGWaWn3A8muSfFsFOVMn5
 ZBp5oFqiDqsOFeBdUw5MFsotTkZmm7uBypdh9Y0NPTj76KBnGjM/dvV/xNPyHPP+AgVF
 6lJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VrYWLwdpop3m2KNW8eg+gDmihIX9bgIE0wBNkGgT27I=;
 b=JfKpmE6R6MJADN+lLxcAx0AQMNSGXbUOfPbGOlcsJoDApDXWHR5KfOtDJFuZLzb9Vw
 LL3aNcTKZSOP8cTTvSdOgQXQNa33zD8D9gg9uYW8gbnQ3qWx5My/MsQICN6uCSsJQOtH
 RMmPQ3T1yi3skCt5qWIYTATqSq0BivvW8qsIztKSVtM8aQMAxTY9V5616s8xyLsfy/fi
 4ke3cQDaPn1FlhFgIiYG/YvcMQxvnxp1jN4nmx8cKSwq4DVhfskZ04MtN6ophS56Ewd0
 a8ZEwE2YSZ7QZw6fsktV1AOTnb77I9vPhuCdyhDoEVZJj5BYSj/2JevXN+TzqWfvn/ao
 +6PQ==
X-Gm-Message-State: AO0yUKWQNslI7rzyBwzVgcLjsQIQ0iEj0ldGFKlW4Z8+MIJyJKwhhiNw
 zIlszPQwdeAF/EFgD0eTcTNHWNKd9cd3BJtp
X-Google-Smtp-Source: AK7set/8iRQFMNo7p1/rEv/Nh/xFGs8ZnpIpqD5Qh6j0t3OBXHb4WKNGkW/k1cybk+BjWq4DcKcnkA==
X-Received: by 2002:a05:600c:45cf:b0:3df:9858:c03c with SMTP id
 s15-20020a05600c45cf00b003df9858c03cmr5235629wmo.17.1675932613572; 
 Thu, 09 Feb 2023 00:50:13 -0800 (PST)
Received: from bark.. (bzq-84-110-34-91.static-ip.bezeqint.net. [84.110.34.91])
 by smtp.gmail.com with ESMTPSA id
 ay42-20020a05600c1e2a00b003dffe312925sm4169535wmb.15.2023.02.09.00.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 00:50:13 -0800 (PST)
From: Kfir Manor <kfir@daynix.com>
To: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Cc: Yan Vugenfirer <yan@daynix.com>
Subject: [PATCH 2/3] qga/win/vss: query VSS backup type
Date: Thu,  9 Feb 2023 10:50:03 +0200
Message-Id: <20230209085004.2745131-3-kfir@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230209085004.2745131-1-kfir@daynix.com>
References: <20230209085004.2745131-1-kfir@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::32d;
 envelope-from=kfir@daynix.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Query VSS backup type number (DWORD) from QEMU Guest Agent VSS Provider registry key registry value VssOption

Translate the VSS backup type number (DWORD) into its VSS backup type (VSS_BACKUP_TYPE)

Returns the queried VSS backup type if the program encounters unexpected behaviors or values return default VSS backup type VSS_BT_FULL instead

Signed-off-by: Kfir Manor <kfir@daynix.com>
---
 qga/vss-win32/requester.cpp | 38 +++++++++++++++++++++++++++++++++++++
 qga/vss-win32/vss-handles.h |  3 +++
 2 files changed, 41 insertions(+)

diff --git a/qga/vss-win32/requester.cpp b/qga/vss-win32/requester.cpp
index b371affeab..27fdb9236b 100644
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
2.38.1


