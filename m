Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF0131EB68
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 16:18:35 +0100 (CET)
Received: from localhost ([::1]:47616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCl4d-0007ck-0c
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 10:18:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lCl2q-00069S-QB
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 10:16:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lCl2m-00087i-FR
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 10:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613661399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YVIbHF9hFW5nfND/RpDpRvmUiEYA5B3GV9Ps616yJNU=;
 b=RbJI4ntqN7Rkrz/qjZhbBLibOFRaP0OlocBN4xFaRSkn2Z+xbNzEtttbc9nyOyD2agoU6E
 Bbjy3FKuXvjcEjCFFXQ5+fSDMPXCT5vPIhUmtz4lhdb97xKf8NBG5USKu0Dn+gdTkarZzA
 hA34jTQuJdmV0mzjzkHHSzHE0KvfQok=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-JugqRt5XNsiUWG4qJ14JoQ-1; Thu, 18 Feb 2021 10:16:38 -0500
X-MC-Unique: JugqRt5XNsiUWG4qJ14JoQ-1
Received: by mail-oo1-f72.google.com with SMTP id n9so1289678oom.5
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 07:16:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YVIbHF9hFW5nfND/RpDpRvmUiEYA5B3GV9Ps616yJNU=;
 b=fgF8i+KaCt8QjUk0wq6O/mBgclS7sRnakcOU6YmMB2W6/6Kl7E/PbVuu9uB3gscm+c
 YPbSqxMBcIfMR0oM7zhsfOQ4ktDhXaLa01jH8msx5xyb5T1b7mZjIAb2pGvvd9cslMFI
 JEEXtTfCxIhcJufrSykNWbjYavH4gNBdCAOfE6li0vrj4+klBVdHyYLZDmZ1TI4vsGOA
 fEsbFThrAdCvwD9ltWNNdpu+Tx0bnggwQmOBYroFlRULLRydiVKQcRvSJo4XFjc2pQrC
 2gmcChjb6BgVtGMu/GqLUdGNobA4YXquI8JvZ0nb4t5IOiigKU47YfLzhZUH4sbZW5dA
 vS9Q==
X-Gm-Message-State: AOAM531CyDu4oDkuy45CgKId5qf461DgzYzbWN0uoCbzm3bm6qKT++bW
 nwV2A3gyhrEDld7CdBgtgggOY4bXnbTYo3nM+6xYJbO1Q4TVgVE+E/fXkmEa0hcBo4Qs1AnB/7u
 Prwh/WukRDq0JrjPBvKeIQRjw3F6FgEPwG+TnSp2da332VCRwMaG1ptMbwg9oaAQo
X-Received: by 2002:aca:b154:: with SMTP id a81mr3061888oif.136.1613661396268; 
 Thu, 18 Feb 2021 07:16:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGdk6pIn/OCSs7hYdTi1+cS55YASpU/tA/tbYJdQOJmk8Cwjk836hM412x6OpoT3sCNVwPLQ==
X-Received: by 2002:aca:b154:: with SMTP id a81mr3061866oif.136.1613661396093; 
 Thu, 18 Feb 2021 07:16:36 -0800 (PST)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id w134sm1212136oia.56.2021.02.18.07.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 07:16:35 -0800 (PST)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] sev: use explicit indices for mapping firmware error
 codes to strings
Date: Thu, 18 Feb 2021 09:16:32 -0600
Message-Id: <20210218151633.215374-2-ckuehl@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210218151633.215374-1-ckuehl@redhat.com>
References: <20210218151633.215374-1-ckuehl@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 brijesh.singh@amd.com, thomas.lendacky@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This can help lower any margin for error when making future additions to
the list, especially if they're made out of order.

While doing so, make capitalization of ASID consistent with its usage in
the SEV firmware spec (Asid -> ASID).

Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
---
 target/i386/sev.c | 46 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 0f414df02f..0de690058e 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -88,29 +88,29 @@ static SevGuestState *sev_guest;
 static Error *sev_mig_blocker;
 
 static const char *const sev_fw_errlist[] = {
-    "",
-    "Platform state is invalid",
-    "Guest state is invalid",
-    "Platform configuration is invalid",
-    "Buffer too small",
-    "Platform is already owned",
-    "Certificate is invalid",
-    "Policy is not allowed",
-    "Guest is not active",
-    "Invalid address",
-    "Bad signature",
-    "Bad measurement",
-    "Asid is already owned",
-    "Invalid ASID",
-    "WBINVD is required",
-    "DF_FLUSH is required",
-    "Guest handle is invalid",
-    "Invalid command",
-    "Guest is active",
-    "Hardware error",
-    "Hardware unsafe",
-    "Feature not supported",
-    "Invalid parameter"
+    [SEV_RET_SUCCESS]                = "",
+    [SEV_RET_INVALID_PLATFORM_STATE] = "Platform state is invalid",
+    [SEV_RET_INVALID_GUEST_STATE]    = "Guest state is invalid",
+    [SEV_RET_INAVLID_CONFIG]         = "Platform configuration is invalid",
+    [SEV_RET_INVALID_LEN]            = "Buffer too small",
+    [SEV_RET_ALREADY_OWNED]          = "Platform is already owned",
+    [SEV_RET_INVALID_CERTIFICATE]    = "Certificate is invalid",
+    [SEV_RET_POLICY_FAILURE]         = "Policy is not allowed",
+    [SEV_RET_INACTIVE]               = "Guest is not active",
+    [SEV_RET_INVALID_ADDRESS]        = "Invalid address",
+    [SEV_RET_BAD_SIGNATURE]          = "Bad signature",
+    [SEV_RET_BAD_MEASUREMENT]        = "Bad measurement",
+    [SEV_RET_ASID_OWNED]             = "ASID is already owned",
+    [SEV_RET_INVALID_ASID]           = "Invalid ASID",
+    [SEV_RET_WBINVD_REQUIRED]        = "WBINVD is required",
+    [SEV_RET_DFFLUSH_REQUIRED]       = "DF_FLUSH is required",
+    [SEV_RET_INVALID_GUEST]          = "Guest handle is invalid",
+    [SEV_RET_INVALID_COMMAND]        = "Invalid command",
+    [SEV_RET_ACTIVE]                 = "Guest is active",
+    [SEV_RET_HWSEV_RET_PLATFORM]     = "Hardware error",
+    [SEV_RET_HWSEV_RET_UNSAFE]       = "Hardware unsafe",
+    [SEV_RET_UNSUPPORTED]            = "Feature not supported",
+    [SEV_RET_INVALID_PARAM]          = "Invalid parameter",
 };
 
 #define SEV_FW_MAX_ERROR      ARRAY_SIZE(sev_fw_errlist)
-- 
2.29.2


