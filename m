Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ED83E0091
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 13:55:42 +0200 (CEST)
Received: from localhost ([::1]:35672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBFUr-00029U-2P
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 07:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFTA-000190-B0
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:53:56 -0400
Received: from mail-bn8nam11on2070.outbound.protection.outlook.com
 ([40.107.236.70]:36769 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFT8-0001Uq-4k
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:53:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjq0/i/9XXGiSGoAlaAu9cRj4QtrfA4+tsj8MTtmRSwOl1zzSPSJo8NoUjMOXZNANXhpdMXVNdn4wPGyl2VKMbNK6zkQRb3DwEoNzLJ8PZb757nryrMTfMUVCPbnfUpUULnOLTzeEbhAje0yobFlhkIOwBwsl7rn83D2+YpP75RkNKlaYnsjXlWQ1YUAieyXiBfkFrDv44DBE2pA3xBy7CMmFrYuvyMk4iy/D/jzK18No0/89HMUvLtoNYFXGejE6hXwwNKdjpR35Az6h+YSXiRXRqW07+s2VRCS51t3tajgTzlLEHIYpFIh3579KuTj/nlPcVcmvWJAsh61KPnODg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kl0EvZ8CasqpGL+S6YZkacvZmfF5LkwyRzvkkOi81V4=;
 b=TeblgtpPFp/GY314LnVfKr9MTuds/5ax3kYbZNtT+sbhpubeUAUsSOC3sny7VsYGM/w1K88r1W2XDxFib8lSDw1mYpy82SeP4l8xYGhK97uo8KF/V0WWwPe8lwGucq7DN4ddCYc1yqr7cDJ6ZnZ/mur73EFqw1nhFPGKlD+HhFQkqFwbk7ttQ9dUdLSgP4GF4a1x0aSZGpaVP5vbEVq4v9I9sxz64rp1E7vxbvQ8nf+DLEwBVembe8rhl28OUaLS6rhapZectzY0up7EEbVL1VAoj9qA1tCaSmUnbxNBCAY5Xhr73AbypGadpCEllsxBPfVYixbTY60HJmCpvzri+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kl0EvZ8CasqpGL+S6YZkacvZmfF5LkwyRzvkkOi81V4=;
 b=l5r+1qcIl0zwjGnE/+hyS0QDWSYtvR9xcyjfD/ODQpHZJs93zNa2na9Yaa1JrHcwQk4uUQvowoRHzNxH0y3B8xK4mgObYFkb/KNQICPgh1MCs5A9JVbOdZ9nC+snI2Tbdnekh0nqcCZnJn6AjzZG/gjHFKQKJYGi0wrN/dWU/Ng=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SN6PR12MB2687.namprd12.prod.outlook.com (2603:10b6:805:73::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Wed, 4 Aug
 2021 11:53:18 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 11:53:18 +0000
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Thomas.Lendacky@amd.com, brijesh.singh@amd.com,
 dgilbert@redhat.com, ehabkost@redhat.com, dovmurik@linux.vnet.ibm.com,
 tobin@ibm.com, jejb@linux.ibm.com
Subject: [PATCH v4 01/14] doc: update AMD SEV API spec web link
Date: Wed,  4 Aug 2021 11:53:05 +0000
Message-Id: <3c88c509d6b96f8beaf5335b8c266714405cc09e.1628076205.git.ashish.kalra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1628076205.git.ashish.kalra@amd.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0025.namprd07.prod.outlook.com
 (2603:10b6:803:2d::22) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server.amd.com (165.204.77.1) by
 SN4PR0701CA0025.namprd07.prod.outlook.com (2603:10b6:803:2d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 4 Aug 2021 11:53:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5aec6553-5c55-4b81-93dc-08d9573e7350
X-MS-TrafficTypeDiagnostic: SN6PR12MB2687:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2687D6BED0594C980FCED31F8EF19@SN6PR12MB2687.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XKCcIXtPQSGQKTy/ICMn924uWDvxtaob6A7dfEbe1mOdKR1cym5wmTvZlUJfOSDBWft+986qzL7Cr0k/uk20+BtSAC5Gf1CT8UgGT2rWTXtnJjSOqPYiGXx62zHybcH92+xes9wHpoSzlSHVuyeWHwPHRG2s/D9SwS92pgBr9JSsM37wezlXgSwIsZs4rEmp7Da6sylOsZiRdTOmcgEmS5+In5WQC5m8ONzHElZR4Qra3S9q/l3OaUe+5X6VTwI0ri/aAjZDqIsp+8Gnx+t1VymeIqiPrTHc9ig9vVapjTxF9lNbnMtqjqbAWGwr3xCujORtcDPB0Gyt5o44PEJDOhzFhP4bB7wvfFyJq1rkeed5kcszd1XpMYgQL86NhjVtSLKal2FiPZ7FA94/I2eh+4K4MVPoYbW2CYxs24mOalmQN31ZGWIK2Ftmgchcgmryu8d4egszwzxO0VFRW7sy0ktqeVXoPHuaJBsqvB/zqGxU0vlsVSiyzqI8OqgyN8W6V7IgNLpV0B5ob/54TdNhyQDoC2ZVXCU1Zcb/G5Nfemqtj63blDN07KQymqen0K2UvxDz5c6fiNFH1Ed5bOho4JQk1rd9NYst3bKerhCbnsL9aD1yAUIdWZz0RHENIwUnlJ0JFMYlNSCO3ywj2o3iWMkdPN1PM7gxxBOzkrSLQhAEonTi2u1S85mrgOpt5USb+qx0SaI/3OQtrlPV22E9PA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(8676002)(186003)(316002)(8936002)(52116002)(6666004)(956004)(4744005)(83380400001)(2616005)(6486002)(5660300002)(6916009)(86362001)(478600001)(36756003)(4326008)(38350700002)(66946007)(66556008)(38100700002)(7696005)(26005)(2906002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9BU7oEkyZF6v2aNQtRJGB3N3EZXexqEFChnHkHgZdIW2k1/i/uzWT9/FzLJT?=
 =?us-ascii?Q?8Hfbt4+F1MvlPz8u9aEWurvX2kHP9Ns6tbjAoWjThNkyFl6m+qX8BMVh+sIT?=
 =?us-ascii?Q?x0eSfb6I5/cyQrEBs9HLwYJHmdsOvAT5LZFzz5vVzSpV9uXr36vsPVpRg6Mb?=
 =?us-ascii?Q?Q52Ned4esy5LP6tHK12/glBs3+q30aGno1q6JEnTNTLIrECHjoF/Rf7f5pAX?=
 =?us-ascii?Q?QiYCzD+7N3xwTxcEGGc/zoeDDiOio8VUVpTKfa/tjOx/uXuCSIXKGuGY1NsL?=
 =?us-ascii?Q?WNfXjSQV82ENobFMb7RxyObGjNw4/N9Hu34/jfm0YyJZ50i7W0pkuPl9j5K6?=
 =?us-ascii?Q?sEHVnSyhdFgK08yZxNaboq5mIsWtp4NpSLvpNRxyO74hIqU71NTgtLWOWxE0?=
 =?us-ascii?Q?UjzxtcAuv09X+0U9hS0cRbxBfVk3rBUHEi18+U6E+o337iSA3SDPx35sIRgN?=
 =?us-ascii?Q?ZkGHKCD8K0Scepa4qVL+JvvhJFkTTtlZPJCy8kgqRHXLUGksgos1eEtEjNSb?=
 =?us-ascii?Q?an++158a+uCq06d3IXwblLCJZa0y8j6Axup75Q65Vn9gEesFXj1KIRyIgIOm?=
 =?us-ascii?Q?kkAcYHW4KlFI47Q7D7GY9Ft8ITjNBFqa5++i7AmAJf+zeE45z84jODd8q4ja?=
 =?us-ascii?Q?9Rxh2fv/TI8wVjIKreou5+0y6DFvscanFZ8HdRSfh0aoV1XNX1j2oLGdXSux?=
 =?us-ascii?Q?i/B5GDUfF7rUMdfCRJ6qOgkFeuBMpm57ea1iCCR4cllO7tR5T0H/PV1i0Sx3?=
 =?us-ascii?Q?vLbtFDsfz1CAw8unNM24t3yx8QKIzKy4cIc7eoEx6URaXrNyAIKEp10QKO1t?=
 =?us-ascii?Q?ILqwu68vKVXNLMGFMnQgd851xjln/AMtwGJQo51QVy9pRx9uLJtJm8+l55+2?=
 =?us-ascii?Q?pXrNsc+5Eim9o69pntTkONWLFYuyn1jnV7sxW/Alvq7eL8vIq7wEZ/GibYZR?=
 =?us-ascii?Q?WGcv70TG3iAHeDiBuVtj5l0BXJY2YGiPABmH1V7l2K/vfSVKbNWUfb1e8TrC?=
 =?us-ascii?Q?CQIXF8G7E04XAsVz4uwTtW7/IwO+siA4vAD+XIaymXyyL9uJ9QQOlpq/n2QB?=
 =?us-ascii?Q?hsbxPQs/7y6uayxQbK69ZZi7K5eooqBZMORquP8FcYaI7jH58YQIB4FYpsXh?=
 =?us-ascii?Q?c6Mhxt4iUiFDUfZ0Q5mohgBc6ZXu7e1VwnaEcDC8rEIA+KE+XTIrW66XSrix?=
 =?us-ascii?Q?KlF8m7b3XHc20kkywN6ISbudlxoYk7jRofxb3vygeFMPYwIDXI+XOdvUqnZg?=
 =?us-ascii?Q?k0MXb4wS/vuTxqLp4AQSEhB7B99LpNuWEsLkl1xUdtzlHsMJwrk8fQmf1y4r?=
 =?us-ascii?Q?kViKuCXJD5vnrV8mbFBq+oJk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aec6553-5c55-4b81-93dc-08d9573e7350
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 11:53:18.5314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qsq/RBE5jXELaTbwR4weOUl4KrvBYVNGWgnAMCU5qXTVDp4etoRJzX89YDi9r6NROZsf96hcaqnoG3zopIc7Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2687
Received-SPF: softfail client-ip=40.107.236.70;
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

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
 docs/amd-memory-encryption.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
index ffca382b5f..12ca25180e 100644
--- a/docs/amd-memory-encryption.txt
+++ b/docs/amd-memory-encryption.txt
@@ -88,8 +88,8 @@ expects.
 LAUNCH_FINISH finalizes the guest launch and destroys the cryptographic
 context.
 
-See SEV KM API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
-complete flow chart.
+See Secure Encrypted Virtualization Key Management API spec section
+'Launching a guest' usage flow  (Appendix A) for the complete flow chart.
 
 To launch a SEV guest
 
-- 
2.17.1


