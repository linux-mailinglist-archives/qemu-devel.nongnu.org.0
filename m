Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A943DEF24
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 15:33:10 +0200 (CEST)
Received: from localhost ([::1]:42396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAuXd-0003DV-8y
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 09:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mAuQw-0000LZ-Fg
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:26:14 -0400
Received: from mail-dm6nam10hn2220.outbound.protection.outlook.com
 ([52.100.156.220]:55392 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mAuQu-0001f2-LA
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:26:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0IOH3AYGlboe/O4DI/MJ1s5yXQSc7LB2r/jpfEIaSGLIcmCjPMRyOb0jrdMC7ywXpwKhj3+/Mq95apx6dQBbLHTB7IMtb6lPs0mOdsTHcjQzWHIuxp4hmLvlmwf4IBgqDpZwEesqG2oGrOE2nXcQ8fHKJaMEgHOsfGXg7Odoia9nTsklMTunhzfW0WWYQi6MAcW69ODnxNTkuEO6gEetWt2AofXyB+KHHgrgLIS+8NXP3u6j8ZEnKyFwcAP6LD4k8gTNkcfY9Pkx0L/RTaVipPINh43abzBiP+YW/IAZxHXgls5VzaRznO11jgo0lZqd+832z/Ce8an/GDxVxZ/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEyRwSXM7cVIRuYNGwYcnj8C+/Wd1wRZz3seQ4KNW5Y=;
 b=CKiwYYl9ESj9+ADWF/EcpO2wBuIyO4up4KcO0OfvktvWN4c24OzkxlgYyvV/G5mX+xVme3a6AUlg29cl/m2NQZ4tJLbJ76DV/aWqK1mhn+3wFooOtNXirwOosPuEuNKvBX7il8q5R15LpMH6kxBBq1hECUEXzk03zaNl87eA9PKo7H4vRSs/2pXIh/E8hLFewKoCn6XNWz5GXoLuXMTKocEJdv4mLiZG5pvFVHBN9bH9uVBs/pusHcIBxDalukZVaK/WF2CRJUjx3lqMRumw8MpttHLE4IxOxT/Bz7WAa03IfSKZko8v1xz0ZEdY2O/BdV/f311JM3WIVGUHuKtBTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEyRwSXM7cVIRuYNGwYcnj8C+/Wd1wRZz3seQ4KNW5Y=;
 b=JN5w1n83VP9F7S+9xgFcK4VoQkxQhdGg3y5RlCLOpaIsTo4agfSFbntNmVMmptqXrhr4tSJxXkQoqkLWu2mK7PGUIwgqxHLcQeIEfimo8/POE+0Yfdn8Bp1C0c3HVFGod07TQeCNs4DALrYMiHGNrWBhYXxJ0T8KJ1WRNmYK+iE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB3909.namprd12.prod.outlook.com (2603:10b6:610:21::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Tue, 3 Aug
 2021 13:26:08 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%7]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 13:26:08 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Basil Salman <basil@daynix.com>,
 Basil Salman <bsalman@redhat.com>
Subject: [PULL for-6.1 3/6] qga-win: Fix handle leak in
 ga_get_win_product_name()
Date: Tue,  3 Aug 2021 08:24:49 -0500
Message-Id: <20210803132450.1093602-4-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803132450.1093602-1-michael.roth@amd.com>
References: <20210803132450.1093602-1-michael.roth@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::8) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.11) by
 SN7P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Tue, 3 Aug 2021 13:26:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4967e4ee-2964-47ba-4f4a-08d956824097
