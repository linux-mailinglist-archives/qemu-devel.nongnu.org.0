Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB152F8D74
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 14:47:54 +0100 (CET)
Received: from localhost ([::1]:36052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0lvl-00054f-Eh
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 08:47:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0ltC-0003Ck-DS; Sat, 16 Jan 2021 08:45:14 -0500
Received: from mail-eopbgr60109.outbound.protection.outlook.com
 ([40.107.6.109]:49662 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0lt9-0007U8-M8; Sat, 16 Jan 2021 08:45:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fc3zz0rguwKN8jf+2xTU5wFb8u2lKKSiD2RFbKYebmYL/qeEF8/bveiXyhZkUKUot4MYwHGjmUh0Bwrc3VVGyV4K2iP7YZTv1XMLjaaFNQOl9xTiK/pAHHMrtz+laVDAZNm1lWaR8Dpkh0LFUaw+V+deZWyzq4bOmYKo13AAehzzh2fF1r4+YwWOk9DpvFKYjLAjmPjYVE9XyV0IJSXoGCpoZLkIajfhwoIRh4cuSXoFG4g1coXeZ1PdYLmM0AAsi6tWmdxx7y3qYSMjyzgWhUjSgnPjB2cdZLf/pR7/xzkdKt0EGoxeustm0s/3S5rRpuYkXXC3mKE2Gmapg/XDLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cid+p6yBnXUtqkTyANgudbh1ybkLKSIR+Rr1mifiMuE=;
 b=H7sY5eypQ2XEzgAufpmfXhlg0BuMK3TgN2e2OGOSXeL7jNs8bkrmERvfd4uGcvmZnomCr3of5TFUheEefDQQ6+wK4lLWLdnNmMvbw8hGK2v/o30sU/k+5G5P3yLPERupx44jAV8/Jbiz1yvu4Te83MJb98UFXZ5TXmMCAtv3M+6kE03Ro7/DWztvZCKqK5vjJS7sghEMNfX9QgASSfKYyI3LZ2TkTu0vF/KctZTqIu4pQSysATenkdHPtGGq13PyK5Ulg8QXbJ+35sY4/Es3BkdahCkdiOPvwYIs9XlmJHq3v7dDwSZwmAUa1SLfvJQE+jyHyfKMLAPI3TEQ5DxTMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cid+p6yBnXUtqkTyANgudbh1ybkLKSIR+Rr1mifiMuE=;
 b=lFJbP9l0Y9jp/VORyE6VBPqkEW6lONrQOEwopj8uRXUjByjWxEfq9wDIxhvzDWMTOSwKEy2koqqC6z+PNfsEvZUkXzhCkwoTkXF9unsLqxDbDvI2dDwaOK5Rxp2VHwYFwUFQlwyndh7tAlNECauDOmdxFKReXYiCOf/1m94Sdrc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2098.eurprd08.prod.outlook.com (2603:10a6:203:4a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Sat, 16 Jan
 2021 13:45:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 13:45:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 04/11] iotests: make tests executable
Date: Sat, 16 Jan 2021 16:44:17 +0300
Message-Id: <20210116134424.82867-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116134424.82867-1-vsementsov@virtuozzo.com>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0019.eurprd07.prod.outlook.com
 (2603:10a6:200:42::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0019.eurprd07.prod.outlook.com (2603:10a6:200:42::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.4 via Frontend
 Transport; Sat, 16 Jan 2021 13:45:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ecc5dd2-da3b-42b7-f312-08d8ba24ecfc
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2098:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB20988A3EF0E5FED9DCDA5F6AC1A60@AM5PR0801MB2098.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:206;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fK7SEFsZFvi7OZR5/kqojd/B97lzOKqYUliXtlgHdJLwCDGzE/06mnKDVBO9V6FeQU4liWM8poKRz33Gc8QpLwuDyIzdqj4fsV/A/mkyuAFcpeJua/GixcFNwVv0IcP1BWLMzPrs8RKUfXeRtIIEmLpKETWImAubbgEL+/KS8nrtFSafLqkrEpEUsCHpICUryYgfDslNCWlkK79kd576kwogtz+pPlC0xidSNsXYEuGcLoUG+ssnoOLOiCGTahdHHAU5uX3t1C8DOTCNDpDgtUcnlCWCIlVqUswNffGY6CsWwAr5n8X9NWWFkZ25SvFm9jrFDfxyUVeRP2D64QA9LI6aeRXnMk64POqhUvgHrxta+RGips96PFe0YfnbllefUK1tWSx2t2/8ZwM6CtMrDGB8XNQKwnuRIl9oaIfsyqiO+iwE1aoLho6mJN939O7apICQVJXsqwhmKWyGWgkyxXfJrQYSvReX56JaYavjlDrT1xkbif6NlIbqlHz3meos6m8dAtbEYps06qBP2tfjPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39830400003)(6916009)(36756003)(83380400001)(66946007)(6666004)(6512007)(86362001)(4744005)(1076003)(66556008)(5660300002)(6486002)(66476007)(6506007)(478600001)(4326008)(8676002)(8936002)(956004)(2906002)(52116002)(186003)(16526019)(316002)(26005)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EjnMchsk/81Tm4xCKW6WpppIBc5LCdfuMmJzw922n3hIIs20XFA8dqJfKdkC?=
 =?us-ascii?Q?OHkGpr8wJcg3nu7OMWm+1SnUwx+7yOZiS3T6ConpomrhH0Vp0V7DrGrafQUT?=
 =?us-ascii?Q?J1ok1AHkmBTmMwJofiWdn64qzaP8TIKZ8PJqLdAyawoEK7j5HyqF133M36Tl?=
 =?us-ascii?Q?gkLLocnLZiy/6CjXo0iSF30jhkJndbjmFzUB++pZTyZ8ucw34+hcUU1mecYa?=
 =?us-ascii?Q?5lGcOCTa6ZW48Mau96W+invRJSLyC/kJImFpBMbQ0ADs2fXyanypi1M8HCac?=
 =?us-ascii?Q?3k4Xf/Wv+FZ/h/tYqK3UraPItvSoRFKN/tm0zKm58Z+vl2iF/lVYRAJocj+W?=
 =?us-ascii?Q?gMFK7tqTZi+y+lzrkjqVrDCnPYIr54SYfBfVBWIQwNr+Bkc1mzovuRWe+RL9?=
 =?us-ascii?Q?qxY8O6rSL4iU9NuF4g/yAJPIzJVZK5PM2qB2BSnyDZukXpLFItkoWMoekd0h?=
 =?us-ascii?Q?w+7s9XgXZd8RfJDslWPDJB9Jno6wwGHYtKAa3g1cSt3iVBO6VRUcr1mGFQ8E?=
 =?us-ascii?Q?+Ago3A7k6ueXc7Kxp0Err7iFIDy4+qRBwkaXJc2FulrZQWQ3yiAPXWFFohHg?=
 =?us-ascii?Q?uDRdchvU2a0WAWffvTEff12RJYHtXj0EXYOisc1wZZFfFOeEIvxZYCEsDJab?=
 =?us-ascii?Q?Wm62LyRDiYoBIzCR4xtVbBWu+bTW7AhaI9OJ6jnsnmuznD0RkDq0FtJ0qByZ?=
 =?us-ascii?Q?Y4Ob11t3Q3aN0WCXE1EIQzOl12p1sPm9Jz3p/iSJNA8STSDaYwSEB2BvoWmz?=
 =?us-ascii?Q?2PET/og3sun5vTUAwyUsKitXVBK2uTD8X5yLGhCaXMyQOJTO29NwRtAuEaJB?=
 =?us-ascii?Q?wI0kEkZ08SIb8H6tWIMDutqlsUPX6lxK2VlDgpf2A68r8upZNzBHrUEdQPzI?=
 =?us-ascii?Q?NRopHOEFFp9f4RbexpBJUnCsB/KTdODNtEniDIn8vvDb/i099WTcxDTunvm5?=
 =?us-ascii?Q?0aOko8f+89yQsJSwz70uj1esomgDI0kZNgEU9H34tqbmHq5K21pa24czPlY1?=
 =?us-ascii?Q?F9P2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ecc5dd2-da3b-42b7-f312-08d8ba24ecfc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 13:45:03.4024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQl531khrgmqkppkR5f1Wo72uOOiTBL7NK/U+d+w/4h7BOD+wZiD0mjldRBRoqPKeD6MX7hVpGG7X37SrRHi/ui/K0k8xIEVswQm7mx7mVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2098
Received-SPF: pass client-ip=40.107.6.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All other test files are executable. Fix these.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/283 | 0
 tests/qemu-iotests/298 | 0
 tests/qemu-iotests/299 | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 tests/qemu-iotests/283
 mode change 100644 => 100755 tests/qemu-iotests/298
 mode change 100644 => 100755 tests/qemu-iotests/299

diff --git a/tests/qemu-iotests/283 b/tests/qemu-iotests/283
old mode 100644
new mode 100755
diff --git a/tests/qemu-iotests/298 b/tests/qemu-iotests/298
old mode 100644
new mode 100755
diff --git a/tests/qemu-iotests/299 b/tests/qemu-iotests/299
old mode 100644
new mode 100755
-- 
2.29.2


