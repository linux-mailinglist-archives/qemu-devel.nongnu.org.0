Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99D23E009E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 13:57:37 +0200 (CEST)
Received: from localhost ([::1]:43466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBFWi-0007T6-Pb
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 07:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFTn-00022P-P4
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:54:37 -0400
Received: from mail-bn8nam11on2075.outbound.protection.outlook.com
 ([40.107.236.75]:21728 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFTm-0001j6-2m
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:54:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iy9//rTb8qeMyUDjq949+J5U5fkx8GM6QYOoTOjy7x9W5kCr/TDR4d+LI7ZSzFqZcLG6ex6jjQ/gJ8vGDMM1hMSLK/my8q+2lenSCg56zBzVozAzuKQPLJRiSQZIhzLwwojeL/KMHL0GzzOvbj9ITzB8SB/AiIKe5iiAxf7Xg3ULw/av2l6Qcy+vkdPLj+kRkrWsNEXfDDbg3WqZDLkYA+dahqIwlZ88dueMQLH1FNlAtUdz6E8QAo7FVuT583LElu+9Hr6mnp1oj2ZlUgWq+G9WncE2zVnXgWTYudVaeN1QuaVd11w4N7l+CGU2ZjwMVM5dpf1zqzdMTU92/DA1PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5CXFplllpM2+I9JXijiPVo/++k579H3w06uYwAsozQ=;
 b=BDVMj5oeZ4/btU/y/d5d+b0VZYME6gAdw50L4Jffpyw11Gp/qP55VvTRJHN/5fKHdsNewod0M+wF+TChN/iKpTxKLgshe5zq/1SSthFX2xkQE3PN9urUuNd/Wjv9sZ6bDNwLrDAHukqVkiwwjjPKFHXvCT/0ZJ0qISvdnkEWO8SoFtbOpNUe2oMjynycoA+w9/nt2SEKwXQlLAMCF2GYi1qdS4cxd0+m++ysTlLacvs1DEYKOcoCzysMmdj7JNogMzBxWbb26NlvXwIPqJPzdbcFg098pMEAuTDW1+g4xQoDmW9MFcu2/lJQvte8FRuy+Krv9g3lMw38goTjR9p85w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5CXFplllpM2+I9JXijiPVo/++k579H3w06uYwAsozQ=;
 b=QjlDLgJ13EjTDgZJv8a8RvAC12rEqvXxXQgIJ9Af5rr+eAehAoBqofoxmcY9w8pfDQMdKy4dERy/Pol9xYw4BboSH6Ky0Y5CCiBWhSgbxYAp+6NMQvA2uPcoo7UXzIjTENZDE8wdjTuuWb1cXyBDokQ41+x0hvNDeoK4vSYiu0g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SN6PR12MB2687.namprd12.prod.outlook.com (2603:10b6:805:73::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Wed, 4 Aug
 2021 11:53:58 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 11:53:58 +0000
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Thomas.Lendacky@amd.com, brijesh.singh@amd.com,
 dgilbert@redhat.com, ehabkost@redhat.com, dovmurik@linux.vnet.ibm.com,
 tobin@ibm.com, jejb@linux.ibm.com
Subject: [PATCH v4 02/14] doc: update AMD SEV to include Live migration flow
Date: Wed,  4 Aug 2021 11:53:47 +0000
Message-Id: <0e2b3d80e3d61b121ff4b508e5299e3c23f7b090.1628076205.git.ashish.kalra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1628076205.git.ashish.kalra@amd.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: SN6PR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:805:66::28) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server.amd.com (165.204.77.1) by
 SN6PR08CA0015.namprd08.prod.outlook.com (2603:10b6:805:66::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Wed, 4 Aug 2021 11:53:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a4bc873-e8ce-4b15-d152-08d9573e8b2d
X-MS-TrafficTypeDiagnostic: SN6PR12MB2687:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2687908009ADBD53A95BFBF88EF19@SN6PR12MB2687.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dG9S4hHa5NrITd7YIxCemktjOFbY3L3igqafXZBfFzQYoYuhzrkwwUkHsUOoG6t4KVSUkYKzNc1XtwMrEUp6g3YSf/1ZrEk3KaWNcixH9hShOWJYJIHnXbZxfPH1mO056tgBklkv9awACmBLDvObJxun0yGOfDKb/G7JfTwRqg6R8nolw9wlXmxGNwAeP/jOpdRaywSXm0H7/H0eZMPBX3Q7WGO3xC21L/NEPLvMeas4FK6AaUeX8SOW230aGdz/jTAlO3Zxm4IzWbje7K+Aa74pMpRwyJzN6DtGpke2EjtKPEu0Bb+6C5hztK9uoZ72+ptIFNhYtigH3xZfCeJ6ErbVRey1kBWPuwpuVeNrR9e05peXKvu6vh4QxkjzPoAw3lKXXNWcr8uQTzqIpdZoQVJBcrqVEFK02e8mTuKBJbOmDbfmP2Xq0UyIFFedqRuEiG8tXoY0Ln/XF5PvHoHw0BWnQaIrcK+rut7I4LXv9bJ+Zs32JlJagAyXB6DiLFYIlrHBXMB5G+doRBv7gmiKzZPbzeToIUjGrNThV3/lmPr1jC2tM02XTjsTrCj258cLqUggjGc8s9o+E/Lw94ExrgIeRRqga1ZdKZ3ew6hRRxaySSAtESplLeODrYN5tS/7RKGFoj5pKVGKp8UElBp+sRvfl/Sw4IjHT577Gz92hbYrpBfy+CZkdrS8PnUa+1hJvG/3zom8o7bZXonOGExcKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(8676002)(186003)(316002)(8936002)(52116002)(6666004)(956004)(15650500001)(83380400001)(2616005)(6486002)(5660300002)(6916009)(86362001)(478600001)(36756003)(4326008)(38350700002)(66946007)(66556008)(38100700002)(7696005)(26005)(2906002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8DIDQwMm99yPRV1IyzVqtl4g+xq+L4Fyqr1BAsIlvSc/D1SHaIuQG4C6Fkng?=
 =?us-ascii?Q?lvvsAFqSNsrJrVlly3o8E1hF/J6Zq02SO2/Hr02SgEE55j62egCpuuYPbmSk?=
 =?us-ascii?Q?9o8VGlOnvWlNu2wDsyinewymwTKMZgktR6kgH8U2c1yQrQym1qq//OBYwd1H?=
 =?us-ascii?Q?YYfTnZR93AS6eBB1g77A4qV7Pq4UzXGdRkZzrw7czwUelxm6GemiSOvNt3Xr?=
 =?us-ascii?Q?8EMyxElvmZJKc4YxE4nVC6PJ+0YLQpIMDRjNrQU9HxTshuwRbrqoq+6M6yof?=
 =?us-ascii?Q?MR0ttTUCExLXPWAsmkaNgNZ6POqY70CoA8A2YpRSt0NYYjkwShufD0ps02Ag?=
 =?us-ascii?Q?lKzqmHS9JZyFrSMUR6LTgus05kuBzhFJQhE8lvk+8W145Yf2b8KJPHJ5fmwg?=
 =?us-ascii?Q?Z3DBa1ET20oumLPHJltOXNweg3/EN3VyU3CWCnlzD7CmQ+G0XdtpXlRHM3dv?=
 =?us-ascii?Q?HTOqqCEvUttNX+zG34VjX5dNEi1cdUW+04SaZXG6eHoIGMp4skmp4qpVr6T4?=
 =?us-ascii?Q?FT2NZPg4NXdc+d0+QKa2XrgGuvNS831Fu99eMkmOwS2xXPfdrc/BBHjN8WLE?=
 =?us-ascii?Q?I7zHkh8wylVxAxlGktREaVcsZdiFUnlh0mbyxIOpK9vlPNMwtt+S5Q/S5FdU?=
 =?us-ascii?Q?DbQkt7MTm3UJo6TkWRflDvXE7q+VAlHH1HeicZ/rBHXJjEG+jAFkIhPuWgpF?=
 =?us-ascii?Q?6KFiE76uFElTNSdJPA9eCSmX+1iaK43P1sqUknPn+BW+cIpLnD7ws7p0KXKc?=
 =?us-ascii?Q?vh+yBKAoImVcbykdTNkE2s7bIXDxgdecPLuS/VYh95m45rbLDXieZBUZppE4?=
 =?us-ascii?Q?bbA1E9RItub6WJDeuJxCzXGpG1qTv6aYuGI0/o7lWBes+dI23VXWsK/FiP+c?=
 =?us-ascii?Q?vUOHg4eG8WFfAZGq8ztP5yPh2FcwSG4EArjMmETVomx8S0YCrdIMGB6BQHns?=
 =?us-ascii?Q?DnLuCzu7lqr+DnfgBg+1TRX2JH44ublY5lQLyacxw8Ii96ITkpqbGDA7AzBz?=
 =?us-ascii?Q?m1cxEHT+RQ3mCpR2OWbWie4bboMSBCUhNAxsXh2AHoXJ79PLppYGD2L/2wkg?=
 =?us-ascii?Q?rKaxCoxBHjuLip6MvhaHTcnNx8sxM/L5MvGXVWFpjHuIvOWX2blTpYUa8xPW?=
 =?us-ascii?Q?SQnmwWmt9WekvIo78O+3icsX9nCra1K4BghS04A7iYD3TvA3cibhxf4FRS2h?=
 =?us-ascii?Q?WkipJCU+xZhLUYJjBhShyE9jcnyOV9aPDv7JzxzFBdasZbTYsTZZsoHTfqvU?=
 =?us-ascii?Q?V9O4W3k1/N1bKsK3DUyDRFuzk//kS4zeWUstzHxTgK6vaGNQsgSPwK54XuTo?=
 =?us-ascii?Q?RW3yoUyUTdyy5v37+OXYDnrg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4bc873-e8ce-4b15-d152-08d9573e8b2d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 11:53:58.5749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HwoURe+jjWe3ajAwwyHEaDvjGZtiiDXYMAbLayXJNu3cwf2OX8X4UUXQ6Cd3yIvP+8/XFrEoU8u0EenUZh9pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2687
Received-SPF: softfail client-ip=40.107.236.75;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brijesh Singh <brijesh.singh@amd.com>

Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
 docs/amd-memory-encryption.txt | 46 +++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
index 12ca25180e..0d9184532a 100644
--- a/docs/amd-memory-encryption.txt
+++ b/docs/amd-memory-encryption.txt
@@ -126,7 +126,51 @@ TODO
 
 Live Migration
 ----------------
-TODO
+AMD SEV encrypts the memory of VMs and because a different key is used
+in each VM, the hypervisor will be unable to simply copy the
+ciphertext from one VM to another to migrate the VM. Instead the AMD SEV Key
+Management API provides sets of function which the hypervisor can use
+to package a guest page for migration, while maintaining the confidentiality
+provided by AMD SEV.
+
+SEV guest VMs have the concept of private and shared memory. The private
+memory is encrypted with the guest-specific key, while shared memory may
+be encrypted with the hypervisor key. The migration APIs provided by the
+SEV API spec should be used for migrating the private pages.
+
+The KVM_HC_MAP_GPA_RANGE hypercall is used by the SEV guest to notify a
+change in the page encryption status to the hypervisor. The hypercall
+is invoked when the encryption attribute is changed from encrypted -> decrypted
+and vice versa. By default all guest pages are considered encrypted.
+
+This hypercall exits to qemu via KVM_EXIT_HYPERCALL to manage the guest
+shared regions and integrate with the qemu's migration code. The shared
+region list can be used to check if the given guest page is private or shared.
+
+Before initiating the migration, we need to know the targets machine's public
+Diffie-Hellman key (PDH) and certificate chain. It can be retrieved
+with the 'query-sev-capabilities' QMP command or using the sev-tool. The
+migrate-set-parameter can be used to pass the target machine's PDH and
+certificate chain.
+
+During the migration flow, the SEND_START is called on the source hypervisor
+to create an outgoing encryption context. The SEV guest policy dictates whether
+the certificate passed through the migrate-sev-set-info command will be
+validated. SEND_UPDATE_DATA is called to encrypt the guest private pages.
+After migration is completed, SEND_FINISH is called to destroy the encryption
+context and make the VM non-runnable to protect it against cloning.
+
+On the target machine, RECEIVE_START is called first to create an
+incoming encryption context. The RECEIVE_UPDATE_DATA is called to copy
+the received encrypted page into guest memory. After migration has
+completed, RECEIVE_FINISH is called to make the VM runnable.
+
+For more information about the migration see SEV API Appendix A
+Usage flow (Live migration section).
+
+NOTE:
+To protect against the memory clone SEV APIs are designed to make the VM
+unrunnable in case of the migration failure.
 
 References
 -----------------
-- 
2.17.1


