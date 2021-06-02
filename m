Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231E9398AC9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:33:50 +0200 (CEST)
Received: from localhost ([::1]:56684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loR0G-00075m-Ue
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfZ-0001dw-AR; Wed, 02 Jun 2021 09:12:25 -0400
Received: from mail-eopbgr130102.outbound.protection.outlook.com
 ([40.107.13.102]:43141 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfX-0003M9-F6; Wed, 02 Jun 2021 09:12:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJd6O9WiW+z1gdQYU2CLVD/x/K2Qz0WUebGWUzGTnBz8BECOJwRqwD3evJ7UL6tWuQiiBmt+u2lBF6CvJrkdPEcV8QnYpwaHTrqTrRDUGK0oWsD6yFBCrtYvToWJi2Bszj4vIAdG/8URDYBFJbOfstB4JqmZH/IthEz4129PaZ/UiLO/ySeLF6npf0h5bzqly2ZSdtIA+zD9W6z/vJmZd8FtpMel8yt9hEQw4Lztu48LQgjGJjMwM7aAFbWS59ortzy780E9GSP+pyCoCpXRYE7+2fgzpcYQLzWvalGQkZDiMiyxzJdnSkSqUyOYDiWehl8VV8Mz/7s6MC+zmf/Ahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/ymRGP0DRJKkxQ32QrnLjwjG5+iJC9P0zhZ7Hzl5to=;
 b=H/ztuZOatOxUQAu5Tf681NJwEppZaltE5jcHgAqkMFG0LbrJKIq++MAFeoKNNxXnPpo0cY21tJgeCdQreABEO4uBQp5ZoA37GK1PeuBslyU2+eAgo6F0a+P46JwE3uQk88f4jBrIaICBlsuTC87hugJ/ctPY0qxj1BnWxi9GX+YkPzAVIyzthtlcVmu0DnlNu2OuXpvSX0JU17RqRx5qRvPTRQWYZNJnd62jGR5P6j9l+iy8luKOC2hykwAqyLJCTL9/5gpP6PgghzvlzIPVl6oTundR6JKaAWPKvkKFBnDFSxNQHTrNlsws09HX959HgXoDnjFhH4wpUvm4PJBk2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/ymRGP0DRJKkxQ32QrnLjwjG5+iJC9P0zhZ7Hzl5to=;
 b=XFOL9Il+YfHXqps4cNb4dIm1bgt4ecXC4MWQLIi5Jj016tFNlFyDcUE/zGU5lpxjKUQt63yGVSVOPvsD9zKCxEBE7cvLvgrOnTwD38YHWSmkHwp6JlqvnyrUdzy2L7y/bP/fURaMXuc6kdCzrYBem/9JHEMRZBGDC2Pcb23BtAU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 13:12:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:12:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 27/35] iotests.py: VM: add own __enter__ method
Date: Wed,  2 Jun 2021 16:11:00 +0300
Message-Id: <20210602131108.74979-28-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:12:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b8daf31-b645-4fdb-4103-08d925c803ca
X-MS-TrafficTypeDiagnostic: AS8PR08MB6693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB669300F6B575F8F0382CDE24C13D9@AS8PR08MB6693.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oKUozmuHg5p3Jrx5oFX1ekWZP2pw3ndlog3XUT5Xa8mfTwKfA4j1rKDMA8yyGCCwcMUQYo4BqJQnErZzMtcwMou5ZlJ29MO5WFpcTHUF2JW5bFctUM7tJTN99APaRgehziWS7kGxnWs+zclPzXDicQ1oDChGBJ3kj1IAPZi7IBWdN25OgzDpW0cfeS5mOBg71i5a0cPpt2YAjokimd7Ayoju9k5F6K06wLTUHhDMXch8FEnBQbYymIz5D5Zua9ZItsvHlFjr7XnncJZdsd5CopYyxeOM8y8Vsi1zbpdc55SymRjq3fw8DoETbcye4W1MjpGB3Tn4EAEDUvhAbOHDjtsVrT82vnNEm+s6QKrBa5eodsJ88EhXrxa+u+TUM/okc7j5idv4FElJWCm4KPnu8FnkS5noTyDGzqO4Q74G5x+/yq8an0B2HtKRA8rxPWiyDbPQXBdWN1lnjFT32kBlt+O7CRBsKMvRJ575lwsBtCaUBmb10Txh4eyHgo3pR65l9TwQrnPAVtmBnuXN/ED0S/diHmVgC80dsF4mycYm1/wV91ApGjm1vnue71hzO9GW1ghkJ6/z0Oqz9yiinH7S9JMyxVU3NLxpID/wudcNG4+ofK4JPFP0kaE433hkuyKTN+aB1IzewYlQ3pbXkxPmjU52DHSSRL/rjsqWqLQsiC4QtZLGv9MBTSg1tK+ns8Vf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(8936002)(5660300002)(38350700002)(38100700002)(36756003)(1076003)(6486002)(7416002)(4326008)(6512007)(16526019)(186003)(2616005)(956004)(316002)(6916009)(6506007)(4744005)(66556008)(478600001)(66946007)(66476007)(2906002)(86362001)(52116002)(8676002)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2u1xrm43/zE90xIXfoxHlaXYu1xgnZbwKzm68rFJE/LTh7cKGPj0SDhYbrfG?=
 =?us-ascii?Q?3aVyQ+dIvG3o/VH8GRAYRHj8UKxohqlDytiF9ZSmWxyaspH5+T5zENtEcGyJ?=
 =?us-ascii?Q?UrjT1FInUeQJoie+7ZG5KCA53zsD6luFW5xio4csVpG5G/ssIBXxOLCpaDP+?=
 =?us-ascii?Q?Qtd580s3y68di2IB28TFTjCbMH0sa1StvLPvdTBWR3yCLd4XX08NNB8P5jSU?=
 =?us-ascii?Q?6RDRhDD3aWor5kx5LUQnrtrkFn1DY4PtMNOnv1GfClxM1ZRroCRB4tYfnpTV?=
 =?us-ascii?Q?fGAl9yJyUNJ6/uzfIuSJTZQVTteBJ7UmJW1D4PW3JAwShxRPiYUPYF9Urojc?=
 =?us-ascii?Q?/5zDCGbL7HS1OtjZTUnugJGhvle1YTR/X1e/EBQCzt3Dilj0KwHhDq2+I+sV?=
 =?us-ascii?Q?hVIlMqxCWjIg+PN1Q7U2rI68sKTCFNSOnXENU+B6hOSxtduyHfBwbMi3zB3I?=
 =?us-ascii?Q?KuXwY542hFpzGN8vdk8FSmqAz5KKEUNnnxy4pKsVzgaaRDHQj89zzD+2lWY5?=
 =?us-ascii?Q?78rtIsrJkmAu9w5ltaaaOrfjfRYGzT6adzm75y9NIqY1YHAv5xk+iHdrszjU?=
 =?us-ascii?Q?kNR7Twk3ATYZVtnof9wiOrxUCG52e1XOL96z6FHjN0Qsu2ZBoI9jBOsppf71?=
 =?us-ascii?Q?fbIOrKRlT59Z9iylUxxS/Qpx/iVMh/E9ju0UPaN7gUpwvhQQ6K9jm9Ca25xr?=
 =?us-ascii?Q?7t81w1Qg+VFa4x7Ra3QZ1LCQF82g6bxo4DPlDc3CTAUMN7zqIDXjPBkDCuoX?=
 =?us-ascii?Q?qGNdaiAWB/LEFntrhXphGFoK7wcM2T0B+DATZNUatBYqRAlifAEeugbSRyqs?=
 =?us-ascii?Q?+9LFZe2JrYDAlHybbY++jmPKpUxNinK/vUxjybz4FSHn+cyphSi3LlrEKAT+?=
 =?us-ascii?Q?ceM0Mbz0WECl/jnLRfiRSW6OS+FLKJE1LyBXJzIYDBhBNskpu7a/ULngMsdq?=
 =?us-ascii?Q?PUl39wiCFxbYE2hT7nAzIRax2cr+ryaHhdX8yCk+mIfA2ICdRtVb43JE2P+U?=
 =?us-ascii?Q?y5GDDdayUX3JSsnQZHb8Fv4Z1lsen74w9HINmX04FmgqiZhY3YA4+NaeyZwd?=
 =?us-ascii?Q?URBRD5lqXGiGQHnE2oIYU5Ka/WSBSz7IvR7jfDFUBy18cLWV41z7LZh1sIcW?=
 =?us-ascii?Q?vTFYb7sbY6AigNOFcEeBg0uX7zlr95qJ0MzJwFpiaof8/SIHazWlknGUZPVQ?=
 =?us-ascii?Q?uy7pZPLJEE9WodSGbpxzC7VPXqmQW70TT/Gys17XsIcKK106ayKLCUSTV6gf?=
 =?us-ascii?Q?LQW28xlyEJkA7J5Vw6tLKZXnJxpYB0UNe4iQ3khAFsDrH5ewd5CFfxNEJJ9w?=
 =?us-ascii?Q?CqdCy2i0WM/1GRLQYWZys7YT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8daf31-b645-4fdb-4103-08d925c803ca
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:12:03.8372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gNfv8RsDNLvN1W7vFeULxDIXNj8hzu5jmQN1jBnpwDZnaQsG53xfrJqqQpfvS8fRK7AYl6lbJRV4Qv/7/CAhi+4ngpidNIPIe2cRXlj06w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
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

In superclass __enter__ method is defined with return value type hint
'QEMUMachine'. So, mypy thinks that return value of VM.__enter__ is
QEMUMachine. Let's redefine __enter__ in VM class, to give it correct
type hint.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 777fa2ec0e..c7ec16c082 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -568,6 +568,10 @@ def remote_filename(path):
 class VM(qtest.QEMUQtestMachine):
     '''A QEMU VM'''
 
+    # Redefine __enter__ with proper type hint
+    def __enter__(self) -> 'VM':
+        return self
+
     def __init__(self, path_suffix=''):
         name = "qemu%s-%d" % (path_suffix, os.getpid())
         super().__init__(qemu_prog, qemu_opts, name=name,
-- 
2.29.2


