Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A314257DB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:24:29 +0200 (CEST)
Received: from localhost ([::1]:54682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWC4-0008DH-8R
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5T-0003Cg-O3
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:17:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5R-0004eg-Hd
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T2ImpqtRm6esWhnoDgzoQLTDZKGPR7WZ/icRmMlGH5o=;
 b=Fo0sdOOcLpO7nqXoseb9+xIKXUtY1sp5KjteTDiIbGUBKi4qdTxOSKiO/gegqgRIWDuCq/
 tQNU20Pdq+UCFMwboWlayzqr5VJ2z5u8ztyIwinYujucaS+4M9j12gWUttaAgL3mZ2v7+c
 KXYXt4+lOCoLmGo7Hd4n5uIF8+GFJE8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-ksnyOWZFMySUGoZd_rHIrw-1; Thu, 07 Oct 2021 12:17:29 -0400
X-MC-Unique: ksnyOWZFMySUGoZd_rHIrw-1
Received: by mail-wr1-f72.google.com with SMTP id
 l9-20020adfc789000000b00160111fd4e8so5140992wrg.17
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T2ImpqtRm6esWhnoDgzoQLTDZKGPR7WZ/icRmMlGH5o=;
 b=oLOO40QeivEIT+C9aFGKhY74AYZVVtaHVtpPVS1l3h5GlcTdVJnFkADbXieSCn09wi
 WnbnUCzu5J/iAiiTvqXGSHzaUx1yXUuP2AOhHvXs/T290970lY5QfE1jEyAzI0WD6b7n
 20KbZmnW+6PT0BnSt6tLrULJEm+OE2ok72cede6Q3DMKmQrnrBEq9bfRDnRBH3w3wliv
 vs6WSEPvC925Zg91yjoEWWuxMpOYECXHl+KVNoQCcpFRq4DeF0UcYf1RBO8mv0duUG3U
 MlAr8KI3vhqdUgRMqPEiPCtpKH238Ruk5mFnmIKAGwBmYfE1Tge33gRs+xJy0BxAOroQ
 /rww==
X-Gm-Message-State: AOAM531XTHzmE3tmG0bDhG/bUJR8tRwXO4Uyq8Xr7sjiS4sg2eLD8t2u
 3cc8BDTW/u0Lo4ZcdB3uqM6Om0MSCBZgcDnyO4q/2C/JkDYdohivocGZOD1EKiQjxyxzWHah52f
 MvNKM6hxFSFHIm8qLi1j1IvYWa4VadO8Dtu08eiHmgGxNaIjX1NWzmZYwRA5nugDT
X-Received: by 2002:a05:600c:240a:: with SMTP id
 10mr17330265wmp.170.1633623448024; 
 Thu, 07 Oct 2021 09:17:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXiHFJgriMo7TGc679FzXDocjunP1esVffm6c4eGKKXk96WSVJZU9pFdlw5+ue8yJioBiocA==
X-Received: by 2002:a05:600c:240a:: with SMTP id
 10mr17330219wmp.170.1633623447678; 
 Thu, 07 Oct 2021 09:17:27 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id w11sm4476wmc.44.2021.10.07.09.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:17:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/23] qapi/misc-target: Group SEV QAPI definitions
Date: Thu,  7 Oct 2021 18:16:55 +0200
Message-Id: <20211007161716.453984-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007161716.453984-1-philmd@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is already a section with various SEV commands / types,
so move the SEV guest attestation together.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/misc-target.json | 80 +++++++++++++++++++++----------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index ae5577e0390..5aa2b95b7d4 100644
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


