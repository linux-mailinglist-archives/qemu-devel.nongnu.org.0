Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3A15827C4
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 15:33:47 +0200 (CEST)
Received: from localhost ([::1]:49246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGhAY-0008Dr-Rv
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 09:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGh5F-0003aH-WF
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:28:18 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGh5E-00022W-Eb
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:28:17 -0400
Received: by mail-pl1-x635.google.com with SMTP id p1so7618891plr.11
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 06:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K5RpPkx1Tcaz5Omqx39MjgHtnMsOaSt7tarRvfh7ii0=;
 b=n22+ofw9nMS/BRENh9Kg8p9NzD8aGfslVNNtxySXeee1BBcxj/fIyKiMZJ7glPLxUc
 5srfZ4nbsN8t16nesMiuwUJJGQxjwtlNgObBXE/LcaOj6FegTWIYF/zg1OAZy08EPkDE
 cNmmAKG5eHAcdGcwD0MZ0SSJSWM4GJ1x+EfHt6lOe3BLffRlPOWp/OVYg3M1jdnSPWpz
 jAognOqsTMo2Ev2L5iOLpeGb0FmNKQ2kB7VpdLtKpq3LVDonLqY1/2xgORjVNetvoVw1
 Q17L6vZWSgwRHLJhuoxx2jpn39rJrVZ1tpP9z7GDOCFRIBv33io2F+G/hrSU8y8lKhx5
 BCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K5RpPkx1Tcaz5Omqx39MjgHtnMsOaSt7tarRvfh7ii0=;
 b=EKx+9ejSVSI4NfIusIKJksBviwRAtv4CxfWTMp02O2jReFQG5/0hipdU5AvJ8qUwoo
 4j786/D7cJ+CC2MKAdC85bp8lUMX8AUmniYjKTY+wm4cfyesZsqeYf65f884ZGO3u+mt
 8HZnMPXOPujnQ2g6bfia0C90YyxmQrvBccTSr6OcjyTZrQVV8tbmfTWH1CpKn7ncqM1B
 x1FH4EjZTML0Y6c8tRV0FEcfcqAXKdC5htOa606mC/rCcs0k+GlpWTl3oG6MyVa2fm0S
 WH94itFRYU9w5kJDDvRQ8i8pcA9nvc9wc/PQqpNy/WN7R2y+uwx3MzEVhahdgOSco6jt
 B84w==
X-Gm-Message-State: AJIora/c6Rcah9j5xlSDH+gT+RgIqpKgctW7AGhBGAur0n1og37UrJ8w
 o9ut7wz/MWylLQDceKi6i06M7ZZ2wDg=
X-Google-Smtp-Source: AGRyM1u1K0nWw3+XrlOmBKON3YI+U+iQ35DaUqsFTSaEnIkoDaU39IlppvdHplQxwt8/EWOLx9zhVA==
X-Received: by 2002:a17:90b:38cf:b0:1f2:fb9c:6003 with SMTP id
 nn15-20020a17090b38cf00b001f2fb9c6003mr4613578pjb.214.1658928494033; 
 Wed, 27 Jul 2022 06:28:14 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 ij13-20020a170902ab4d00b0016daee46b72sm1971192plb.237.2022.07.27.06.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 06:28:13 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH v2 3/6] qga/commands-win32: Use os_get_win_version()
Date: Wed, 27 Jul 2022 21:27:59 +0800
Message-Id: <20220727132802.812580-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727132802.812580-1-bmeng.cn@gmail.com>
References: <20220727132802.812580-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

Drop its own ga_get_win_version() implementation, and use the one
provided in oslib-win32 instead.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 qga/commands-win32.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 7ed7664715..6186f2e1f2 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2178,26 +2178,6 @@ static ga_win_10_0_t const WIN_10_0_CLIENT_VERSION_MATRIX[3] = {
     {0, 0}
 };
 
-static void ga_get_win_version(RTL_OSVERSIONINFOEXW *info, Error **errp)
-{
-    typedef NTSTATUS(WINAPI *rtl_get_version_t)(
-        RTL_OSVERSIONINFOEXW *os_version_info_ex);
-
-    info->dwOSVersionInfoSize = sizeof(RTL_OSVERSIONINFOEXW);
-
-    HMODULE module = GetModuleHandle("ntdll");
-    PVOID fun = GetProcAddress(module, "RtlGetVersion");
-    if (fun == NULL) {
-        error_setg(errp, QERR_QGA_COMMAND_FAILED,
-            "Failed to get address of RtlGetVersion");
-        return;
-    }
-
-    rtl_get_version_t rtl_get_version = (rtl_get_version_t)fun;
-    rtl_get_version(info);
-    return;
-}
-
 static char *ga_get_win_name(OSVERSIONINFOEXW const *os_version, bool id)
 {
     DWORD major = os_version->dwMajorVersion;
@@ -2312,17 +2292,12 @@ static char *ga_get_current_arch(void)
 
 GuestOSInfo *qmp_guest_get_osinfo(Error **errp)
 {
-    Error *local_err = NULL;
     OSVERSIONINFOEXW os_version = {0};
     bool server;
     char *product_name;
     GuestOSInfo *info;
 
-    ga_get_win_version(&os_version, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return NULL;
-    }
+    os_get_win_version(&os_version);
 
     server = os_version.wProductType != VER_NT_WORKSTATION;
     product_name = ga_get_win_product_name(errp);
-- 
2.34.1


