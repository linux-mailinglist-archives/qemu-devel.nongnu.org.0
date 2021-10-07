Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 207914257B4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:19:27 +0200 (CEST)
Received: from localhost ([::1]:37510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYW7B-00059r-Am
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5L-0002ws-D6
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:17:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5J-0004WF-Uj
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GNtxCZGvnxhj0iwK4swW8c7ZuwhRSlRGtvMCk2ldQWo=;
 b=i4uWre7dXPq3Egm63tsxtJoMasKOl29mBbITddMdCKqgi/dJSar3iFBq/Z74yZZa6NjxAd
 mfK6sdyy1cBmkstGGPuhI/pztZaIzV3cslCaaFFUj6sSkMR7dsKnE+s88HEPuBbvzm1IGS
 XyZvsEy5QSfi8b9cDIZzr6LnMr8RtfU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-mp5nRv4OPnSHBeu6diM8vA-1; Thu, 07 Oct 2021 12:17:25 -0400
X-MC-Unique: mp5nRv4OPnSHBeu6diM8vA-1
Received: by mail-wr1-f71.google.com with SMTP id
 y12-20020a056000168c00b00160da4de2c7so2031142wrd.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GNtxCZGvnxhj0iwK4swW8c7ZuwhRSlRGtvMCk2ldQWo=;
 b=DDhgqF+ceMaU0wDreBV0qCZbLijD7sLCuOi5VNcdkpNkIBbi99obQIWAcg97BUmSFN
 zwvX8TWF5T6Esl83FeDX9Ojn/vM1AQUn3Yvht6gh8/2AYh/VJQRucfXyymoHPdBhQe/N
 pDbbgnmHHhhPYnPcgQKuiJAV5aSBj3+jJyhaOo8YuabcjNmVCPbc3821TrLaYgV1RnKJ
 S4qhATA6R/C09Swev8/ypkrDAZ+e4tOMIqGkmBL0jq/VDy4XcWKU9qm9T50XYCj8UdGw
 IAL1i7juIVaW237cqEKzU8mTbeALNYxOi9cm1siPkHIY9n2R0o90plPmlIfmUDyqaLsB
 KTig==
X-Gm-Message-State: AOAM532bb2GSXzUcjAdSZCJ2ti6UskNGJlzcvF/WbaVQi0D69DCZUtCg
 ymkjDTyavkpC6fLTEOENiuvwoS45u1ieXUVtRcS9igdIgWMHpq24NumIj+gZUgVnuZeqDbEv6cG
 RW+Aa8rQaQsuymU38wM8L9URAZb9CVLKrCgBB2Uf8AFbnObpi0bLpIs93ukbxkbVy
X-Received: by 2002:adf:a15c:: with SMTP id r28mr6657742wrr.287.1633623443237; 
 Thu, 07 Oct 2021 09:17:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+RMzqKfLp1HEW7IFDLlNjEi/iRuCQ1sFP+CVWglEu2hUVLxRR+2IyjSGZpZn9KcPO5riLYQ==
X-Received: by 2002:adf:a15c:: with SMTP id r28mr6657700wrr.287.1633623443022; 
 Thu, 07 Oct 2021 09:17:23 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d8sm48710wrz.84.2021.10.07.09.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:17:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/23] qapi/misc-target: Wrap long 'SEV Attestation Report'
 long lines
Date: Thu,  7 Oct 2021 18:16:54 +0200
Message-Id: <20211007161716.453984-2-philmd@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wrap long lines before 70 characters for legibility.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
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


