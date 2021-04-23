Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6279E369B27
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:12:47 +0200 (CEST)
Received: from localhost ([::1]:44668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2AQ-0003Ro-G4
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1la26z-00019w-IM
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:09:14 -0400
Received: from mail-bn7nam10on2067.outbound.protection.outlook.com
 ([40.107.92.67]:12705 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1la26x-0005D7-BY
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:09:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQXjnCP/MAVQ6k3Lxr2bNQ03ZyuEwGZwU0EqqNe8IMq291VnI0ndKHoM6o1i01b+W4RJj0Qp418nHjx0Hiz4aIXI0ygsLJC9wsDE+0Q//eu0jBNlz4PH6vnaY7FRk0BI66pvxMr5xmNR45RCknGck6m14Rb/F6KQjyRKXBtvUqzkB1CitPWdNdXr+UNzQZPoXd33AqiI8BnRSJMXtXerxCEEP8E9HjNc78xatYVNdP/6OBAL0z+cVD096JdbT5r9WSIJkb0RSC1eOwI12pUl5xE8ihDdM7cWCw/YQHL37yM0CzcZNIX7XlWnfO1VygoHTQLO4Wws1Y9IQUueAigycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4z03hKyTRRx8qmLvblygBGm5FolLoDIyXsn0FgirHj8=;
 b=d1O23iCG6kWu8pC1Az4GQv5AdmMu+VneOd2zpUY5A8wd3k+XAYyQFzvJRs0kB1f6J/P+Ifhw/hzfMAUgOEu0bfl4WwzfmicYqWUjnoFHmjAaf/pE0uKOgOLOklMDhWqHA7BOi8xKgF+JAhHPMjj3w/mIWGW/l7d4SS8wkyqL8LpMilOQx68FBm4qsT8yVm1rnVOVQDtYvtErHpgTR/skRX+3JoL/NuRCQRunMTX62xZvVkuFLHySznGakk8UGjkY/TyytXqdv2ecIolW5eVOIFUqJdrHt3pz4V+mGuuKRhWInCf8h6+7VF5G4+AQLxXiA/buz7++LPg/QsCfou7YsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4z03hKyTRRx8qmLvblygBGm5FolLoDIyXsn0FgirHj8=;
 b=31N1Bf+NyMI4lkxbdOAgXZ6xq6HkyMpHQ1TXCMkBj/dAXM5aY+qf8DaTWs/h4L6fX2a8SvV9wBRV1La3i4rvW0o3n7AaxHDDfaZ0iNqgDeCNgxidIHYydmEfZuJ8KjT/j6oU/JPXta9aOnkB6JJ+bqoBXpRhwhSPZkreg1faCNQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM5PR12MB4678.namprd12.prod.outlook.com (2603:10b6:4:a9::39) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.18; Fri, 23 Apr 2021 20:08:38 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9%12]) with mapi id 15.20.4065.023; Fri, 23 Apr
 2021 20:08:38 +0000
From: Tom Lendacky <thomas.lendacky@amd.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] docs: Add SEV-ES documentation to
 amd-memory-encryption.txt
