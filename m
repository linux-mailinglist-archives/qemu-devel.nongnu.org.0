Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7418140205D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 21:19:15 +0200 (CEST)
Received: from localhost ([::1]:50338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNK9C-0005JE-Hb
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 15:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxt-0005dl-Pq; Mon, 06 Sep 2021 15:07:33 -0400
Received: from mail-eopbgr80094.outbound.protection.outlook.com
 ([40.107.8.94]:32928 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxq-0002Fk-9e; Mon, 06 Sep 2021 15:07:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F10w5x/MtjbX1tYz+exga8fw+x8mkLwpTgawSoA77uda6TGiDE2sSBdydArwBSsNMkHCkfw9dwz8X88XMRUfDQa5ctHPBVsuc2+hae4IYj8AFgS89tp2/MiESmb8z2a0Sq8fgP9x6LNUH+YOwYlsNkAIvHA7juLOCdyA1ysw4Hlu21BWfLM12OEAekXnbEFGSr6gfMCKFpmiwrfD6K/0Wb70ADwxYcdHCESYTmIf1p97D/wsojsKCrFyEo6u810cqnRGujy4No0diC6D7VNpJU2QiqyFtBy+UYGIz+QENflUYb3E6x52/ixvHKV62MI8iII9U4oyEagDhgVzUfYS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=quuh71NJ1RhvlnxDiXWRJepUFiqTf6/wjjdKCEvqNCk=;
 b=Etsytc21CXQGucGTjfbbtsYSRs2xl9hRFJqQBX5mEB2SgH3sbwzYJDU7/rfsiuvoD6bvzaaGoHcyi4Qf/SBcSx03XuieLdzjW03cuUdfUNgoCg3a/DSyvN3/BsCG7jUTMtf+tpAH2j2kAQT+WQySmhN2yRKuIq80N3ZVD99NeBEYaPKl4TphbHWfgJJ2o+WbkLeXLvAaOKfDDJuOUtBNZ57q+iIAqi8TQ7cUZpn39lSfZt3POC0yFvDBhf+WKN2iGDQFyml/vGQ04Mb+rdRsfLQVV7KPzGW+CPOVHr7W4ghQYLeVI11jLCJAj/VIkihQZbB4UX/k0hlCfKZ9O/H+bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quuh71NJ1RhvlnxDiXWRJepUFiqTf6/wjjdKCEvqNCk=;
 b=lGVmdNXOOpStbvXfbEwCzS5s4T6PSJ9C9KtYbfZYRvLWtYTLtmqeNcq8GwheEQingTt9kVeR0DsuqC3jOCfJPkLy6AYXi5M2ehmljdpKOaoBQUYVVxHJwBvumJOTLvXvewq5Y0atGzr8AqxDFO9yn2mj8Gi39j1hS5HiABwDxqA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4849.eurprd08.prod.outlook.com (2603:10a6:20b:c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Mon, 6 Sep
 2021 19:07:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 19:07:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com,
 den@openvz.org
Subject: [PATCH v3 8/9] iotests.py: add qemu_io_popen()
Date: Mon,  6 Sep 2021 22:06:53 +0300
Message-Id: <20210906190654.183421-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210906190654.183421-1-vsementsov@virtuozzo.com>
References: <20210906190654.183421-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0302.eurprd05.prod.outlook.com
 (2603:10a6:7:93::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0302.eurprd05.prod.outlook.com (2603:10a6:7:93::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Mon, 6 Sep 2021 19:07:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6eddb842-6bbe-4dee-564f-08d971698b88
X-MS-TrafficTypeDiagnostic: AM6PR08MB4849:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4849382A1B211E343AE7339EC1D29@AM6PR08MB4849.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:317;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P8JSCrrA87FhDhgilI6FkezKTqMwZZ6o/JbZwAG4lNSkBSs8x5oSsd3wCpxKze7n56fYgPc+RQwRd2z/EDPj62rnyw8fS+auR5SdSUwO5l4WAbF1NDVd6EpxH1CCm5p75cw48rrpBKYIqd4rJlQcMpvAx1t+3F0ZjyuCh0DKaUWL+JJXUkdLVA8uG58Yt83YmIM6bN68hT6E6HY8Q9V0Vz9pWx98BTnr915iAyZd+Jfgat37mO08mEetPaQxO8yN782XLjwig5TbcGxveqyhUXPdaVodYFQYHh43+qYv8sOJAxGdFn2/ZoBpcZCA96kgVPtxDcXnAC2kQ2h2pY8Y2DDFEkCXfITBG9nus7cb6v64Ov5JKXrT54x4vo2ny6chS2wSIn95jD2aCI3raAIgV49JwQf7BXhIzHpLHiVaebYYkLpE08IuCVcPQ4C1Rk7yo48IE3BmPt+6aTxKwgtYBnnjrBBBaI2bIenLRVsAOXsus/+fqiflfe80tk9prbZUuD/KME0r1nCgk8naJYpbEBiLOnSGDrE8iKV6SwYq0gNSGGfZIh9CsmHPbwbHIA9SeBystuG/TN+G4gZhqicn678Zz3d5lRBhfEP+mHNno2qVCV7cUhVhQURUoUeWZ3SZfbdqB3fqzqECXeik5NgBuMU+17Uy+jprwWett71rbxVsCv6sp5X8rVr/0KBTNaxBij6bGsulD7yqEDDociMlIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(346002)(366004)(396003)(136003)(66476007)(66556008)(38350700002)(478600001)(26005)(66946007)(8676002)(5660300002)(1076003)(4744005)(186003)(38100700002)(52116002)(2616005)(4326008)(8936002)(36756003)(107886003)(6506007)(86362001)(6666004)(956004)(6512007)(316002)(6486002)(2906002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vJ//8pMNlcr0Om9WKUkuNTNtlD/0Xcj067g5BxK/qxEdOtm8Gmg8AFZcMoQF?=
 =?us-ascii?Q?X2l+WF02ws+5Fc50uXdQfiHnL4XoFL3Ql9BhFOXhsCaTnF4oYRryL/Wp276U?=
 =?us-ascii?Q?mS5cSbE0lyFeHe085jqp/YlaDb+RS+3DIzKte4sQZRJ8a/t5ZPNv3t1mvH+a?=
 =?us-ascii?Q?ShPUuykA++GfpNj2wmLBt60a507Z9ZQZ3KltzuzapENlk2epkXZ6d1FwiXp+?=
 =?us-ascii?Q?NO10nsEXvRVOvu7WEfXDJlakuLBqY/13t7bBbhrf2EXGq1JVfcl0SS5okpu/?=
 =?us-ascii?Q?Xo8fZP43asmzWH+3FfEcvRXmlwYCyEMx9eSP8d5+yl8yP0zb0nbiUZPQ8lAg?=
 =?us-ascii?Q?BYnkQEzPzs4AJ9Ffw45+142I92tXV8VFHCjEVGqomzEExfdLvk9IPSNiburB?=
 =?us-ascii?Q?kSjp3SuvrFstmhfi08Bfcxh9iYeSy3+D4OcO23RPEIRo5QsBdJrdoha7oVz6?=
 =?us-ascii?Q?3YEVtVPlDZrC0oAdMYCrjnndBJu6+PhxQT23KMcfTnu3AgeL2Sj1rxxtV4u6?=
 =?us-ascii?Q?MJ8fg4LgkmCs5DLT+8mGaJ4lWAsjZV3mhGY0BZ3Xs5j7YGw1L482UE4ylvvI?=
 =?us-ascii?Q?ctOoGjMH7okctsxF/IiAtyLW01vzo+FKXUYymFLB3j494lF3rPR+xMBeJtwQ?=
 =?us-ascii?Q?TSz7JPzE878MGyWqoH9gBIASrWeViuxFklOnBvmPUYGt2JA3UFmtGmCAz80y?=
 =?us-ascii?Q?5otwHTB1zmjei9ThH3J4LpTvckHHBTZ38PGUXiorVLw/V8/136M3EBieIPTc?=
 =?us-ascii?Q?GSfx/LgjkgFla0EbxiGU0cLaWvj1dbrh3A+tVxAzT+NKQcVOhXohJng+V1AH?=
 =?us-ascii?Q?/X+07bmLOAYu8yqb9fFyO4DlZqWnDIT1EjLzKtiDf+NM5cgu93Kzaqc91k8v?=
 =?us-ascii?Q?YxnzonDjq394L7jfwxFK69s/YbTavuM1jrE4XbilpUCZqZamaa0Q2zCzHv0K?=
 =?us-ascii?Q?3RNC3gvGNmbi8an+mFEEqhL2vKphtANJ3tSAHyg1MlmVrxxS5fKe4xDC0YcZ?=
 =?us-ascii?Q?TuZtgOx9HRpoNzcBsTOEsBDgDTX7ShR5Zqo82NyfE2QFHimilaYE+K9anvV/?=
 =?us-ascii?Q?6/Fbft9pRrU8SCe/88harInvpFB79oQKNFktJ4xX7RCLp4YfaUFcBu4g/0QB?=
 =?us-ascii?Q?jKTo5LczWMb5tosTALGsGmVtcYm2bZquzjV59VxBzb3f8EJq9E6b+mpiF+D/?=
 =?us-ascii?Q?YG+tLo7g+uyMy1vWdPoPT9nvVtXBOOUy04TncpOMirOoPQ0ecg3lwVReeYUE?=
 =?us-ascii?Q?rhTxGZtD9UY31LXVxIkoqXwR7T8UJ4RrKJRHkSlyUhqT7l4E0ihxOXNQi/e9?=
 =?us-ascii?Q?xw/Qc+5gWXU5fYbnPDqTpZuV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eddb842-6bbe-4dee-564f-08d971698b88
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 19:07:17.7482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBwea2e0Vku63iqK5ol901WLkNrIcDW3TuY7hjlRD6u94GFxZP18rGUTrWAZob2CDQgJC9/dQoZ8tq6MEgnPw9ruw2v36934jCMi64OUI0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4849
Received-SPF: pass client-ip=40.107.8.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Add qemu-io Popen constructor wrapper. To be used in the following new
test commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 3b7b57489a..be53c8d5ec 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -216,6 +216,10 @@ def qemu_io_wrap_args(args: Sequence[str]):
         return qemu_io_args + list(args)
 
 
+def qemu_io_popen(*args):
+    return qemu_tool_popen('qemu-io', qemu_io_wrap_args(args))
+
+
 def qemu_io(*args):
     '''Run qemu-io and return the stdout data'''
     return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))[0]
-- 
2.29.2


