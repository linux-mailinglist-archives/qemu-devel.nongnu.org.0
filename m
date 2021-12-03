Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4B3467ECB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 21:29:17 +0100 (CET)
Received: from localhost ([::1]:58346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtFBD-0003sv-QD
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 15:29:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8j-0000mO-0d; Fri, 03 Dec 2021 15:26:42 -0500
Received: from mail-eopbgr150139.outbound.protection.outlook.com
 ([40.107.15.139]:14661 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8V-0001cv-2m; Fri, 03 Dec 2021 15:26:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLxBFoyV1HVSDnho8fAMai/2hhjAZS8BJFBg8wHCGS9qRNlV8jz9HAZiCaVGm4D9e5vhNWJLXmeG9Kdqd3k2OXaRsq5hQQTXKWvJJcMdw6QuBCtWLlxbXXVSFkgB3fIkaoGj9jPNpUvlOXhrvD4nzNwGE6nBJ5QwJ0F9t0re6odGpNd2EYKvz4z3Y7o4bSMwpKI9QfDCV8nrkzP/I1ZtpMRXAGXZbLHraRHM9cOkFA91qedgd/+fs7kPl0aa13fUjPIm3hvsyHnhZKrTfYHFD4Y3MgUWnHknKHspQZeDraaC/ydFwxj8Pf4KaTMCGyNfAPJVJfh3Ia8P//nLtQqbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Y9LPTxEfEll8hr7ZfNbGMzDqY1ke2XkpUh154uh+aE=;
 b=cKcMabTEvhX+w0UEr0kE9fwZJZtnDIRG/gMFz7dLd85cWrakiv/nokubIjWv8o8mLQQJhJCX8CGsuq5m35djRXOa9URzNJrjUW0OeoUJyTzb4kdUnapddVhd5Du8I9JrsAn9iovCHw7OQV05pP3jJ1F53pn/pqI/FpeAKjLihOGZ8MW4zDCPORZCt7/uBI8aH6Fpz/InAIWzpRrTlVqkYCsK7kzowZeud55ktSnkW0FWtgf6K3mqix4ogyrri2AYc1FlxcDu8YjpjDoGKESx0XROOD25xA5oc6Gqq/OCugttOueC1l9EfyMPBUYKc311gcty0lEHfr3NSpYwXm+UeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Y9LPTxEfEll8hr7ZfNbGMzDqY1ke2XkpUh154uh+aE=;
 b=WlvN+8N6dL+ozIJGdFPEyKCnqJUAl5ulMSsYw/UM+0BHKTzdEgFwxnpoPtXdcpM9Wsu0jMVdbgzDjzLE1kcOgkFzgpx7rsfKjzyYRm+2PX2R+1WDgqE/T8/ECm5MeWYKpAcO5Mxx2qzPEQo8AftCjdIBxSQgo8dCPpEHgrk3V3k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3841.eurprd08.prod.outlook.com (2603:10a6:208:106::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 3 Dec
 2021 20:26:17 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 20:26:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, John Snow <jsnow@redhat.com>
Subject: [PATCH 01/14] block: BlockDriver: add .filtered_child_is_backing field
Date: Fri,  3 Dec 2021 21:25:40 +0100
Message-Id: <20211203202553.3231580-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
References: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 20:26:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a94453e4-788a-4d52-16cb-08d9b69b2889
X-MS-TrafficTypeDiagnostic: AM0PR08MB3841:
X-Microsoft-Antispam-PRVS: <AM0PR08MB384131560BFCF764A5CAB8F3C16A9@AM0PR08MB3841.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KhlXKqJDc8yYES/XTQ8YHeXM77U4M6F5xuhgN243mXcNyDeSK/hkCFfaBDfPiVdHkHrbNzyW/l6wBbv8/gD2B3nxthuVc6eDmyxVQRZV+z0DtAoNK8NMH66wLAZrSahneUlUBSasmDYbVRauI01YPbbMyjnxp2HIOqwRUtBQjQDnSXq5kFPoj5A5EPpau87Nf0eJDKqvOf/uQiPAxHJg+c2vSvi96CQ2P74+j8JPttjfLymLhp2pxMvvB8ZBnOmXQDFa263il8h7nVnORjnDBYjPJb/OWE/vmTFeYOIah0n0oPZ1qmKO23GP+l/47YFKYVc6B6RSl6N/u+Uu1H3luBkQZ+vxRidwhtsNT6XvHRy5F5Y15vNkqiG2T+TMVtnwgfsvngL3kEj/URlVPfN2Ca2Ylo1w7nAdQY79m7DZAOy/Wd/RYP4b3knxjK+nlpzjnxxRPWvxefmK41kLtFpxmuCPFvYvuUtoLcA/Ty8fEU1zd5VRuKOuKYzT81RIeCo6NqIRlZHm4p8RjnxijkXGh8wSYeivj4/g+nRZJCDa/LRQC4xtNhLmNE3wNM8dHQJgHapCEWZ2HAlVopgm9TIRf5PXLwRJJZ74CXvEhS90uYc1QIRUtMbuItCqFRpXbjYeyuEJO1O8ItU+XCQqJla+LXHR2bUKLcD8jDvVCUnOsUNrP9DT3pNPOr4sspSKhm2iMYlUJPigkuX2VbLB2tlTFbfZCTcwC8y2WVSr8oQpwkM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(86362001)(2906002)(2616005)(6506007)(6916009)(1076003)(66946007)(26005)(36756003)(6666004)(66556008)(6512007)(52116002)(38100700002)(83380400001)(38350700002)(8936002)(8676002)(5660300002)(508600001)(4326008)(6486002)(316002)(956004)(66476007)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Msmb5Vaht9DYDc1D8wF/Ur0Qqx5SjOHMnu1dupCOQGUAyzge7F3E11jhAJDw?=
 =?us-ascii?Q?mvEMcIa91eYaghENWsmNPnwZOQ0YYhC8b08JQ0uPEMvs/ZEcGGt4IV2EddId?=
 =?us-ascii?Q?Nacky4xSinzOyxYauP6xdxOfR1OnF7ZcfbfytH7iPciYvnvy4LJ+EDtmCqYS?=
 =?us-ascii?Q?ibNTncjeuyOOLzb7chEPFffAImncakIvoB2zYpt4EwLbluaT6knfd6dPf181?=
 =?us-ascii?Q?32uh1Yfl48qjbkPNtOnuZP2bDOqCxCfT5ym2fTNbV9LjJNKMxB6kOTQjJq7Y?=
 =?us-ascii?Q?8JDT70T2GiaGef1N1IApbhIGDc7TrC+oIrDeNTufsmU/t7wb+ILRBovg/wk3?=
 =?us-ascii?Q?52v9PcAQNWAgRF3wHTpLJhg0GnhWysdIdfma3D1MCjih2SuTftDJ8Ijr6DcL?=
 =?us-ascii?Q?168p8/tZKmw6mCZMEOxVL3CK9r0ycwi6AFh1ahSIDFiOMhvgmIz1bwl64jBz?=
 =?us-ascii?Q?p+O8bZjRDNZE/kD6DwHJKD3ZmKzQXBJ+ePLoRmIFRu18O0iiIQtLp3JM57JZ?=
 =?us-ascii?Q?spgDTewEuO3IH0DMBgLHRreeIq9VnswORSWAy7tXBsNBCa35mDpLYJ75sXkD?=
 =?us-ascii?Q?3mDef+cUCM3zGQyb9DCLvMxwPZ+8XYDjRkxts6tRdGdQh/BeVwYufEiVg7Ci?=
 =?us-ascii?Q?GLsJfOsTRwE7nMW2TWJS0MBHtn9XuVIk6W7VUaM8hNF3BFEwVPWjaXfUg6HN?=
 =?us-ascii?Q?PkNwZNfWFxlxSNkh6VwywoW2V3H/DrDdjxP0u+I4pklvVLf/jUeA5bRRLecw?=
 =?us-ascii?Q?r0lff4lXEMM4BlAVTP8xQkGiYwtCUGv00/M5Vq9e9J+L4AyZSsE5/WdwCcVs?=
 =?us-ascii?Q?FfNfw9/WTQOy4xQWgpyQIL/GznuNXQw0QU5hfDu5ZivxtUbKKhc56bfpnYYL?=
 =?us-ascii?Q?VeWeDENL8mgXG4jEWPabRIp7du2TYrlQ6GB93LliE+kh63UCUyPI0fKbtKM2?=
 =?us-ascii?Q?DVx/aTqXUQ0bqFLm7VfVP6Qxyfb8kYkLMSo6gi1mvBl3/tpW9TvGCl8pMy/O?=
 =?us-ascii?Q?rCHf9VqRxNj7KPmbj986l4oaFskSnsm0993VT+ZPViO9WmqHkk7KND4mKgYA?=
 =?us-ascii?Q?8ypduYBblAQUyyapp8kxKT+yuYbAm4JS/8dK/E9cZAy7CfiPjolBmMjvUZ0V?=
 =?us-ascii?Q?s6jbCDB1JpeMxhFKtQDRTBgByOKN0SIYIiEWdsZvhPiepF6YYJ5k8nNGNIyT?=
 =?us-ascii?Q?LZTDlVWOyPe6MzCwXi4q0BP6ugcn+1uGPV9xLGfXBcCBYSvF9zltunSD5jWB?=
 =?us-ascii?Q?s4p82Ubd35+8EQYvIKaf/NHyAwn1DNIWVzEb6wTZqrkp3Lm2wx2468hmYNje?=
 =?us-ascii?Q?uFsln9+xXB65wh4wtelqY1T2BqvRMPJSv3ch464a7x7bVYSAKzvlWO2njI+/?=
 =?us-ascii?Q?hr8XFvKTrn7pyg6vsHzFo6jGScVY+7VJJm7Xv+MlnzCReOZLLbtvlTbN/BSH?=
 =?us-ascii?Q?w9UYSINsmXv0uyyQXsa4YSqCtQQJ65RFaWR+jTgiMomBNdoo/ozqQLUQ56Ct?=
 =?us-ascii?Q?uwyULW/tgnyhB620+h+n+ahQmuHfH8qO0mBH7kWGs5ck8hUwaNY3Thio9otE?=
 =?us-ascii?Q?V10M/WIf4y98Z88wnjJa24r9UnCghCFRgtNAPyjBc6QI1IKKFHY4kbWHYM2n?=
 =?us-ascii?Q?K+9oD7Hzj2yFLSs54q3eJSNIjsAlbHp2LMIKkFT50SOBofr1vcB4+EbdJgYW?=
 =?us-ascii?Q?2kxkWYEhkJ1Jrpmjx5L5G3G8Two=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a94453e4-788a-4d52-16cb-08d9b69b2889
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 20:26:17.2356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ax04YpyCKa8/J5c6bMC8pauNiJPBOwaqLRZBqMjUCvCkZiyg9hIpj+tikPxVbfjNs8VgNdndwoMFWkli6ZjeM26IoKifa8UFXOHr8sAbRTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3841
Received-SPF: pass client-ip=40.107.15.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unfortunately not all filters use .file child as filtered child. Two
exclusions are mirror_top and commit_top. Happily they both are private
filters. Bad thing is that this inconsistency is observable through qmp
commands query-block / query-named-block-nodes. So, could we just
change mirror_top and commit_top to use file child as all other filter
driver is an open question. Probably, we could do that with some kind
of deprecation period, but how to warn users during it?

For now, let's just add a field so we can distinguish them in generic
code, it will be used in further commits.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h | 14 ++++++++++++++
 block/commit.c            |  1 +
 block/mirror.c            |  1 +
 3 files changed, 16 insertions(+)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index f4c75e8ba9..9c06f8816e 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -117,6 +117,20 @@ struct BlockDriver {
      * (And this filtered child must then be bs->file or bs->backing.)
      */
     bool is_filter;
+
+    /*
+     * Only make sense for filter drivers, for others must be false.
+     * If true, filtered child is bs->backing. Otherwise it's bs->file.
+     * Only two internal filters use bs->backing as filtered child and has this
+     * field set to true: mirror_top and commit_top.
+     *
+     * Never create any more such filters!
+     *
+     * TODO: imagine how to deprecate this behavior and make all filters work
+     * similarly using bs->file as filtered child.
+     */
+    bool filtered_child_is_backing;
+
     /*
      * Set to true if the BlockDriver is a format driver.  Format nodes
      * generally do not expect their children to be other format nodes
diff --git a/block/commit.c b/block/commit.c
index 10cc5ff451..23d60aebf4 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -237,6 +237,7 @@ static BlockDriver bdrv_commit_top = {
     .bdrv_child_perm            = bdrv_commit_top_child_perm,
 
     .is_filter                  = true,
+    .filtered_child_is_backing  = true,
 };
 
 void commit_start(const char *job_id, BlockDriverState *bs,
diff --git a/block/mirror.c b/block/mirror.c
index efec2c7674..22e2b7b110 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1587,6 +1587,7 @@ static BlockDriver bdrv_mirror_top = {
     .bdrv_child_perm            = bdrv_mirror_top_child_perm,
 
     .is_filter                  = true,
+    .filtered_child_is_backing  = true,
 };
 
 static BlockJob *mirror_start_job(
-- 
2.31.1