Date: Fri, 23 Apr 2021 15:08:18 -0500
Message-Id: <fa1825a5eb0290eac4712cde75ba4c6829946eac.1619208498.git.thomas.lendacky@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <a7c5ee6c056d840f46028f4a817c16a9862bdd9e.1619208498.git.thomas.lendacky@amd.com>
References: <a7c5ee6c056d840f46028f4a817c16a9862bdd9e.1619208498.git.thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SN7PR04CA0207.namprd04.prod.outlook.com
 (2603:10b6:806:126::32) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tlendack-t1.amd.com (165.204.77.1) by
 SN7PR04CA0207.namprd04.prod.outlook.com (2603:10b6:806:126::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Fri, 23 Apr 2021 20:08:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a7aa4f6-2478-478e-6184-08d90693952e
X-MS-TrafficTypeDiagnostic: DM5PR12MB4678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB4678F9344996F5B9EA114DB4EC459@DM5PR12MB4678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I8L+rMz4BBks2bwjJQlvK+jiby2+8ijrmnrkxoC5FvsyH4S5+dmcO/Zhq+Lyz5EssSpuTlSSuXD4w//o7ZkTjTYAF4tUYno5hD2Bwc2ZnjuAsSRfk1LxM1A88fFdAvDAlTH0y1LNMCacumEdZdOwmyZNjC7386XEnSNfg1BVBblnFPBWHNvWkWNU4qa3/YPn5xrmOMT/RnmMn+98elMUP0Aw2+78LZAyhqUaaJtSQVmwS5Szt00K0oGhGFNKS8yIsgnC0L7Cvmqwx/Y0tuPEYSDTWtxOVSP2reg1atuL8NbWgPFlVddfl8C0IeEV7FS2JQAFaOOmbaBrIak5EZ0lcnC28flVjtENsVddsL+tdkLetzLHcQjdrKeGvc0ObXR8LRHddN/IVm0JsBghy6d529Xxqc/EcUVmruMTjk4vNYPpYGJenWdBx2sLjBxHlnreTpFpMxNdzgqpuq4WMQEApCRN6JszDhdr6iOtEp1fagiDSaSIUW+B7GB2v2oR+4z1YBzJ3koQsxzE0rYcKT5WlLkFZt8bnVC/0dDOsqbgSbUz3LTBkXe87/z5lKzz0OfifQIegSA2gkGEv6jZSHgS4vITGFLijloi7w0vBVj0n/f3fMRzklLCn93fIcbvREcuqyZV3X8Nznskc+vZCmz3Jg1GEqwIaGdoT1ltfpqpa9iQcNEQkZ3bFSoT5iNoQ2evcslq8RM8T02Fo9jHD7pUOXezSkE0i3untGLKd1lK4bU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(6486002)(8676002)(36756003)(7696005)(66476007)(66946007)(26005)(956004)(478600001)(316002)(83380400001)(966005)(6916009)(4326008)(186003)(66556008)(16526019)(86362001)(2906002)(54906003)(2616005)(38350700002)(5660300002)(6666004)(8936002)(38100700002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?AQ8RP/XLbph2bEfnpVWdl0megAia2+jpCV6dITDBzCC9nX9vkam6o3Yx7WAQ?=
 =?us-ascii?Q?o5MFb3ELoZ5bn/RGUlwP/ip767J+8KADh6j2ys91gfmuBpnGD2AYnYocPcBl?=
 =?us-ascii?Q?eV4whVZa0RmRvpV3vM2G7XXrBQQeJGwVZ1eg0VwT0vHm4pxv97cWTBu1cBJb?=
 =?us-ascii?Q?+0VuIr9PwWKtsEt0RMjbcK42S5DgcjRpOs0EGLyXWruYsuEDbNnzD1/0lndr?=
 =?us-ascii?Q?pA0/3N8y0A+ThMW2mnckbVHcK50xP1AzP/+I6fKse3rht035Q3eDYeM+baGd?=
 =?us-ascii?Q?XFn3f7i7Q7ii/H9Kyfly+1CSOmwug7+l09F9IBHY5kJF00hDA6ZbFoTZPkW0?=
 =?us-ascii?Q?fziPF60t5dvP0diAzzs3qQseXrg+jLaP9XiNysTMp5fLg5xC+ecJIeH8Q4R7?=
 =?us-ascii?Q?HKFkqno08eu3gcvcQwIEFHvBJQghdQ42Z0hkBMs7PJQAvrDeaVPoP1KCgQMA?=
 =?us-ascii?Q?Fa1H2DtketyyolOJK3VnqgQDPx6EqFuYJ6sY2QFiK1w3a36W2rAntsjyLQvX?=
 =?us-ascii?Q?iNTBKkbW4vX4m/qmWuRU+Z4eCIr/NLicQ6aLsXN9Xia6xmqv9dLjHFKUF53y?=
 =?us-ascii?Q?K7sc9w2SJRMAn4WGlLiEGHqaRF4bRgDRkSetaxly0raG6fZzEO2EcmCBc+VQ?=
 =?us-ascii?Q?2R6ZleKR5/Lcty1+KO1Fze9g2ocdheZIwrJpw0B3ANwGkrIs6N5//eUL87U8?=
 =?us-ascii?Q?YlANIEVJM5HG+Sb+Bt+ryGGgm4816JllJtxikr5dI2ovq+EP044olf3AIUY5?=
 =?us-ascii?Q?pGHk/5rHxeg4k5QCKncdXuNUFT4EkUB6iRkULVf4YZg9kql6E0AbhUNJbqrk?=
 =?us-ascii?Q?xyRbV67fwxlyw1lH+3/he2ega5wF6pFaNe4MD5OL0iuyqzwn5kwj0kKMofe6?=
 =?us-ascii?Q?2TvoMmIWLxj/Px34NhvSUHjFPX7JAyr1fDQuUf/AFPf9wnVvMi43Inoa7N2Z?=
 =?us-ascii?Q?+5QraF++LnDW6MrDWq/rcpKSk756yyTFUBFbaCLt/4sjzFJKukejsev7AY+C?=
 =?us-ascii?Q?jfqKEbPtfBB6R/aDB342XH5AixKkMGvNRAAKZQvD/q39fuQfCaxevPV6iRCI?=
 =?us-ascii?Q?va9mqDl6nuQIpn3Kt78RbCQ/fwVOTWPfrhGusGi/u5STbT8Jo8fvsw5IG4GP?=
 =?us-ascii?Q?shev4kjL+NbObH/CJnMqfLm0JkWV26ypy4RAMAbyErUm1E9p9sbfRvBqwXtc?=
 =?us-ascii?Q?lF91IqrjCjT6KtZifxhySFiPQRwbBWHjl8V1nzkqI8OtBTRBE2OolGH0OxtL?=
 =?us-ascii?Q?X74p5jqf9gF01R9FAtZoCK6HFs8GQ11nQqHX5Da2up2ZweWpVKTALAqDu5mU?=
 =?us-ascii?Q?/6XGZuAVfRG7eaqXxDMEl/fJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7aa4f6-2478-478e-6184-08d90693952e
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 20:08:38.3889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVM1W5kDi+HIAtx9e4mu0uZaYiOyMMYbXa3aT+1eWoX90Torlko95o1fq1357nvyZJie3ogN/+caVsrOULa1Jw==
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

Update the amd-memory-encryption.txt file with information about SEV-ES,
including how to launch an SEV-ES guest and some of the differences
between SEV and SEV-ES guests in regards to launching and measuring the
guest.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
---
 docs/amd-memory-encryption.txt | 54 +++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 7 deletions(-)

diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
index ed85159ea7..ffca382b5f 100644
--- a/docs/amd-memory-encryption.txt
+++ b/docs/amd-memory-encryption.txt
@@ -15,6 +15,13 @@ includes commands for launching, snapshotting, migrating and debugging the
 encrypted guest. These SEV commands can be issued via KVM_MEMORY_ENCRYPT_OP
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
 Boot images (such as bios) must be encrypted before a guest can be booted. The
@@ -24,6 +31,9 @@ together generate a fresh memory encryption key for the VM, encrypt the boot
 images and provide a measurement than can be used as an attestation of a
 successful launch.
 
+For a SEV-ES guest, the LAUNCH_UPDATE_VMSA command is also used to encrypt the
+guest register state, or VM save area (VMSA), for all of the guest vCPUs.
+
 LAUNCH_START is called first to create a cryptographic launch context within
 the firmware. To create this context, guest owner must provide a guest policy,
 its public Diffie-Hellman key (PDH) and session parameters. These inputs
@@ -40,6 +50,12 @@ The guest policy can be provided via the 'policy' property (see below)
 # ${QEMU} \
    sev-guest,id=sev0,policy=0x1...\
 
+Setting the "SEV-ES required" policy bit (bit 2) will launch the guest as a
+SEV-ES guest (see below)
+
+# ${QEMU} \
+   sev-guest,id=sev0,policy=0x5...\
+
 The guest owner provided DH certificate and session parameters will be used to
 establish a cryptographic session with the guest owner to negotiate keys used
 for the attestation.
@@ -55,13 +71,19 @@ created via the LAUNCH_START command. If required, this command can be called
 multiple times to encrypt different memory regions. The command also calculates
 the measurement of the memory contents as it encrypts.
 
-LAUNCH_MEASURE can be used to retrieve the measurement of encrypted memory.
-This measurement is a signature of the memory contents that can be sent to the
-guest owner as an attestation that the memory was encrypted correctly by the
-firmware. The guest owner may wait to provide the guest confidential information
-until it can verify the attestation measurement. Since the guest owner knows the
-initial contents of the guest at boot, the attestation measurement can be
-verified by comparing it to what the guest owner expects.
+LAUNCH_UPDATE_VMSA encrypts all the vCPU VMSAs for a SEV-ES guest using the
+cryptographic context created via the LAUNCH_START command. The command also
+calculates the measurement of the VMSAs as it encrypts them.
+
+LAUNCH_MEASURE can be used to retrieve the measurement of encrypted memory and,
+for a SEV-ES guest, encrypted VMSAs. This measurement is a signature of the
+memory contents and, for a SEV-ES guest, the VMSA contents, that can be sent
+to the guest owner as an attestation that the memory and VMSAs were encrypted
+correctly by the firmware. The guest owner may wait to provide the guest
+confidential information until it can verify the attestation measurement.
+Since the guest owner knows the initial contents of the guest at boot, the
+attestation measurement can be verified by comparing it to what the guest owner
+expects.
 
 LAUNCH_FINISH finalizes the guest launch and destroys the cryptographic
 context.
@@ -75,6 +97,22 @@ To launch a SEV guest
     -machine ...,confidential-guest-support=sev0 \
     -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1
 
+To launch a SEV-ES guest
+
+# ${QEMU} \
+    -machine ...,confidential-guest-support=sev0 \
+    -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x5
+
+An SEV-ES guest has some restrictions as compared to a SEV guest. Because the
+guest register state is encrypted and cannot be updated by the VMM/hypervisor,
+a SEV-ES guest:
+ - Does not support SMM - SMM support requires updating the guest register
+   state.
+ - Does not support reboot - a system reset requires updating the guest register
+   state.
+ - Requires in-kernel irqchip - the burden is placed on the hypervisor to
+   manage booting APs.
+
 Debugging
 -----------
 Since the memory contents of a SEV guest are encrypted, hypervisor access to
@@ -101,8 +139,10 @@ Secure Encrypted Virtualization Key Management:
 
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


