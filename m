Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30C2398A52
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:22:51 +0200 (CEST)
Received: from localhost ([::1]:43252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQpe-0004Vj-NP
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfH-0000Zk-6X; Wed, 02 Jun 2021 09:12:07 -0400
Received: from mail-am6eur05on2123.outbound.protection.outlook.com
 ([40.107.22.123]:34529 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQf4-0003Gh-My; Wed, 02 Jun 2021 09:12:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PreXdhzhXh69UOOLhMNAhFaaxw4aJlgYme5in7T6keVPeBCJ6M4Z4oZoBUrttDsVSCAj4fa/kEpmXdPxHHAU4/uPGdchrin8sKbz5fe0FZZLi/XHTho9U39otCC6zdTFj1RWrcVZCW5+Sc35TLBoSoiqyRAkdmKNqkxZEH26sh+wVPjqYCrZ21FLEQzCjf6Sg7myyuKXThw5CzWRzVRv9dAK7/DSR9M8Kpiunsp6owYUccaB/OIabgojJ8tyycJVvcslFBSXD2RIdax4uOXOS+2RCovufMN4wPFqu7IZeAckhBYirgIHeBu/gNf6YebYLRpPsVkHVQBcgrbbiBHa1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N2uiVLFU5ZMtznDXUsWnweG+NBu3A9QkTphI8xiDcg=;
 b=CZiM+xIIjVicUjXcuk8TE/dVcZlJDTJl/IXIWv7P7w42qbs4w+noI6Zz12FqNLHAXOpz8FcNzAOoWP1PBXw6Uo4Z9S36gW0VgCg5FS0zpfZn6B63MQLsOjbk5hnB0qKYhBLoh1oEnIv2qM57K66270QMdaMi/JbzVsoDsmXHsetm7YOHiquECGaTSoh5B53E9QLklM8n3YcYvbF3RUqmhEzH4xj1ZwOSzOtFnRIJoDiP5M4n8Tszogh2EMSIoN4gyp1UzY/jd9ZO5cDQr6fydk1m1k6kR8JjWBje1Y3yLdMoHsuJUBfN4NJLN4nxZE2p31ptd784AnyMtDEswRtK0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N2uiVLFU5ZMtznDXUsWnweG+NBu3A9QkTphI8xiDcg=;
 b=BOZ2UrrqFHFegQhErsmPOyrv3qBbPtjZUbIY5wbfPKcB10aGU2lTTyTuXMVGWvBqES2vvswO0B8HiBATnkd59VHAlV+kMDbv40xWrsRK3JzCNuW/o1+7JdwV7TuLFx70d5HbTPyK+nK8SIVrZ/DNgpt21M3DbIcZniOnyRbnYWE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 13:11:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 13/35] block/copy-before-write: drop extra bdrv_unref on
 failure path
Date: Wed,  2 Jun 2021 16:10:46 +0300
Message-Id: <20210602131108.74979-14-vsementsov@virtuozzo.com>
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
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f882eb83-5958-4b1c-bd25-08d925c7f823
X-MS-TrafficTypeDiagnostic: AS8PR08MB6693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6693BD8ABD20D97A49D9F4B6C13D9@AS8PR08MB6693.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vwg6L6GyNgflTvaCXcIx2IJsX3ZdIcIbLoa3UXsEYIVhCA33RQZH3cxUFiTbxL9+qvxxK88x6dw8ErsEJsIQKH4wzG64mxh2Bbh2KiIfSUULYiprtXnG7JBOhPO/ZtuPFp/7n1xYjLrR5A040kGHVK0ZvrStkCey9ypJcy1fGGyzsbqNvJbGNFofZ/NE1wjY/25jUhHYRbETKqvy5wJV3d4I83wrymsGD2lOvwCaZUHN4Kvd3r9RVAbmsknuuLmwYnengKiCKmmrfUHvg+/OFTY2JTnTjCkjKIC78gSmtLWjEDSItitAz0WnJA7FyCiGz2b8IsXpU+gHBWO8VHtqzfOq5QwVcIGB7Xj+6BdgjpEOnQwsHxSHizeKhhxIvT+efYoKLRv9fa+KAoOu3BDUP4goo0W4k9e46qlkxw7ltYI7akwSsTNjQIm2fPVisyU57da0N0jJEqqgtffUzRp8za3jgVmnCSYAJQtnXcPTZcKFG9Qmv/Q2lT5eOYJVLVoMRXDHfvCAFkk0fxIGNDS37Kg9teY4K0G7cRCU9qWAbNjTjA323RVGfta1291VA+BZXp+7iqdfhcUV+mS5+Vgd9RCO42NYnaInLgXTPeqAPIqzQ+v2kYJ6kpcZB7hkymLBA+wNlM/BwqqA89k/xfs2QGgo8PCkZFDH+jzOJgB5Q5exLmA+BOw1SpyjXx9+ZNQW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(8936002)(5660300002)(83380400001)(38350700002)(38100700002)(36756003)(1076003)(6486002)(7416002)(4326008)(6512007)(16526019)(186003)(2616005)(956004)(316002)(6916009)(6506007)(4744005)(66556008)(478600001)(66946007)(66476007)(2906002)(86362001)(52116002)(8676002)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MlUr0+Ms4nugBYTW+l7uaEo+Ue6mu34UyraRRXBX7dRU+Y8X85NWHnQFbTqW?=
 =?us-ascii?Q?944xMszfk5wP88e1RC244drPcyPa7cqM7tA1VPvqcL2qw/nF+n2tQLSrLBnY?=
 =?us-ascii?Q?80fbbxMlJc7qYR/luOIIHiACg7W2sS8GnlyfMtvJsMyfiL6qs+/OZvvv/usc?=
 =?us-ascii?Q?gR2FfT+Z1KHWLdI/4aKuf52uwb7Al5FjN0uw1YS2hcr9W8A1Nt6sCV4ls8AD?=
 =?us-ascii?Q?6jKtuhKHqdK/oVaPgwgLjf+Jf/xlmVJZdqaDG6c3vpVs6pGOvRZPvh60l2UC?=
 =?us-ascii?Q?nvTJHMplQ2aDZvvngalL3BymQdFZAKzTM52cJ2CPsp6gRVvYftLgSFo/1Mpu?=
 =?us-ascii?Q?t8V3Ld/KbOWnl7mpNS3pJ9NXv+6u++NMYnfUDiQqLbj4eHUcGmZCEbiAJlQC?=
 =?us-ascii?Q?x2bvcv5X+dphyUnR3j+79ZokxPYrvSklJg/xuYxVs2uikj9AB3ZOTmvRjToY?=
 =?us-ascii?Q?9JeLaYdKQ2oSCMUvLObzXHWYUuDRrfmPqNUMqAWtBlnURUO9o9oAY58+7Red?=
 =?us-ascii?Q?THDFFw2ylWd9oXMkv59m5Cu5SvLZzXMMc9YmdjSMwKUBQnOGbI4Vo8usqeHL?=
 =?us-ascii?Q?7sm27TCYuHiN1zQoV4NZaBnKmh0nIrq6kZOTQGX745oxt6+6/Xq6msfS6dKC?=
 =?us-ascii?Q?D/OAiLbB/0B3ZDfQiO0N8+IBzr3XstkvxPmvjr6bWccslqczAijlbkHYZ8jK?=
 =?us-ascii?Q?t4w9E0sku8STmV0BJldJNqn0Dto19sK/XBrthEydbmZ79Capqg8aN3rwGsbk?=
 =?us-ascii?Q?nYzOA/v/l2wNvA7STcElqk4TpRA8cheHhVgljJQ7F/AH8BEOpJxmv8dCZ7D4?=
 =?us-ascii?Q?R43HWXw8a8VFx/+dEhWoKAEV0Esx5V9Rh1LIIqC69A2N0DwQFiifjXp2rbGE?=
 =?us-ascii?Q?1ldPjVb5ULHE78nDESj2G6QyOqnjkOVf5Zel1w7GF60CsLlsIGr3294Zyqm5?=
 =?us-ascii?Q?y+8dRSyU8lrbxfaHiDi+45FYFjQYk745XnZVdenipoTaRdDR6dc60seLt0VJ?=
 =?us-ascii?Q?p2ce9D95xzGjnx255pDCnVngkgfpe1OTtIxJkzSaDXCyR+ehbKwxloiMBHfm?=
 =?us-ascii?Q?TKGbiN4MZWQgxTFj0noHH75dMxE/AeA6lnLhxZBwNepfqDGyWrblRXRQUtbZ?=
 =?us-ascii?Q?yUccsPY/HiJvfgStfvnL3XqVdRufc15ZqkQEB86QmZIRGAeCPXN/Bc1RG48J?=
 =?us-ascii?Q?ZkFZHpisKLTJXnKFru/rEUV5sNH4EEDUodBF1DSNXmRRn23QOuF+fN65zzKq?=
 =?us-ascii?Q?18P67m2SH0rMe+xwR/U4G38lSPkOeAVh7fCBrt2Kl3jdtjnCWJifVbOusYM/?=
 =?us-ascii?Q?ict6GSgh7b+F3kRlAe6/2QTG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f882eb83-5958-4b1c-bd25-08d925c7f823
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:44.2771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hoXV56+rKB6tu/1xR5WjrPHNyyHpwBwNs8xXvxEsGU6VoggONh1H7kQUS6CLtiXfBNEU5d27m2Ll2CGXmxfX8YtXw5Xmwv35eBNv0b7FXrk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
Received-SPF: pass client-ip=40.107.22.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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


