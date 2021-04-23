Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DDF369B25
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:11:16 +0200 (CEST)
Received: from localhost ([::1]:41272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la28v-0001xL-Ge
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1la26x-00019a-9v
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:09:11 -0400
Received: from mail-bn7nam10on2067.outbound.protection.outlook.com
 ([40.107.92.67]:12705 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1la26u-0005D7-SB
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:09:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCedyXzgzz26yRgVYX1nzJVhjG6x3wbSlNhXee3oS/ADvpuf1jJIyqR5P8g7G7zolOG/tIyCSjUR7Tpb+E7+jjy+WMUJz6Ued9R7lSlYD3fMesTwD6FwaqgfJZqfWfZgOMf1bGwRw66RQlnbjAXSW1pPVRfnsiuk4jP44J5hcrbc36GRZq1fUfPYPVwuYKXoMPUqolQQ+V83furpRxZhwB8Z88OQYHsxGYZdVmiGgRvPbre5TZnW3P0LC4uYxhUnnVH3SbWg7RvlzgQsxJ4g17d67cYgXPL5niq4IEZzbxDRvtgxbWK4cMlG81UE/DwD6HJ7tEPu8LPD2CvdxdDIBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTI+Yu8+zpLHe5GHQhalYm9j4C2CTK9cWugmo7kisfA=;
 b=MjN7hJb2ko1102RNS7yrOBWVrXgrlymPYVv74ctLC5mzw0YCv70AjdVmBHAd3n+pdIfXxzJ/mYsM3l4VJLO/0ri0NxDd6HObIlcfEWfcuMc4bic0rl3BOghm4PjArcmuGfc7+EOowfVeocAFR9gslzIU9sqh0et03xzpRDBkOJZgKzvc6TT489b0cff1EyPj4Ij+UejfbAxwg65YToaoy7mjroOknEmyujxnfDaau2MLQTCs98wHPfQC1GiA4/ct7ySHPIctMzGzFM1dkJySeFFGMZampdexUaMoEDZv5qFiRrHPeZs4d9p0l+LXXDbmn9wc7h/HUBJnglNbAomeIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTI+Yu8+zpLHe5GHQhalYm9j4C2CTK9cWugmo7kisfA=;
 b=KR+bJ4bCaQNmDwLnDh+L28K7Zxdb1zXhx/RhVlcnsioPSiLn5dGJPKWNs/IpO+BChC5U3PbSSFDJwbVeuFRModxnMHk+eUZqwNY/MDgXhYypF1qvYDjH2DqhGKP0OeIgN8G4XyHBJK70M5OFweJUda2NA7eqTcl7mUQBAYcjuyo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM5PR12MB4678.namprd12.prod.outlook.com (2603:10b6:4:a9::39) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.18; Fri, 23 Apr 2021 20:08:30 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9%12]) with mapi id 15.20.4065.023; Fri, 23 Apr
 2021 20:08:30 +0000
