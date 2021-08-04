Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3553E00A7
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 13:58:57 +0200 (CEST)
Received: from localhost ([::1]:48786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBFY0-0002a6-UL
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 07:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFVl-0006Rv-R5
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:56:38 -0400
Received: from mail-bn7nam10on2051.outbound.protection.outlook.com
 ([40.107.92.51]:55585 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFVk-0002dC-5J
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:56:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3BDedgNigYO42EDjEgWrIT0aEN3eQEM8UQt/34VISPFpqaDozrrJu6F/H7IoLq68hJd6nLmgGc06rzbe9KGxdnqXQ1zWL5xpr4M9J3Q7lc8EhsLtElI/rBjB76mxDO+FwiAlmmtXfGxrzZEmBPLH0eT0OSiy6dEGRWbxIqBWUa4orJSToUXWVMXEVlCk/pg/DFXILT/V+F4QFAK7GUqLXiWnKqZmVcZTVyU2szwBw0pijlvxguGCqILQxJ1c/54K/LiuV//q0QHC7fYJC4sLo8Z+pKfVyUoe6HoI3fbn5r8QT099lthd//X3J77H5a4CdNfKzIPMReJH2AMVNztwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yp/6powOoQaPs30OV6TqYhbSnWIYY6+3PGvBh42wkSw=;
 b=MfFoJUVOgHPaZ31Vs2wzTOfJo4meSwPvaGADS0ZMyZc+v/NmvbgVcBwKn/J69Pl2QZK43DwikLGJpEC9py8du1Ufj9AXVJVa86VOGmM8AFt/aFz9gFSVhX4gGXI7hObxnv6A3Bwjmf1jwmAtItPrFboe5AQx5WOifzHkM9upaDOaQh5YrP8rR/l0Zmi5OMV9ESHIdOo+ZDBNbcsAgAaWEHGpYqtEkrUxJ11eo7cQzLgnfE5fEVQr6L5QPAaoCmW/XwkJPPkLgZgzvyueys8hX/KiBGG2/nGMviuCJrs6DKPKlHpIGeSuCSV5CxPYMoLIXDu6PfBkF43VRgcZ2r+2Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yp/6powOoQaPs30OV6TqYhbSnWIYY6+3PGvBh42wkSw=;
 b=USUYJc4Bj9UKol0zW9mgBWaQnNLxRvxSb5MKR+hgDERwNNty2+tSgsrRNXTuGiHt4R/FjGDotw2N8IJI4TMCk3hxLLUtVGIT1VNkgByi8gPGnjryuBYPIaIn5W/MsFF8rNUl0jX6zZIIK0KoJ4xFu3NErpONqwfCR4IIIXdv26E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 11:56:33 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 11:56:33 +0000
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Thomas.Lendacky@amd.com, brijesh.singh@amd.com,
 dgilbert@redhat.com, ehabkost@redhat.com, dovmurik@linux.vnet.ibm.com,
 tobin@ibm.com, jejb@linux.ibm.com
Subject: [PATCH v4 06/14] target/i386: sev: do not create launch context for
 an incoming guest
Date: Wed,  4 Aug 2021 11:56:22 +0000
Message-Id: <b85694233495c4ae1946b80015647e04c002c97f.1628076205.git.ashish.kalra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1628076205.git.ashish.kalra@amd.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:806:120::21) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server.amd.com (165.204.77.1) by
 SN7PR04CA0046.namprd04.prod.outlook.com (2603:10b6:806:120::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Wed, 4 Aug 2021 11:56:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3393ff7-eabf-4cfb-191d-08d9573ee76d
X-MS-TrafficTypeDiagnostic: SA0PR12MB4413:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB441353B25F60D0E4D0B2D25F8EF19@SA0PR12MB4413.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xglN/bX0ARdQGLi4BgLle8ImrJadqRv+5NTruE+2XlBsTbKz6PmJAGuw9fTDJyktsXVIDyP0mnp2ACZxPTlTcQvCqqj3iQzN6lIrKqspgcD+Q7Mv1N6EqZMTit3SdOtivWOOy+XUlq9Y5JhT2zDDD36POW6ldIRYiajbjMq0Hfr5e2XEWniGILCe2GFgRsWD6DroX4WmjTc8cgj7Rd2y2PNNu+H0p7DvpvsvS/Rux/sKvPLGGkUhKkKnhtJxgxrGfgBgPcNMfZ7Qdb2/YTc9Q4bDPvoZ/jAXZVrcrQUvoMMzZG49FB2iVB9xqxdhQhQxoUMr8PEfhl1pNvXAO/AK+K546Ke2A/WYRitHlpFaFP2WvKCkf9PoksBWCMvC/NIi+K+1ph8Fb3LW0Pco0rAA6QyMVgXr1UsywKLq9FaKoFBGNzx4QqoxjfO1vCOT7DBqe70d7PKOpY72BmpgSaRxtS9Cx1gLxs9fk/GwWGXWuJlLypjl7v9YRWzK9N9Y39RmUxE6N5zycBu8RX83qwOapuoVPpdj1h2DnhamAni00QfeL29L9QiHPQHVTJXb/Tzyuu/H2KPPNbaOWpaz8AbvBFd1KzTkKvvDVZqL6umBrU0itcPOTMFgj5NFqKTvqpglxgutoV14plm0xRYc2/X3hOh+f/QSfurqqYm2E8YNRpFurVnz1L1wpl/KTR0cX9TmieBCAWAz9cmU+TmM3um4oA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(36756003)(38350700002)(2906002)(6486002)(8676002)(38100700002)(86362001)(5660300002)(478600001)(52116002)(7696005)(316002)(83380400001)(66946007)(2616005)(4326008)(186003)(6666004)(6916009)(26005)(66476007)(8936002)(66556008)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bIWeJUvLqsTspDad5MNaR3/wLENmfhNieG/L1oaJ0M+7X2WQfGm5hz3Isa+k?=
 =?us-ascii?Q?X/VZ/nw/KEz0pGcSiKaVO06y1wemJ25AezxnRvaEMEphaVLFg+0AbrNQweUp?=
 =?us-ascii?Q?5JJ7/8PuTDnpseUHnbeXwE5dsgXNHtV9NZL1aKt2G2WGh3C20rKyCevla4bH?=
 =?us-ascii?Q?vi0GktVQfEvC1r9ULq/713x6+YtdLIrSKjftscU14/j5nx++RTWss1qe2RxA?=
 =?us-ascii?Q?pfdj5c2QspWkwHQO2stz/+uVwohgiimdHC+Tgrn9wOft+PfNQziEHF85Z7wn?=
 =?us-ascii?Q?OSEB4g4N/FwndDuyWk69YaNhmlQvMDntc0Gt91GaDW8iB06xpSzfKye0lgaA?=
 =?us-ascii?Q?zDISxRtMy2labKQgCHYiMfyCO3xeybhhpN90e7skVWgUe5bE2twZUTA8d00/?=
 =?us-ascii?Q?1l8Q2eX+1tB3fe/hhtzvKeVtrEojytW9OOKQCXlaeX9JO15/naYFnTK4ZjVj?=
 =?us-ascii?Q?2M+5l0muF/mRgR3qRidbe3tTY4ItrDRbIUTvFHS9GLCFntUaa9mqN0HB7iVA?=
 =?us-ascii?Q?gVmXYdAIb3+3iOq+Wd42E7MWBjyC9G6FCPrcmwJJadFynI4D8ZYiwM4X38MF?=
 =?us-ascii?Q?59/+8jQVs26JAqiuPyOtTyjO0SjL/4gAE0Q/NJ3PwomeEj9lcKevh/a4ROLu?=
 =?us-ascii?Q?RkwxAyywB8Y0TvqwSZY9/9LffZOS9OztRk2vdDSBl3px5kHb2T1MWQmrOSeW?=
 =?us-ascii?Q?IEcl3qh8Q1f6xVfyXKOueIqKVTP7apTAJynYmVSaARkXfx5AJObdlSjrLSns?=
 =?us-ascii?Q?wojmSqRLE6KCrfzDTJnr7+2Yk26jq9NqIr7729dMWB1SbC7TgCKJIqNe+MTE?=
 =?us-ascii?Q?+nR4IF3wvX7tYPaZvyPvmm2lzvzJqKqAZxDB5+kqnn1bfrjkj5fuld5kgCrW?=
 =?us-ascii?Q?lc44Q+S8nWq34dlJECCvaqshlmVG1LsxP7/Rx6kfb8ClkuPz77d1mbA1cpWh?=
 =?us-ascii?Q?eLNl7eIkzSyFV+XoSNmXOM+qkTto8K+Z2FpSxM9VUU5SjVyAId17q2pZ7OSb?=
 =?us-ascii?Q?YVPTdFkHzKU8NNVdZ8Y2JbrFaRwJTohVPHKYn1lYDyyPPACB46GrQelC9BLS?=
 =?us-ascii?Q?wE6r503LCFJV8exIixs7vWqsZQLC2tJYirQ24C7QGiUNYAlD0vRRc0jZwb6U?=
 =?us-ascii?Q?WESINrHu5Cqj8I4QirKYVuhFn2Hd5kLKckr8K0Wxmo1SwHq/9DmgQJUKtWBq?=
 =?us-ascii?Q?VLbBF1OfejIzC3DrK2W7WCBCYPyGB/s8spnGK2M84ZG9jswAfBREoDTyn+VR?=
 =?us-ascii?Q?b0flL9+o+uVzxUW3xX7KEhnuanq5q4fX7TxlZwSykApOjjkZF5ZxyZc+s99M?=
 =?us-ascii?Q?0Xgm0OyjZAvci0rIjjQhS9AD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3393ff7-eabf-4cfb-191d-08d9573ee76d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 11:56:33.3450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jIDw5RUu3hJ2xXjje8stkt44UpEoP4vqouYvMCSzQN90PByD3WHrYMoez+U1CZhsqoi7MgWYCfAqAV/EeBSjMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4413
Received-SPF: softfail client-ip=40.107.92.51;
 envelope-from=Ashish.Kalra@amd.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brijesh Singh <brijesh.singh@amd.com>

The LAUNCH_START is used for creating an encryption context to encrypt
newly created guest, for an incoming guest the RECEIVE_START should be
used.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
 target/i386/sev.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 5e7c87764c..10038d3880 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -919,12 +919,17 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
         goto err;
     }
 
-    ret = sev_launch_start(sev);
-    if (ret) {
-        error_setg(errp, "%s: failed to create encryption context", __func__);
-        goto err;
+    /*
+     * The LAUNCH context is used for new guest, if its an incoming guest
+     * then RECEIVE context will be created after the connection is established.
+     */
+    if (!runstate_check(RUN_STATE_INMIGRATE)) {
+        ret = sev_launch_start(sev);
+        if (ret) {
+            error_report("%s: failed to create encryption context", __func__);
+            goto err;
+        }
     }
-
     ram_block_notifier_add(&sev_ram_notifier);
     qemu_add_machine_init_done_notifier(&sev_machine_done_notify);
     qemu_add_vm_change_state_handler(sev_vm_state_change, sev);
-- 
2.17.1


