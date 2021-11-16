Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77376453BCB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 22:42:31 +0100 (CET)
Received: from localhost ([::1]:57670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn6Dm-0001uq-1t
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 16:42:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1mn6Cp-0001G8-Kn
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 16:41:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1mn6Cm-000454-7x
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 16:41:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637098886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c1XcR1lgQisttXwWaF7KjLI8WftPbhuxF3FmagGOsqA=;
 b=PRPdaOl+u5OR0g+SqcHLB2uWoLRUxiHuyuPOdf2r8SWDomRJzibUX9l1e4ymWFD6KCzXMt
 qDUQzZo+iP92lf9tKoRe6ZX4fM7rQTHOC/UW8fD0LsDC4ze/FrXOkFRVNcpq5h1OqdBOCp
 gesW045MG3fNJSzsp7dmReao/V7Fy0o=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-l96DCQe9MrqPkmjFGJd_Cg-1; Tue, 16 Nov 2021 16:41:25 -0500
X-MC-Unique: l96DCQe9MrqPkmjFGJd_Cg-1
Received: by mail-qk1-f197.google.com with SMTP id
 v13-20020a05620a440d00b00468380f4407so219020qkp.17
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 13:41:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c1XcR1lgQisttXwWaF7KjLI8WftPbhuxF3FmagGOsqA=;
 b=YpcpOIfHp7AOu5B9vEBNvUX4lyE95zlS2cAVoxCTY6ohm6YPoZ3omp7/ZT6ZIeJki/
 uoaB8y1Zm7hyk+YmmxOjCorgRsTHMY8pQRirPjtdXaVW5Gk8lT9YJfsJt++x1Cq1/sYP
 iYZZ0lF8ggx4cNez4yU2TBl6GBjnyZDrAm+qrCBbaqE3Jh4vz/YaG7uEjq9TS8Dkz+f7
 mfKS2cXexH3tbfZiUKB0gNoiytDi6xqG10P0zEFI8Ipoa4pqcLV8V4CO3MrXRW/Eo8FB
 PJY/EXMj/p56ybycjh9MfVqsQGb78lrrk62JFMLp4yyzWcVDqzWCMy7Gm45ipoUsOF86
 IT6Q==
X-Gm-Message-State: AOAM532JIHhR/knHiQEfzX5nA0J4XK6aggDVrqlcsv/YlIaJKeZWzZHC
 o/QjyP5QR64ywTUSLaw5ytRMH9lgnVqqDwUHgw1C6polYh4Sn/0FCXo3XXt8wCt381/GCGygZS3
 7Eg+TAZrELkViiURNa0IkbsBRAxGR86wLulIYoYas9mmzIJ6xjiHLlp63rYoGaAoDoPo=
X-Received: by 2002:a05:620a:2589:: with SMTP id
 x9mr9064305qko.454.1637098884503; 
 Tue, 16 Nov 2021 13:41:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoK77BQgdC+mkfcZYlYgHvo0X/I00SgFa12PkUpKpwiadMtlERa/KaqLqPLXryzH0FchpoIg==
X-Received: by 2002:a05:620a:2589:: with SMTP id
 x9mr9064261qko.454.1637098884153; 
 Tue, 16 Nov 2021 13:41:24 -0800 (PST)
Received: from fedora.myfiosgateway.com
 (pool-71-175-3-221.phlapa.fios.verizon.net. [71.175.3.221])
 by smtp.gmail.com with ESMTPSA id q185sm8885891qke.64.2021.11.16.13.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 13:41:23 -0800 (PST)
From: Tyler Fanelli <tfanelli@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] sev: check which processor the ASK/ARK chain should match
Date: Tue, 16 Nov 2021 16:38:59 -0500
Message-Id: <20211116213858.363583-1-tfanelli@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=tfanelli@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=tfanelli@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: berrange@redhat.com, kvm@vger.kernel.org, mtosatti@redhat.com,
 armbru@redhat.com, Tyler Fanelli <tfanelli@redhat.com>, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AMD ASK/ARK certificate chain differs between AMD SEV
