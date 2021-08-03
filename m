Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E0F3DEF0D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 15:27:53 +0200 (CEST)
Received: from localhost ([::1]:56988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAuSW-0002N5-S4
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 09:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mAuQr-0000Df-Ct
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:26:09 -0400
Received: from mail-mw2nam10hn2246.outbound.protection.outlook.com
 ([52.100.157.246]:23648 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mAuQp-0001X3-O5
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:26:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gp4ATomTb6nGDqm2ZlFAroWoOcIAvxdLcvskzFBjWoiRMI3jzK7b393/vUY7XzoYqy3zXi9cJK/5Es5LfzT4q96CO58Iy5QrtEQidobfFuK9HzNVuI9PICeg/WHngs//lYgCfrbJHR9w/ATJmMKaLoyGnadPv0CSoSrHCP3uoUnLAPWaEGiaRyAk9Y0uQ7CNysBwiY2aZc4AoS7tulLnY5t2O0fx7yQ5Tl4ybsVQUWW0jhLro0/8QPRrweUE7dkLOmWZvHElJ+V4wg1KqX3Y34sbAUcMn4lhR+eGc2ht01alWwLFQwu/HpfxpOJgyBVo7S+9QEO36I6QxN6ZK7awIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=et5Km8zdgm2AUr04gfYaQ7eetKwbJS4a1xbFvV7Mdgo=;
 b=JqEdP2FMtLPa+Yl83d98lh/a+A3F3ORaJTc08jpXwGVDkQe0y8gkER+H+vy7rCrKvPYUttMo4E0qP3gHC7k8KgQ+UDI1bcObWU8kruNKmZb/dG+COR6APND05lWUTlWQCP23sITVw9sxpOVRkMfiVMbhorhaEM0Llod94k1fqhpxaDkgBLu1pvgxa/4XV1bNUS3jVap6ARWrNpCOd4d5TZr0PulMdySAxMhlg1JGKrXOC2/IEZluWHAL/Jcsom2V+QfufCwrm01E6ld7FUvpyiE6VMzQXu43QDHzTpuxrR4tbbA81d7rLrEPytQpz6NCrV63qkhP2zGeLI1o34PQSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=et5Km8zdgm2AUr04gfYaQ7eetKwbJS4a1xbFvV7Mdgo=;
 b=sovYJFGJMU0r5HuBCzPjVW2hjj1Tqy5wI8vFqWKlZchZzWyhVQu0CRVOQ5eXQoJNldatM74/NsbxK6Kv7pQEmrQsmAeVu4vR4I+BSyM8hh9hIqkoZQ8dVFbOsBk7GVxMRu2FW7OmsZva41A4n5gua83QvcRskjS4yLeu0PCpzuQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4136.namprd12.prod.outlook.com (2603:10b6:610:a4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Tue, 3 Aug
 2021 13:26:03 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%7]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 13:26:03 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Basil Salman <basil@daynix.com>,
 Basil Salman <bsalman@daynix.com>
Subject: [PULL for-6.1 1/6] qga-win: Increase VSS freeze timeout to 60 secs
 instead of 10
Date: Tue,  3 Aug 2021 08:24:47 -0500
Message-Id: <20210803132450.1093602-2-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803132450.1093602-1-michael.roth@amd.com>
References: <20210803132450.1093602-1-michael.roth@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::25) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.11) by
 SN7P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.20 via Frontend Transport; Tue, 3 Aug 2021 13:26:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f22cca02-857f-4eaf-e540-08d956823dfd
