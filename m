Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB405680EEA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:29:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMU8u-00015n-1O; Mon, 30 Jan 2023 08:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU7v-0006om-Oq
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:15 -0500
Received: from mail-db8eur05on2071e.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::71e]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU7t-00069g-Vu
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5UYimeX3s91W6Mp4NysXuMjHF5iWIuus+9BeIDqm7a2rHc7++WN1bhITqV+4XygiR/CvIOXGLADctCSuOwibUQ/IBRkn0DRWh0RAWFqSAz6BAMpTCOUZijn3E7lEFBnR1U+Ym7VRWDBQtqZBFda/PgxqwJT+MRL84ax75/0xzVS8SkUyb/A0/6eGZTQutm3mbP3UWaBNGBe9X63yW5d4oF5fnBew0pc2bltAsca83GpI2DC8UNVAtK4fHHvC/fGvcl99CNUM/uVH+32mBcQXW+yFJo7Et5ktaINpKk+QayCx0X1xIFQuMhgpX9Axf5kXaXKo7jD8jmrvh1KtZPrMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9Abq45938CGnKEaQArxmSlaen8sO/agH+n/BVwCof0=;
 b=M+1+1L4WxBg3Uup4C5SgVimVj7BuwREeBPsuU1FBfMWotQkbgdqTiVXnxcPzMvx/Oe6Pc6KigC9VWmQaVWDn8Kg0FVmLr+W8X7KT17oJymuA0S8841MMEU4kYkckiyIjLjPk9b5pjqOvu48/2kHC5YkD36t5DywU9EP07q57KI3jY3etAwfG0/lPbhgxicBIzk1b+EkKADeCelZIK+HOaP8qUNeqWPVLahYNS2gGtjS762NDoBZgSxFTXP0q0voa9s/Kw/oTM9O/IK2kP/KAhBqU2NK7LTYdvE0Ov9ZUhnhTK9kwUfkxOjUfnimbKqZJ60PiGtkqTErLZ7gxAxxUEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9Abq45938CGnKEaQArxmSlaen8sO/agH+n/BVwCof0=;
 b=J4lNwO0gRFVVCVg4J0Z8e7DbTYdFqak7E1a0RDL8BDFsK6bzp3d1eQq/31+VFK7xwvgA9aYfmiRhEINyKGfRmr1hZzuGEa2FY1D+KvkNHYxnMPSEMMzhc1/MtlZFJNwlc4mOOBKkY38f7CZfFJw/pnpwOYdAUOFvjPUgfmIkJVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DU0P189MB2225.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 13:23:09 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 13:23:09 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v2 1/9] MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
