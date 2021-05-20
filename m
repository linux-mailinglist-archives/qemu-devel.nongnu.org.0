Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7159838B1CA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:32:46 +0200 (CEST)
Received: from localhost ([::1]:41764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjjB-0000aX-5r
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZS-0005Yf-Hj; Thu, 20 May 2021 10:22:42 -0400
Received: from mail-vi1eur05on2114.outbound.protection.outlook.com
 ([40.107.21.114]:6785 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZQ-0005ev-3J; Thu, 20 May 2021 10:22:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czpm5TlWumaRXaoXiAGrf97A+NmDaa4wP9/JmnVeDZfRxc27ppCROMScWe+82lYFFFtcViMyywH4FRCx0Nq/LYI3yuKwZB7g02w+/+izLwWIU/w+bEyvWW2svILfTDq2shWnr0ghXbQqjCT4aNPIqFrmacA5gnmVPMHB0pK4JQ1r+z4qkV4sammnx2jyCd8Kfq1O5Hi87GoZR6vDZ6dpGBVFqZ70YiEo50HLO0sq4fLlUgtQ69f24/Taf4mGIT3TActyrRjGCPoCZQCY2K6Y1FpALTYinCfv/yul1mrhRKEctTqABDys3fWA/5uHJSpsSHaE7sItzEo8QC2bEZDbCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vjw2x0AL6IcxYWcZQRo8Yg0F/zB3SZ+NFGL+4T8bkhA=;
 b=LWNhF2lHbTenZHiV+y6i80lmeUaX20iAstXMeOATRLPHPkNUH80WriOcRSqrgEEVTV9lIvf5nIl+XFz8LQEHlPZK5CCFZS8JIBUwBm66GydT1GoXy75aGImHm7nOtpKP7nsCdNC4zSPhW/EgrHzV+b+mb5e+DyusOF/0u6cw/lWhhdVt/X9a4zRe8v0YiWuvHcqIQL5zLN7NNO4Dkk5hBHS99BLeQ5OJKsvR+3DkO011y1rzODw5YWtp2MLqnCeAQy3XINkQSuqBbJMxpFFnMmrno0AGHYtqbiHK1JDKgrjvXu7kc3mdkP8wksVx76F6/e1nx2jTsCLgkz1+6IWFqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vjw2x0AL6IcxYWcZQRo8Yg0F/zB3SZ+NFGL+4T8bkhA=;
 b=hsBngYXupzavkPqE0ZVxsUbDMQALN5uobZHKSOse5rFr5AGOWw8efERLPJ6i38SsLxrdJ5XnlUl3gkmrnxNrCKw7IpbeHaNzQSAbTNx2s4nDx/SXTZ/UWup85lvnnl3YtJ7ZdRIhEn2lt+P//a23msljT5fS0jkV8PTDf2vAAPk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB7009.eurprd08.prod.outlook.com (2603:10a6:20b:34c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 14:22:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 04/33] block: introduce blk_replace_bs
Date: Thu, 20 May 2021 17:21:36 +0300
Message-Id: <20210520142205.607501-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86338855-0557-4bf2-1bed-08d91b9ab253
X-MS-TrafficTypeDiagnostic: AS8PR08MB7009:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB70095CC9980D0BEFA1C1864BC12A9@AS8PR08MB7009.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cu347g+CeDF2H1jBW0mFYrvKWcjiEdXLRCMiCLJLuoSSqOK8sAheX81OhnWqOLtCXB3la0sN/1DxwvutKiRBFA8fAb2NSQFRTKI4qp57dKvJbNYpNdHz76uvCuez3h1oU+y4Cx8v63Cdv9iz3LB9V0FSr3Fgtma3ph6wk3Xkda6UC3WXolH5XyRdna/fOrknpHxXsJ5xevMB/CN8B0ErKXkZgZuo9n45UVwhfW30JJhsQTdTTijlrykmGHSyVv09M6cyOWVm3+Zcg9uVkickJz8eGza+qKU4hvc3Vv08Kd4hf5+9ElwEjuQCTJkrE6ifETIGnMbQAp25d+TU4BVmSgkopMzf36kMIiFbcGRXx454TsBtX11QvHee5S1iUaHBJ6l4OFvwT2HbpwXOsA/mvrwix4V5jzhTEpfTwWYSj58aw+d83h8aj0C5Ur99Cs/TEk4Yhlgv90rXTpE0OlvoDZXkT/SBKKkKI5AMOF7SvmVw2MiD8JI+rHS/BaSMFHWLahDPbtb8zHhVhjSmZ7SIPD9C9hFyI7DISs1b9NX+Z10WE8R89fV/LclYN2nQnCz2JaaL7sSCuqjYZr9WOiVzR3E/4oBayloxI2csLqScP0H8wrHDBO3nG50gc5duFN76lgk98fRxpAia0uSada6TAGe6RF6YzedPFg3nKvh/dAyELvdn6SOlfVd9QU9T4bll
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39840400004)(376002)(346002)(366004)(38100700002)(38350700002)(478600001)(86362001)(6916009)(6486002)(36756003)(83380400001)(107886003)(8676002)(186003)(6666004)(4326008)(16526019)(316002)(1076003)(5660300002)(8936002)(26005)(6506007)(7416002)(66556008)(66476007)(66946007)(2906002)(956004)(2616005)(6512007)(52116002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DTCT01nVMMgATQUwzaY2eybokIvIQteH+nowOgaw54EPEfuPf3rynxqyqCC8?=
 =?us-ascii?Q?I1Ap4ShbmQK3b11jrwmz956gdGwXQ+iA0Es0WKkJON/Bs6oOkNKbU1IhXRlv?=
 =?us-ascii?Q?/jNzB8hLckXedjhq6Sc0gemIa/i12rZHF6KnPPgu8JBPdWfQvMJTSbhAlTXG?=
 =?us-ascii?Q?JOL81RB8/NGYTx0jt4GjB0t23vsF8ErFpOOGTqbAl63WMcOJYGnar+43975/?=
 =?us-ascii?Q?hHzbT8rNs+67WPVHTGSKFkevHHJiaEc8SFvI4sKyYas+mG/jO72Xvkg0zePO?=
 =?us-ascii?Q?sEsnw0qH63vGFR3vVs5JP4Ab3orLgS6gBUMnqw9n+XKLi7R7t50k+EIagXA2?=
 =?us-ascii?Q?S96WfJ1eakY/l6zwshfr3h9BpHa9xM4XkiSRSZquwA6BbDy6eWRnXZuCR32P?=
 =?us-ascii?Q?/XdOYr3weGwqluF2Lp5Ws730+mZkc4LHvdHp2HVqUJ7LND+1mD6ecOmjwskr?=
 =?us-ascii?Q?roZw/9oRMiHfyHaFXw0LaBLezv3cwfXkUvdL049Zbmrq6njnTcbunZFSpXJd?=
 =?us-ascii?Q?bcN0WbO1T7L0W+nqqpRcNZUldGRlDLi7lW4LI8HasX/+JV5IC3Qqo1OdZNXV?=
 =?us-ascii?Q?YUezWZ6II6ojgt1otpujpLu8e5AwTqB/FE2MddjT/Xi6P0tPLvHB8DGwKCQw?=
 =?us-ascii?Q?3ghCE/ScRwo0Pp87vj44/5NbFk3W2UD9traUWzkotQ2zg7A42zeI/PKjjgcG?=
 =?us-ascii?Q?U9Qxte4HteDuBHJfWNpnGFHYSJpMu53JN29wWey0/eTi+xUrJz5ber4z9Y3e?=
 =?us-ascii?Q?kVNOtV7veNbGj9Cy2ANvDyMIF2dZB1EbghzQZwszxk9c1AtPzymBz/C1CQ0t?=
 =?us-ascii?Q?B+K/YxxKp9/Yw/ZaHYl/by7uZD9wzReAuqKqvGbtJ3dgg8E2DtW+iS64g1s8?=
 =?us-ascii?Q?Mqzgb5sU/+XIVRmFYNU7B5ueW1EdgQ1bRwFL84XtcI+PW7cBJVfsJtyox2ql?=
 =?us-ascii?Q?FDmrgagC2eNN7AZssqfGxFgqP/cvr4rNzQX+Yp7VihmrpEP6UZFhwrv0bp76?=
 =?us-ascii?Q?BnxBPMgOAECl8n6SAnEE/IenVcsgjy3yed562e+hDXxUtNuu3lQmK6JxTAaC?=
 =?us-ascii?Q?63xWN8HIeiOcHF92trJaavOAwoQd/rMa6hbUsSYEaY7W8vbTxJ9dOJlMaRmp?=
 =?us-ascii?Q?HHZHZaXTIvxcORBxj5UDoiHi2yFODpeGqCa+ypsScXrKLaU5aC4l4y1j1v3i?=
 =?us-ascii?Q?tAI2zUGgem3G3yhx2kJrx3SM90PFYVPBucIbXTPgEqdQa6H8dFm2Y7XUFTFC?=
 =?us-ascii?Q?su1nNgKQVOn8tg//MTXBeQcbl8XLgMsHB2vs5//2RnkjnDDACKsJAkFVM6cb?=
 =?us-ascii?Q?jkKRLVkqO37AmjHr2eZOf8Ro?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86338855-0557-4bf2-1bed-08d91b9ab253
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:28.1555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vd0i3+jBqOL9ssL+kFBst38XiEsjdKdF1OXk927mVLWl++gUQi6phhQmeZF1YZGyefhQ8OVvGCtFHMU5pq01u13B08nVlBtcODhviBQ7Zys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7009
Received-SPF: pass client-ip=40.107.21.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add function to change bs inside blk.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/sysemu/block-backend.h | 1 +
 block/block-backend.c          | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 880e903293..aec05ef0a0 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -98,6 +98,7 @@ BlockBackend *blk_by_public(BlockBackendPublic *public);
 BlockDriverState *blk_bs(BlockBackend *blk);
 void blk_remove_bs(BlockBackend *blk);
 int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp);
+int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp);
 bool bdrv_has_blk(BlockDriverState *bs);
 bool bdrv_is_root_node(BlockDriverState *bs);
 int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
diff --git a/block/block-backend.c b/block/block-backend.c
index de5496af66..b1abc6f3e6 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -870,6 +870,14 @@ int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
     return 0;
 }
 
+/*
+ * Change BlockDriverState associated with @blk.
+ */
+int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp)
+{
+    return bdrv_replace_child_bs(blk->root, new_bs, errp);
+}
+
 /*
  * Sets the permission bitmasks that the user of the BlockBackend needs.
  */
-- 
2.29.2


