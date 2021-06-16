Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B353AA5A9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:51:42 +0200 (CEST)
Received: from localhost ([::1]:46204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcVh-0005ze-Bj
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcO5-0001HF-2n
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:43:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcO2-0000Wr-7c
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f27vlBksGaI+niJES8qihuGdOvYPg6DANZZdhWGvvvs=;
 b=Go/oIV5FE6AjFgtzJdH5nL+VoNuX33ElBN0LMd4EjuiSSL+z9WsRQeGn0ufjwiT5xwlnyf
 gca85CUAW4QW34fuCIcQkI15TSI4esyVasEsPlzBgCUpztPu95Qzqf9pEH2vM9lbtjdq9q
 8UdmCkCBx0YQY5Sj1hB++SZ2P+zJgac=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-7-OF2EISOO6bTALFQwIwwA-1; Wed, 16 Jun 2021 16:43:44 -0400
X-MC-Unique: 7-OF2EISOO6bTALFQwIwwA-1
Received: by mail-wr1-f70.google.com with SMTP id
 k25-20020a5d52590000b0290114dee5b660so1857191wrc.16
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f27vlBksGaI+niJES8qihuGdOvYPg6DANZZdhWGvvvs=;
 b=jbM7m2B4MJnOrFSbK5dxE4dNFuBBvjbiFDF25zJDdMTgXTAb6emibYf7UM0rx7Sgfy
 iXihuw/4fiNbCdJ4xv0Eq5UN03hQi3ipo97tJWVv1dEruZsWZBoz9a3t67nPrl7E4kiP
 0j0Gg2Ql/KlfMbqb5Ky/uvlfC5u0/oppZ0FWc26YUc7LFjWpPKL5iMhPj4zpJdzBN85U
 5SsuM+zWdWCkwnXbo1PaJwgxZgIAqaKcJqBQpZBjUFwytIB+vz4alBjfT8vAmkqDbY0q
 NBYBb7eq1iHH2RFhzSkKY7rY+0mU+KM1NOsa4pJxTzq7wiI6eEKNnQpLP+apW0eNQZZo
 G9kg==
X-Gm-Message-State: AOAM532huon8YBduYxTpOjQ1anuaifx/4koJ8uGN53FKRR0UumrTM6fb
 nuXwfArwO0tTnB46caKYvkhoqfUKny87a3gxBOhsbERm/1vRDhUgDddkxm6oa328Bnpy/vE3hNw
 UGWBrfRyy8thkoHiVUmD8E+0nGO9HCeTG7fUsYnLRx/9TSUlsC2hoPNt8Sz2vDdFa
X-Received: by 2002:adf:ef06:: with SMTP id e6mr1122926wro.393.1623876222837; 
 Wed, 16 Jun 2021 13:43:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPYvJewK2vRAkCpO/ycM+faWpflOVGubRIFJXIAOJg0CaB9TsKFUae0tpe7UL59HYhOCaMNA==
X-Received: by 2002:adf:ef06:: with SMTP id e6mr1122888wro.393.1623876222541; 
 Wed, 16 Jun 2021 13:43:42 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m65sm2716810wmm.19.2021.06.16.13.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:43:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/23] qapi/misc-target: Wrap long 'SEV Attestation Report'
 long lines
Date: Wed, 16 Jun 2021 22:43:07 +0200
Message-Id: <20210616204328.2611406-3-philmd@redhat.com>
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

Wrap long lines before 70 characters for legibility.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Note: it would be nice if checkpatch enforce 70 char for json
      (or at least QAPI json), that would save future
      developer modifying QAPI definitions reformating time.
---
 qapi/misc-target.json | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 5573dcf8f08..81646126267 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -290,8 +290,8 @@
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
@@ -305,10 +305,11 @@
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
@@ -316,10 +317,12 @@
 #
 # Example:
 #
-# -> { "execute" : "query-sev-attestation-report", "arguments": { "mnonce": "aaaaaaa" } }
+# -> { "execute" : "query-sev-attestation-report",
+                   "arguments": { "mnonce": "aaaaaaa" } }
 # <- { "return" : { "data": "aaaaaaaabbbddddd"} }
 #
 ##
-{ 'command': 'query-sev-attestation-report', 'data': { 'mnonce': 'str' },
+{ 'command': 'query-sev-attestation-report',
+  'data': { 'mnonce': 'str' },
   'returns': 'SevAttestationReport',
   'if': 'defined(TARGET_I386)' }
-- 
2.31.1