Date: Mon, 30 Jan 2023 14:22:56 +0100
Message-Id: <20230130132304.2347-2-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
References: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0055.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::27) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DU0P189MB2225:EE_
X-MS-Office365-Filtering-Correlation-Id: afee850b-5c52-4f6b-239a-08db02c520ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Y/yewFbxh5Zne6xFEYT6C9sZDlt9upmFtrqYkPHuVNJBmQViAKeoiutFIhWroEREosZyX3nmySB2TL9Q10qsYQHAbDmKnyg9llyVA5B9sErmgihdM4Rz2qVav9vzLCLHXCDtH9PiKKoDR9lQXIhfSP/98StSjJI9bFQLegUf0VI/NSNMqRNhOXqF/6LXeLHaAUO7P1VX0WVjNk0oxguYnNqOSHPeJV+YJyHCcnk2wyb2UQ2b3oalwfe4L2DTKV0SVg7uu9j3EYINAhTpucxIvAsLIXRJWP0OmeXVPG3bJ1IUnbPAKBJo3sGPJqLqCh81Dj4fovhMUFGUM3WVOnvw1L/dxJTE5C02TuTbzvETEEFuYwhdNni8F/y6CzlqwWTuqPKauEIZF2i3FKKnkJsgo/ebnb2W/pH0mQszwmmPVvRT39OjLV6twf6pO1k9itviholdxiIblI2gWJWELg6xJGYoMvicses1+Qpx4XdhnTvz4iSDKf6t9JJEM+FSuANJs+IP299dQ0hZynv8SVrBRklYq3BQRvQfDnqGQPZbiEYApnzFrKmH1p8ZZJiiA+rL/bwhJhQlbkFq6vK1bUusIaVpehYIHNVnIk3I3KglvID0lH+MIZyVoSCtQXCakAFB+XpOSuepaZ9ZPYepeQ45n68T8JiHqoTew6gKjDrnQDjSHLk+JzpX5lB+SL5Y9mavjPE5AUm1dEEMtiP8mocm17ZO/H3g1HHGEu+xpCdDz8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39840400004)(396003)(346002)(376002)(136003)(109986016)(451199018)(70586007)(66946007)(8676002)(4326008)(8936002)(38100700002)(316002)(6666004)(5660300002)(6506007)(1076003)(26005)(54906003)(44832011)(186003)(4744005)(6512007)(66476007)(41300700001)(66556008)(478600001)(36756003)(2616005)(6486002)(2906002)(86362001)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HR6ZXvHe4x9I9Kxfy1A3IyCMvfl3qjaV+Kjy1cSJIwfuS5e7m8gVFfgy2eUO?=
 =?us-ascii?Q?YxJlw33FU1Cx1S4NVT4pjGRXmDbz3+eI8prynfWOYrDLrhscRd5v0bp//r/m?=
 =?us-ascii?Q?qDb/j0rXXoaFjdLhsf306ZEC2xkgObsGpIl4K5r8voOj0zBDRFT4CRs8cSHQ?=
 =?us-ascii?Q?cJsxzlB0sQ7+1lx8kDFdt+rYVvZ23XApKFnyxtxvUwxt5wlc6BjbVcviibLr?=
 =?us-ascii?Q?NO4gQXxdSXr65lvTnW7Kk0CI9vht77p2NXghQVFbB942IanHZY/9u+8xxuL3?=
 =?us-ascii?Q?m9c+OIhkHPWBNRMbY2zpjIrLWVLb8y1NkcHv2zDIgzeYgbQI4gZP72lgQdJz?=
 =?us-ascii?Q?t+5uIURPxvvlsS0IyAYQKHsEec9KmP2Z5Xx178jfby4vxm9RkYbMjBYrJVec?=
 =?us-ascii?Q?W5T9SWpOPWlZisP3g0dzOSg7wZxYXfPW9EMeudMgtxQSKd/6Q94XGvw+1l4z?=
 =?us-ascii?Q?EIRFGrMYgvqPslBtAztWY4zlar329P082ITwxgilk+UgQNgbhNvuRMaT5BEv?=
 =?us-ascii?Q?sR/gRFrHUk3cqGumcVaF5NC9Zq4cytl7glHK0WM67uj475FeZ8lYhbNwvpmG?=
 =?us-ascii?Q?8OXe/PMuMAp510Vg07O6yV5oydIrNdVNHF0Xj4lw29nPwVqY50yZAX9mllyK?=
 =?us-ascii?Q?TWoMcCBXwrzBGeGonNiNKru2Pb8K8+fyecqRBNDU3b0OiGGlpYH1u+0Ydwlz?=
 =?us-ascii?Q?/WScZGuKEwSOUDFRsQJQ/rX3MEMDgkBp0h6U1tVEtDYS3rIGXAy2MZxYhbka?=
 =?us-ascii?Q?6I5tHHzalNkyiruVRfdGczwr1Av3wkxUNj1EKPl2S83IMF3SHh4FdsFGYekN?=
 =?us-ascii?Q?qEMygfCI8iF/zxKUvRFaNnCJntX7zDSYndpVLiY65ZaH85rhvhhLoWSJKYCj?=
 =?us-ascii?Q?9tn9ewrmmZG6aun6GzSZcpgiDyGOR/RuP/tErzEuOBrfTB1hjLvn5VBnuDoY?=
 =?us-ascii?Q?LsDLs2dcK/g925pyi0C8bs0t0iqMZ+2urk09LMpaMt4P0oFb1liK929X4ZKP?=
 =?us-ascii?Q?Y5fdD/ihzlrPxo5emgCSUJH/h82tfjQW+tMg4emy2CZ79KxeSdDTzT1CNfC4?=
 =?us-ascii?Q?9nQ8QKyjeGXPO3Wwu7b7PUO9rIlpn1X3Dze1t8rp6DVVM5V76vFtItKM/1EQ?=
 =?us-ascii?Q?FyEptp3XiXngYU90GGkq0Tv/Ciu+1Z6fYGKno0YuxqRaESRqo9x3cEBvNtHF?=
 =?us-ascii?Q?HgGEXS+uzxKzjv7s0FadaKHsCCgLI+SEYd1f2tKUIDffS/9JJ1LJIYEcWfEI?=
 =?us-ascii?Q?TXtQeaFWEWS8/muLahdSDPqLZF2G8BcZor8D+JXic9TecLBaDdHbKrs99+0U?=
 =?us-ascii?Q?g++ER25TsFNWMVqUxXfSla45pTfMCFIqKlcqd7q5P4J1d6iYgQP8Pb8uAo1s?=
 =?us-ascii?Q?NH5we8SjiKICEyP2hgBPL2hkXCjn+WQ/+DXkTWYxXOoAoRie9vKI4A/Zg61H?=
 =?us-ascii?Q?g7Z9jsMwL7A2wJyj9VgSFcTnHOld1DrITgkq/97JIpRvYxa4l2zAba4Pa/B6?=
 =?us-ascii?Q?hzpKgTaSfFi8QQG1vzOYQu78L06aK3Z6GjV52GMCthnsk/PY/HhD+riH5cti?=
 =?us-ascii?Q?UuQEL86PQv6i1XAhzW6B8VDYUhxzUksPxV06nVlgyVDTD8Fu0RI7xtVHf5Ax?=
 =?us-ascii?Q?Xg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: afee850b-5c52-4f6b-239a-08db02c520ee
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 13:23:08.8753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVD5C85ZN+2lvX1CYaAx1DLrl2f+wFENn6qkhVLQYTEc4vVxxv9HUzTyBXi5rbck+MT8hwhsZUFIsulWpuKXchLbDvMrzS1pzgv/IYqCBPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2225
Received-SPF: pass client-ip=2a01:111:f400:7e1a::71e;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I would like to review and be informed on changes to igb device

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ece23b2b15..7d0e84ce37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2224,6 +2224,7 @@ F: tests/qtest/libqos/e1000e.*
 
 igb
 M: Akihiko Odaki <akihiko.odaki@daynix.com>
+R: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
 S: Maintained
 F: docs/system/devices/igb.rst
 F: hw/net/igb*
-- 
2.34.1


