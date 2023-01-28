Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C042267FB02
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 21:52:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLs9u-0006Yv-PJ; Sat, 28 Jan 2023 15:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLs9g-0006Wz-Ac
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:50:37 -0500
Received: from mail-db8eur05hn2032d.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::32d]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLs9e-0005Ml-Hx
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:50:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqFSWjzBbBZ7y+Od8IQorVssHGnuGPb6WTVEdBlu3HpfDAwof79fqwO7HWhaaTg6lygOHIQQufne3T3lsyBUbi6C5SgENHK/kiT8BojuF0r//SIZ3LTHZ33BX5+I6j8dL89U+4vdxONhGXBiwSmkKbYjC4PcgNez+29LRn8nxyPe13L/Z4WlOnvw1YAcSPZOXKoGQY7xPJEEUFYnXVCjyTyKCHgpF5dfrDxq6WNdz+IoQeYRzJ+AFKmnTtT7tPMQn4MDyCw2yDjBc/EtRI0/XSJJej+j+S/hfQqqieIFeJ6riVIknCL7ZHK2zmxPctst2J7PwoupEQGaudH5jXurfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9Abq45938CGnKEaQArxmSlaen8sO/agH+n/BVwCof0=;
 b=nA5MthJzoLGRvGAueucyQ6Puphu6fTvAMFux0kP0W+9PJhzk6F5USgv0auBN4ALga7BCLW03cMwpoG9hUuu42ujaEpAZ3p0KDVmlaIIHSw9ozD4wy5y2k0ndIv5mqKRVELuZl7W9IEniEEgoCLfuAkBZHadwQdnGh68ZasxOvQ+CDMgVh7h2+N3zEvzH6DMG7KCidraRvuh4XkDK0d3lLFgHdQBp/qLjTkSJ3s70e6OdyJ6i0KbNNChjxPpsLPwPS8qd2TPs2UtOA4atosTgvCCMN3ZHkPC+fMrgbMvsCL22deLMY9dx+FrKRUsAx4QBN+te11XXblTVzWtz9jKXUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9Abq45938CGnKEaQArxmSlaen8sO/agH+n/BVwCof0=;
 b=Rw6itjUx+H+PuDmMbhRRauhk/j6k9cqk4mXBLRbk6gBX33kILl5AcL+9QIIFzBeEA5n6mVLuerte5Orqf6Re65a7G8uBV/8zno98WLsbOWkhZlQmNT0XHi18wXgQc9dqxZHLdVJp0uw5j5jZm6XaDnDwh/Tzz+5S6TQd8td/SMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AM7P189MB0661.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.30; Sat, 28 Jan
 2023 20:50:19 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.030; Sat, 28 Jan 2023
 20:50:19 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 1/9] MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
