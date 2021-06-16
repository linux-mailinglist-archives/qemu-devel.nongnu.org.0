Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732393AA5AE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:53:45 +0200 (CEST)
Received: from localhost ([::1]:54754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcXg-0003Ka-FQ
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcOE-0001P1-0l
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:43:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcOA-0000b3-VY
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P0MVNMPFT2iPgR7XnSOdieFnhCqfHwDB3FuH7adTvvs=;
 b=fEJq+mNWavrJf9DnqB15tD/Pum1+hWbnJgv6hSjoBG54weqWkf0sllu3YlfxFAi8zpLNTQ
 tpq6+a0KSEzCscLx8Sw6+f0Fo3SD0IJSM196VjIqy+2zAx5Q4VxIU7azU/L3tzY2B8tPGF
 HP7ezY1iG5tV77BunHkqNmY+oLQVEsE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-Ik1KJs5eNw-DV749V1KN0w-1; Wed, 16 Jun 2021 16:43:51 -0400
X-MC-Unique: Ik1KJs5eNw-DV749V1KN0w-1
Received: by mail-wr1-f72.google.com with SMTP id
 x9-20020a5d49090000b0290118d8746e06so1862912wrq.10
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P0MVNMPFT2iPgR7XnSOdieFnhCqfHwDB3FuH7adTvvs=;
 b=pwKSRTUfMfwlMDAcmqk2lzTK59anHbp2WzmETi7eVIurPWcwjTApCW+JuPMgN33dQD
 VrSKcbcm4r0NTduSFfecx5QlTJmjpuFq69CCsV4Go+jpKo/dxQFvX5XjrgMtM1HEmU/G
 /SRGYSVvtNhewgBCBXMcSfWNuGosY8iE76FlohTuDK3W4Ck3dNsAcOa/cBP/WNRX9V0w
 c76JTVJLxHypl6mUp+aMnYVos7cJp7F6g76KdHLylgH7mIjBoExiM0cfu706o/tjIEi3
 F3w7iuVnOd89q4gQ6bxgHf/7OQJrDwiOniYxiRr2zHST55+wi8wBajMDqmlwdBdczd8q
 qbKw==
X-Gm-Message-State: AOAM533AtxZqqK7DpGcu/N3E/jOQ2dX1ZVrzdrhbv1Ea12+gHu+OzL4S
 kivbUwRcurtYm+6DIUBrRqJbFvPrfIwnFXwriC9IwkI/BtJ/78V0hntE41oG7cQzzM0h4bNwoqA
 ycmCBtCL4vqFYBm1yqyTDjyCq7pEdGhuH9frUa9sWALHrXqy8B4tFWwtq0rpL4F6x
X-Received: by 2002:a5d:67cf:: with SMTP id n15mr1200957wrw.228.1623876229995; 
 Wed, 16 Jun 2021 13:43:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwplhFANU5pzuPNxWZIeJm7JQpPrDirmo3H9Ue0VCXVvQOvNJwE61ASe3BEOXvjHMx/sFefjw==
X-Received: by 2002:a5d:67cf:: with SMTP id n15mr1200918wrw.228.1623876229733; 
 Wed, 16 Jun 2021 13:43:49 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m37sm2445006wms.46.2021.06.16.13.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:43:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/23] qapi/misc-target: Group SEV QAPI definitions
Date: Wed, 16 Jun 2021 22:43:08 +0200
Message-Id: <20210616204328.2611406-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616204328.2611406-1-philmd@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is already a section with various SEV commands / types,
so move the SEV guest attestation together.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/misc-target.json | 81 +++++++++++++++++++++----------------------
 1 file changed, 40 insertions(+), 41 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 81646126267..7db94206212 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -219,6 +219,46 @@
   'data': { 'packet-header': 'str', 'secret': 'str', '*gpa': 'uint64' },
   'if': 'defined(TARGET_I386)' }
 
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
+  'if': 'defined(TARGET_I386)' }
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
+  'if': 'defined(TARGET_I386)' }
+
 ##
 # @dump-skeys:
 #
@@ -285,44 +325,3 @@
 ##
 { 'command': 'query-gic-capabilities', 'returns': ['GICCapability'],
   'if': 'defined(TARGET_ARM)' }
-
-
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
-  'if': 'defined(TARGET_I386)' }
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
-                   "arguments": { "mnonce": "aaaaaaa" } }
-# <- { "return" : { "data": "aaaaaaaabbbddddd"} }
-#
-##
-{ 'command': 'query-sev-attestation-report',
-  'data': { 'mnonce': 'str' },
-  'returns': 'SevAttestationReport',
-  'if': 'defined(TARGET_I386)' }
-- 
2.31.1


