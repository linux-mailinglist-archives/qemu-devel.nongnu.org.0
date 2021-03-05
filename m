Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D8632F2E2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:40:19 +0100 (CET)
Received: from localhost ([::1]:36982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFN4-0005Mf-HU
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIEMf-0004zZ-1o; Fri, 05 Mar 2021 12:35:49 -0500
Received: from mail-eopbgr30124.outbound.protection.outlook.com
 ([40.107.3.124]:32132 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIEMd-0005C4-Bx; Fri, 05 Mar 2021 12:35:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BscOvyc8IOSNGM2ZDLVNI86pwhvd19ID1Jj72zPO5B2WpRTeNIg8iqkCGp7Thn1QS0r5jbSWS2ttw0fuLipqG1RrWP1IY+EoAdsD2qU/FbpUAaC0JQ1uITkZO7BFeTy5j+B5g2aHV5PW7KW2eBJQfA4OAyAjscMGTMwwEpsicBROuTEySv01W/7Fq2MXv7bGqU4D39Ry36eqQ01llX9IIkkviMvwj5tIEeH6vkV9CdORF8ef7vtD0HUakdGdv2TpO4IWYHcIpFwXuqaGNVM+Ox/uB6o+BEceZhJVjp6io1rh+RpQM3vqTvTcBoELTFh/AT38C6sitbjwWgnu6Sz+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/+shfLISwkOirf04DiUtMpKyo+BE3BeVeHJm/68kK4=;
 b=I9yMeBi1pecMGUDB+ijx/gncL25kW2cDwVwhGqfy0dQxjE1DuQvEPhfWfAVTnELrFYwsggdyLKSqYefyVooAIQG/2KwRrZt0Z32k751blqzzwmLaqt2uQ6/iZ3VdGSIhQQpH1bn5/z4FS0hFB/oJUUWr7UtRC6FwoL4L6NYeu5XgVrfBqHlJvK0ELBMM6NJsJO3zGA+53M45Iby5ZFswMqKJmlQxuFgGu9tmvz/2JquHCfubPYzNfeC9BIPY3w7Af7+sdjIhEb+RQcUebsN8yjsq61vLmKkzurisHsvX1EMMw3Gt8v2ib0CHS5X5PW4LbdFMI2nWT1Q1NJiJRL94yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/+shfLISwkOirf04DiUtMpKyo+BE3BeVeHJm/68kK4=;
 b=bVBtgQdrZh0/AJrb1mTUbirzwpxn3hoTHG245ZqDG4qvGGRJ91GB9b+q/g3fz67ohwroAjm4kEDzmM9S/EyiYC7Z3yMh43PZ9otcDtoiFvPG68tjz5fIn5x6sW7wwyRxqquWBcKgcWr4ubaaTKnPiTR2eoEb0jDtlTIJFu1etMU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4408.eurprd08.prod.outlook.com (2603:10a6:20b:be::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Fri, 5 Mar
 2021 17:35:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.024; Fri, 5 Mar 2021
 17:35:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com
Subject: [PATCH v3 5/6] block-coroutine-wrapper: allow non bdrv_ prefix
Date: Fri,  5 Mar 2021 20:35:06 +0300
Message-Id: <20210305173507.393137-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210305173507.393137-1-vsementsov@virtuozzo.com>
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR02CA0119.eurprd02.prod.outlook.com
 (2603:10a6:7:29::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR02CA0119.eurprd02.prod.outlook.com (2603:10a6:7:29::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 17:35:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b238ec45-a0ee-465d-7641-08d8dffd1243
X-MS-TrafficTypeDiagnostic: AM6PR08MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4408290028DFCEC5B68C10BCC1969@AM6PR08MB4408.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: In9l2GfvblUw5X2n+d5ZMnF3q+A3Gw8YLBBJ071pzDLTfGSphd8SzLBQCNz4/O703AOPmV7Te883f3YNlhFkz5M6A/fN64m8vn8MTMeqULshlCzmlrp0OmVn01w3NiinsJsH7h4ISeKCh08iXPyNi/8ZVTZAemXvo8r4qvHxsWq9UWz/FJVqpq6UbmOY54910WX+TplWXoNLtMptw+9pcd9f1THLwG5g49O/+lv1VD7eQQdxsSR2eQ+eQsG8Cve/bcaxo1XoX+JXGMIJykOYfQqEoA+r5YXo4kroYIMbPU8F4rz5BHKsFmO+D7u4qwhUsdReI18Lekyg4JVPC2kS7UnCQnTRB9h/LQ5LfBFwj3dIIAFxOWrYDDrRqHG1uLURMU3HWq4JYFMqoeYMH/pVwJ9Fldau6cDLLLe/N/Dw/p7I92YnK98RN8tGj+bhpYKB1UgFr3XkhAdkA25WvbPMVXhHX6GYOaJ3lxt7Wb+cBM0Cc7AnzOw8o9dMxCywmdRDH6cHItUSOuH1RdoiTSd3RMEbVvPzuonIJ0faeRv22/ZBXEGVN2ytAw+QmMTAuHCu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39850400004)(396003)(376002)(346002)(16526019)(66476007)(478600001)(186003)(8936002)(8676002)(6916009)(1076003)(956004)(6486002)(83380400001)(69590400012)(52116002)(26005)(6666004)(6506007)(2906002)(2616005)(4326008)(66556008)(316002)(6512007)(36756003)(66946007)(86362001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?avsfbKwDUx92VsIYNgPZ2C4mH+qjUnWCYRfzA9Ui66CMLvvkbpfVFNuqyEq3?=
 =?us-ascii?Q?1WbR1hioGbXWwXJwVIjKKlF27UdNZZRgtDTDFk3hpAd7ZpPxA8GpY0JSKm3p?=
 =?us-ascii?Q?nAs+repQOw4fkI5lZwQnnKLk4suj/InJVVyR83T+yuNoOD2a+Q95ggISne/h?=
 =?us-ascii?Q?UdKVFFT0urwNSBjmh/tyKapZofsFmQA6mc6sVOABh6bAW9jF0s6IYMoVUwAE?=
 =?us-ascii?Q?eC3F2mBkkViodYh8kbCLjisC7rM5+cM5um1mD4nhq8vj1ciBF5BlZNQRo63M?=
 =?us-ascii?Q?AA69uwc/NBqlrT7nBBdlIBaT0Uk1JwNeW9HJ88vPYnM7uw3JtOcHCMzSKd++?=
 =?us-ascii?Q?sw22IxBm6ymt8XSewVMDD37cM1aA65Juw3kAmnoj4G3jsTCSpS1H2eViwKDC?=
 =?us-ascii?Q?GwLodspKj+Wy6tVQmNHP6BO9d4QwVzu+1duKIkp55fvMFMUdLJT6h4V5TYCR?=
 =?us-ascii?Q?1wYDZsnsyYv4Ok5TXe+CeYKMDFWCXGUZeivbCIw+UJijuMCDJWw1x+Fc73BW?=
 =?us-ascii?Q?qgujq2XnRjuC818ii4SE5zFYETKmC+OYiUzYr2bpqsmovDLzIMKYBZtZ114h?=
 =?us-ascii?Q?6EyLaInr/iUzNhB1aM+ispyGe76p5npYYwe5ATDOJNxdSdGL6OCTHX7hIIm5?=
 =?us-ascii?Q?fjVcWDOhFx5KgAcNYFtvoqR5D+P1E2G7xNtP3ZA8AosbtoGWc3P0xR2gBu4+?=
 =?us-ascii?Q?74J/ypMWUz4II7EkIjRZ0lPCw36qbBEVC1Ic7lcm0gbS+8W+0s9R6SpfANtt?=
 =?us-ascii?Q?MxTIBVh5QUZPJ1hbDjQXrNXEjGfG7HGq9FfK0yFSG+EkrrOR6rXLjLf2lBae?=
 =?us-ascii?Q?z4G/zWuCq0PbaqLEFmt0BPxLDxBQpXSAl6eFNiYac0KLH+rJ0/F2AOKjeQTZ?=
 =?us-ascii?Q?ie3BiBqDBZ9bezoN5S2zRQFzfzLpAbmL4MPJD58lWxkZMjGpmc8xaco7K+e+?=
 =?us-ascii?Q?yN+T/qaqzDwr97/iuhiEYk8HmUSrDg2vFPzlBEKkjMLFaUeyUpqnNeIum5Ls?=
 =?us-ascii?Q?yLwCZs5xT8QtQYppCreYjDR0USUJ3O3rxhq7uJRMWq+g46d+V0rVVpDd+uN5?=
 =?us-ascii?Q?rWpYJs6fLaYM86DBpmEMoB1FrALT8GUXq3DRTXj8Nbrt8bsH+aORUrZypG00?=
 =?us-ascii?Q?rbW5q5estZWXo3TxnAVl2QKUVT5VTn5l77gpC5/AeCD6bKef3Evp4Q2YJHly?=
 =?us-ascii?Q?VRU6inlzJKFiQ/qNlkPMQ4tcvlMPlPaOrAiq4hGOjDk+HOWDZOHO5FYGxbZ1?=
 =?us-ascii?Q?CfsAYPQRXYEIRkPAl+t2VOE/Ok904hCOFA6g+CZU2NV4tvsNZsNF07huexPa?=
 =?us-ascii?Q?PYkrynBPWFc7gKLozqQdh+uL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b238ec45-a0ee-465d-7641-08d8dffd1243
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 17:35:30.0778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drcExzDQ2L/yoYt0ElNdYqSuGsdQGmdcD5BQzaRmndfTu1XaBMga5jgDQ3C9sD49SRiaiANjPiu0aHZmTfizFta0juNBv8CMWCicP7CgQe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4408
Received-SPF: pass client-ip=40.107.3.124;
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

We are going to reuse the script to generate a qcow2_ function in
further commit. Prepare the script now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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


