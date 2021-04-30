Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD0936FCA0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:42:53 +0200 (CEST)
Received: from localhost ([::1]:59712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcUM0-0000fR-Hl
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lcTVX-0004EW-LI
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:48:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lcTVU-0007ND-QC
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619790515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2WLra2sSAdBan1Wq22qFHiVXFhh0NizItDhHSYEjJo=;
 b=YSs+Ru1/AcdN+M+GZshQ1wuNGqcvFvEJf+WJ2JCHmA6m9GcAxOBC6D7wdMklpCVcMDUJrd
 izTKfgGM3RDgU8F1tNa7SztBE/Q9/TZrIDqAd/HRrol5rM8zYf1Ynv+BkHxRCSDHzgL1U7
 XlNd3qTgtD4ulzzY2dtg1DVKxKhTbV4=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-h8OmO3pwMziYDIHJhST1xQ-1; Fri, 30 Apr 2021 09:48:34 -0400
X-MC-Unique: h8OmO3pwMziYDIHJhST1xQ-1
Received: by mail-ot1-f71.google.com with SMTP id
 h22-20020a9d6f960000b029029e185197c1so19793435otq.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 06:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v2WLra2sSAdBan1Wq22qFHiVXFhh0NizItDhHSYEjJo=;
 b=ujt6olJ1yl+bBlKUl8rjVEBc68wPyzaHI58pHTxrJi9y8N65KwGwkRUMt41vbbLqxI
 DfzS+pbeqEjUllGbHDjj6vmgBo8T3HeeSDjFxmM9I20JRHfngL3A/l3S74GgsOcqIXAB
 ez39dsTsrPndsJH+zIYCA9zYHKgO540hJRENhtE0CDWmXjRBCOQEkURKMZUTDhlzLet8
 rO3ujB18GKMVdO41x9QHUUD9F5YUNBv5E/xGe/Kxk8SDuAX0iLl5htiuNdjob1sKCx67
 1P+//qhHP+LrdQBnN9y6dlpioU3v+ovwXWwDbuRgthR3fuGtoYmdr3sHEuFC0AyVArfB
 BmJA==
X-Gm-Message-State: AOAM532qx50PrZdbKkHXxDh2EM+jMVTSGCbx3sdeS0xdv1dAc/UeAt/H
 muTeYMmZPC6tCSb+Xzs41CYIHMKc42FgTRhZ1WyqEDBaMbiTOlyYqnTddfOR/bxvSSh685lApLt
 I96fxaEfbE4UIpKRlff+8Zx/e+Dovg8ZjBzuxpTkKi+s6x2XLZzixcET2VWEkheee
X-Received: by 2002:aca:90b:: with SMTP id 11mr10792445oij.77.1619790513290;
 Fri, 30 Apr 2021 06:48:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfgsr2LmGjeQuuw0bbXIGw5q0NUy31uiqbwLV0SQGrbtifZwxyCrmRcQ7/6a/ka4kqZn7ovg==
X-Received: by 2002:aca:90b:: with SMTP id 11mr10792431oij.77.1619790513099;
 Fri, 30 Apr 2021 06:48:33 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id p127sm799072oig.16.2021.04.30.06.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 06:48:32 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] [RESEND] sev: use explicit indices for mapping firmware
 error codes to strings
Date: Fri, 30 Apr 2021 08:48:29 -0500
Message-Id: <20210430134830.254741-2-ckuehl@redhat.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210430134830.254741-1-ckuehl@redhat.com>
References: <20210430134830.254741-1-ckuehl@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: thomas.lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 richard.henderson@linaro.org, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This can help lower any margin for error when making future additions to
the list, especially if they're made out of order.

While doing so, make capitalization of ASID consistent with its usage in
the SEV firmware spec (Asid -> ASID).

Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev.c | 46 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 72b9e2ab40..9e2e47012f 100644
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
2.30.2


