Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A3F3A2952
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:26:19 +0200 (CEST)
Received: from localhost ([::1]:59554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHtC-0007oV-4r
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcs-00064n-GO; Thu, 10 Jun 2021 06:09:26 -0400
Received: from mail-eopbgr10092.outbound.protection.outlook.com
 ([40.107.1.92]:32769 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcp-0005DU-Hh; Thu, 10 Jun 2021 06:09:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hudbfXomrcBzsIuRn56lNG2nucwFIfc5lKs2oFBYqgMVpVowIPHLQBk3kQnx8hRD36q/xSgd2xZO5muom5P6qVURcxulXhV0TTcAodahUsm/UIgEbzTJVQkVNhiVCyqfZ/WJxTLrk4/2fjSvRr6Orop1t6GRuK9ghm5X4gVSogew2WwxtY1Z845vHi3fTJPqDsP6mPnRJMcU/BqfGvLbFqidm9SW3anjeeXViGTFF2uS8sthprBeFSg9DweKjkxHuWRSQYroyRBNeS8D6/EzPpY9JogCESwM3bU9ZreMTupIzQOcVSwlewx5c0a5+Mpq0C7BxQL+pYkUAIO+yxNJug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StLfyw2ZLxmj78mUEIEo+0knD7hqrcH76s+XWWHIvuE=;
 b=R1LRMhinSKERR88Q/UIXeA00ejf2KelROhvTa9vWn71UjMhE4gQwr0Yuza5wUVDcA5hE2AvhyzYOuRSZDNF3HeYVhwKpvJbaAA8+k8dZElooxvLmji0Ukm+NsziUiryjdiQ5iQ0f64F87A5g4xxVMYjE/lSDeyTRP51FMCRD0mtPuLUALwP4OrPw/1kP9oTBy2xE3S9cwwPCP/ymsi6TI7rySouvHM2Qeiml5wSbCVmJj3N/lFOZJpTt5UoHdlhnIRYyrUUSWFY+KT1LL7yHIAjHKBVvIdHEg3TVVuuIDk3W5OQxRxNUufq5getA2MxnrZGThoONb98fCqCh7yLkqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StLfyw2ZLxmj78mUEIEo+0knD7hqrcH76s+XWWHIvuE=;
 b=IN5xhKNpIoZVUFUfPD7zuNzqLkO2dOFz6Upx+bri3qgqiJBziLXpctV6DGtJqROvQFyX0yh7QUKN5QXVbEKc6B62OOBomVP7plRDL/1QABLakXJWxw8GIR4cv13ZGXTVsTa1YgpE2tAmp5t3QrQMrb6W/rZMNx1/mOHH6jTVfQg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6806.eurprd08.prod.outlook.com (2603:10a6:20b:39b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 10 Jun
 2021 10:09:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v4 27/32] block-coroutine-wrapper: allow non bdrv_ prefix
Date: Thu, 10 Jun 2021 13:07:57 +0300
Message-Id: <20210610100802.5888-28-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610100802.5888-1-vsementsov@virtuozzo.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:09:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42a4f36f-0fcf-4aec-ea63-08d92bf7ce4b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6806:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB68069909D42B43A40C717AC6C1359@AS8PR08MB6806.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ff85GaT6MewkcPWJv5h/AYIglmnul4rzpw+7As3KKpofVPQVmZt3bKKan4sDdSs/C27ROxB2pqd1t8mWpKtDE9z4O0H6adoD3wgt0udafBjXgNgUvbw2AARunlrOzXGEXTxVdmxg+NMNhAA/j+yBPDJIIZafcr6PdFVyro4Oy0p4E3ST3eAUua1DOn7JfVLUcsxgOsX8ZToq+r5c/9OJl+ZSD2PoDK3M3Zad735JILWDCLUXykdyQEdLx5T9WpBk0DjTqax+KEbg+D6DyKuE3gkBQzQlpD/s1qgDZjFJXAKkCXeWTRp8yl2Fw7n0UPIHrVzTp28dtT3vbP5cWFFTB99BrNPIsXsX3xrZpxgOPv7u/SV5ur9QK2+I6r9QcptUk+39qnxWSgpkjUQMjsXaUNsHeDfoinpysulrMuILBjTSVlmI9+aicMGLqrBy/oKDFOZRnrfZN6mWNOu1D/tuCIsJcsp4ttuLjTzeQNKlfuQKO9Xmjd7PHiggJl+mGKaVxM7buQ7dVrSCwYRW2gQpKBhhGE2Z5t8kuq8Xkjl6wlVczpp8rmHb19Aq8dV9BurTnkOKSK3B01lHGuowtmvhLaHqlkXHyaUl8NXfKfje1HK5LoXOC3xRXwlygm5bZ/RhxGw3gA2i8oEYVEXVyGHUlnnZQhoLgZ/auM9aUHAcDNSPtIw9st51ptJahVvn/+PL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39830400003)(376002)(396003)(346002)(2616005)(2906002)(316002)(6512007)(5660300002)(8676002)(1076003)(8936002)(956004)(6506007)(54906003)(86362001)(66556008)(38350700002)(16526019)(186003)(66476007)(478600001)(6486002)(6666004)(4326008)(38100700002)(26005)(66946007)(6916009)(52116002)(83380400001)(36756003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?F12YpOlCjT1g+kRvt1HWeVYpRl9xnU8mm1i1tgupKQVKZIvt1FAOL4DhteMr?=
 =?us-ascii?Q?6NRBR7ETQTx31SXnGRXw80f+TbvZiKIDZfLQeWMKO8J3l3NRCYKzInFR5nrz?=
 =?us-ascii?Q?ObZ+4vcwvQCeDiD7ivNg6fSJl9cho4G47Xp1+9z4sAdkbi+CJllNT7QkqxRI?=
 =?us-ascii?Q?QMCRT0tSl1NDdjRRVqBtkegUdPrXpnHlPqUFaWFNXUT8gwqll74cgTZmtaIa?=
 =?us-ascii?Q?d11htPawKaHFH6p6XgGvgkQJ/rm9BLLY2PTMfEIPC0s5z4I3S+CXFn3B2E4b?=
 =?us-ascii?Q?504IZde+QEX6UfacK781bIX1pGesml8q57AahbRSjHZbj1pMhe+6PIe090iL?=
 =?us-ascii?Q?CcLyV0fm59id5rSFJRF/UxTKZaFZJzsAuuOFyADa0OOXQQuosfUBcbFld1g7?=
 =?us-ascii?Q?/gqkB4DalCTnUyRP40TukR0Uaeo8DPD/ECD14Hhoe/ULgKDEVnkgVys2wjFM?=
 =?us-ascii?Q?cNRHYNbu7gzyn/wqSaSLVVvP6PVXRFuiMrAO3KnN+vQ81BayN61pVWXcHIZk?=
 =?us-ascii?Q?uVRURAc3rdD0lT9Ka2c7lYqbA7sgIUoAWyddMD+2QsPLZggWDFxSUhsSR1cF?=
 =?us-ascii?Q?ORrr2wLPGX3i+LZEZD08ue0d4eKIZjZqhWDj0B97FTvnLdPYU8CaJS+qYopa?=
 =?us-ascii?Q?GJGZDhgzuMWPe+H7k2gz1EYhsL/KFCENL3E8E0OAGJ8EBNFhpfQDXcz8KFA1?=
 =?us-ascii?Q?jgWVP4Rg8Sf6ynevsJokvjbE5qM4FnQlH6go7br5sAqZXU99kMJk7PmryjoH?=
 =?us-ascii?Q?f9f6WWjJcU5wS+Z6bKs/Z4FFUAov32XOFxeKbaGeTx0cR2Lz7I8Yl+nMnHap?=
 =?us-ascii?Q?T+NPV4Q04C3Sww+waIT0InzLBFcR7+Cx/isjTZFPdHKDjqgWdTPrCmb+rlUQ?=
 =?us-ascii?Q?m+DiVp/TJiZl069B+a4s4iZ6En94sDU1/TJ+jfak71sEAmqGyOpguQgy61tV?=
 =?us-ascii?Q?PKTff0yeCnpJckCw9PiThokHOfZ59vcwspnyuPzOCbKlB89y1m6Ds994ktSQ?=
 =?us-ascii?Q?bPrDayAfnIGjyYWCHvRdCsClpsUiLxtnTG1Xdbpppy35dpx27tPhsscPh0lj?=
 =?us-ascii?Q?CJb7d3MGew5NR6A7UkoYG/afLfXmIGtkLUi/MARCNHGgUPQjup44z6vyNEmP?=
 =?us-ascii?Q?Gw+sfKpM674DglmamIvcPM25cUvvzpeJpF6U2H6+qUeIRP2rKVakhd/80JwH?=
 =?us-ascii?Q?pwjqAuJa1yy4ZVe3bTZg7vC+/fMtdHl9bw2rsHT4luod/hdxiJHK6/DHANGu?=
 =?us-ascii?Q?S5u+WuWxFNh7Phhl7jnoZ/gj11hCi9DGktW2bMfUsmiLBkX+esg2+hXaZjWz?=
 =?us-ascii?Q?QkzS0C6IFePO9f0f8TswkZlG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a4f36f-0fcf-4aec-ea63-08d92bf7ce4b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:16.9246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+UIaxERGqKUPpTTeQOBeyYV0+ZqT9B0vMA+pjw2ZtS8GtjbwJjzzcDNKTZShmTpZDpukIus+9FGXAkQVfgajvQa2CT01BBMF1mPTiROhtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6806
Received-SPF: pass client-ip=40.107.1.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

We are going to reuse the script to generate a nbd_ function in
further commit. Prepare the script now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 scripts/block-coroutine-wrapper.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 0461fd1c45..85dbeb9ecf 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -98,12 +98,13 @@ def snake_to_camel(func_name: str) -> str:
 
 
 def gen_wrapper(func: FuncDecl) -> str:
-    assert func.name.startswith('bdrv_')
-    assert not func.name.startswith('bdrv_co_')
+    assert not '_co_' in func.name
     assert func.return_type == 'int'
     assert func.args[0].type in ['BlockDriverState *', 'BdrvChild *']
 
-    name = 'bdrv_co_' + func.name[5:]
+    subsystem, subname = func.name.split('_', 1)
+
+    name = f'{subsystem}_co_{subname}'
     bs = 'bs' if func.args[0].type == 'BlockDriverState *' else 'child->bs'
     struct_name = snake_to_camel(name)
 
-- 
2.29.2