processor generations. SEV capabilities should provide
which ASK/ARK certificate should be used based on the host
processor.

Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
---
 qapi/misc-target.json | 28 ++++++++++++++++++++++++++--
 target/i386/sev.c     | 17 ++++++++++++++---
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 5aa2b95b7d..c64aa3ff57 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -166,6 +166,24 @@
 { 'command': 'query-sev-launch-measure', 'returns': 'SevLaunchMeasureInfo',
   'if': 'TARGET_I386' }
 
+##
+# @SevAskArkCertName:
+#
+# This enum describes which ASK/ARK certificate should be
+# used based on the generation of an AMD Secure Encrypted
+# Virtualization processor.
+#
+# @naples: AMD Naples processor (SEV 1st generation)
+#
+# @rome: AMD Rome processor (SEV 2nd generation)
+#
+# @milan: AMD Milan processor (SEV 3rd generation)
+#
+# Since: 7.0
+##
+{ 'enum': 'SevAskArkCertName',
+  'data': ['naples', 'rome', 'milan'],
+  'if': 'TARGET_I386' }
 
 ##
 # @SevCapability:
@@ -182,13 +200,18 @@
 # @reduced-phys-bits: Number of physical Address bit reduction when SEV is
 #                     enabled
 #
+# @ask-ark-cert-name: The generation in which the AMD
+#                     ARK/ASK should be derived from
+#                     (since 7.0)
+#
 # Since: 2.12
 ##
 { 'struct': 'SevCapability',
   'data': { 'pdh': 'str',
             'cert-chain': 'str',
             'cbitpos': 'int',
-            'reduced-phys-bits': 'int'},
+            'reduced-phys-bits': 'int',
+            'ask-ark-cert-name': 'SevAskArkCertName'},
   'if': 'TARGET_I386' }
 
 ##
@@ -205,7 +228,8 @@
 #
 # -> { "execute": "query-sev-capabilities" }
 # <- { "return": { "pdh": "8CCDD8DDD", "cert-chain": "888CCCDDDEE",
-#                  "cbitpos": 47, "reduced-phys-bits": 5}}
+#                  "cbitpos": 47, "reduced-phys-bits": 5,
+#                  "ask-ark-cert-name": "naples"}}
 #
 ##
 { 'command': 'query-sev-capabilities', 'returns': 'SevCapability',
diff --git a/target/i386/sev.c b/target/i386/sev.c
index eede07f11d..f30171e5ba 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -506,8 +506,9 @@ static SevCapability *sev_get_capabilities(Error **errp)
     guchar *pdh_data = NULL;
     guchar *cert_chain_data = NULL;
     size_t pdh_len = 0, cert_chain_len = 0;
-    uint32_t ebx;
-    int fd;
+    uint32_t eax, ebx;
+    int fd, es, snp;
+
 
     if (!kvm_enabled()) {
         error_setg(errp, "KVM not enabled");
@@ -534,9 +535,19 @@ static SevCapability *sev_get_capabilities(Error **errp)
     cap->pdh = g_base64_encode(pdh_data, pdh_len);
     cap->cert_chain = g_base64_encode(cert_chain_data, cert_chain_len);
 
-    host_cpuid(0x8000001F, 0, NULL, &ebx, NULL, NULL);
+    host_cpuid(0x8000001F, 0, &eax, &ebx, NULL, NULL);
     cap->cbitpos = ebx & 0x3f;
 
+    es = eax & 0x8;
+    snp = eax & 0x10;
+    if (!es && !snp) {
+	cap->ask_ark_cert_name = SEV_ASK_ARK_CERT_NAME_NAPLES;
+    } else if (es && !snp) {
+	cap->ask_ark_cert_name = SEV_ASK_ARK_CERT_NAME_ROME;
+    } else {
+	cap->ask_ark_cert_name = SEV_ASK_ARK_CERT_NAME_MILAN;
+    }
+
     /*
      * When SEV feature is enabled, we loose one bit in guest physical
      * addressing.
-- 
2.31.1


