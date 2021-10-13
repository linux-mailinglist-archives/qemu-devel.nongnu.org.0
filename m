Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD9C42BB6B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:22:13 +0200 (CEST)
Received: from localhost ([::1]:51798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaSi-00067P-9T
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEi-0002Cw-4f
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:44 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:36389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEb-0005eM-81
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:42 -0400
Received: by mail-ed1-x530.google.com with SMTP id d3so7317452edp.3
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/giZe14TAwXhU0o5Dy2WDHUDipUg4ESGdmNZUsCh8Pg=;
 b=ZLELFuGwd6ZeUf3//J7KLUuAHcEz6z93e5xLCvQR7Ndyc2nEAH2gCSwAkrqsQs62xV
 YJxfAz57s+gwDzQySaYChic6DeJaUEx9VzaUq3iWgTxojLaphguh/rYF65HYm1FCMfs3
 vdEjQ2sErn0AFuM6VFwpdS0AeLPraah0ddyIDtIchyZQCvyTUJteiUiWGcqZ63H3CI70
 iKrJ3rRewJxtVeEzCM/bl7xv9mHmj/de6NRiZ10cpBxAV+VWjh8bg5KrJLbjQF1uxAXC
 VEllPuOC7bRPrvh4gIEoPWsiL2KRUfSATbsmnwDZeh3c+djIEGUk82N+ik3gEDetlsTo
 j8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/giZe14TAwXhU0o5Dy2WDHUDipUg4ESGdmNZUsCh8Pg=;
 b=XOBcU9rzAnDwTs2y2hiaOWGo7dXdlzP86BEi8xOCtSZ4MTsjKwPR9NhxnlxC7JS9oN
 i+mgTJrY4yxt5ynw2HpkN+teRvn6NhUC/k+lSYWyy+n43EhqBIeBiRw4WKHvj+JqNKrI
 yL0JKEXlB5gNgZWH7rBvrJWn1K/fIFshfG5ePd+KjF9H49SpTrpLhR0rShsy9U1yRC9f
 2EZy/JqA3VH4KitITHchmlWxN/cVd9oCUdOMLW4BTGxe1AkmPS7S3RHHP3xZLHPyKOY8
 OCvwECcm9UkQcsofp6mHBW63wTq8wySoYKCKCmoIlhMXFOwcOenuMJls1pZkRSYo6DtB
 09YA==
X-Gm-Message-State: AOAM531Ms5rm7jtOJSWuO/MR5UpLOMKLk6HcuB1+Pyao7N3I9lCj0Nns
 p26fRW4INI0QaBu5m9Jua3SBvQsgtuI=
X-Google-Smtp-Source: ABdhPJz0UVyKx8/fM2nMhlNmEHdJmSscIOiC1DQInoF/s5Aj+ZK8BqTxs2FtOBzhWZOgFv4OT+2tlQ==
X-Received: by 2002:a17:906:52d6:: with SMTP id
 w22mr37241603ejn.248.1634116054869; 
 Wed, 13 Oct 2021 02:07:34 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/40] qapi/misc-target: Group SEV QAPI definitions
Date: Wed, 13 Oct 2021 11:06:55 +0200
Message-Id: <20211013090728.309365-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

There is already a section with various SEV commands / types,
so move the SEV guest attestation together.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007161716.453984-3-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/misc-target.json | 80 +++++++++++++++++++++----------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index ae5577e039..5aa2b95b7d 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -229,6 +229,46 @@
   'data': { 'packet-header': 'str', 'secret': 'str', '*gpa': 'uint64' },
   'if': 'TARGET_I386' }
 
+##
+# @SevAttestationReport:
+#
+# The struct describes attestation report for a Secure Encrypted
+# Virtualization feature.
+#
+# @data:  guest attestation report (base64 encoded)
+#
+#
+# Since: 6.1
+##
+{ 'struct': 'SevAttestationReport',
+  'data': { 'data': 'str'},
+  'if': 'TARGET_I386' }
+
+##
+# @query-sev-attestation-report:
+#
+# This command is used to get the SEV attestation report, and is
+# supported on AMD X86 platforms only.
+#
+# @mnonce: a random 16 bytes value encoded in base64 (it will be
+#          included in report)
+#
+# Returns: SevAttestationReport objects.
+#
+# Since: 6.1
+#
+# Example:
+#
+# -> { "execute" : "query-sev-attestation-report",
+#                  "arguments": { "mnonce": "aaaaaaa" } }
+# <- { "return" : { "data": "aaaaaaaabbbddddd"} }
+#
+##
+{ 'command': 'query-sev-attestation-report',
+  'data': { 'mnonce': 'str' },
+  'returns': 'SevAttestationReport',
+  'if': 'TARGET_I386' }
+
 ##
 # @dump-skeys:
 #
@@ -297,46 +337,6 @@
   'if': 'TARGET_ARM' }
 
 
-##
-# @SevAttestationReport:
-#
-# The struct describes attestation report for a Secure Encrypted
-# Virtualization feature.
-#
-# @data:  guest attestation report (base64 encoded)
-#
-#
-# Since: 6.1
-##
-{ 'struct': 'SevAttestationReport',
-  'data': { 'data': 'str'},
-  'if': 'TARGET_I386' }
-
-##
-# @query-sev-attestation-report:
-#
-# This command is used to get the SEV attestation report, and is
-# supported on AMD X86 platforms only.
-#
-# @mnonce: a random 16 bytes value encoded in base64 (it will be
-#          included in report)
-#
-# Returns: SevAttestationReport objects.
-#
-# Since: 6.1
-#
-# Example:
-#
-# -> { "execute" : "query-sev-attestation-report",
-#                  "arguments": { "mnonce": "aaaaaaa" } }
-# <- { "return" : { "data": "aaaaaaaabbbddddd"} }
-#
-##
-{ 'command': 'query-sev-attestation-report',
-  'data': { 'mnonce': 'str' },
-  'returns': 'SevAttestationReport',
-  'if': 'TARGET_I386' }
-
 ##
 # @SGXInfo:
 #
-- 
2.31.1



