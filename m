Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E47690283
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 09:51:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ2dP-0006yu-Ii; Thu, 09 Feb 2023 03:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1pQ2dH-0006yA-3w
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:50:24 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1pQ2dE-0007iH-Mo
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:50:17 -0500
Received: by mail-wm1-x32e.google.com with SMTP id o36so923548wms.1
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 00:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cOyK1xwkRtmIF35qit/32W4WDgM+0CBPhABx7HpojiY=;
 b=P0ea7NRJC/KcW2mhn5pcuJL4IWuWkve7FVLSeOV5twBqEzADfN8XgO/dUH+N7E8bRQ
 Ha/XwsFsGRgHFmiQL504WaU1bqTdmuX5uAAc9VAOwGOLOnu9OK7itv+bVcdsAhuMRKFt
 d+bnUirz3GWQx0B12j2GHVDHTTaaWNrLjhnlnRLMbrZbQOY0WLgTRAMEIc95VNldih6U
 iBYDtVJyfHaZAeCnqYSifybEd3Z621DwQfTWe+AyIsJFyZ4DDI84CDA6uW6yzbrBUvt4
 hPgxn9QS+D/y1w/4WGwc/lrvpd0Zdc5MXjKMUGlOF49vF6FUyFVJsNgv/SxpRQDoMWhd
 5wEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cOyK1xwkRtmIF35qit/32W4WDgM+0CBPhABx7HpojiY=;
 b=dauRlxDGLtyMIG+6DBlAEvfb9nqV0Bo0xooWQ6HF1srKpTzNoWOdqd3pWiM9V4nOXI
 41ro+aVQrZNOp0slHjN139VwqTsHiA2nk2fQaGaPNmC/c95GD978PxqnuzC4qiKNxttN
 2STXqoD14OWpEw8aOogw0/leopaWuRZ+E311qJtoodwlY4Q8irS2W0fqWQqKP02mFADz
 K4E/oDKDlY/1JsVk/pSjaRFvAzVeja3vlEY36j0krQES27mPD5yv+LDeYFxgaCLH58+3
 4x/ziCWvZrA8BxoAEeVTaDumv+b5XqHAby8uZG1XoTNA+X0vkFNDFwhmvyEbrpgBg/Hz
 NbgQ==
X-Gm-Message-State: AO0yUKXXbWJ2HMmuN1nfSRs/MJd5hqhzxKBEkrVC562xfg29Dhi1DuqS
 sOKuBd6K7bW56M2m4upRwzYAUGq9kZc4sD+Q
X-Google-Smtp-Source: AK7set/VE8XyOH28Eu3PMgFpWhQCOE/Fky7BVpV7mtIAiNYJyjKxX1dsN0OCgGPhqLbj/cfC50NBhw==
X-Received: by 2002:a05:600c:1894:b0:3de:1d31:1048 with SMTP id
 x20-20020a05600c189400b003de1d311048mr9279827wmp.29.1675932614526; 
 Thu, 09 Feb 2023 00:50:14 -0800 (PST)
Received: from bark.. (bzq-84-110-34-91.static-ip.bezeqint.net. [84.110.34.91])
 by smtp.gmail.com with ESMTPSA id
 ay42-20020a05600c1e2a00b003dffe312925sm4169535wmb.15.2023.02.09.00.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 00:50:14 -0800 (PST)
From: Kfir Manor <kfir@daynix.com>
To: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Cc: Yan Vugenfirer <yan@daynix.com>
Subject: [PATCH 3/3] qga/win/vss: requester_freeze changes
Date: Thu,  9 Feb 2023 10:50:04 +0200
Message-Id: <20230209085004.2745131-4-kfir@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230209085004.2745131-1-kfir@daynix.com>
References: <20230209085004.2745131-1-kfir@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::32e;
 envelope-from=kfir@daynix.com; helo=mail-wm1-x32e.google.com
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

Change requester_freeze so that the VSS backup type queried from the registry

Signed-off-by: Kfir Manor <kfir@daynix.com>
---
 qga/vss-win32/requester.cpp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qga/vss-win32/requester.cpp b/qga/vss-win32/requester.cpp
index 27fdb9236b..163b3870b9 100644
--- a/qga/vss-win32/requester.cpp
+++ b/qga/vss-win32/requester.cpp
@@ -285,6 +285,7 @@ void requester_freeze(int *num_vols, void *mountpoints, ErrorSet *errset)
     DWORD wait_status;
     int num_fixed_drives = 0, i;
     int num_mount_points = 0;
+    VSS_BACKUP_TYPE vss_bt = get_vss_backup_type();
 
     if (vss_ctx.pVssbc) { /* already frozen */
         *num_vols = 0;
@@ -332,7 +333,7 @@ void requester_freeze(int *num_vols, void *mountpoints, ErrorSet *errset)
         goto out;
     }
 
-    hr = vss_ctx.pVssbc->SetBackupState(true, true, VSS_BT_FULL, false);
+    hr = vss_ctx.pVssbc->SetBackupState(true, true, vss_bt, false);
     if (FAILED(hr)) {
         err_set(errset, hr, "failed to set backup state");
         goto out;
-- 
2.38.1


