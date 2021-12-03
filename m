Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845A346784E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:30:31 +0100 (CET)
Received: from localhost ([::1]:46186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8dy-0008M5-Jc
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:30:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Is-0002O9-7q; Fri, 03 Dec 2021 08:08:42 -0500
Received: from mail-eopbgr40135.outbound.protection.outlook.com
 ([40.107.4.135]:40808 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Ig-00071Q-8U; Fri, 03 Dec 2021 08:08:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhDI4fznsCe6lAqJOHsxZm1URXFL/PuRmi5V6hMOFrhW4yKdv9wK6woU5Qb+SssJJCS3kiHOIHO78sx5IrJlG0pcu8WFmNkYMAiQUYf3fGFLY8ISGI/k+40ujNO76xDiK8CaNzRXsGcejE2C/ndDIbKZXyuNz6S+OexS2hJYBLkvoUw8dQlOkZw9EsKjeCR16FzjPnhQJu8ydBA6+z7Wh7AJzrGt4JIRAZgMpyphqh2qX1crXQfQDwU5AHDePpEEhDhXli+WxQ+fGWdJC+BRteqnZ6Tm7+5aKNR1JuSGuHQEevkgRfgKgbheqmuNXmhvut+TxQhY20OmyuQXJch8Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNBEUzaEKpyy3EPJPJuLjstFxgZdcUWJxXmmbd+oSZs=;
 b=lqUptJpn9e3KhjAp3fiNPmIFyJ1tQe0ZlndBC7yBm9MjJv89NUD1+Q7YKLg2RZFo2BgBM+biaPEnsv3rn8d/5tOH1GcKH7F3DJZOVAzmdQs9cOwEpczVHq+YPBZMeM4pExdHF6bDiozQNOSddtH8mB9rkpOcMgq9hsl0TPUm80i33IRWPL5DQWsbieXagSIrT4FWhdazmOwJ4YejFzkKMaQGrMSN912MDSRXTlbgM0MC0PD7/tdolERIfax1CUGv03TyBQDki7v/CK9mv1klkdbxdvQuu7l1398meSGFdYaTJlRlKBzH384JgseM4iQhDEfwJlX3hvTWdVck1pDpUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNBEUzaEKpyy3EPJPJuLjstFxgZdcUWJxXmmbd+oSZs=;
 b=cuX1dKPeFclVF63+GeZ3GyEkJOxOcX0pHgQjr6KyGP6w5Hcy9u9wW1WCAhhSlcdmKLnZEO+27ThIIdEFxrhPFxWp91pBB6Z7uJnX6tHNlU4iaSz1R/29XR64mzGT0M1roaGnDimdV1Xtybg/UW6Lv+2c6EwfN5CaUZsKlQ8Kx9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4515.eurprd08.prod.outlook.com (2603:10a6:208:148::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:08:13 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v4 13/19] iotest 39: use _qcow2_dump_header
Date: Fri,  3 Dec 2021 14:07:31 +0100
Message-Id: <20211203130737.2924594-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
References: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P194CA0095.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::36) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6P194CA0095.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bb5da08-df07-4fb4-eea5-08d9b65df800
X-MS-TrafficTypeDiagnostic: AM0PR08MB4515:
X-Microsoft-Antispam-PRVS: <AM0PR08MB45159DED6E7D0679E6CBB9A4C16A9@AM0PR08MB4515.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:47;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 45o6+LAIbA0R+DIRiWraOYVob+4h+ekevkqIf3JjTM3DFjpEJGJsnAGQCj40GFhXPopo/nM9isJ8FbU7AX2szQxrNS1adZEPzSNhJNfj4la1VKttzZJaFdEWfGEyY1az9TdcHwxjc/iAb20mBm283K/x3zpA8lIm55RqyiQrBW06WQd/lciLQbfiwyP5NL0/8Ycr6wGrB80YldqfZy8xD1EYuuyVDdGZGO2K9LDa552HqE6KkWHOVrvKfjR53JWuX4qin5Auo0tum4JB986PKQuMqoNo7FaulX5OqbX4F5BntBufpxPs7odCe6iJMjom4cgrG3cbZFDqtz73u8AzQUnA+sVhxXD7fVm+xdiC14S6llQPw4cw9aNHcQ7Y0XTELY65zs382JZoajALBDnREyf0Sa+G534WOs11U0trqWnfNLBgbTpnNXarUC/uqCFLp9UDVe4723PPvrcb9n1g6H11ImW+gCgxWF/Zr6ZbyBHF5T4OQHJrpD+isacKdk3qxzEdqwXM19fz1SrmtJuQOWKy6xvh6jb9i6F9vod0YM2MlVXzwQQeEOjxe05hn/7XTUt4fnLPJe54oGK6lIaLQ1CghD2R3xms1RuL3rcGMyCdraaR2R13w/b/DMvdSmN34YSXQcwnjPQL9Ekv3VJT//FGLOKVowk9zuTMju5u2ey/8ks5g3OQBNBpdkEP9RIegi0DNqTxZlcfNJ97L6zsww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(4326008)(186003)(6512007)(52116002)(6506007)(1076003)(5660300002)(36756003)(86362001)(38100700002)(26005)(956004)(508600001)(2616005)(8676002)(316002)(6486002)(4744005)(66476007)(8936002)(66946007)(66556008)(6666004)(83380400001)(38350700002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+G8acmD325mDidl/vJkpSYX1OTLxxZZ14eCEJW2nUW3ULIfTu0wIEuAKZgWK?=
 =?us-ascii?Q?Y1mpDcmC7ymlRgVHwTUeWYZBT5eNqQ6gFpJbJvnUbbbHZC0s45/0rkyepkBJ?=
 =?us-ascii?Q?ouSmiApFq9/7is7salqnFgAoGMBSw/nCDYTgD6RjUmwWpe0ZB8sJkdAHaNXm?=
 =?us-ascii?Q?hYioDXI64j3a+cT2zomu6Zq8RLrZn5k0NB4LFTrH+XVZsa1NEN3MFLeLdISj?=
 =?us-ascii?Q?qTlPGc/06/xR0Zb1TWGt45LsHoebJTeofJAMIrcOp4PMui4QaYPdhCwQuUPC?=
 =?us-ascii?Q?HNqQwK8ONuOexS3w58T9mGPc60fR1q/zxotmT62CLf9bM7qNA+fl3TDJ1kDu?=
 =?us-ascii?Q?mo5wS6pfH33awcQjsoEGKNq7DmX7y5zAoPM0rn5po7Iaxhh1bvYdvAbhrLXY?=
 =?us-ascii?Q?tmiH5vgftp/49IU2QQ5z5UZpTLRlY4L+ucdytl3fJfPn+lJo0V7Dc3M2sDxZ?=
 =?us-ascii?Q?4utUaAo8Ahgb+JqxgU4QWDIemESIVcBCma6YypzoXpEzjXG4TgRPKDfKtZpU?=
 =?us-ascii?Q?CsozFGeBQVjdGTOMkMdGqdLwFbxxhnABoldgDs7e7CKo8JdK9X+yxoYV/TV0?=
 =?us-ascii?Q?KYXzXHE8FhHBh3xPm/SmV03I0ueWUiUwGD1ch91MOaGa9VvBtfewA8dKvpmU?=
 =?us-ascii?Q?91mHsWi8lXHK+d4VSnev3zwRk1eiln2efhJI88gX+lbir1RzVISXFK3rMoaN?=
 =?us-ascii?Q?lSotMwVzrxe9aU/y6Kz6Frxw7zFaSo272VgHB7u/AafgrVNtdsZkdEdTPv0m?=
 =?us-ascii?Q?c0PoLCgnf2v+0yn8C3HqhqoHkdxu3AQLW58L1Fhe63gxRZ/lYKylQr2/ZtUm?=
 =?us-ascii?Q?KYKU2ZJd0Sbw7uJFMOCIJ811pk1qCHJGLHT+mYbckGZmZlFtsqwIG4QjdUm9?=
 =?us-ascii?Q?RwSkPGMsVByQN+lnUUDqQNbfjLnN6A2ZmC19PciuQmNFK5WI28KVEpr2OZ5Y?=
 =?us-ascii?Q?SyLldlAT9ELCnc/Rk2kXSYrEGwqq3MyA6RVFaFNvukRRqGwY/6IXFwvSwvup?=
 =?us-ascii?Q?Ag1ouXH2XeRYnmSgSUQzgFGiYhGi+SbtQg4O0WrKQLvvFx0xVm74Gold2Ksd?=
 =?us-ascii?Q?8W/GDwYZBJqFfmMpV9xrw8gpQyqDSGDBPAgh3ajsZKqv7YZvWaq7VFa7lUpJ?=
 =?us-ascii?Q?kHAN7whqc0RA2TI4wxj74H588DJreY988IWLXVIKm05DEJ7tHvCxwNIBhF25?=
 =?us-ascii?Q?MjG+Po8UsqcA7wLrrPNDAFpBR4gxm3rPf26xTlJ/UmlETt+VrDJSKITYjJG7?=
 =?us-ascii?Q?pIa/t6t82CywCpT3VyPT4gnt+nzX3Oe/Q8e3Eg47E9yWmY+ljew0qnAFgEtt?=
 =?us-ascii?Q?aWYiC7S1oH3t22DvOoh3KwkQR4tjhLVNPBcb/h4bZ+u83YTzKFspZvAE3Mdg?=
 =?us-ascii?Q?/I0tDBkUqzy+q5IA5Gu3e7bjeiJg46CROqm5G+Irinp+0trNEYsCIs6cQlzs?=
 =?us-ascii?Q?UFBEFARCUr3+cje0TCdPRhrZF/FSuVhmk0VCI+wO//rzUKu8XU6xKtS/FJrF?=
 =?us-ascii?Q?l80o/rn7LT5K1OXs3LnwWrNiK+hoW7yWlGo64c4DkanBrbiQj4TyBfd0RiTD?=
 =?us-ascii?Q?t/FDxwwbTMIaEtzTP8y71qmnQg9ZpWEAJgVUCk5U1xazutZekdnMNL+HN6GG?=
 =?us-ascii?Q?8ZFXhdBEFPCPFuX1k7NpCsB1XuHOxFtgCAoIfvtkXuxJ6fL7gXTZXUY0QCPb?=
 =?us-ascii?Q?ayx37A=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb5da08-df07-4fb4-eea5-08d9b65df800
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:16.0621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2cEDwOTA14R4+JSgvPNoGTrpAvyFZ/HOwKHv58QqT1qN49G7vtUpXn6PueEzaQdQ9ERWcgJYLS81frk35rRupCcu74nRblciZC6h+jOV4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4515
Received-SPF: pass client-ip=40.107.4.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

_qcow2_dump_header has filter for compression type, so this change
makes test pass with IMGOPTS='compression_type=zstd'.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/039 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/039 b/tests/qemu-iotests/039
index 8e783a8380..00d379cde2 100755
--- a/tests/qemu-iotests/039
+++ b/tests/qemu-iotests/039
@@ -142,7 +142,7 @@ $QEMU_IMG commit "$TEST_IMG"
 
 # The dirty bit must not be set
 _qcow2_dump_header | grep incompatible_features
-$PYTHON qcow2.py "$TEST_IMG".base dump-header | grep incompatible_features
+_qcow2_dump_header "$TEST_IMG".base | grep incompatible_features
 
 _check_test_img
 TEST_IMG="$TEST_IMG".base _check_test_img
-- 
2.31.1


