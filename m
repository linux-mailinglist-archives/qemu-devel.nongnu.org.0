Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B2E367340
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 21:15:14 +0200 (CEST)
Received: from localhost ([::1]:42424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZIJd-0002YE-6q
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 15:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1lZIHo-0001l0-D3
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:13:21 -0400
Received: from mail-mw2nam12on2046.outbound.protection.outlook.com
 ([40.107.244.46]:4449 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1lZIHi-0000JL-Og
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:13:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BN9sqPOYwwNRL2yyOYOhtHZzlZWZBuCugfA4UVG1UNfUvF3O55+BCFTBMX/WXjdyzx5BrA2yw58N9ARZLq0sefz0HG5noDx8tzV3ItzlCOFxg/HhmKcrqah5PyGfoOVP1mFTCiNED1P5RkzKHW+FcEJKhlAZD/MfHLGTtZjnSY3CHt+AMVyDvX5+qWM2qgj5ZO98yNv41FwxQ8Gc//WKruNg8KKOCo84TphFOoEFIXUZM0Y4be5L/8uCpf17M1OmQFmN7sSk9iYbSRstMJ0XS6Vj9tNQ/M2cwSsKfCwAj5/egAB5bnkO5z/n+YGbY9XrcYA1dO2swecAdi4jvTb4Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbMtpHYX9O5GF81boORuflXNyUQTKoJgdRu6xUHTGHc=;
 b=j4BeZH8DmIVm5y90n8gCymka7FqrYzgTA+1rAiHZtIX5NnSr/5GGNBUBJC3V3eMBuDTUSdOkxokkKx5H6DQumkf/FA5wtpRD0azxeWnP7JcJD15U5kZBqFb5dOSAfWnweuqyZxnu2yCvG49CQkNiztFjoQPS8sWXh1Iu2LdObppSV0o/NFtKrmYVn2s3OQdf/w9pFywmPzs0612bcF5qa4tgG2LTadWs6sIvOmiwCBudS6q3ZQfByc3BSE39REE9Um1tjzZRCUZTn2EvmCkfoMobXdXFGuH1eSEHXicYGdnOQLAfG8wQDidUDbGiVaZW6f7yN2/ulgn1BiWJqhZDWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbMtpHYX9O5GF81boORuflXNyUQTKoJgdRu6xUHTGHc=;
 b=4f/sWtFxF/Q6DeAWT2Q2bMtgkxIXCXiFVxTFQ4HQFVlp4tT/zbEEcNb3DjYmGHpRnZFccPSnQ4R3wgQbc7otNXv9Cqd64xoRnqVyHxInW5GJTCEKg0d4NdctqJOvyuC70XyrkhftQ2e6JFP8WWm+H/97aX4S5d4M+Mi6iKJYWeU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM5PR12MB1163.namprd12.prod.outlook.com (2603:10b6:3:7a::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.19; Wed, 21 Apr 2021 19:13:09 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9%12]) with mapi id 15.20.4042.024; Wed, 21 Apr
 2021 19:13:09 +0000
From: Tom Lendacky <thomas.lendacky@amd.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs: Add SEV-ES documentation to amd-memory-encryption.txt
Date: Wed, 21 Apr 2021 14:12:56 -0500
Message-Id: <c06be7ec96e774bd6e17f14a27330c74266c5650.1619032376.git.thomas.lendacky@amd.com>
X-Mailer: git-send-email 2.31.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SN2PR01CA0039.prod.exchangelabs.com (2603:10b6:804:2::49)
 To DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tlendack-t1.amd.com (165.204.77.1) by
 SN2PR01CA0039.prod.exchangelabs.com (2603:10b6:804:2::49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Wed, 21 Apr 2021 19:13:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8aec263e-9427-44cd-dac2-08d904f97fd0
X-MS-TrafficTypeDiagnostic: DM5PR12MB1163:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1163147B9A93022A8C442780EC479@DM5PR12MB1163.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NTdNS8hrR9YGEx/Lf1RvZhoadpX2sdXGv79ta9wT6IGFPj8U/c387JdOz9ZYBQG1Ms5k28J3qNRZvgtg+S7JWSm6XiF+i+pZONqsHaUMKIMJCD77lJj3HMUxko0S/AkcXk90xHsZw5D+tvyFaj1KJx0RBQsuFtfWsBzK/Cx5nVBFzAeGGGKLpg4MjIndfFmwWC6uNnv2r2UEOOqs48xMxDLGa1Lzs6Ejl9YKsZkZQXOblzRtOHF7diMsOUp+Vv0RnIKi0ZEtj/L6idyKCdHiG6EJdV/1HcieRiLocBW6JpTVmXkWKDn6CKf1xOzriJcmD8I+MMHHoROqNXaqIzgzfme7AhGCr+v1gDN+nog8xQ3KT+8z0tfkaz5sFrgwswVegZo5noOV/uNiBw1t99rHSqJddtKQsxK3CDCc02TjntWt+XbdzdKbq/BkTkbgOeodLWkyYElgsAgP1wo3j/4HV/ow7WAyb/eqTGBdF+DIdVJPqLwbjenIzkaV+Jz8qIQbOwEWzQ6ozucywh2V/eUkzw3lT96F+xMLE3poZwbl/zW6MZtLFcikZ9QSOhiZOPx7Ws8xI8gfA96s/mn8eJm+4BH6eRsRs9AvFpVpnzmFRDxQoD0OFg3VS31MIFALmgP5FxWmN5I5Y0TNrBncFgRWjSWB+6ZP+3l0okBStCeE22ULSS0H16LR4hrPvB3dzpt/1sD3wsJlNn3HzQ+2OLbxFB0aLLMFrCGeqoJrieoa9hg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(7696005)(38350700002)(16526019)(8676002)(66946007)(2906002)(956004)(5660300002)(8936002)(4326008)(186003)(66556008)(66476007)(478600001)(86362001)(26005)(38100700002)(36756003)(6486002)(6916009)(54906003)(2616005)(83380400001)(6666004)(52116002)(966005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BCyAHAL61tWGuSHIy6fZML4VO2ZbubTkJmXchVo6PvWa25A8FugMXZmyiOO4?=
 =?us-ascii?Q?daNnW0hPNi31yDABPC50UKyDZxCUF5hkbbdtiEk0GWbPJJDofcOVAYO1kBUo?=
 =?us-ascii?Q?61VSEv9Dnf9iovEQY6cB8K6klapH4yWp81mHOx+Br1qa/AoqHzFwBDVKtMWH?=
 =?us-ascii?Q?Y8Kx0tz+ZumiDUA5i6kOTkM8KLvKvTqHiZnFnqqOrdMg29y3QV8F95Ym0FS4?=
 =?us-ascii?Q?XlBq0lJIipU2GGqyHiDWVJVC82SqzvrqvvVoRlodGI3LmCD+4vpqTToOBb0c?=
 =?us-ascii?Q?611o0xOQyOw0PE1MfDaZK/T2LfAAMT3efGD+N2ryQVhszbqT8i+yVmVGHFRg?=
 =?us-ascii?Q?4HzqgPZDY5arNM9BjxG0sv/eIlM899OOQ5mT/2PngCxmSwWqjQVnWyiMMr/R?=
 =?us-ascii?Q?GqiVgXCnQm8Ub3yUhAIRtoP116Sg4i2N9BVCzs3GBzOjY5Hh4o7THPDxpxql?=
 =?us-ascii?Q?W0JTJ6PEnpcx7F0hjFQifuIB/MMTOCeuYKX9sf2J7etpP38A78dz3GAS6TX1?=
 =?us-ascii?Q?f+PAyQ10bV5myD2HQQL5enN1FAr+V5NR4tG/8WCaH0J6zfuSL59QBjB+bmBQ?=
 =?us-ascii?Q?6Tfc9zsN6DtTMO5ReV5OEHIix6UetxieU5XdYiRj0HJoQmplFwaaaEM7zsIV?=
 =?us-ascii?Q?vsd9Ku8BLJQqSFQgs4S/9N4Nm3xl0q93ZtI2G5tABSet6lTboaR2zIx9cPqS?=
 =?us-ascii?Q?4q64wNLh2DgWE5OBj1M4ZV1QQnNfoJkWjw8KQFb00gN3lOGsy+5sDzx9Y9mn?=
 =?us-ascii?Q?cPnutFpaRYQDHxuGSpeLdElRnzYcPMiRlotStHnfvH1yQQrcWSBGRGYo1vhh?=
 =?us-ascii?Q?HFt7Wy1JByrXCiAypXz+SlPO1WVMPrZBSiWNJaoja9JzHQjSYpSLehxaQMHM?=
 =?us-ascii?Q?qqIPopnFMUpoAZa2BXNTtbgAFxUdH3m5QksJTBp/52Q8gsojbJkI/5sPTJzs?=
 =?us-ascii?Q?iTudLQ/P1KpmVLW4Q0xkBGTJOkrLH54iPHrwTx8xC072+HBsP2rxD42NFF8f?=
 =?us-ascii?Q?HjxJyfMiMgrhyD9dgQ4yg3AdG342NRJUJ4MOEBJCcxB66xwngswaQ6Eji3kR?=
 =?us-ascii?Q?k6/yPQmbDKreSZRZReqbMXO6DkhlADs7hKt5fRR2o0R1FDIiNWzQZfUg/3go?=
 =?us-ascii?Q?bFYKvktIMvghsXNxFvEQrTtEm0M0tKNcatc4fhsa1kBwTdAIHXWBnYuBQQhn?=
 =?us-ascii?Q?oIwe5zi0vBhwx4Jd+vIJtvBAWsEQcgUPu/u3SQbWU3QrXDRG22c0ja2xtvEr?=
 =?us-ascii?Q?8IufEuk4ttS6zJBggYrzDDh3cO2zEbJytObeUY3XGkonJfLzrzkBYPiZLVdc?=
 =?us-ascii?Q?QKI6sPuIf3mdJQvoTaOLxudD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aec263e-9427-44cd-dac2-08d904f97fd0
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 19:13:08.9946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2tUz9szG8HI6b602VAmwEdFFjkq9egiZWx+RdZCrzUEJcEpN6XB3Ahm66NKwoZRBoGvelK8dMAfWo32I4v3mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1163
Received-SPF: softfail client-ip=40.107.244.46;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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

Update the amd-memory-encryption.txt file with information about SEV-ES,
including how to launch an SEV-ES guest and some of the differences
between SEV and SEV-ES guests in regards to launching and measuring the
guest.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 docs/amd-memory-encryption.txt | 45 ++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
index 145896aec7..795b990fab 100644
--- a/docs/amd-memory-encryption.txt
+++ b/docs/amd-memory-encryption.txt
@@ -12,18 +12,28 @@ The key management of this feature is handled by separate processor known as
 AMD secure processor (AMD-SP) which is present in AMD SOCs. Firmware running
 inside the AMD-SP provide commands to support common VM lifecycle. This
 includes commands for launching, snapshotting, migrating and debugging the
-encrypted guest. Those SEV command can be issued via KVM_MEMORY_ENCRYPT_OP
+encrypted guest. Those SEV commands can be issued via KVM_MEMORY_ENCRYPT_OP
 ioctls.
 
+Secure Encrypted Virtualization - Encrypted State (SEV-ES) builds on the SEV
+support to additionally protect the guest register state. In order to allow a
+hypervisor to perform functions on behalf of a guest, there is architectural
+support for notifying a guest's operating system when certain types of VMEXITs
+are about to occur. This allows the guest to selectively share information with
+the hypervisor to satisfy the requested function.
+
 Launching
 ---------
 Boot images (such as bios) must be encrypted before guest can be booted.
-MEMORY_ENCRYPT_OP ioctl provides commands to encrypt the images :LAUNCH_START,
+MEMORY_ENCRYPT_OP ioctl provides commands to encrypt the images: LAUNCH_START,
 LAUNCH_UPDATE_DATA, LAUNCH_MEASURE and LAUNCH_FINISH. These four commands
 together generate a fresh memory encryption key for the VM, encrypt the boot
 images and provide a measurement than can be used as an attestation of the
 successful launch.
 
+For an SEV-ES guest, the LAUNCH_UPDATE_VMSA command is also used to encrypt the
+guest register state, or VM save area (VMSA), for all of the guest vCPUs.
+
 LAUNCH_START is called first to create a cryptographic launch context within
 the firmware. To create this context, guest owner must provides guest policy,
 its public Diffie-Hellman key (PDH) and session parameters. These inputs
@@ -40,31 +50,42 @@ The guest policy can be provided via the 'policy' property (see below)
 # ${QEMU} \
    sev-guest,id=sev0,policy=0x1...\
 
+Setting the "SEV-ES required" policy bit (bit 2) will launch the guest as an
+SEV-ES guest (see below)
+
+# ${QEMU} \
+   sev-guest,id=sev0,policy=0x5...\
+
 Guest owners provided DH certificate and session parameters will be used to
 establish a cryptographic session with the guest owner to negotiate keys used
 for the attestation.
 
 The DH certificate and session blob can be provided via 'dh-cert-file' and
-'session-file' property (see below
+'session-file' property (see below)
 
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
+LAUNCH_UPDATE_VMSA encrypts all the vCPU VMSAs for an SEV-ES guest using the
+cryptographic context created via the LAUNCH_START command. The command also
+calculates the measurement of the VMSAs as it encrypts them.
+
+LAUNCH_MEASURE can be used to retrieve the measurement of encrypted memory and,
+for an SEV-ES guest, encrypted VMSAs. This measurement is a signature of the
+memory contents and, for an SEV-ES guest, the VMSA contents, that can be sent
+to the guest owner as an attestation that the memory and VMSAs were encrypted
 correctly by the firmware. The guest owner may wait to provide the guest
 confidential information until it can verify the attestation measurement.
 Since the guest owner knows the initial contents of the guest at boot, the
 attestation measurement can be verified by comparing it to what the guest owner
 expects.
 
-LAUNCH_FINISH command finalizes the guest launch and destroy's the cryptographic
+LAUNCH_FINISH command finalizes the guest launch and destroys the cryptographic
 context.
 
 See SEV KM API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
@@ -76,6 +97,12 @@ To launch a SEV guest
     -machine ...,confidential-guest-support=sev0 \
     -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1
 
+To launch a SEV-ES guest
+
+# ${QEMU} \
+    -machine ...,confidential-guest-support=sev0 \
+    -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x5
+
 Debugging
 -----------
 Since memory contents of SEV guest is encrypted hence hypervisor access to the
@@ -102,8 +129,10 @@ Secure Encrypted Virtualization Key Management:
 
 KVM Forum slides:
 http://www.linux-kvm.org/images/7/74/02x08A-Thomas_Lendacky-AMDs_Virtualizatoin_Memory_Encryption_Technology.pdf
+https://www.linux-kvm.org/images/9/94/Extending-Secure-Encrypted-Virtualization-with-SEV-ES-Thomas-Lendacky-AMD.pdf
 
 AMD64 Architecture Programmer's Manual:
    http://support.amd.com/TechDocs/24593.pdf
    SME is section 7.10
    SEV is section 15.34
+   SEV-ES is section 15.35
-- 
2.31.0


