Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7713A24B8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:48:47 +0200 (CEST)
Received: from localhost ([::1]:59898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrEUg-0001oQ-7W
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrESC-0007Vq-Ch
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrESA-00058o-Cr
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623307569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FjkQZ0yzu9xDnZx5K+AIPt7jpTRH0jKavlFDBx0pW4E=;
 b=aya2ydUTACtW4R/1800one6PxE4WnjS1OMJHgu9loe6RJWm39dXQ1sl8ByNFEF/yJ6FYCP
 4+a8uNsGW/GcvdMyOx5vR7GNBa37StlydI2PjDAkhWK1fNNgDFKrbyOW2dkAImMeZ/ig9g
 Dchh7QQHo3QnOKWNWwxnCRL8b7v+Z08=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-_mchGanOMl2UaEgDa2FEnA-1; Thu, 10 Jun 2021 02:46:09 -0400
X-MC-Unique: _mchGanOMl2UaEgDa2FEnA-1
Received: by mail-wm1-f72.google.com with SMTP id
 z25-20020a1c4c190000b029019f15b0657dso2665069wmf.8
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 23:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FjkQZ0yzu9xDnZx5K+AIPt7jpTRH0jKavlFDBx0pW4E=;
 b=UwKBgsHzv4ic0cki2qM1wZvIoUSO2PDrXHoHuWWCTGwknChd0QwImpCCwXH/QaB8FF
 m6cSbpsla9YipdLL3XmnihOJgL7VsiPl0syR6lrOPGqdjfGLnIQODVRY0jSuqiUi+vte
 AFPPVl24ixRsn/YuwjAzCynTxyvO5BwzjcrIjX4iDNwxQU9dQt8K0N/oi2IZktx12kPh
 RUFIOGaGvwMD9W8kkQ7LGPtZ5pzyVCtJ+7r6cQxyw0zUyIC/eUDxdxpYywPC+B9hVa5E
 Y9QZQIAGFmG/dpY0kR2TvxvVFS261KjGQTVV89DpuaSxD0tC4m4Xe/szMdX28SP7c70f
 +JGg==
X-Gm-Message-State: AOAM530/oZbECQ5wVTxzuFKbHwRwO8qhZs1+AXqnwrFC9K9GOjwpebpu
 DEQy+1fQwf6OkMA0H5v8qfmS87hi3s/ruNEleZ9OwqFu2u7kGhcJZw4bFF27UhwTy18s7bz5FC9
 ee2lNqQkJmj4qq/0DJBPVmRHYFzExZyP0UNpd/gtG5sMbrhfYwHqYqmq930YxmbuD
X-Received: by 2002:adf:f382:: with SMTP id m2mr3538152wro.394.1623307567561; 
 Wed, 09 Jun 2021 23:46:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwD3Y33J1pqwWZ9Wgz1TCngLNjD7qht0/s4Q5cBDHjR8jdAs61L8MQXcXpM3FRBfHv1mIIpEQ==
X-Received: by 2002:adf:f382:: with SMTP id m2mr3538127wro.394.1623307567295; 
 Wed, 09 Jun 2021 23:46:07 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id z3sm2371221wrl.13.2021.06.09.23.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 23:46:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/11] qapi/misc-target: Group SEV QAPI definitions
Date: Thu, 10 Jun 2021 08:45:47 +0200
Message-Id: <20210610064556.1421620-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610064556.1421620-1-philmd@redhat.com>
References: <20210610064556.1421620-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is already a section with various SEV commands / types,
so move the SEV guest attestation together.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/misc-target.json | 75 +++++++++++++++++++++----------------------
 1 file changed, 37 insertions(+), 38 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 5573dcf8f08..1b81f7017d4 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -219,6 +219,43 @@
   'data': { 'packet-header': 'str', 'secret': 'str', '*gpa': 'uint64' },
   'if': 'defined(TARGET_I386)' }
 
+##
+# @SevAttestationReport:
+#
+# The struct describes attestation report for a Secure Encrypted Virtualization
+# feature.
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
+# This command is used to get the SEV attestation report, and is supported on AMD
+# X86 platforms only.
+#
+# @mnonce: a random 16 bytes value encoded in base64 (it will be included in report)
+#
+# Returns: SevAttestationReport objects.
+#
+# Since: 6.1
+#
+# Example:
+#
+# -> { "execute" : "query-sev-attestation-report", "arguments": { "mnonce": "aaaaaaa" } }
+# <- { "return" : { "data": "aaaaaaaabbbddddd"} }
+#
+##
+{ 'command': 'query-sev-attestation-report', 'data': { 'mnonce': 'str' },
+  'returns': 'SevAttestationReport',
+  'if': 'defined(TARGET_I386)' }
+
 ##
 # @dump-skeys:
 #
@@ -285,41 +322,3 @@
 ##
 { 'command': 'query-gic-capabilities', 'returns': ['GICCapability'],
   'if': 'defined(TARGET_ARM)' }
-
-
-##
-# @SevAttestationReport:
-#
-# The struct describes attestation report for a Secure Encrypted Virtualization
-# feature.
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
-# This command is used to get the SEV attestation report, and is supported on AMD
-# X86 platforms only.
-#
-# @mnonce: a random 16 bytes value encoded in base64 (it will be included in report)
-#
-# Returns: SevAttestationReport objects.
-#
-# Since: 6.1
-#
-# Example:
-#
-# -> { "execute" : "query-sev-attestation-report", "arguments": { "mnonce": "aaaaaaa" } }
-# <- { "return" : { "data": "aaaaaaaabbbddddd"} }
-#
-##
-{ 'command': 'query-sev-attestation-report', 'data': { 'mnonce': 'str' },
-  'returns': 'SevAttestationReport',
-  'if': 'defined(TARGET_I386)' }
-- 
2.31.1


