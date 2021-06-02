Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17369398AD3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:35:32 +0200 (CEST)
Received: from localhost ([::1]:34966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loR1t-0002xj-WE
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQft-0002Kc-Az; Wed, 02 Jun 2021 09:12:45 -0400
Received: from mail-eopbgr30130.outbound.protection.outlook.com
 ([40.107.3.130]:57568 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfo-0003lC-OM; Wed, 02 Jun 2021 09:12:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgo81GAke9KWEVFu2VI7z8fAuhCa7Mi1avuQleyzNTMXInx4HZjuUw7pUdc/req9UmPp23p5A1v3V3uEGH1YoKYp3WDUVZ44asve3KgcLHePQBw5Mez71jdxsIviXDu2XDvJSpf/boROnnT0VPWFd8kh/YeYpiki44UgSt760t6TJAYZfKLQ25iccOcNYo+62FslTvKl2hk7bQV+tpkeLt4KfatD0WcZONrNbS5rJ+F0qhDLVO9crtpopc9XZWpXil9IC2SJQcDFVGeVWcApzXG7MKBLLJZotTj2kL2mJraq3prHyGNsmJi7TirGP4CKTA8Tztsjuib/7HThz7vyEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm/DX8vEH9U0U4+GCtPJAxsZlteqTAW/fTB5aMXiQYE=;
 b=YcO13mv6RuGMuNzkYIJBx8JOyGucLn6OSx1Yafkxi5+jJJxOUBQzQ1m9pcP2D+B3B3AVkp3MKd3kIg8j7o+F/lcPdg/wuajlprpQBPekjp6lI/nfN96j2TYxJ0LwqQ2+JDGhBf8kwgEt/bMf7EozK5eZjO64jH3c9WhlcmjUfwlsVZTInxOxpiLFOb9k9y+xykP1+7DDjEm0yIXTgOM1DUFB7c4NqmcJLvQN+JIkxYpOzfaHip0b5/e9Ay/9wh/b/A5rOAk84oy3iGxMc4LB8WfVFc4r6ov5t0uZgwYYMQpC1lRFKIPZCFvxNEMrbecDbtEJKbMG6xrc3tI7cnMByQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm/DX8vEH9U0U4+GCtPJAxsZlteqTAW/fTB5aMXiQYE=;
 b=PHtj7pUfdGizThhZ2ZLl65stdUS+vmqxy9URCFT4VnTwj8XfrzU5s6hAX0Ui0v7Yiw4b7z1JYQXbXVPA9Q1/do56jPH1QQdQIXFHFz6ygIjccpCFZZHLZq/wZWRirEJE3OJ5iJdJl1KP5M08A5pvN5afcQT6e2XMvrO2BInBc7g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4536.eurprd08.prod.outlook.com (2603:10a6:20b:bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 2 Jun
 2021 13:12:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:12:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 30/35] iotests: move 222 to tests/image-fleecing
Date: Wed,  2 Jun 2021 16:11:03 +0300
Message-Id: <20210602131108.74979-31-vsementsov@virtuozzo.com>
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
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:12:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdc95a0d-346a-4d01-0ed3-08d925c8064b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4536:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4536B47B0A75F3620AF83DB7C13D9@AM6PR08MB4536.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bfu8oRIpqpJPfbjw2V7oQpksu4xLe2gT2J9UciG5UIsTyOLS17q7tB/mpaRl4ZDbS9wfmKG6NWhVRC4B3gU9M9B2lwKJmSit075qKvRA2Cox78K0GjQ0833ilusmOYJFWkWdP28BHVKufMG/kdcu0tgCTDUSOGy4jHrmJfpMCNNKSibPLWppSc3fCd6llPdE5vSyk5oDLnKHCv1mtdulyiq5bDsz8Hb3lI+nTzVOWQctgG3kPLOMreYsQpV2aFBt4BmfLvtovvYSBftxD1p5IG11+51cRVW/KmfVB4fy4n1l0j08Pcf/ccgF3JAZQzouq8dg0Uj9ynXOS8083R0+7GfV/SzO7CeGQl3jTb5dwejsO+CSACSxepnbJBFOuiLlS4SDRlBPOR1K7ti0ramiyOoSI8e43g3T4zqz2LryBNQCIBz8ONiwpwo4m7UfLzlGQdogOUiUiLUzwtb00x+YL9K246sli5xhRXdPB4gufGQkiF1GS41S6L3qQPQZHaptU+T/iz8L/KWEehK0yRBHWU7EwyH//AmhqTRDqxrXI1hw9IEr/aTmzEp41GgN3arwbs1kMFasdFqUvQWWGLtrOYJ0+QAfFVF8/7SwVF+0K7ukusCG+NKdTCQYn4ZY2aDo25zOUENz1q2OgWblPncu6f1hoY0jAsjrx3//W42hJZjV+pMCaSS9c9AEmdxXZkOK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39840400004)(2906002)(36756003)(316002)(83380400001)(5660300002)(66556008)(1076003)(66476007)(4744005)(6512007)(66946007)(52116002)(7416002)(956004)(8676002)(186003)(6916009)(6486002)(16526019)(6506007)(8936002)(38100700002)(38350700002)(6666004)(2616005)(86362001)(478600001)(4326008)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?T2vFIoUBhWLKp6tsMCOXs6cid5lpAZYzOt27qt7JHuE7j6KTcOeNwfTeEWuC?=
 =?us-ascii?Q?gyArCASq9GdzXqh1QsYH8oHBck7Lf/2AmSeUe4LXDBbeWf86+PC8AfuHZNfC?=
 =?us-ascii?Q?kpBR4yE0k8FyhjO0OerVt/wkdYawE/r+UGnYM7Fys1Km+ANuyjN+rmBS6PzY?=
 =?us-ascii?Q?5/Sx5bxuOBWoirsbclR+77KANYqJ1A7GL8Bl9ntaP7DyPQPiIVukYcEeS+Wq?=
 =?us-ascii?Q?GE8ujUyQx4fl0sTztcL5HMX2r7upkzwvJP/bg9qwfKILztsSWok/iFo/yfbF?=
 =?us-ascii?Q?D7tybKkbsQhJbt9rBcAWpLAuq43A89kRftujOKM5x+Ca3+ifdeZ8hN4IVCmg?=
 =?us-ascii?Q?2n0I/5415C7OZsBv8CHFKyJTbdjyRvk/A7+rQuFcwamVXM6pzQQzk+YeO4Q/?=
 =?us-ascii?Q?8KSQ1sQ5p2Daoibm/liwKa3zUL8E0EmzY60K/YhwLrabVXyBHGL2RXtAhbKL?=
 =?us-ascii?Q?f14Etd3qKGUQ5gNyRqqH9A6aCKvWB68faF4iuO5w3FpHTk/44qhlJfW0ZhaW?=
 =?us-ascii?Q?bpThDvUtgO3Or/iXAI+BzFg9Syh28r8WRMeFfKz8Fxv8D/KJrCdVK1U5w2I9?=
 =?us-ascii?Q?UBRpnMXMsWVRYn88yGZLRfwb1AIKI87OiFGtV4bbGQ/FzbM+FU2dxR8VmsfF?=
 =?us-ascii?Q?p4FJj81e4bp73g24tb/qEUJnawRmlv0Ohzv+ywC+R779Jyy72m2hpbzjh58s?=
 =?us-ascii?Q?eyykc36MTbrYnLhMC3iSi3eCOFFtdnAwNT1QExruArP8mkrFXgCYK4sRzGBA?=
 =?us-ascii?Q?930wux8WBm0XqKaXCX9rOrAVEA8QA9nH/DMd6C4ZACaoApmAv8l+Si6TmXtS?=
 =?us-ascii?Q?cCJYuP4lU8Exus1Jd3E7ZII9lNuq8+TnmdE7I2S5dh9XUeOoRjf0+JnyDuxj?=
 =?us-ascii?Q?g8wHN9n8ZDhHXRvaDC2t4ibm2P4Ww/kl/Z3eeIx0MAGC4juxHmJKPGWOQ7wy?=
 =?us-ascii?Q?I8Pmr4aS8xRaJS/y/Pggpg3c5ZM+gGIX2gxwIePfxcL323dgSCB8VTcONpA+?=
 =?us-ascii?Q?3aJ3yFtEVEL3ifHN9z5gIPJ1Nk0p/xLy4b98MnRwikZTglnDfiYoRCTCQRxN?=
 =?us-ascii?Q?4FXa41LFIGT8XO5TH54uiYcDjaOhEepzpiEO5VWomzVONLGkRUoHp2TEKJrL?=
 =?us-ascii?Q?m9u96VmpwWjtLE99Jvg4IMSlaWdRLzWk+gB6n5+0/TYFWLb9zW+pzL9gDQtV?=
 =?us-ascii?Q?lAATcHK/zFmyrKI5zNx5Znpi63pCypwc1lNfZ73JMAmEAYQhhm5gUmRWbF7k?=
 =?us-ascii?Q?lQZzu0q/eD7feEWjabq/wwk2/vk9zpJOYIqutTLel4mAeO7esct2psye9YxK?=
 =?us-ascii?Q?fKlzL9dz1Qm0/8NKuiIoP7lY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdc95a0d-346a-4d01-0ed3-08d925c8064b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:12:08.0259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXBbDPGxrPgXmTWuzbgLzj3RUWHOExsW/OB5xSa7IWnveJRCjZMbIUq1y22YQ4K8JO2jcb0XX/589Fb4c0fms6BKtPCU9cR3pFPx85CVU9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4536
Received-SPF: pass client-ip=40.107.3.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

Give a good name to test file.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/{222 => tests/image-fleecing}         | 0
 tests/qemu-iotests/{222.out => tests/image-fleecing.out} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename tests/qemu-iotests/{222 => tests/image-fleecing} (100%)
 rename tests/qemu-iotests/{222.out => tests/image-fleecing.out} (100%)

diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/tests/image-fleecing
similarity index 100%
rename from tests/qemu-iotests/222
rename to tests/qemu-iotests/tests/image-fleecing
diff --git a/tests/qemu-iotests/222.out b/tests/qemu-iotests/tests/image-fleecing.out
similarity index 100%
rename from tests/qemu-iotests/222.out
rename to tests/qemu-iotests/tests/image-fleecing.out
-- 
2.29.2