Date: Sat, 28 Jan 2023 14:46:25 +0100
Message-Id: <20230128134633.22730-2-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
References: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0044.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::27) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AM7P189MB0661:EE_
X-MS-Office365-Filtering-Correlation-Id: 270da0c3-0597-4758-99f5-08db017143e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: poraBOOCd894y+K862XAEdjq7oKUEOGjp+ka92RbVrdKie1nlOC8l1RrffHllu4w3RKHOBQzEH20E2cwiyn84gakx+6iC/pha5UiJW43fw5Ob1loHHuRO2J2WKh4BdDR3EG3xAIqZkINYLuJ3yeCOCCi9Mphnos8avB5uDcF966tx1iztDVojE34AS8HVNbR9IKL4roFxZo6HMZ3+1YXnB6KXbgxDNwzlhPAIoAY1/kaJh1uNA5AdzC3ywVRsVgtJRQc4Il2s5266zAAUqNDLWQG0QZaP1EjRScyckWzW+kaoGCITMmTC0gbILMMjHE3DNA5xTWdqnrq1HxdoA7RhqgXkYxHBkONtG+0cUB8L6Auz0w+odmn7tRXrXcbwuZQ4Fqyr5q8sXEULJUZYBVzmEfyYzVoZ1/GWq0rFF66Qb2eWzXNRcVnCUr67xPoJEkMxo+xMMitTj0neg7gLldEbuwVSNpKJaT7eMt5b1JM8tmCDVZRb1Y3UUBL/c0wy/kKhiXDCWtplupTNIbWt6/5yUKHsm2Dhod1+7oyuDvNGYvpimFd+KlAn25lN3iKFVKgCL7TTsX5TwzlldVp/ye/LB8+xjN6L/KTBiDxm3Cd/zzT47igFvw3JC+3yYb3On5Yrf1AzJOXZMoqeeZTG98QTP6f7OitvDKIim5nptEHvQ//1ot/DaWjJ/xae3uPdcqpTNUevv6Tia28cB7geB/XjqtVRy1RdfjmxE25WaY3hPU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39830400003)(396003)(346002)(376002)(136003)(34036004)(109986016)(451199018)(8936002)(41300700001)(86362001)(2616005)(810100004)(38100700002)(41320700001)(316002)(8676002)(54906003)(36756003)(4326008)(66556008)(66476007)(70586007)(66946007)(1076003)(6506007)(6666004)(6512007)(26005)(186003)(6486002)(508600001)(44832011)(2906002)(4744005)(5660300002)(266003)(37730700002);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3Dg94qrt6hB8DFrwve9Wh71DoPI800MbFuzhfH9KENAPoWtMGiblPUrOtaI3?=
 =?us-ascii?Q?Tc1PJkNhIuroj4iUBu0AGTbH6Ffq65aX+76Yo6NiWZ3rjv425XzQb+jOayJf?=
 =?us-ascii?Q?bQ447LxY36aWWPeOy2i34/Nl/bC7vxt0B1BtFZponfSNNHtLWvK5tHson0TX?=
 =?us-ascii?Q?HjDekC/pcUUT1HkNszHlttxYFEJrOTPm9tZWZRFHnMzbelmKRTLGcFWVHLAx?=
 =?us-ascii?Q?jNMjj0aqHLfh7qVSBBeAR0FAM9QjnZZYuRYYpEnbE3HfZrdm711dO/A8qFYA?=
 =?us-ascii?Q?K06wemGVxO/Ap7FYxUCRCgK8vkFGts1xLBVh8oSKPhUqGZn/S85wmeRFT4TW?=
 =?us-ascii?Q?sy9yD7G1eMGVmLN+QpcqX4tTSH/KG5GYte5O/9EHIxNxlYj7M6645Lwhd5ST?=
 =?us-ascii?Q?A3Nc24qBcqY6mRVbyvH/oTUtxF/yLRKF/eQfZdoKatUKGsXegT0T86y1/zkK?=
 =?us-ascii?Q?o/bUY5DDAPvUp1f6zlWlazqwG+JpGGlEZLk2BXEyKIsUQRLM7V+FY0AnbQsE?=
 =?us-ascii?Q?CQl6Q2u7LqC/Nbe/4TYwETv5n3VZH2jH/LzpLQ2wYq4FKzU9t1iFWB3Ss/Wh?=
 =?us-ascii?Q?jIoF0KC8QkHkN6TPx+tb6Asjz1LLLnWhQKIcXbZCySeJPRZOjiCVab7kfOJi?=
 =?us-ascii?Q?xLloiyaviXOh/aY+o1NXrLZ5aUmRW+DEi1CsnTWLPuTNXaMGItRGQWXUc2LF?=
 =?us-ascii?Q?JgtgoHNA2CUVwrN+dXVL8MxCsxRIsA1EsBsvC6TlIhiu+Wcvv2ATreRzLB6+?=
 =?us-ascii?Q?vebHtDECV3h0TVaCKQLfA+yphcT+hImrs3j5Xqgk0D0lAGhWUPKcmMj9LyIu?=
 =?us-ascii?Q?9lMGtjXZ0bd1r7MTf9WFQG3h2cBP0NlruMS3cOFGyxK3FUjuL+N5riE5TxSa?=
 =?us-ascii?Q?A08ok8v+uQG1vJyknOYyP1uLnojoqJ47D0cYPXzTKHsuZQZrovIuoPopJSpJ?=
 =?us-ascii?Q?GZvofiO1f4A8eZzNCNW/w2kLCl3cVzzhtcs0AsX8lCUFqWOrFM+uu2G9ZKMt?=
 =?us-ascii?Q?rsxYs0sYNEtBFBDum2NlYMmw2KY9jmnCY75THsTdMHAKB/YGTmQwLKjo6LAA?=
 =?us-ascii?Q?2uZZWKOMeHfE57cfTeDtp+lZsU2hRTYXmM6iF9iDU88PeNHJfB6ft1AtNaNI?=
 =?us-ascii?Q?H4eFIbtE4tT1hT6beOHPFuekpdea/Ya7RUE8fNDWSMwO5ZiRncnb+Nj6upfd?=
 =?us-ascii?Q?5OPYlKyhUdwSEVOeYj85wzCWudp73qf+CmEhItIkFfAIZv3xEHeGuv6Ipbxd?=
 =?us-ascii?Q?hefNdZQ4Vycam1+9SatQKguAPqASGfMaC+vSsxj//fdRswL6/5vvzFgbAdMQ?=
 =?us-ascii?Q?bwQNUK8BoNhXS1O5YS4RDFPvPMOAttZRcvre1p4ik/+F2I3Py0kPFNnyJwOC?=
 =?us-ascii?Q?ZzijXvRHqeLo0wSUhYAkNEUTktJC+DRrTvuKdhE4e+JlYepYi/vVZ6hjnRB4?=
 =?us-ascii?Q?Gohj1FvZnkSubP+0VKC+sFvQFV0I4xabQlOdCSZ3pWdtlnoIO/iXCSRvNDPo?=
 =?us-ascii?Q?ewepN7+efYmGt03sAJRfmXsZiAi3r6X5oQ3erEHpTozEMXXnwj+JrNWecLJN?=
 =?us-ascii?Q?2ONhfVwvtWJRqi8mXD7gol6/UMPhWb7OjOphZhS9Hu9msuqFylfUBPZ18i5/?=
 =?us-ascii?Q?6A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 270da0c3-0597-4758-99f5-08db017143e1
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 20:50:18.7815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mE3TGPYnHO3OhB8MAWCzeMIE3he+IItHMSlmOohfSJgXK1S4dN2KqBPIeXJ5z7B9cMuBqSD9T3ViTaGY6Thlta/DzKjsTh7M2SKtIOsw2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0661
Received-SPF: pass client-ip=2a01:111:f400:7e1a::32d;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


