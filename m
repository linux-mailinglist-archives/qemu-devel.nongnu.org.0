Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C187334605E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:54:06 +0100 (CET)
Received: from localhost ([::1]:44324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhTu-0007nr-CC
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhOX-0007GE-1f; Tue, 23 Mar 2021 09:48:29 -0400
Received: from mail-eopbgr130102.outbound.protection.outlook.com
 ([40.107.13.102]:31392 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhOU-0001rq-J9; Tue, 23 Mar 2021 09:48:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzqBpbS6EJ9++P86x2hQvLOtuJ+/Tkfj62NN9B92C5JYv2irWh+BFM2pbWgNtkNIpd1zDuu5o+dXgxnoQoiHAcDGPJAsrDbPnlU4C7x7KW+CzCkpaYEMCZ5sUJqoVi2MhXHjxXDfygle4mNMY2ty9ruECxoSLlZkMOVETqJs+2OCFawEAqDxgG6qkoRtFmVFFtpPDNCGGkaF2piBfaC46kgw4E3X5x7meqJDAIIEoq6E3EgEHPrchV/lk/JsnOG2RzWamHPNlDt8D1nO/QBIDKYlkvGxw0GX2sSWaO8rDANPG5AoE8NNLanp4CfROeJrg5/NihJudGt4gONoW18MyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQ8qAb8Ee1KlC8mBjDEKJ+xaN3/BIEq9d6ubMefqYDc=;
 b=WpAEpN37bVJFY1ZVi+I4dUCieHYmb1P/uS4a7EkOlGcVaoLlWVspAWqMZk3U/KDbZnogw622RJBfIxIFx/YVZfhLnH9TTPM0pKbA/+op+7+fxOk3TbdVRUmNXzbiLKdlB+kr995ydy8446kM3WNLVAeOopIVRz5MPm6thxendGE4GKbPq5cLv00tNHor8Vv2OBmmqCmdCmtFh9kY9f9SoadCkJVL+B0g/1yfkZFDdIFSsntIetyy0Nxo4+nc/rEKiq0ifP56XGmSsC+rxPlSU3Vg01PqbqChOPQde1JJyT5V8IvAfxJDk+ZBTez3jvmLOiabXv3eOYhr82BVZT69mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQ8qAb8Ee1KlC8mBjDEKJ+xaN3/BIEq9d6ubMefqYDc=;
 b=VWbwptPETd3LG5cwCG+3h0P1jtIqgtRAvtWGXQi8dKHL9Z8MNqn/ZeZIz6yfNN5mXqUt2z9WMGAs9SgfyCFmEQBNf0tC5OJIvra/KqNp3OKuBiClqlHEkmFy0YHIkJsKpnObJcEra4exvxi/qcfdlbJtv01HAmhSn5Qjz4bVxvY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4070.eurprd08.prod.outlook.com (2603:10a6:20b:a3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.27; Tue, 23 Mar
 2021 13:48:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 13:48:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com, John Snow <jsnow@redhat.com>
Subject: [PATCH v3 2/9] simplebench: bench_one(): support count=1
Date: Tue, 23 Mar 2021 16:47:27 +0300
Message-Id: <20210323134734.72930-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323134734.72930-1-vsementsov@virtuozzo.com>
References: <20210323134734.72930-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0184.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0184.eurprd05.prod.outlook.com (2603:10a6:3:f8::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 13:48:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 633aa85c-a91e-4299-0232-08d8ee024650
X-MS-TrafficTypeDiagnostic: AM6PR08MB4070:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB40706DB312FA4CA1CC82C41BC1649@AM6PR08MB4070.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v5m5QoXkPRdCakie7ncWUjVcFyqvmuxNU5qnUN4LxvofmQvwPL8LMwSw5oZDzpJFLOtYdJFqgBSXlt1ZUTXZMQ3u2TvS8b717bwYkEtxZFWiw5cLrthmxoGqYo5TITYMLNWMO43RKn0goJcosCaSFOnd8NR6HhkJa3N0XFCJtj/ImbM5YSP32mh5fYnGPFrt0wNbW0xM9Ks8xtQNqEuyi0h6D/rOnKbLu4jwU8hIclZGJbGY66XV5DTKD2dbPBITYgarFF9VsNeAYKTiRvMfs6zLNB7a7m7AzO/StQVQFb2GOOGOVKMpL45Lat1D9K17J7lF1YKzgtEOgqBhHONKfuaRuL17vIEirTA1PWyDeDr7V8MIjyueUkYDuZaik6UOidCxGMKlcfS5aVKLYr2IA4HN0jD6ivwT9BQI8FCjkGXju4dA0maEYwAmYoW5qJi7xa0EqkzEV7GMYV9Txe61wtnvVaWh2fwc984F8Q9r8c+f6B1EqUlWRpWMu7Lub7t8CAr/gXrQIrVCeKecrcCFVc3WZwMFGkEU3TsjklY8UFuHHPj9gmPAAB2HdRovRSl/B9SpHXMUDbLEyyAzRj+kNVh2bJPRiRntBMRJramHErh1gwGoCBwm1WhxYOv5b8e2gwY86jqXQDNLfaDZuCPsxmD0tt2kVzaEIgM5vFQ27pPNtfF4jhtPeVjxm3k8HLUz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(376002)(39830400003)(346002)(69590400012)(52116002)(8936002)(6916009)(8676002)(1076003)(66476007)(6506007)(956004)(83380400001)(66946007)(4326008)(6512007)(5660300002)(4744005)(2616005)(36756003)(38100700001)(478600001)(66556008)(316002)(26005)(16526019)(186003)(86362001)(6666004)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lrwWtY5qYSHiyKTvHCDpVn5kzj152n9vj6i3Z8uUqx4gmh59d5vCDYqCRyiy?=
 =?us-ascii?Q?w9i23i15MJOhfcurJIQGIpxXGldbeafFgXf0nJohbGbt00LVaTZVTmk021R7?=
 =?us-ascii?Q?sCXTg8frAaiMmxwFTQkmSzFNqdZ3pjBWCggZRmmZRsJppwFZFZ54IK0AQO2w?=
 =?us-ascii?Q?+rp6GMnriLHTCNA72YE6DwdZdjM88m0NwRDQqNm5w2Eg510Z6LxtSBu6nwYm?=
 =?us-ascii?Q?ooUDck3YyGq+9mBSz2id3s8KtixkqGlDuPTQ9FSV/hOdYbFnwcC0AGMls6hA?=
 =?us-ascii?Q?fkcw8ds7K4biTvYi70+0U/QC2CMGPQ/0lxtERFwB9jpm4sirRYwf4HmUfSJ4?=
 =?us-ascii?Q?diAfeSmeh1jPfsBkinK6jKBPYhFFfRuG+HT9BOlNbiyNhbPryEfdIrnWwO2s?=
 =?us-ascii?Q?DYvtn2+3Ep7kR28FA7aeVPZaT3NrMyBmPdhUgVKkUZltEi1ffoLG44PNMY11?=
 =?us-ascii?Q?gNO2cOHptCKWFUrC6A2/Tpf38QiGB9Y0UUzuShocZqlUsCYPEKke5AOHSRNR?=
 =?us-ascii?Q?GGCyxf62rb096Cgn/aCF2n/IzV6GlI8KCnrkLDRh3T/lW06WtvquECIyjeEF?=
 =?us-ascii?Q?vxpqELjljE81TTsn9l/bJhnrg0mZcNDkH3Smq88ji9x/hQYqrDxG3MYftNSv?=
 =?us-ascii?Q?nc0/bjsGBszC9jg/18k7w2pn8H5YbxZ5Yhv8x0BQqKjVqimFv78D30axVmbe?=
 =?us-ascii?Q?3vecgQ7bw+Zmu6OOfHaigKwlSrw91PcXmYfjv2aLgS3j9YJ68rziFXMhT+bL?=
 =?us-ascii?Q?lky7kbCKA006gFNQttoRzs1GyQ49x2PPtN9Hz6wvZuuf9/2zxaSz7RWVV7Im?=
 =?us-ascii?Q?nBHLE0L6UlKlZJzSiLZQKyeErY5JU/rtHq5jmgZU3oAkDoeEr9PkGk5CiqFu?=
 =?us-ascii?Q?TA0sjTQaKVSziMkZHPc2UlJYDNPOaAN0bcemQpIEmkmNZ3ADc+w0gRzVIycU?=
 =?us-ascii?Q?eV9JT1ys9K7zUHGzJ0p9cn9DmL5eVObrqixg7Y8QBU5rr/R7IiRsPppbbydE?=
 =?us-ascii?Q?RWiaqZaMy9AgvbrEJ6oz2dGWE5l4uZkk6DW44Cf3WR2HIV7VwnvJTsPhw/Gs?=
 =?us-ascii?Q?BR+m4FtjdLgGKqlRfxGdmRRJhach09Gzwl/t13tAq+CfoZfw6If8Kwjn7MGo?=
 =?us-ascii?Q?qLQ17k8c5CfAMfTmMWkSQTPKs8+w2+nZlkOsZLx9ffm4vizktwdtxhNpy3rc?=
 =?us-ascii?Q?KyUd6F3MyUhCgxxrt7VCED+2iUM2BJiguA8VZ2y6BOcpv2Y5voeo0Eo4RMzB?=
 =?us-ascii?Q?v/A1crXl9CHSmhOBg8+GzJ4qQuQUMcZ1a+cBzC9EkUzO8Yf0Xohs5J2ma/zP?=
 =?us-ascii?Q?bsYcfr9GLQTHkEBHgVSHoc/L?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633aa85c-a91e-4299-0232-08d8ee024650
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 13:48:01.1601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1I39fJfuzPLgsknEEvrwGIgbLnRZIiwcqfm5fKIQEZ4RvCLU2XJqUbdpI5kbLWyn0UrXmWHnF3X0hunYVdDCNsNe3PeYzIzYLUKVaY0eNuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4070
Received-SPF: pass client-ip=40.107.13.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

statistics.stdev raises if sequence length is less than two. Support
that case by hand.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 scripts/simplebench/simplebench.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/simplebench/simplebench.py b/scripts/simplebench/simplebench.py
index 0a3035732c..27bc4d4715 100644
--- a/scripts/simplebench/simplebench.py
+++ b/scripts/simplebench/simplebench.py
@@ -83,7 +83,10 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True,
             dim = 'seconds'
         result['dimension'] = dim
         result['average'] = statistics.mean(r[dim] for r in succeeded)
-        result['stdev'] = statistics.stdev(r[dim] for r in succeeded)
+        if len(succeeded) == 1:
+            result['stdev'] = 0
+        else:
+            result['stdev'] = statistics.stdev(r[dim] for r in succeeded)
 
     if len(succeeded) < count:
         result['n-failed'] = count - len(succeeded)
-- 
2.29.2