X-MS-TrafficTypeDiagnostic: CH2PR12MB3909:
X-Microsoft-Antispam-PRVS: <CH2PR12MB39090BECCB2BD91C0EDBECF895F09@CH2PR12MB3909.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7DCCK16MVSGAREbJ94x1a0apKSWrxzOAz/tT3I7cF6jhltyKx0+39qg4887J?=
 =?us-ascii?Q?Soj29GWbMRs+OSCdiQompTrpyXZrqK0czpKmLsXGuDcTiRhkxKWHmCOteiwi?=
 =?us-ascii?Q?zdcqADPQmvwd0dfWbZBYgrS1yuz0OZq/RJ5IEa8m1W/HLxdzHrzB2XNuKLzp?=
 =?us-ascii?Q?0JfMErTN+j8kMfJ084vw0alELgUp5HYVV306b9/v0OHNfe0uwAf+5qovYkdp?=
 =?us-ascii?Q?H3+8tThfFu2DjqaHT1nimsZEQNvdJTejiJNGX+VDYHaiJ89JTcH8RI3xDi4n?=
 =?us-ascii?Q?j40UQjpIf6crcvLe2zfFnf6Sd0NHnVDvifMgoCk/Z6MdL8CXZhLe8MbYDa2+?=
 =?us-ascii?Q?iZBbB6bCnUUqVXl5WfBLpDGUqhdBwsPLxruUMSxTL4UPQqkSQLqExZcyhK/A?=
 =?us-ascii?Q?IoxdoaRPJRpCW7Zvd/ic7jOt8/nAZ6dkRn0QCt4+RURuK9MXpqcChywe5OL7?=
 =?us-ascii?Q?ZMFCj1psW31rCeKcEFo4c3cSMk4GmK9W2oe6IKe3rH1i7FUUGPQTl6/D9lpL?=
 =?us-ascii?Q?3GCRI9umX8lfPsM1a4HyPRYMMD935tdSXtdZl1n5FoiOpI4sjDjwsjJoDv0u?=
 =?us-ascii?Q?kN9rvUR+6HraUQcSIP5pEPvSj1ZYacS2rwFLTWRepK7G4p9crIJWuROCY6o8?=
 =?us-ascii?Q?LY41V8IT98boCq089TDRLgY2ut+YscaUVegMYMW0Yik1SmIfP0Wv17kRdMdO?=
 =?us-ascii?Q?hVklabyiwMF/0DJ523zoWFGIMjVxQcqQD0PaP7e6OVZCQBTSvqsY8mxEKtgh?=
 =?us-ascii?Q?oykg4I9oX+tSZ/ufv3ED3X9byshPa1oLWUv2JfMHTic1IxJBcue0vuCtzF4I?=
 =?us-ascii?Q?40+r5M6zT58G8wJ70igHYvMW/Svj96ktreJtFmTbYBCidRzPstNOIUNmw34S?=
 =?us-ascii?Q?ckR3ILoT/uXO1erAkkrq22lGqV3oiqsY8ywJe3bE3SCrLOVGMP8Zdgmig7x0?=
 =?us-ascii?Q?J4x6Tu90ebRvJMddt9lUAvkxKKgyY/10qmEuP1IfVZfoUcU1FWuNDanhTOh7?=
 =?us-ascii?Q?gG3xhHKCqn3wKB69ikxhc5uRgLg/huAyvA2azoYyBSviFSegJyy9P7DnDFtO?=
 =?us-ascii?Q?evCsK1GGuZ77N78jfuXts/FrmZwswvueL8jmnGqgtoygjPkI+iu8lhP5BzNI?=
 =?us-ascii?Q?vZeF3O5zTvDd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(6916009)(86362001)(36756003)(5660300002)(6666004)(966005)(8936002)(54906003)(316002)(478600001)(4326008)(6496006)(52116002)(2906002)(1076003)(8676002)(83380400001)(26005)(66476007)(66556008)(2616005)(956004)(38350700002)(6486002)(38100700002)(186003)(44832011)(66946007)(23200700001);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rcFy/RQmfTHr+yrB4rKkZk/zj8EA5pSIvujsoiM+XqHRN0ZV0DRD27e5pew1?=
 =?us-ascii?Q?LxxzYntCK8LoJCFhvD8/Aa6hpFGbH8Sp0UipPgvwi3/fYshqUWuUgrIr4yxs?=
 =?us-ascii?Q?/Zo0/eVGg/a9ma2nizxUFXK8JF1yL0UELldLwV4ZteJ00WryRYwdW1QxXWGd?=
 =?us-ascii?Q?1TAUk5FuaM2lt9YOrjX+KflQF/Untgc2hCvmznSaDuo5vTha9Ka54VG/SHbQ?=
 =?us-ascii?Q?SKEg5cVxFghh1B+5RoXkVIkhBlhzrxIX0/mBmUn3rQD9MYGSmNkmRKekIH9G?=
 =?us-ascii?Q?d4P9iFeweup7IR9zuTCGl7Lj900qLniPcUfQTA0vq5Oumb0hqeT68P/WnjGG?=
 =?us-ascii?Q?fB0pl47X7A3bH9jqQV9r1ZZFDlOFQLCfoY2b9Ynfu623zBMIwq9JyUSoKLV4?=
 =?us-ascii?Q?J1/Aw5oZIJNN8fmmS9TmBKlbKFMxzwGs5zUuE+QOWSQy4+ftPKYGTaXbbkUP?=
 =?us-ascii?Q?he4ga3BPRONOQr70IdXaaIXwz0l10W6uvcJCyj5FdAvTi6YnrXT+rjX8tOez?=
 =?us-ascii?Q?xjO6/s8Beb3eADqtMzmJacr+QRTZ8fULNoFbd3nXwRiHBBfuFFoGRmFFGTcs?=
 =?us-ascii?Q?Yo7mZNtrNAWO4bO5sPb2HGY7FVO684H0W1EII7re5oecB4P+tzIds/6nyBOs?=
 =?us-ascii?Q?tm2le6WqquG22THvLaDd+aH+LnkphwKPOluRr1Sx32jY6AslLzn5vQ3heX/M?=
 =?us-ascii?Q?WxVsW8YQvtvgpXEVzOSTR7Pbz01z3kJkrN+U0bhWCJoNVpigsOvk36ZF+im6?=
 =?us-ascii?Q?ou09YZKHIQkMjc65k50oFnnLXg9KD4mLLut42merq613T3M+1jWSZgT/3q6s?=
 =?us-ascii?Q?4aHNco24UNnPLhGDb8PaPHs77M1F43wpvVyyRz27QIBA2XADmKTiqIydMrQ4?=
 =?us-ascii?Q?1rA2o+u/QJJhnLQu9S7gw9R0kQz0UJHfqQzwF6I7LM9JC9xXZTu2DmvcZlZs?=
 =?us-ascii?Q?kJbb7XH6k9VSptpyhyxIYmlqvyKyDcDA50qAMYLFblZjZ1jh0xLBrYaoRnPj?=
 =?us-ascii?Q?1c/nHeGL636qefF97iQE9OwLjFyupNQ3roh2x6+X3HIYAEHTSXEg0SFgHqCD?=
 =?us-ascii?Q?DMstkvORmZEQ8pCbpHBFxrP6gCMS2VnBn4D2aQiobuSZhebF2ckWPPKWMDKq?=
 =?us-ascii?Q?SOTNBu+a3CsM2gFb4LUlo763ddcdlVdg+yDOvSDBlPKogjd0//Y9Fcn8UTEo?=
 =?us-ascii?Q?6evQgFi0yd45zFYUBj/GdQc104ODuCnBeSoA4gC3XDcEJoGICOOOHIM3r3kE?=
 =?us-ascii?Q?TvCk8IxxxeJ+nF6d0Mg4GpMrw91qfiSlCLI572NM0dT9ph7n6d/Borw/CdJc?=
 =?us-ascii?Q?AhS3ezIk7tEPpnjchRtWrMFQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4967e4ee-2964-47ba-4f4a-08d956824097
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 13:26:08.0196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dRD/udwoNDK/8XPZhlMCShT1WqwaeVDhqM6fTd66O/wxmrh+BUy+lQveIO97b6Aa/wDmXO7cZBz5x4dduVOstg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3909
Received-SPF: softfail client-ip=52.100.156.220;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

