Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9B139789B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:01:30 +0200 (CEST)
Received: from localhost ([::1]:52720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7lh-0007iW-HI
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bn-0002Jo-2m; Tue, 01 Jun 2021 12:51:15 -0400
Received: from mail-eopbgr150112.outbound.protection.outlook.com
 ([40.107.15.112]:35829 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bl-0002O8-8S; Tue, 01 Jun 2021 12:51:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQfWVArWVW73gUK/2TqJffZZPLw17lEPgkdbhU7oszM75PXQ8BOEI3tsqarlxbdy3SdTJdtKeNjGG30435hz5DBReuT6h50IsD3MHBiXJA1ktusH214fJP93UXeeYEjD6xPnvvD1XcHn18rMaAqf3Jmwsf7rK45LSQ7UqRodFVqhRpqwh4tRttfxvXKNTjwePKHF92ZslArA1f58Z7ABWa23BVhURwubo/DImYo/3ClpNHI3rsoQzBd7O52IZohHdW+8Cu5MWDhxBK3n/n277hgStrqvmm/SP4aSJeOf8ucd/NVAG/2cVmho8qfATTMPJkwv3AtlQB5NJQE65GUC7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N2uiVLFU5ZMtznDXUsWnweG+NBu3A9QkTphI8xiDcg=;
 b=GgY5/r511V61PCCqL5fSDf0szwPPRK+SwVSpNWrfgfJ5Ddri7Fpg69iCsf4jXzbV1q6s+zfmtJqaeHKwodap+ByAol5zpcG8kB8sM6O2eYeCOcnSaJUm86etbMMDHlpabW79mUxpUEp1n5PW1db0BS/yD5HpvSJLY2iS8fRT4XlbBllovTlRKLugfE2suqyRP28Rx592qmMn66s3T0NQ3afU7nVkdMkHb29CsH5nEZyy81ogSKiW3z/vKSD7yvJyd0uLchCfeiVyR24V41AvIoIjP+sxqV3ETPyqYuq7Avqimxfol+1lhFmxBSDCnPPXOsZYiLfiBD2JFest/HZQng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N2uiVLFU5ZMtznDXUsWnweG+NBu3A9QkTphI8xiDcg=;
 b=TYu9JB73DFx7hz38MkhirKtTfDaueMJaUP+j8xzhtM89C43BEsNst0ASOzlZhWdVhTwH7UboPyL4xEMwm97P7CZNlVRpr4jhQBJoex4r4RsZFUsSi6yh/zYW0Fv3EpVWx8Qahagt6RU3mrERqC+WgB0uFnFxyRtHMPCyIxZsHFU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:51:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 13/35] block/copy-before-write: drop extra bdrv_unref on
 failure path
Date: Tue,  1 Jun 2021 19:50:04 +0300
Message-Id: <20210601165026.326877-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:50:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd32ecd4-0c23-45c0-ccaf-08d9251d6f6b
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19724BCC29D73143935BC5FEC13E9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U6YEz21dnpQ6opM/J7VFKTtXvOjcbkrM48lqy1l63WXI+yoLxhrBlPwaSg6F9wYiXbNjnWpUDEZGMGHqT7VO4HThPsFzqJsZ8e1chs9LzEXY8hObmTPjST2hrwFqGu3h4R0pjGK5nuiuMYeDGh/PaYc+jPnLdu52I52+NaqDtmgKMGqyg0TqnOK8zxz8d5oCAXpG27oMCl4TKLs93eg5+ZjCr6ZJSwzYZutGX/FqUJ7s+4Wt47HdI1vuC7gh45Tv5a6CPx6ZEfxE03zylAgpOv72mdyYXJTx2KJbnNI9sXcldAuKvYAK1vpLanmaoEshcQIBUOwcYSNy6d0435E5WiCkGVn/9jBfZXOM+M1EnuTycmo0hWHED4igcYmVYIEijcbzCEQnYLE1WZzNNltXeUEnH7h1G61p9ckUpXLkY3Tm0wIqmXH8Of89I6eiXLZA8hLoJ7Yoi0hsHsIGSPyVZuXssDj0Vbmjex2emuOxn9AHUbL+6Nu85/MuzXmSJTCIGFoW8U6CWd6+5b07XCU9DtdRw753yHQhE4Pe7RaLubpJenTZVaqeT4WXtXpFheV22KwtDHxwfusjQlfbXIzJ4MVIJQC0+KxeswKHC4HZiBXQNCvhCmf/h4Muv2mFztUp5CZkTsj6e5PQkOPHgwmAGGxIfhA9I/bzRgeule073d+W5sslIqSOZ5hy+Ofvdlaq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39840400004)(346002)(52116002)(5660300002)(4744005)(2906002)(478600001)(26005)(6916009)(1076003)(8936002)(2616005)(6486002)(38100700002)(4326008)(16526019)(186003)(38350700002)(6666004)(316002)(83380400001)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(6512007)(8676002)(7416002)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?R4A5j3Jtk8/Jf/T3C15BvYqKSfThWGEqsiJlT5fAGtUPqrsP//aWow+ndMJj?=
 =?us-ascii?Q?uabMWkViJ3UvJ1hD70APtYR/aa4yc4XM0wGFUfRuJi2LhWXqrkFqb4HwOb2L?=
 =?us-ascii?Q?9mNH1jnJe5iyMEhd62njmJJ5iIczrNJ3lw4KinancvQQs4uK+ADn8naVLvqQ?=
 =?us-ascii?Q?xT7x88URI/osYl52yWpYdm0VTje2wcOI3sVor+/T6lVtwUeYrdSCtFwgAaaC?=
 =?us-ascii?Q?ShD3/fTSAwn5UJMe7q+5/RZlVf7eVAyQNBo8HOdMNnf6srARhKxtPXrfWplc?=
 =?us-ascii?Q?mKNRc0Bz9wd9qo9KEwtrYtHZjsH0WoIijnjZJ9W1ShdkLq+LojkelNCsnclA?=
 =?us-ascii?Q?axOEGvzeXCqI3wQy1w77T+mppcb4rtlBVk7KH5Yt0lCqF7EoY45COigbA8To?=
 =?us-ascii?Q?SzIJhxUAC5RA8EAMqxaNPnTnzBvvmK+rD0QRj+LbFia1V6vuX9bA7BKjBlx7?=
 =?us-ascii?Q?1Bjy4GdExgpV90GAT+7HgSY6JWoGo2wCSTod1WVEH/pCKPjYwY0+WkFhd08b?=
 =?us-ascii?Q?LM4ucekXk/k0+QkZAbMH/cakjleotRv8/BPJTWSmDGgUAuxClWga1WmhsxOO?=
 =?us-ascii?Q?XAq+OA6vsEeXate7hfI7I2tp8KJq1EqEfFRjK+Zee9rWXYuDp4EfHx8/gWsK?=
 =?us-ascii?Q?YpHwwvPzZGXw1UC4tPQR26RjVMNawl/V3hwGn4OKMUlyQos4ZMNowAtj4s7v?=
 =?us-ascii?Q?Cu0QJ4o6bNvM8RJvKIpKODv9jAtt3NI4W+Mce2Y8kkPp0Agri8K+Xx1FenjA?=
 =?us-ascii?Q?o9KMkt40OjvXt3bWPyVhr01jzuYb9bGxTkKHf2ro+ORfax6E+4iaLlJJ3Hw6?=
 =?us-ascii?Q?X6z0AtRSlR/jClPD0gqp9Hq5Tls83pLDG9Vw5UkTy0M4huzbg1R7JpYszbrX?=
 =?us-ascii?Q?Og3BVTO1rhwpfsMip/ugDY2CvwTQxdyrWqMSHAqOg+823GF0T9qHQvx+66ok?=
 =?us-ascii?Q?qeeAXnctRxWUFtdHAgMWBwgVkcsxvUlfrLTd/o84C4vA3u2JFHvP8Pdz/9WN?=
 =?us-ascii?Q?ZeqwnvZDe8+ejagAS8OpV3zlhVFv8GE6ctBxr8vy9HCWRP5M2OLbr+tVi7ih?=
 =?us-ascii?Q?Wue7iSio4M9Zk4Z2EIZ2ZkfMay+nOBpBt/pCNOfzp0Yo7piD25ftRjYAOuGm?=
 =?us-ascii?Q?Gw0dchnM9m9X8CQPc4R5iYoQjh+GZZUQjhJ5dz29PrwXoYrbRXdVb31caSl8?=
 =?us-ascii?Q?hmktDttR7MoY6KR+efwLHQAKkqcnf4VXHWQkutDaD9r6jz9V8TDLGZ7Fo+jl?=
 =?us-ascii?Q?Ie/cZmE0SGo10apeDpdOEyEWRSIzLAI9sGZuvyh7ssE0XbtlwnlGdns15Pam?=
 =?us-ascii?Q?l1KTPyzdWbtBQQib58xVuNDf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd32ecd4-0c23-45c0-ccaf-08d9251d6f6b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:00.4435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbgRzFg55LDNrMvFlgugpFcATiUce0B2X1kTTaesDdB0mYFGW0Xx6OMo0qgAv+Bsn1F1xkWysBZK/RfBhIWaZdmtquR7PFeg+BCh7jtDeos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
Received-SPF: pass client-ip=40.107.15.112;
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

bdrv_attach_child() do bdrv_unref() on failure, so we shouldn't do it
by hand here.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 2a51cc64e4..945d9340f4 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -201,7 +201,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
                                       BDRV_CHILD_DATA, errp);
     if (!state->target) {
-        bdrv_unref(target);
         bdrv_unref(top);
         return NULL;
     }
-- 
2.29.2


