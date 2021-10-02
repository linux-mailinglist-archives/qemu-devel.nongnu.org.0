Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC9D41FBFB
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 14:58:55 +0200 (CEST)
Received: from localhost ([::1]:37244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWebO-0007hv-6v
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 08:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWA-0000XB-1Q
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:53:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeW8-0000ZE-51
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:53:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=77XCyInhhDjafl0gvl8ONZ83GvKuNYK6mpZCL7SUumw=;
 b=ep+GH9K8FmZt02QS3Ybf3xdgx+qrha3NQCy9m5GOhjEL/QPgBewm71xRK9unD+H0fb3rkN
 vXq36OZIUau0HH26zkJaFkCjrkVpIkEdLhGJEDMjReiknCeyHbnuLZk7/ZhU0AobvFAO40
 L9KwQTeLGFT/mNmmtQNnhYHkpzf6vsg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-a-UGOi83MHWfFdRvt4Enbw-1; Sat, 02 Oct 2021 08:53:25 -0400
X-MC-Unique: a-UGOi83MHWfFdRvt4Enbw-1
Received: by mail-wm1-f72.google.com with SMTP id
 x3-20020a05600c21c300b0030d2b0fb3b4so4596844wmj.5
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=77XCyInhhDjafl0gvl8ONZ83GvKuNYK6mpZCL7SUumw=;
 b=IUuraTF3WVy4pESJmByvgHbbd+CRhAYhGmTn/cC1zBdII5UzHaHaMITUfpAiB5N4ZH
 uMdTRzyRnA/b52yalJemShJL5phWsyuhUz6aEHlON0WtKR6mf17o2TYfa423JW2MA498
 0FnOUwFMkOoXlRC6tXMNZDLomozqfBhXVvekGQGZyzDpq/y+54vX1sPEb5MKAsCHDSrY
 AIPsm+N9cqHpqgrbL7FXn/cNfYpqmZaqcVdhPhDIxI7f4H+wWIQfD1mUL1v6hQL2BFbE
 KfLNZJdJE+Rm14C9Wrb7mkIa3/JhV0CMz7z8xEfTt5ablxC6UALOLWju0py/CE9kXQ3F
 fA0Q==
X-Gm-Message-State: AOAM530yTdphJH7AOf7bd/7kDgOJ57ig9sxyAEJR9O61rMIq5r0tSCl+
 hnPExHiIinmyVZvdztZh+S3gBPhmSCRHr7RxNMjZV93Iquz1VVm/Lo4ShPlgaLb0qVaL9X1XAbc
 Yw3N4q5UJucS366OApkGtXEP5wBJQTVDf9OL5B8arlrCUoDW9s9oPetksckUACNn/
X-Received: by 2002:a1c:35c7:: with SMTP id c190mr9340548wma.57.1633179204218; 
 Sat, 02 Oct 2021 05:53:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1GirbsivBGcc75qonhC/tP/yFG+dbrQslj/ieJQDwUJOIb3YR9xlNe3qi6SdxOBKkUr/2Og==
X-Received: by 2002:a1c:35c7:: with SMTP id c190mr9340526wma.57.1633179203922; 
 Sat, 02 Oct 2021 05:53:23 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 c7sm10953748wmq.13.2021.10.02.05.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:53:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/22] qapi/misc-target: Wrap long 'SEV Attestation Report'
 long lines
Date: Sat,  2 Oct 2021 14:52:56 +0200
Message-Id: <20211002125317.3418648-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002125317.3418648-1-philmd@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wrap long lines before 70 characters for legibility.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/misc-target.json | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 594fbd1577f..ae5577e0390 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -300,8 +300,8 @@
 ##
 # @SevAttestationReport:
 #
-# The struct describes attestation report for a Secure Encrypted Virtualization
-# feature.
+# The struct describes attestation report for a Secure Encrypted
+# Virtualization feature.
 #
 # @data:  guest attestation report (base64 encoded)
 #
@@ -315,10 +315,11 @@
 ##
 # @query-sev-attestation-report:
 #
-# This command is used to get the SEV attestation report, and is supported on AMD
-# X86 platforms only.
+# This command is used to get the SEV attestation report, and is
+# supported on AMD X86 platforms only.
 #
-# @mnonce: a random 16 bytes value encoded in base64 (it will be included in report)
+# @mnonce: a random 16 bytes value encoded in base64 (it will be
+#          included in report)
 #
 # Returns: SevAttestationReport objects.
 #
@@ -326,11 +327,13 @@
 #
 # Example:
 #
-# -> { "execute" : "query-sev-attestation-report", "arguments": { "mnonce": "aaaaaaa" } }
+# -> { "execute" : "query-sev-attestation-report",
+#                  "arguments": { "mnonce": "aaaaaaa" } }
 # <- { "return" : { "data": "aaaaaaaabbbddddd"} }
 #
 ##
-{ 'command': 'query-sev-attestation-report', 'data': { 'mnonce': 'str' },
+{ 'command': 'query-sev-attestation-report',
+  'data': { 'mnonce': 'str' },
   'returns': 'SevAttestationReport',
   'if': 'TARGET_I386' }
 
-- 
2.31.1


