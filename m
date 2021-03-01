Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 215D032829F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 16:36:43 +0100 (CET)
Received: from localhost ([::1]:52642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGkbC-0004tN-6G
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 10:36:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lGkZ8-0003vj-9C; Mon, 01 Mar 2021 10:34:34 -0500
Received: from mail-eopbgr700138.outbound.protection.outlook.com
 ([40.107.70.138]:44032 helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lGkZ5-000378-JO; Mon, 01 Mar 2021 10:34:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CI6V0DafQVaz+oH5gPgDIpAGK6a+ekvnzW/CSzJyZvD5mm8n514TKEFNdOOteQdaAkXHq5nV/pLf6VinzofbvOPWIag3gFoqQ5/8UaHGVCzUsJ7EQz8mO+tjPqD+zQZt61966ACGMHPLf/gS9jck8VI9Oi7ID/q2ZGvn+X3Op1JBpxe0Ymdehk5XVkgeql2RrWD8fB9xUje3vhhICzKiIZzgOI7DQEVqBPcen6QqQ0ptLY49ki7+1U4a/4vP4RMy8mmYEd1xwLngYP9/Z2v2jhWHiIVPPkrV/M7tcwsfhMqCl0VkhhdYdxfaO6t+sfDJQIVOzpZniDft/IiFxteYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkxnw4oHoLIRAoHDsriSNWJN0ZS+8O4DBAjogUsnlNA=;
 b=bYYzs2HCvD1/d7WpS7Z5pHEi486NYKGbJAi0OXrqIkPXab3O/hJNnU35eHEjjY4bQjDnfcQy8gObDPxPLHahAWP5Y0QFrfrX1okIPqqKLr80Pa7U/doBe8+UMT5rtkhUTYcGG3lIKFFLpl1JC1859kLRBhGOLK0GvHahAVSJmVMMGGkUX2967WxZQn/2Q2sFVitCRm6IP2CZLEBAJk4sh4tJb3fmecxWv492qivk66dLh8fF7yJiOs8jI8gVdHIOg4bMD2azY0LOrhMh7ORr/6mIbNVTXdCExJOa42rbaM8Ewcqt1r3uGLjk52Ez1X8du4stuPFT8Kw3VxJX8ePHuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkxnw4oHoLIRAoHDsriSNWJN0ZS+8O4DBAjogUsnlNA=;
 b=OdQfEiBl7YR9/IB4cpMyGyTQpdT+M8IpirwHJ29mM0yS24KYJNIS/VM+HQj2H+JlyAfoMWzDff30WwkyfFKoxCErqCDdCqviBQz9vSWPc0XEmVilyRA33j5YMS5O4s8wgS1OqW+ofiztxXedxE950aG2bXwG0QPBgxqvMLWQ9dM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from DM6PR03MB3865.namprd03.prod.outlook.com (2603:10b6:5:47::31) by
 DM6PR03MB4266.namprd03.prod.outlook.com (2603:10b6:5:c::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.23; Mon, 1 Mar 2021 15:34:21 +0000
Received: from DM6PR03MB3865.namprd03.prod.outlook.com
 ([fe80::3d08:f80f:7252:a948]) by DM6PR03MB3865.namprd03.prod.outlook.com
 ([fe80::3d08:f80f:7252:a948%4]) with mapi id 15.20.3868.036; Mon, 1 Mar 2021
 15:34:21 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] pcnet: switch to use qemu_receive_packet() for loopback
Date: Mon,  1 Mar 2021 10:33:34 -0500
Message-Id: <20210301153334.81021-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210301073947.39451-1-jasowang@redhat.com>
References: <20210301073947.39451-1-jasowang@redhat.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR18CA0002.namprd18.prod.outlook.com
 (2603:10b6:208:23c::7) To DM6PR03MB3865.namprd03.prod.outlook.com
 (2603:10b6:5:47::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR18CA0002.namprd18.prod.outlook.com (2603:10b6:208:23c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 15:34:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d690e89-a9fa-4f66-cf0b-08d8dcc77b8b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4266:
X-MS-Exchange-MinimumUrlDomainAge: launchpad.net#6244
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB42662709962DC48337B81823BA9A9@DM6PR03MB4266.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:120;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3A8nzpUiwbUmsgs+mMjY7PdPp6LLzkiYCsSggQaqnW+bgqIMrW5PVG3wXOZ5QC6UypwZMS1tBF7TT7M65DFa8wT33t/Mgd+24Tvgrf0QIgSVewP94g7i5GdYbn/g+58rlUFn4JR/uFKaQWL3kbo98FTqE0Mg121ATnrvxhiYeuwBW86BEXQvx13/lSV1eDf/7bA16gzUb4GJ72p12PWWMtOHguj2o5R4qukPZ7s2GWa7hcAMvCx/yoMCZyOwUtEEBV1w3R4oyDjqTDnUJor9OC7oC76E7MTlvGPhPloGYNj39DZIAVdgiKCSL2viFdovFoM9A1jaN+d0wPHgvFFbvsupXfALbYSFR3X1nUpE0GkeTGyq0rKB1ezE+W3cxRQOM+2DAGizOnHdFpRKFl0GA7Cff5KU37nHAqfeoym52XmGn7ozT5gkOVGgpyY+139w86NF+iivoOeDs/ke2jr5hwm4HLGd98jCN/cENVNHYubanKPSrqh5Pcd9BfC9JfjkH5OF/7zMef4xYkgPuotSPu19b7JNML7fMnpgtS5cYgL7t4j8qPD1gPusN3BCEIIv3euh7OGbAwhHAwSf6QgPdzieuwWvCdk9N4x3xmj7+zw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB3865.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(186003)(86362001)(6486002)(26005)(16526019)(1076003)(6512007)(6916009)(4326008)(5660300002)(36756003)(6506007)(2906002)(966005)(52116002)(478600001)(75432002)(2616005)(8936002)(8676002)(66476007)(66946007)(66556008)(4744005)(786003)(6666004)(316002)(83380400001)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?B8XJgWXcQKOfu9+mAq4kZg1OYjkDDAIc0W7b+x/PBjN1exsX2wTmJWZ7TGmF?=
 =?us-ascii?Q?jyKQjoH0p44sRktmz2z0hdZ5oNGBVYdZf/+sErWz1TI2jZ71BFs9GctDPkAE?=
 =?us-ascii?Q?Qyg+3mW934KOYJthi+cU8pgs6+p8Np1CqX5cdGOWBuQf7ukQRHOPSsf3+UIq?=
 =?us-ascii?Q?sy4UOMcLNXCCpd+J+XXLyMbeSZ89RgXPlMer7hTk+jzOnEayj90GIBGwosAz?=
 =?us-ascii?Q?uqdbvtU8P8rWrOwAo8Gf0tyJQvXmfptwVwbh4ravurZzxGoiw4j22PtERIG2?=
 =?us-ascii?Q?/JRWWhIToUXQUmsekF0ZtOpcqtu5jLWx204aF+QjbSHQVNelkLWLchTylJ01?=
 =?us-ascii?Q?UWC3uDAW40+NrqqzxUoEtE6biYpNbJhHAcKvIVIuh1spN+60bPBadxrTqkoV?=
 =?us-ascii?Q?b9kheCygOMdeWIOLOMkPWbBCEK435xkpZVuSCglv3MeMzfP6JUs65lVBOgbe?=
 =?us-ascii?Q?7aBA+SFHnxDloCmlEkp4se3wdT7wMCK+7bvWZIaTVZsvLXPAN/S1C5eIKSqb?=
 =?us-ascii?Q?LhuoRbH2bHaCbM2/Hr+gcH9PZRzoFZPXJfAbOR30JbeKG5rqvaC9NmbWP5ac?=
 =?us-ascii?Q?PEEayeC3jra2nRDo88cc5qXGd8sP26nxF3dGf6r0ftDip63WvV6yW0Da5MXF?=
 =?us-ascii?Q?fUe4tqK5hk3V7cDwKWiwAbMbmD1wGAaJQlXROY3coTZluZYg8CKl2ud7XAlC?=
 =?us-ascii?Q?Mhzc4vF9M34JXmvm0SKCLSwknhWsN5hu7S4QoYogfgrXoxCzzTtus+eVcq3F?=
 =?us-ascii?Q?wFApQVYCWKETfF/ji8i5iTIqXZ1rMxoVHELwei0aFYoV9CzqDkROpwDzqT6c?=
 =?us-ascii?Q?gh+Ka8Zm182hTtyh74tK9ON8R3Phrdo8klfiyPqL/stiQT70WQaXpt3IjWU7?=
 =?us-ascii?Q?o5bmZQIGrwwrPnktDpVix/evaD3xSoze5EeqgH/FQW3hrwxS8DJN8LOe+Frg?=
 =?us-ascii?Q?hjlihuB2uWouSblk6TnA9AnF/YcbqX0G2dlRBOZ9Paz8Sj1e2ZmGAW34NVTV?=
 =?us-ascii?Q?OpKfFAtKE2+Ppmdwh9BEuqWqTuJoTTJaj/fKnD8VM27ZH0wIl8GjBcSX3z/m?=
 =?us-ascii?Q?Pv4BDy5DKnVa+vPxOhPkyIDP4uMKueRStdDFYPwjVo0vziUioysUiucDKF8F?=
 =?us-ascii?Q?LSqeITyZPm9HGzv1TgCAoEF7o1doCeDOLjSkBFK2sn6Lwp18bLFwtHVTpNgw?=
 =?us-ascii?Q?aDHJKEM50vYZw6DdMbzoHhPvwVKt4KPGwdmeh1fgo3To90oP2EoSlnsATgZF?=
 =?us-ascii?Q?rqeTgplCdzNfS8NLDZGpocOVkiWM+mXFD2jV9q/0a+BaUd3NDFLybiOJvrR7?=
 =?us-ascii?Q?hg85QIjUQfurSZyTAvUR89GT?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d690e89-a9fa-4f66-cf0b-08d8dcc77b8b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB3865.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 15:34:20.9014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E8tEABoDHSojPodnqqNCp/OKm8dTgDypvw4Xt7bNJo+97I7M+P3Mb1R97fLyALps
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4266
Received-SPF: pass client-ip=40.107.70.138; envelope-from=alxndr@bu.edu;
 helo=NAM04-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alxndr@bu.edu, Jason Wang <jasowang@redhat.com>, philmd@redhat.com,
 qemu-security@nongnu.org, ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch switches to use qemu_receive_packet() which can detect
reentrancy and return early.

Buglink: https://bugs.launchpad.net/qemu/+bug/1917085
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---

Here's another one, that looks like the same issue.
-Alex

 hw/net/pcnet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
index f3f18d8598..dcd3fc4948 100644
--- a/hw/net/pcnet.c
+++ b/hw/net/pcnet.c
@@ -1250,7 +1250,7 @@ txagain:
             if (BCR_SWSTYLE(s) == 1)
                 add_crc = !GET_FIELD(tmd.status, TMDS, NOFCS);
             s->looptest = add_crc ? PCNET_LOOPTEST_CRC : PCNET_LOOPTEST_NOCRC;
-            pcnet_receive(qemu_get_queue(s->nic), s->buffer, s->xmit_pos);
+            qemu_receive_packet(qemu_get_queue(s->nic), s->buffer, s->xmit_pos);
             s->looptest = 0;
         } else {
             if (s->nic) {
-- 
2.28.0