X-MS-TrafficTypeDiagnostic: CH2PR12MB4136:
X-Microsoft-Antispam-PRVS: <CH2PR12MB413667103567EF2AAC7BE93495F09@CH2PR12MB4136.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B/EHXCCL2G4E07ANx2h8fulcveNdiaD4Wd1TyVvdmlW6+NsgLHeC+X28W1ie?=
 =?us-ascii?Q?g1uTg0FVm3lCzZ93inG3WDWZ2V/StemBCfq5k66CjP0X+TY+1ouHy63Aku9I?=
 =?us-ascii?Q?yQwH7C7RFsOiRME/GKMLN6SBSzqSrx3yMjSmtmGx8fmaYq/ZAl8azltBq5Zr?=
 =?us-ascii?Q?Zwwk7e7p1zzzG0n+9KykapHrFfiWQhtTsP6uIe3k6xUB7xaS5LULzY+M/ZOR?=
 =?us-ascii?Q?OKDjRmpXfMwAv+CauLKlhY4shk7EZHK4MrANGpVObHTCmKEygyrxGDhhlUoI?=
 =?us-ascii?Q?lZedmwae3Dvrb1aPOQ4q09T2r3pR8n+u0tVx1MibPmyXNFkwJ2zh3jjvRzlv?=
 =?us-ascii?Q?bB/2Rh84M31qe3TTz8CgYqexbPd+v04y3v0smyQheVFC/vkiS8FCPUtKE4+s?=
 =?us-ascii?Q?ojcrK/kA74EcHqj7NSNfRY5T84DCUU2r9YZJSrN6ssDM4aJtVR0J+TwQ1xKY?=
 =?us-ascii?Q?XsNTyHzAw0NW1eRxNE5Z+el5gPHcJcavj/NVAduhymSTfQd5OJsmdJLf4lhc?=
 =?us-ascii?Q?1Mp8kttxcrl6BDITwwWNgQG0EVKij9M/x9weTW3PBi+0JkcPKF0ZevIiQuD1?=
 =?us-ascii?Q?2wiGejlUWDmP6NsbK1QGJZmKMi8hrvkXR3Q8Yag689eu8SkHiEetkb84cFEs?=
 =?us-ascii?Q?j+IxbcOMpq8b1/emnJvsAXpIefeibQWVHA0O5unXEo0hPxO/J1jyZ6Gh2iP0?=
 =?us-ascii?Q?1P5UVC1uUGDqaE3CHLuC+KH/n12NEiMO4b1PdhNqW5rzFgz7GiRA+Ususeke?=
 =?us-ascii?Q?lCTK+zvHs8elj6yNqCXyyr9edXldsTug4hl9y24RDIBOYmSq7fN0DHyjAIVd?=
 =?us-ascii?Q?5te70PxnlYG3722DxjW+XF+A01YPTiue4beBv/38pGXOUMHmw6zcCsgpA6sE?=
 =?us-ascii?Q?z+Jv7393KBOTg6s3WlcB3rtap5GOzLw6jBoJ1fsnRDpOm7byeYwdGcMV8E6k?=
 =?us-ascii?Q?fuNX9WSEKVbie9Nhhf0onKPhc862jQxuAvkUx9lfx36h4FL0OVF75wb2M+Z2?=
 =?us-ascii?Q?BaqpsKnk7HI282pezrc97OXfp6IBTyhslRecaTnkrgDuq5JNWPY2NN8ccF9H?=
 =?us-ascii?Q?gaSzJJorLxhEysWX1SkcgCEZP2dFWkQKrSNKtx2crMAzjFBB2QtWhwQjD9bb?=
 =?us-ascii?Q?IO567ZaJgtD+pbQ75hWaKUGZrXipjOM2ODGnMsuOUsXWF50Kr8iesdU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(316002)(2906002)(38100700002)(44832011)(83380400001)(8936002)(1076003)(36756003)(6486002)(6496006)(52116002)(54906003)(38350700002)(2616005)(956004)(478600001)(5660300002)(66476007)(186003)(66946007)(8676002)(66556008)(26005)(4326008)(6666004)(86362001)(6916009)(966005)(23200700001);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UlJXNpSkCKGzqAXEtfCTBiza1PQ6QxhrUB3kyK0X3Hgn9oP6Dd3RteQKg0hl?=
 =?us-ascii?Q?7j9cj/ZVBaRp+cZEMtQsiS8WAc0AVGzsddBorTT5zE586fgGOT7fMlNidgLF?=
 =?us-ascii?Q?L/UQ8CrQt6BzC6jXcJy0VKUjL2kTk7KzrgsctJKAm/FEgnaMaQsz5XJ0n6Uj?=
 =?us-ascii?Q?8uNlYS6upV78t7cT89YdBLvboggH17JhKTobLtpv9SvaNGgrpkfLZZVqXqwD?=
 =?us-ascii?Q?Nh7/O1mGGmxnIKKSfNYwondedVVh3FyFp69KpvNXk+l7Gf+i0+0fcJtEGoKg?=
 =?us-ascii?Q?1VZxMdNPIFpIx5GpJyA0xrIBaAHnThqhuSmPcfb/5JhpXOlwqTlRWulHJnVI?=
 =?us-ascii?Q?TdLiocaDQoJ8JFYAh1mmju+CrFWUJuV/QM9EtcBTqUGSWU/51tiZtonnyVCL?=
 =?us-ascii?Q?HkIG/7x3inqn6P2OUhVTdbbjfaY1kB+jPr6p6RmBRSrbvHUWIUNRkW9NpMFZ?=
 =?us-ascii?Q?LfrPJWqYrGZOlktay4EoBrvBgVAgMIhTjNi2Apj25k/GrGEpOXxdClJrzv+L?=
 =?us-ascii?Q?EnQVrpMJdYy36j9exFHSH/g27SPNyGb2KAHYsH34a6hgKYsqfv+BQzT6Kwyf?=
 =?us-ascii?Q?DdXjSbZOFTuBT9uiIsAQvjT/ahrhLtCvZZlhyt46YJ5wd2kSOCjJCJK/xYWr?=
 =?us-ascii?Q?ZxrlNm3DKOyVPEv8H8paGkVZDtMv1nlN2TcxDZ5qj0HgSn90aiae4mwZRRLg?=
 =?us-ascii?Q?2X913+aLYEf1VROT6MQ12oJr/n8nzr41sP+ISLbrZ89IltRv6O+KttlwxSYE?=
 =?us-ascii?Q?x6M7gsDOizx0tuIEVojEBQGG3RJJ0Md4dgySNF7YVjmzBEvDJ9Oo5fz5DL3j?=
 =?us-ascii?Q?q5Mle53PKZtddJgDLzv0iutCiGRvlhQlaPxQfTXFtkEpeur4lQ0BR8UE3WzK?=
 =?us-ascii?Q?+w6mpCZtYsE0/TaXhXR6ClduiiwRxW03a5X2Oi0RxgCwmZn4tMHiydkVMzbq?=
 =?us-ascii?Q?VTWrumloNRiZul8gHpc1JXdFqZ4q27BTITG1w27AnEAuWmwipz5aXXOJEQsf?=
 =?us-ascii?Q?LRhdfBZYkf6241oAgQr0GFQ/UvgBvXbUkgQDekGlxUdf4KBon+gPyrQjC8NV?=
 =?us-ascii?Q?zqrNt4XNiff+oeggWseFEaehmZiveWopVsf0Y9y6gX5NO7wWg0aYYLxsHBLS?=
 =?us-ascii?Q?WrqhweMxQ51pIa3gxDpyB8PGVck92m3Wk3UFH/RWHtd8Q8oLK9ywWlVXljgm?=
 =?us-ascii?Q?jhDDCK3MQhNFcZ6ei6q25iX3xds4rBkN2thLBFG7ZOVrE84r9IrOy2Ig2mG6?=
 =?us-ascii?Q?jk8xmsn3d+MOU+9GT/dwe4vgzI99LNemTM9aKS1MzOllKdyWoIZOn5iEJOlL?=
 =?us-ascii?Q?C/E9pIeaD3dSN6xLJBBjgges?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f22cca02-857f-4eaf-e540-08d956823dfd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 13:26:03.6925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDaoe/O5N5coYvChmmj8yWvMF6cKGQtV1CR7yZsqhycLasyBBKBXd0kRDEa6CZV0sam1J9aIpoL98eDSProSLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4136
Received-SPF: softfail client-ip=52.100.157.246;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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

From: Basil Salman <basil@daynix.com>

Currently Requester freeze times out after 10 seconds, while
the default timeout for Writer Freeze is 60 seconds. according to
VSS Documentation [1].
[1]: https://docs.microsoft.com/en-us/windows/win32/vss/overview-of-processing-a-backup-under-vss

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1909073

Signed-off-by: Basil Salman <bsalman@daynix.com>
Signed-off-by: Basil Salman <basil@daynix.com>
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 qga/vss-win32/requester.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/vss-win32/requester.cpp b/qga/vss-win32/requester.cpp
index 5378c55d23..940a2c8f55 100644
--- a/qga/vss-win32/requester.cpp
+++ b/qga/vss-win32/requester.cpp
@@ -18,7 +18,7 @@
 #include <inc/win2003/vsbackup.h>
 
 /* Max wait time for frozen event (VSS can only hold writes for 10 seconds) */
-#define VSS_TIMEOUT_FREEZE_MSEC 10000
+#define VSS_TIMEOUT_FREEZE_MSEC 60000
 
 /* Call QueryStatus every 10 ms while waiting for frozen event */
 #define VSS_TIMEOUT_EVENT_MSEC 10
-- 
2.25.1


