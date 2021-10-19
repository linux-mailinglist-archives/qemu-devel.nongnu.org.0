Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C09D433965
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:59:11 +0200 (CEST)
Received: from localhost ([::1]:40844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqa6-0001Og-Ml
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq2j-0005uH-Jh; Tue, 19 Oct 2021 10:24:42 -0400
Received: from mail-co1nam11on2076.outbound.protection.outlook.com
 ([40.107.220.76]:40448 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq2W-0002EI-QP; Tue, 19 Oct 2021 10:24:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZerSVIQTTnAm45ZNgSqNqw/BhSbsOmOCQwLVe0wBHMhm43AQiGpYWKzq/0XjqB7m/1beAUyiiWqUzm2L6CdZuve0bpovxi5FdPivmuAHR92yACXgBKHnRRK3diHfWL2c+LF/2ywuythetMl3gIUNDihzaJL8jJXq4Z/ACrRC2XUMESLmz9+vLdyp/VC6DLYcr8BaYJwfTJObfGk6d7HS/hSnYp4J/eIzMJiPRYMpTSi6F/USnIf0o+56YC2YD0qhadMJ3dPYH1difFSgexHgqtv/G/QlOPAXQGi0lFfQAbH64wwPDnzq5g19QMA0V1L2j3csTvACgMJw2OXLIr0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Au4JseQIzhEWjEGJqVKAYPKIG2saGQSEilfiwZlhDbw=;
 b=eaNx1QsdhXNYGoxkAupS/OxzZdnIC0DyJjm6dLiv2jci0TCH9GN9buWQwrkg5+6ZDdzgtqYMsMvk/Z2zQTIq8CKs2xzKcxzXUyoexrXZfTp5RDvy+Ws6v3sTbtg6KnCGwY9XDzbJTGosCbv67laFXbJJjYNkLpOe9gmZa3nGd3Oif/5gFcZMSNx2rgEhX5weTqXr2/mwMUGMpeX3BoLh3ToYRXUAGum3SYV4tKCwAc3R8BGcdN4xdiHXx6ORbDpd0EvHEdlVlaaXUAXWwMLB+S5Mp40F7fMSlhYsVcb4/TW8NnXMOwzxjJN+kUpf65UEV9hnPZdtdOhFYUI+UvH+nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Au4JseQIzhEWjEGJqVKAYPKIG2saGQSEilfiwZlhDbw=;
 b=MxItoGFMDIJEJ0c0ye8PTOFJpftu3KyWnLXtJyKwu1gJW+2jhly3EV1MpQxepSAiwl15jTH73AycHgMikJhHNTEINLYfnwZdfSjBAmQyhWv/8NHaoJUo55vTPWcUZ6/uGDU5PsY2KCl0csAgA2lNSZ/Xmd/noqFJ29OtBci9QVM=
Received: from DM6PR13CA0023.namprd13.prod.outlook.com (2603:10b6:5:bc::36) by
 SN1PR12MB2573.namprd12.prod.outlook.com (2603:10b6:802:2b::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18; Tue, 19 Oct 2021 14:24:23 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::f2) by DM6PR13CA0023.outlook.office365.com
 (2603:10b6:5:bc::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.10 via Frontend
 Transport; Tue, 19 Oct 2021 14:24:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:24:22 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:24:21 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 34/64] crypto: Make QCryptoTLSCreds* structures private
Date: Tue, 19 Oct 2021 09:09:14 -0500
Message-ID: <20211019140944.152419-35-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 749e10d2-e80d-4b46-4401-08d9930c25a6
X-MS-TrafficTypeDiagnostic: SN1PR12MB2573:
X-Microsoft-Antispam-PRVS: <SN1PR12MB25733527F3DB979C0078A60495BD9@SN1PR12MB2573.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fqv2QqweNZXfyQtYAnrKdNNnd4P743nVLgDNX9J4a/2nSofTH2Nk0xoC7TgV13Tw/YT5c2tttalPMEz9kjsIaApyianr/ebJTRRQGk+fVO+nMeN9QdCzFeC1cg+50r0AEQ6a2EQi2310ZBBCFa5O+kYvbBnS27MngAjkObF42pXWzhxUOT9ill8KSIAOziTGiQFG/LlHdHAkn7YZ0KRVeAwIKCPW3lj/TQBULSmq+oWufcE7/ydREWh7WigPvCYhvErvz+UlsqORqemz71faqcHWA+8Yiglewn/wSZjsReGDT1k/OENqFWmlHlFeMRivaXgI/Gfkg8fYzZZN2uOJzB1Sle5+5NPmMr/i6vh70j/4csEd5ietXpU/9JFrLahEZyAouFFa806v+oD+GkomGM6B7wUULCFB9+aLjovD3vZHlR0hVLNqyZOlwuA0vYQVZ0e4Z9+QZSAGUXx2ia3oDtwR+FJP4A2S4jASqjM5ovtgeHRPxvclObMeceBQe2dQX1UQ+Helnl1h+UUfODTvSQbKgGZUYNYcCl8/j1ACqmjozN4YHqUHl7J3TfGugxp8c8QAgYao8lrvJAkYE7kYyQ8HgQv88f7QiTqucg0QPkoPmT5hLi487No5obOXrYQS/nsKb122hWL/D2oLSi8njUEOxS8WT8Mush9D58fk6TmgWQ5Hfit/8O1WMd26Cz5E+LFmmoiUM5719s96w+3DH123XFk+Rx85M8id5LNLiAn6YslpYlv7RK+jgBxNFc4BEax8etgDRGP9mUYnOZvGyHf91iWyixEsd+GyCjpoKamfuUYjk7V/NlFy5V6EOqpB
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(44832011)(966005)(2616005)(70206006)(508600001)(70586007)(316002)(54906003)(82310400003)(2906002)(86362001)(356005)(81166007)(47076005)(36860700001)(36756003)(19627235002)(83380400001)(6666004)(8676002)(5660300002)(186003)(336012)(1076003)(16526019)(8936002)(4326008)(6916009)(426003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:24:22.9320 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 749e10d2-e80d-4b46-4401-08d9930c25a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2573
Received-SPF: softfail client-ip=40.107.220.76;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Code consuming the "crypto/tlscreds*.h" APIs doesn't need
to access its internals. Move the structure definitions to
the "tlscredspriv.h" private header (only accessible by
implementations). The public headers (in include/) still
forward-declare the structures typedef.

Note, tlscreds.c and 3 of the 5 modified source files already
include "tlscredspriv.h", so only add it to tls-cipher-suites.c
and tlssession.c.

Removing the internals from the public header solves a bug
introduced by commit 7de2e856533 ("yank: Unregister function
when using TLS migration") which made migration/qemu-file-channel.c
include "io/channel-tls.h", itself sometime depends on GNUTLS,
leading to a build failure on OSX:

  [2/35] Compiling C object libmigration.fa.p/migration_qemu-file-channel.c.o
  FAILED: libmigration.fa.p/migration_qemu-file-channel.c.o
  cc -Ilibmigration.fa.p -I. -I.. -Iqapi [ ... ] -o libmigration.fa.p/migration_qemu-file-channel.c.o -c ../migration/qemu-file-channel.c
  In file included from ../migration/qemu-file-channel.c:29:
  In file included from include/io/channel-tls.h:26:
  In file included from include/crypto/tlssession.h:24:
  include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/gnutls.h' file not found
  #include <gnutls/gnutls.h>
           ^~~~~~~~~~~~~~~~~
  1 error generated.

Reported-by: Stefan Weil <sw@weilnetz.de>
Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/407
Fixes: 7de2e856533 ("yank: Unregister function when using TLS migration")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
(cherry picked from commit 678bcc3c2cf22262d0a72b52da57737c4a40e040)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 crypto/tls-cipher-suites.c         |  7 +++++
 crypto/tlscredsanon.c              |  2 ++
 crypto/tlscredspriv.h              | 45 ++++++++++++++++++++++++++++++
 crypto/tlscredspsk.c               |  2 ++
 crypto/tlscredsx509.c              |  1 +
 crypto/tlssession.c                |  1 +
 include/crypto/tls-cipher-suites.h |  6 ----
 include/crypto/tlscreds.h          | 16 -----------
 include/crypto/tlscredsanon.h      | 12 --------
 include/crypto/tlscredspsk.h       | 12 --------
 include/crypto/tlscredsx509.h      | 10 -------
 11 files changed, 58 insertions(+), 56 deletions(-)

diff --git a/crypto/tls-cipher-suites.c b/crypto/tls-cipher-suites.c
index 55fb5f7c19..5e4f597464 100644
--- a/crypto/tls-cipher-suites.c
+++ b/crypto/tls-cipher-suites.c
@@ -14,8 +14,15 @@
 #include "crypto/tlscreds.h"
 #include "crypto/tls-cipher-suites.h"
 #include "hw/nvram/fw_cfg.h"
+#include "tlscredspriv.h"
 #include "trace.h"
 
+struct QCryptoTLSCipherSuites {
+    /* <private> */
+    QCryptoTLSCreds parent_obj;
+    /* <public> */
+};
+
 /*
  * IANA registered TLS ciphers:
  * https://www.iana.org/assignments/tls-parameters/tls-parameters.xhtml#tls-parameters-4
diff --git a/crypto/tlscredsanon.c b/crypto/tlscredsanon.c
index bea5f76c55..6fb83639ec 100644
--- a/crypto/tlscredsanon.c
+++ b/crypto/tlscredsanon.c
@@ -29,6 +29,8 @@
 
 #ifdef CONFIG_GNUTLS
 
+#include <gnutls/gnutls.h>
+
 
 static int
 qcrypto_tls_creds_anon_load(QCryptoTLSCredsAnon *creds,
diff --git a/crypto/tlscredspriv.h b/crypto/tlscredspriv.h
index 39f1a91c41..df9815a286 100644
--- a/crypto/tlscredspriv.h
+++ b/crypto/tlscredspriv.h
@@ -23,6 +23,51 @@
 
 #include "crypto/tlscreds.h"
 
+#ifdef CONFIG_GNUTLS
+#include <gnutls/gnutls.h>
+#endif
+
+struct QCryptoTLSCreds {
+    Object parent_obj;
+    char *dir;
+    QCryptoTLSCredsEndpoint endpoint;
+#ifdef CONFIG_GNUTLS
+    gnutls_dh_params_t dh_params;
+#endif
+    bool verifyPeer;
+    char *priority;
+};
+
+struct QCryptoTLSCredsAnon {
+    QCryptoTLSCreds parent_obj;
+#ifdef CONFIG_GNUTLS
+    union {
+        gnutls_anon_server_credentials_t server;
+        gnutls_anon_client_credentials_t client;
+    } data;
+#endif
+};
+
+struct QCryptoTLSCredsPSK {
+    QCryptoTLSCreds parent_obj;
+    char *username;
+#ifdef CONFIG_GNUTLS
+    union {
+        gnutls_psk_server_credentials_t server;
+        gnutls_psk_client_credentials_t client;
+    } data;
+#endif
+};
+
+struct QCryptoTLSCredsX509 {
+    QCryptoTLSCreds parent_obj;
+#ifdef CONFIG_GNUTLS
+    gnutls_certificate_credentials_t data;
+#endif
+    bool sanityCheck;
+    char *passwordid;
+};
+
 #ifdef CONFIG_GNUTLS
 
 int qcrypto_tls_creds_get_path(QCryptoTLSCreds *creds,
diff --git a/crypto/tlscredspsk.c b/crypto/tlscredspsk.c
index f5a31108d1..752f2d92be 100644
--- a/crypto/tlscredspsk.c
+++ b/crypto/tlscredspsk.c
@@ -29,6 +29,8 @@
 
 #ifdef CONFIG_GNUTLS
 
+#include <gnutls/gnutls.h>
+
 static int
 lookup_key(const char *pskfile, const char *username, gnutls_datum_t *key,
            Error **errp)
diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
index bc503bab55..6dd0d14d29 100644
--- a/crypto/tlscredsx509.c
+++ b/crypto/tlscredsx509.c
@@ -30,6 +30,7 @@
 
 #ifdef CONFIG_GNUTLS
 
+#include <gnutls/gnutls.h>
 #include <gnutls/x509.h>
 
 
diff --git a/crypto/tlssession.c b/crypto/tlssession.c
index 33203e8ca7..a8db8c76d1 100644
--- a/crypto/tlssession.c
+++ b/crypto/tlssession.c
@@ -25,6 +25,7 @@
 #include "crypto/tlscredsx509.h"
 #include "qapi/error.h"
 #include "authz/base.h"
+#include "tlscredspriv.h"
 #include "trace.h"
 
 #ifdef CONFIG_GNUTLS
diff --git a/include/crypto/tls-cipher-suites.h b/include/crypto/tls-cipher-suites.h
index bb9ee53e03..7eb1b76122 100644
--- a/include/crypto/tls-cipher-suites.h
+++ b/include/crypto/tls-cipher-suites.h
@@ -19,12 +19,6 @@ typedef struct QCryptoTLSCipherSuites QCryptoTLSCipherSuites;
 DECLARE_INSTANCE_CHECKER(QCryptoTLSCipherSuites, QCRYPTO_TLS_CIPHER_SUITES,
                          TYPE_QCRYPTO_TLS_CIPHER_SUITES)
 
-struct QCryptoTLSCipherSuites {
-    /* <private> */
-    QCryptoTLSCreds parent_obj;
-    /* <public> */
-};
-
 /**
   * qcrypto_tls_cipher_suites_get_data:
   * @obj: pointer to a TLS cipher suites object
diff --git a/include/crypto/tlscreds.h b/include/crypto/tlscreds.h
index a14e44fac1..2a8a857010 100644
--- a/include/crypto/tlscreds.h
+++ b/include/crypto/tlscreds.h
@@ -24,10 +24,6 @@
 #include "qapi/qapi-types-crypto.h"
 #include "qom/object.h"
 
-#ifdef CONFIG_GNUTLS
-#include <gnutls/gnutls.h>
-#endif
-
 #define TYPE_QCRYPTO_TLS_CREDS "tls-creds"
 typedef struct QCryptoTLSCreds QCryptoTLSCreds;
 typedef struct QCryptoTLSCredsClass QCryptoTLSCredsClass;
@@ -48,18 +44,6 @@ typedef bool (*CryptoTLSCredsReload)(QCryptoTLSCreds *, Error **);
  * certificate credentials.
  */
 
-struct QCryptoTLSCreds {
-    Object parent_obj;
-    char *dir;
-    QCryptoTLSCredsEndpoint endpoint;
-#ifdef CONFIG_GNUTLS
-    gnutls_dh_params_t dh_params;
-#endif
-    bool verifyPeer;
-    char *priority;
-};
-
-
 struct QCryptoTLSCredsClass {
     ObjectClass parent_class;
     CryptoTLSCredsReload reload;
diff --git a/include/crypto/tlscredsanon.h b/include/crypto/tlscredsanon.h
index 3f464a3809..bd3023f9ea 100644
--- a/include/crypto/tlscredsanon.h
+++ b/include/crypto/tlscredsanon.h
@@ -92,18 +92,6 @@ typedef struct QCryptoTLSCredsAnonClass QCryptoTLSCredsAnonClass;
  *
  */
 
-
-struct QCryptoTLSCredsAnon {
-    QCryptoTLSCreds parent_obj;
-#ifdef CONFIG_GNUTLS
-    union {
-        gnutls_anon_server_credentials_t server;
-        gnutls_anon_client_credentials_t client;
-    } data;
-#endif
-};
-
-
 struct QCryptoTLSCredsAnonClass {
     QCryptoTLSCredsClass parent_class;
 };
diff --git a/include/crypto/tlscredspsk.h b/include/crypto/tlscredspsk.h
index d7e6bdb5ed..bcd07dc4f6 100644
--- a/include/crypto/tlscredspsk.h
+++ b/include/crypto/tlscredspsk.h
@@ -87,18 +87,6 @@ typedef struct QCryptoTLSCredsPSKClass QCryptoTLSCredsPSKClass;
  * The PSK file can be created and managed using psktool.
  */
 
-struct QCryptoTLSCredsPSK {
-    QCryptoTLSCreds parent_obj;
-    char *username;
-#ifdef CONFIG_GNUTLS
-    union {
-        gnutls_psk_server_credentials_t server;
-        gnutls_psk_client_credentials_t client;
-    } data;
-#endif
-};
-
-
 struct QCryptoTLSCredsPSKClass {
     QCryptoTLSCredsClass parent_class;
 };
diff --git a/include/crypto/tlscredsx509.h b/include/crypto/tlscredsx509.h
index c6d89b7881..c4daba21a6 100644
--- a/include/crypto/tlscredsx509.h
+++ b/include/crypto/tlscredsx509.h
@@ -96,16 +96,6 @@ typedef struct QCryptoTLSCredsX509Class QCryptoTLSCredsX509Class;
  *
  */
 
-struct QCryptoTLSCredsX509 {
-    QCryptoTLSCreds parent_obj;
-#ifdef CONFIG_GNUTLS
-    gnutls_certificate_credentials_t data;
-#endif
-    bool sanityCheck;
-    char *passwordid;
-};
-
-
 struct QCryptoTLSCredsX509Class {
     QCryptoTLSCredsClass parent_class;
 };
-- 
2.25.1


