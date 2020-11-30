Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5792C85F7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:57:15 +0100 (CET)
Received: from localhost ([::1]:57452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjjg2-0004oP-Sv
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:57:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kjjQK-00073l-LU; Mon, 30 Nov 2020 08:41:00 -0500
Received: from mail-eopbgr80115.outbound.protection.outlook.com
 ([40.107.8.115]:22148 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kjjQI-0000SL-6M; Mon, 30 Nov 2020 08:40:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oI1bWKmmIQuVgy6eXJL+CW7TCc56NSU6besa9pR/hDyxSypKGCePDn6Jn/FdMpF+l64GU4sIRCXRgNq7aY7Hv2JxzlgxlGHCZ1s4s29aO2Ik8FEGdGwujJhxygI8EH4H2XL9i1E1vLfq6Qup+Yl5KeJF62TUA6xIAXNG49eKnlVbvhRBRSPZCe7Do+Pfuwipt7Js4UEPeTPC7KgkZ2kVpfDRIXJ0mX8gfi//uGKFUQjzGIwBr2e4qGPSxXqdYoySMRPu9YQOJQha/174WyXQdFzu423KvY5Jkd3BhsMkzkWM3PufCF5mdN0YukcwMhBDc0WdZfileZ0jfrxYbqPy0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZuFLQIa9CZxiMx4cHqXBLH9EFd6BBNu79wjleXVldw=;
 b=DWz+WRwBQstO4WlteY2atYNapPN54+x9NDLrNfxw93JFYR8GQpA3LSOdBGBtnqmKUCmQ6ov3EmFnd6NvZl7m+9NptUMM0xgIqBwdzuySluo+igymdXXY1qMSRYd4+Wh9aFX38zM/GUcediFWlastFI6ixTWaK75IAQYkv2h0t4bxFhkG3YOhay2nvQAMelHw7hKL1VBhxyWInxQWjT6gr2IFBaggyeGfJLHAMfx4Xl++7HsjLVRyvD3bEh7kSIJzs6P4SYLX6xtcLTf/GFQcQ6uiWqMvQBvQWbPdF8FdmEala75kEApStEM3P63SNfNbs5t7yU9D6RsVbMR3oxihsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZuFLQIa9CZxiMx4cHqXBLH9EFd6BBNu79wjleXVldw=;
 b=n9MBekO9sZv3kCPmyTsFHSoNiG6HWxNxA/xqFtLWB5lrntLUMB47zhWMwSHU5PmeFtTsHESEANVeNt2uDnB8L0O/Z7mZXB6NvKkoV0z38shu4xqfNU3rUFELqWeAr7+Nu8HyJJ0uCPzA/ps5vp56KvOxBgo0pF5uxDCFuBq3M4w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3448.eurprd08.prod.outlook.com (2603:10a6:20b:50::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Mon, 30 Nov
 2020 13:40:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 13:40:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v2 3/8] iotests.py: fix qemu_tool_pipe_and_status()
Date: Mon, 30 Nov 2020 16:40:19 +0300
Message-Id: <20201130134024.19212-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201130134024.19212-1-vsementsov@virtuozzo.com>
References: <20201130134024.19212-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR04CA0007.eurprd04.prod.outlook.com
 (2603:10a6:208:122::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM0PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:208:122::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23 via Frontend
 Transport; Mon, 30 Nov 2020 13:40:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eaa3999d-b914-4a8e-4436-08d89535876b
X-MS-TrafficTypeDiagnostic: AM6PR08MB3448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3448B0012DB894B4D5A77174C1F50@AM6PR08MB3448.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:63;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p6OoeqfIDiFypVXKuSta2uLAtYGEZqe+HSWiS6ciLdSLRVeIXjEub7n1rQyC3rfa2Ab5jFqnDSRnFZ6yU4hix+anZmO8n7yob0xeOH10DTm3u7lqbQOkk4YrmVDpdlrKplk90SSmEXVfYXGk76M/Z+q1mAwMlrliyE2IVNxWx5nT6oCl1ElDQzkXhxatG7aIUdfAS4x88y9mT1DcGYP8RkMFtzKlPVVlY95/UNlsExeKxLbvuAIV6TM0bBKf6SxFdjxgcVMC5Rj7ZDZTWM3gBm1jcMiAb0ow6udDm8+PvE5P4MSvap8HDCXi5gxT68u3qERYItus4ip1IpPbuCIjVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(396003)(376002)(39840400004)(2906002)(478600001)(52116002)(4744005)(6666004)(1076003)(4326008)(6512007)(8676002)(8936002)(86362001)(107886003)(2616005)(6916009)(316002)(956004)(6486002)(5660300002)(6506007)(186003)(66946007)(66476007)(66556008)(16526019)(26005)(36756003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KcdWzPtWf7gi8Cni3df7ZjP8wgcloS3UjatFUQiuFsU/SAbw6VnfNFTmYLIy?=
 =?us-ascii?Q?mA+7Vf97wi2enU5ZxMjSjX0UH8Axugskcaqa+o+Ilaw2pPfqhHjFlSyuZ253?=
 =?us-ascii?Q?9RW8+LDzQeHJkctynpqAcmCgulAj4tdbc84f6pjwLVH0VSpoRG5APer54UN+?=
 =?us-ascii?Q?uQ2syodwuCtyBAKvr+cl+YInAdKBCxDrYCr8U8kOIgc+HxW6MEevQjyn9wZ5?=
 =?us-ascii?Q?XOtC/Zx0X1O1AMafCZfHCsibPmMs5fkyzZnehy6Iwz+IK51R74Z7OEs7A28n?=
 =?us-ascii?Q?a/KfaKZOYWusnYx8ug8kHUm3cxOH8P9TnZ2Kvq8bdrmgeeXxmRNWsp+jFD/9?=
 =?us-ascii?Q?Bl4TlJuBgdG5Cmpl1VhQLzbRfXjOcBIRL7pZWupA4ujAtYd2rMIgieUyvVGm?=
 =?us-ascii?Q?yxZcyIex3XT4mHAR0HoLvYMn4nluykN15ZKT4/1KPDmrAtUe5TReo43JJ93b?=
 =?us-ascii?Q?YYbE/D84Ym7Zf+72XRoP3CQaEk1r2RlXABmOG0jD08PNwGYr7q58QpZbXIj8?=
 =?us-ascii?Q?1vVlCQbaEV/T3ATpiAiyXfDp3o4jAKpyJqiqlA2tI8TyVE8PO8m923FRkntK?=
 =?us-ascii?Q?NErMwUvSH3+zJn+Db1cfiRpjKXqKtchNmUGj4UWWjJvO2989VBlYOHC/d9Ca?=
 =?us-ascii?Q?4QXbAXfMX+uZ4xu/HpSYeRT10Xjsh9xD5J+x1qWsVs8h9nQJDcz1ouumqXhh?=
 =?us-ascii?Q?jwvLOZTkrnZILVgTKoaKM/wW23aOU2yCknB7pNjju83S8SqPn7z9cBCGUhte?=
 =?us-ascii?Q?ekANJFsvDlOvdQruYrGdmVcM+7mqLkqA2z4ZM4RIbAsWXOj1FOrS2omrlJ63?=
 =?us-ascii?Q?mGTqrEm1TBtgs8jgwa4AKPtgCdTjABnohmDwGedESaTnaoF8zk3kW8HWex+O?=
 =?us-ascii?Q?/XXmQdVlhd9EwyAGegjyjxfTPNSyve06zza/xX4WN4f/vcEdBW/b48vHlDJz?=
 =?us-ascii?Q?ohSsmlcMlykmbnLEbEVkd+Bj4+rS82ErAhU7BzJNtsu7mYg0Y/04rxa5QeKh?=
 =?us-ascii?Q?oMly?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa3999d-b914-4a8e-4436-08d89535876b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 13:40:41.4696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DstQDlYxwaXDevisGgwXxlGHjZN2F+gn4econVXWx8qFuHzdcWnvHoG1vGt1byeHwVhbMU7cltE1PwKoioxmyczmanLCCdOXMGp5n9ALguk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3448
Received-SPF: pass client-ip=40.107.8.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

qemu_img_args variable is unrelated here. We should print just args.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index bcd4fe5b6f..5ebe25e063 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -101,9 +101,8 @@ def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
                             universal_newlines=True)
     output = subp.communicate()[0]
     if subp.returncode < 0:
-        sys.stderr.write('%s received signal %i: %s\n'
-                         % (tool, -subp.returncode,
-                            ' '.join(qemu_img_args + list(args))))
+        cmd = ' '.join(args)
+        sys.stderr.write(f'{tool} received signal {-subp.returncode}: {cmd}\n')
     return (output, subp.returncode)
 
 def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
-- 
2.21.3