From: Tom Lendacky <thomas.lendacky@amd.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] doc: Fix some mistakes in the SEV documentation
Date: Fri, 23 Apr 2021 15:08:17 -0500
Message-Id: <a7c5ee6c056d840f46028f4a817c16a9862bdd9e.1619208498.git.thomas.lendacky@amd.com>
X-Mailer: git-send-email 2.31.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SN4PR0601CA0004.namprd06.prod.outlook.com
 (2603:10b6:803:2f::14) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tlendack-t1.amd.com (165.204.77.1) by
 SN4PR0601CA0004.namprd06.prod.outlook.com (2603:10b6:803:2f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Fri, 23 Apr 2021 20:08:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab65cbb1-b898-444a-ecb2-08d906939053
X-MS-TrafficTypeDiagnostic: DM5PR12MB4678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB4678306381DD13463012FDCDEC459@DM5PR12MB4678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RlUgOXM+iasBGRJUNcrY5AISlIx/YvL9rZA9El1Ze3B1uaPhvQH84acVAX7PQigcw1k3HdS3pg5/3QEyERd+Il3PV4V+FlXrD7wCRxhV71ul/f1BwZBnjN/qVNqAOmAKk0tdSlJBS5GovT0HE7WX7S8Sbx0dxl06E0/RRzH+KaNlJegPVarOoNOF6erJwIXa5LchmEvyr/4lVAzVaTp0gNEtmWJOzCYHITR9PalBFV4PhY2kpUdza/lVFSOkDTaELHfFDcyUUvrAr139wA7bwimJ2eLD/PpEiQqAZj7TWOIYUg3hG1cjPB87azds73UP1pHiQTERkVZFfJwr1l6IGJTpvZ6wYO4jlZAau8zcAme4jsy39BvcjWuElkPkCrtGuhZXVgMX+H9q6GuRvrSDss7tmjbPNciDx5jLpLQmRC9Fp4F45XX28teYLG98Ok+ouFjFcqIwgWw52HBNerkDD+bArv04RJDRfrAbls4OM345l9nMNZ8MWyQFeiKJoSLajB3sirSk+iWujh22PFcWp46z3foGevQ7if5FX1FQmdbigPfxycg2nkX7GDIWWjDJ7I2YuwJZ+4Np94ORiV76rkUABId5NUWHeh/oAQuyO72YHWL4tWpmG3p9A+jCu3fogYOHxURXj6/wgle3JZtbZrLS1MzzYVYvACytY0o1BuM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(6486002)(8676002)(36756003)(7696005)(66476007)(66946007)(26005)(956004)(478600001)(316002)(83380400001)(6916009)(4326008)(186003)(66556008)(16526019)(86362001)(2906002)(54906003)(2616005)(38350700002)(5660300002)(6666004)(8936002)(38100700002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IyvXdDyd8mW/dqjf2CQwD/yD3+XsQQrmfmpo4FvEynoTBhSQL51JE971MsGk?=
 =?us-ascii?Q?xoOiN+0WRWE2RLDWfII1klSALA7dhKZx1+g+/nfNmHSHpO6F9j30evCVm1SS?=
 =?us-ascii?Q?hSNR3sRk2zbxpz8s0313B417Z1Fc/LiVwW07y1ckGBgF2vvl169NkGz7IsEp?=
 =?us-ascii?Q?JSjWrU74t4pZosiI8uSdP+QBhCF7lFQqxp+z9eiplcU4pxEfDV7HLdHVMs0c?=
 =?us-ascii?Q?vrcLj7jDZesxq8Jdmdb0IQOsRAO9RwNy6TtAFvj5sOVahQyrtEXKP3Q0Gnql?=
 =?us-ascii?Q?hq5TQyfXwe2mROCSSzGNb2NYXOoOJqxIFFdaEUW3atDZUfrXorrVstDrb9Ld?=
 =?us-ascii?Q?kFv4IqF1WKviuGIeCjqLJRGERp4xrqx8GuqqXCZhJ5Dizh3wmGrOmowbNwoK?=
 =?us-ascii?Q?x7KWurQMALd8j3JV0u6thJk0uTlsB4nChP06hQ5YP3DE9DfNLzs8MZtKymJK?=
 =?us-ascii?Q?W3N4FhadQJ3HpBE56clHarwoLLQvcGCcy+k9Ag5yDZzBO1Lx6/qNPcOEVSbv?=
 =?us-ascii?Q?6SubnVskS7ezLqO6XCn0Hlth/vpX0sRPBzvjpyRi2Y9n4CZsAitWdApEqdF3?=
 =?us-ascii?Q?W4/haHh/87sLOkopY0O3q2O8P4XSyb1fK/Mjblh8ep3K4kp0V+QqChGBxd0P?=
 =?us-ascii?Q?Kcu8mLsTiQFm/3JRfqnLswRzHQ0iZBC8b5UDwL8yXuUjL2hRntepStpytP9P?=
 =?us-ascii?Q?+MsqebUkzjuks1f/LNFRNRaCSn3lnY4wv5Dx40ZX58kAmV9R/f0cj0mQmwUC?=
 =?us-ascii?Q?yc4lPbAFEjcOwos/VIhEbIKtfbddhYiZoWF8BEgu+uvOgcxx/qLwbW6ySrBs?=
 =?us-ascii?Q?nPx5woRE5KjdTKTpDFQTOtItbYC6bqpYDsMttCGfY8oaimAbrP32kamNWFik?=
 =?us-ascii?Q?P2QKHB8Py3zWYF0YMd/oyzvZgWma9AoF1PI8yUn0GFNZbO7iHyOkTFTkF5pE?=
 =?us-ascii?Q?4TGibK8otTlfCSO6M+HXLHyON/ZMsYW5MgILN4K+Bf7u1hrqv/X0o+Ov6Ui/?=
 =?us-ascii?Q?G8EqRhTd0C9mnvRhnvqwJuXpbmz4gNTVO5hBvK2EWmBjP5El7tei65Ycw9IB?=
 =?us-ascii?Q?Ge4106fF3sQD6Mb/NyLoF3B6bnoxViGjvM3Dlnjxd6IwGP5/jjHYkmgXu08a?=
 =?us-ascii?Q?cfqjfrj+EEQtq1edYEj6/8CZf3zGciit8VTFxnyhv0RyexpDUwqfrFJkMqdM?=
 =?us-ascii?Q?7K4C3Jl53qEAoHm1+9SNNyxK0lA2VGA+DEtE8xbwQi6uooIEnB2+yE/gCM8b?=
 =?us-ascii?Q?75jWB9zJoHHJBS2w2zoyBPOUr3SDu7c5aOkuyQ7/xIaErgQ/qE/TnMWKK8Qm?=
 =?us-ascii?Q?B/RFlGV9erWA0A8Tick6M3RJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab65cbb1-b898-444a-ecb2-08d906939053
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 20:08:30.2443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGZ1JjgSNifEKtm4jPJSgTVqkoNAQ1jNKr957fQFvUq216mPUA8QmIOfZOn899lwxT9770s/xt5frB1buHipag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB4678
Received-SPF: softfail client-ip=40.107.92.67;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Pavel Hrdina <phrdina@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michal Privoznik <mprivozn@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tom Lendacky <thomas.lendacky@amd.com>

Fix some spelling and grammar mistakes in the amd-memory-encryption.txt
file. No new information added.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 docs/amd-memory-encryption.txt | 59 +++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
index 145896aec7..ed85159ea7 100644
--- a/docs/amd-memory-encryption.txt
+++ b/docs/amd-memory-encryption.txt
@@ -1,38 +1,38 @@
 Secure Encrypted Virtualization (SEV) is a feature found on AMD processors.
 
 SEV is an extension to the AMD-V architecture which supports running encrypted
-virtual machine (VMs) under the control of KVM. Encrypted VMs have their pages
+virtual machines (VMs) under the control of KVM. Encrypted VMs have their pages
 (code and data) secured such that only the guest itself has access to the
 unencrypted version. Each encrypted VM is associated with a unique encryption
-key; if its data is accessed to a different entity using a different key the
+key; if its data is accessed by a different entity using a different key the
 encrypted guests data will be incorrectly decrypted, leading to unintelligible
 data.
 
-The key management of this feature is handled by separate processor known as
-AMD secure processor (AMD-SP) which is present in AMD SOCs. Firmware running
-inside the AMD-SP provide commands to support common VM lifecycle. This
+Key management for this feature is handled by a separate processor known as the
+AMD secure processor (AMD-SP), which is present in AMD SOCs. Firmware running
+inside the AMD-SP provides commands to support a common VM lifecycle. This
 includes commands for launching, snapshotting, migrating and debugging the
-encrypted guest. Those SEV command can be issued via KVM_MEMORY_ENCRYPT_OP
+encrypted guest. These SEV commands can be issued via KVM_MEMORY_ENCRYPT_OP
 ioctls.
 
 Launching
 ---------
-Boot images (such as bios) must be encrypted before guest can be booted.
-MEMORY_ENCRYPT_OP ioctl provides commands to encrypt the images :LAUNCH_START,
+Boot images (such as bios) must be encrypted before a guest can be booted. The
+MEMORY_ENCRYPT_OP ioctl provides commands to encrypt the images: LAUNCH_START,
 LAUNCH_UPDATE_DATA, LAUNCH_MEASURE and LAUNCH_FINISH. These four commands
 together generate a fresh memory encryption key for the VM, encrypt the boot
-images and provide a measurement than can be used as an attestation of the
+images and provide a measurement than can be used as an attestation of a
 successful launch.
 
 LAUNCH_START is called first to create a cryptographic launch context within
-the firmware. To create this context, guest owner must provides guest policy,
+the firmware. To create this context, guest owner must provide a guest policy,
 its public Diffie-Hellman key (PDH) and session parameters. These inputs
-should be treated as binary blob and must be passed as-is to the SEV firmware.
+should be treated as a binary blob and must be passed as-is to the SEV firmware.
 
-The guest policy is passed as plaintext and hypervisor may able to read it
+The guest policy is passed as plaintext. A hypervisor may choose to read it,
 but should not modify it (any modification of the policy bits will result
 in bad measurement). The guest policy is a 4-byte data structure containing
-several flags that restricts what can be done on running SEV guest.
+several flags that restricts what can be done on a running SEV guest.
 See KM Spec section 3 and 6.2 for more details.
 
 The guest policy can be provided via the 'policy' property (see below)
@@ -40,31 +40,30 @@ The guest policy can be provided via the 'policy' property (see below)
 # ${QEMU} \
    sev-guest,id=sev0,policy=0x1...\
 
-Guest owners provided DH certificate and session parameters will be used to
+The guest owner provided DH certificate and session parameters will be used to
 establish a cryptographic session with the guest owner to negotiate keys used
 for the attestation.
 
-The DH certificate and session blob can be provided via 'dh-cert-file' and
-'session-file' property (see below
+The DH certificate and session blob can be provided via the 'dh-cert-file' and
+'session-file' properties (see below)
 
 # ${QEMU} \
      sev-guest,id=sev0,dh-cert-file=<file1>,session-file=<file2>
 
 LAUNCH_UPDATE_DATA encrypts the memory region using the cryptographic context
-created via LAUNCH_START command. If required, this command can be called
+created via the LAUNCH_START command. If required, this command can be called
 multiple times to encrypt different memory regions. The command also calculates
 the measurement of the memory contents as it encrypts.
 
-LAUNCH_MEASURE command can be used to retrieve the measurement of encrypted
-memory. This measurement is a signature of the memory contents that can be
-sent to the guest owner as an attestation that the memory was encrypted
-correctly by the firmware. The guest owner may wait to provide the guest
-confidential information until it can verify the attestation measurement.
-Since the guest owner knows the initial contents of the guest at boot, the
-attestation measurement can be verified by comparing it to what the guest owner
-expects.
+LAUNCH_MEASURE can be used to retrieve the measurement of encrypted memory.
+This measurement is a signature of the memory contents that can be sent to the
+guest owner as an attestation that the memory was encrypted correctly by the
+firmware. The guest owner may wait to provide the guest confidential information
+until it can verify the attestation measurement. Since the guest owner knows the
+initial contents of the guest at boot, the attestation measurement can be
+verified by comparing it to what the guest owner expects.
 
-LAUNCH_FINISH command finalizes the guest launch and destroy's the cryptographic
+LAUNCH_FINISH finalizes the guest launch and destroys the cryptographic
 context.
 
 See SEV KM API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
@@ -78,10 +77,10 @@ To launch a SEV guest
 
 Debugging
 -----------
-Since memory contents of SEV guest is encrypted hence hypervisor access to the
-guest memory will get a cipher text. If guest policy allows debugging, then
-hypervisor can use DEBUG_DECRYPT and DEBUG_ENCRYPT commands access the guest
-memory region for debug purposes.  This is not supported in QEMU yet.
+Since the memory contents of a SEV guest are encrypted, hypervisor access to
+the guest memory will return cipher text. If the guest policy allows debugging,
+then a hypervisor can use the DEBUG_DECRYPT and DEBUG_ENCRYPT commands to access
+the guest memory region for debug purposes.  This is not supported in QEMU yet.
 
 Snapshot/Restore
 -----------------
-- 
2.31.0


