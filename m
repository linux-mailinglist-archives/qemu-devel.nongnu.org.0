Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7EC3979E1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 20:15:24 +0200 (CEST)
Received: from localhost ([::1]:51146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo8vD-0004Nr-Tl
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 14:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qj-0002cc-QP
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qf-0005od-Ld
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622571040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MnOIYbIKjYiDgtpVN4+Wmj9A+5oig7jow+vPBOpyLE8=;
 b=KwxP5KUsB7fZo1IRU5XXf/ATwhIilanoayc3Sejz3a6hGQZ0G6lLqP+EWXRgauNyhABFSU
 pZlx29eIV4V2N5k2yYolxqQR7avNOyvVLG2oNshcjvbG5/d5Fjlw2tdaiSjEZuVoNy+iJ3
 TM1YYNVxSTJFVSNyGgCD0Ip8KS1YnRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-a-HoW8H8N2yVrXu6fH55pg-1; Tue, 01 Jun 2021 14:10:38 -0400
X-MC-Unique: a-HoW8H8N2yVrXu6fH55pg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ABDF801B20;
 Tue,  1 Jun 2021 18:10:37 +0000 (UTC)
Received: from localhost (ovpn-112-239.rdu2.redhat.com [10.10.112.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 642105C1BB;
 Tue,  1 Jun 2021 18:10:37 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 23/24] sev: use explicit indices for mapping firmware error
 codes to strings
Date: Tue,  1 Jun 2021 14:10:13 -0400
Message-Id: <20210601181014.2568861-24-ehabkost@redhat.com>
In-Reply-To: <20210601181014.2568861-1-ehabkost@redhat.com>
References: <20210601181014.2568861-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Connor Kuehl <ckuehl@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Connor Kuehl <ckuehl@redhat.com>

This can help lower any margin for error when making future additions to
the list, especially if they're made out of order.

While doing so, make capitalization of ASID consistent with its usage in
the SEV firmware spec (Asid -> ASID).

Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210430134830.254741-2-ckuehl@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/sev.c | 46 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 1a88f127035..5467407ee1d 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -87,29 +87,29 @@ static SevGuestState *sev_guest;
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