In ga_get_win_product_name() a handle to Registry key was open but not
closed.

In this patch the handle is closed as part of the free routine.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1929144

Signed-off-by: Basil Salman <basil@daynix.com>
Signed-off-by: Basil Salman <bsalman@redhat.com>
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 qga/commands-win32.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 763186efd4..098211e724 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2231,7 +2231,7 @@ static char *ga_get_win_name(OSVERSIONINFOEXW const *os_version, bool id)
 
 static char *ga_get_win_product_name(Error **errp)
 {
-    HKEY key = NULL;
+    HKEY key = INVALID_HANDLE_VALUE;
     DWORD size = 128;
     char *result = g_malloc0(size);
     LONG err = ERROR_SUCCESS;
@@ -2241,7 +2241,8 @@ static char *ga_get_win_product_name(Error **errp)
                       &key);
     if (err != ERROR_SUCCESS) {
         error_setg_win32(errp, err, "failed to open registry key");
-        goto fail;
+        g_free(result);
+        return NULL;
     }
 
     err = RegQueryValueExA(key, "ProductName", NULL, NULL,
@@ -2262,9 +2263,13 @@ static char *ga_get_win_product_name(Error **errp)
         goto fail;
     }
 
+    RegCloseKey(key);
     return result;
 
 fail:
+    if (key != INVALID_HANDLE_VALUE) {
+        RegCloseKey(key);
+    }
     g_free(result);
     return NULL;
 }
-- 
2.25.1


