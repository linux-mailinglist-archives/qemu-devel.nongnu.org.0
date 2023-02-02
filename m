Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C20C0687678
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 08:37:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNU8R-0008W4-GA; Thu, 02 Feb 2023 02:35:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNU8N-0008U4-G8
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:35:51 -0500
Received: from mail-vi1eur05on2070e.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::70e]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNU8L-0001eR-9U
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:35:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVplFpbVBZ5qBQtEabHHPqpVOzv6OkEd30cJUlX0iSzhHD7UKQIJlAO+RvSjtT5lTjiMW6Nd8FfIkowi6mmqzsbycKYC/H5AveJ+xn51gr1ESO+vZxwF0duOPfLxtNlgLQfcIPQ3XQGu5fiZCsHrrX70nPDLqNpGZgGBSjwtHGpJkrr8/YcO6NpKvJaC8sHRk7l1hM/rssdrXYVfQuIRkScCl9017QM3TEuQP2r1c0ID1F3HodZ+lpey2H22LB3TMrmigt5B9EDE9k7zWiFVYWh3pt2Lbf8wtghWQPUH1toUoJMIRH9hryfC848bDCXI/Gso3I2VMMayR8KKOhek/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UN2dmeYD6myOaEsjsEBoj94RLVb9kiG9UatzaSQqjJI=;
 b=UvzOFPLYUNZZ5yj2mHNt35osLONTJKc2YaI/FN7jljRj7OHpR0wtY1hfaSKp06NWQKMcDuOP3g9vl8s5ysD5emjK+WboTaYIInm3pFaqeRqoW9eLVDTh9HUqyWaNV7IWz+OSLkDYfX09JyBHNSgCX9dL7awnZMlgMwQZJ8/IJUCDDqPzLUw2xsXTDW+kEf6ZqhmgeQHjb30PN/RD+te62iM9qyymbqaccqGEm/AtVQh3k3eaPD3OlAMzQ7c4qbTTQkmmcgw/vy63rWJd5nwOp1ZYF50jGwOmSBtFm+ZDfAhY1sqnrz4YKLfCAlCI+UPmR27xCvjuEaTUqHbH2hm22A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UN2dmeYD6myOaEsjsEBoj94RLVb9kiG9UatzaSQqjJI=;
 b=U6LQ/EBgX5Zdl227lPA3XZ90q25ZPtAF7gJY88uk6YQY3lbgjL/tDd5o4b5NbXHLA2K16k9AJmhac07IvimJassZQh1cdUsP9j3qMDV2s+XjfuRbUcg9UxqE9NZA9zy75a0iMi+jr96ihbHHuA6S9InEaiHOdP5eU9QnBZKxdB8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB4P189MB2389.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 07:35:39 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 07:35:39 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v5 6/8] igb: respect E1000_VMOLR_RSSE
Date: Thu,  2 Feb 2023 08:26:46 +0100
Message-Id: <20230202072648.4743-7-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202072648.4743-1-sriram.yagnaraman@est.tech>
References: <20230202072648.4743-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0011.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::7)
 To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB4P189MB2389:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f99e164-31a4-45b7-3018-08db04f014a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GPK5UlmrZnnegUWv8SunEVlihCNH+fIsunqiUqlyndvxSZ2a9os2yaowaLLEBehE4w3na5lD9jJdd3jW8axx1WPIbLgFvk5WjbuqLpDOiYaIyOTysO2sU46LifWJQVW+MwV3ByK3zvKUMPyRUZvxJOdD1ZYPEJJpf/JEhbS/RhdO/OPeX9rgbokVaCHSgeZPHk+yqk0UBqMutbK6ObLeVNSInaMqN1BQBozeo9mQ8NsG5bmUW/8H+gCJM7L+kYnw8tDvKP1tmcHjmMNQlxvoNXpGsNDp29niujPDqt98iHhcgTo5XEMjiOamAhOpqNuHR2VPdkaki7Sh7NbNVQVC0Gc3UFzHkodzZkIHZARlPW/Wr6ZbtYLLeEBsWzCihIb+jgMKbQWb9dRUFN5bJrz6DfsvnHkRlqh2LO/qVxqp5DrX1iANMjlOAHkM2/BFxWIHSwLwF/Z6SPHLsLwCTtCrBj6z1dfRO4GrEVZgAibnQvcqy05dMPpQKmqwRroPLCIqjz4+7Sk2VPVJwWq6aYXKhlWIWh0AGw/uNDlU89vEJiRrveowpKEJreoCYGWAh5kVSGKbSdvZa8Tthkur2uWFYn0fgreHh34ZrS1ycfcpEtDRc4OsUFuYWbx2wiZWlQ8owCQM1ptMDmlENQFNxBv+jWktjbo0fqf1AdfU8h1lHHma7/Bl0cLwYoRwQKdP6IqcOKpM4QKKIMMRH/EVK+IqJsJEROgdqbOquXq9FmguqzQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(39840400004)(396003)(136003)(451199018)(109986016)(6666004)(1076003)(186003)(6506007)(6512007)(83380400001)(26005)(2616005)(38100700002)(36756003)(86362001)(8936002)(41300700001)(44832011)(5660300002)(4744005)(478600001)(2906002)(6486002)(66476007)(316002)(4326008)(8676002)(66556008)(66946007)(70586007)(54906003)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7SzRCA4nGGPjYSs2YNXqG9Luf4cGehSgYaExxnq5/JKacCUCujI1WMpZJBVf?=
 =?us-ascii?Q?F2U3xA3d2MapUFbu3HE+Hsan5yz9E7U1cbCW/UripGkWnXFkTMig4/sAN9W4?=
 =?us-ascii?Q?ZFVc3ogUP9tKdHpQIBPvOw51/XlTC1JXClqqChVkoDyrvikB6uPrSxI7raeU?=
 =?us-ascii?Q?ZsFwECYwfMQnfdA9sCq/N0vn/p1YzKk3DJmvuI4sr7IRUqFJt6FnfiafGTIK?=
 =?us-ascii?Q?vj3W853Vu4dWaXrKFziih4FrUI3/qdwwOraB4Wh5apENgPFd9OCmCkKXsR0I?=
 =?us-ascii?Q?gxlx5wOWZ5dXaUBybCmWkq/pg4UZSjMLVyRd5BjwyCvbbPNNVaJehz853XPx?=
 =?us-ascii?Q?7vIjYWiKhC/hyDzHL37I866Fd5B1vdNMozjthngH9c5efCDmXRSISPisNL6/?=
 =?us-ascii?Q?sCGv3Csy2qW0Af9ptzOv0gu1FiZPoWJFSpJCZvoEe4j7OOV9qgn0WM/42g3x?=
 =?us-ascii?Q?MNaqQJRIRL0VYiwaRCENa8vEBQKpeA4an6g1dTFwQt8J7pVDixbpHVEjTXmK?=
 =?us-ascii?Q?Ph4hsuGVht3Vr+rO59RvCO2pHbI/udL7v/u8uG1U32tbc1UJxuwohl5ZT9Ds?=
 =?us-ascii?Q?P5QAbVWJ85Y7BdeZ5N4bCbr6rfgEcgemsPK9tVYr7pRFFSfWy9a7gcwqw0Cu?=
 =?us-ascii?Q?wAyoWjLXGc5A6Bjp0ZwMoOhQtjEK8mZdFHMteNQeEnccn5prAjgnIFjWEx3m?=
 =?us-ascii?Q?Fbfptce75sxKCOn5gcEOruRK6obsH+3wnfA22RKYErYKNS2j2TzoVlAIHCBO?=
 =?us-ascii?Q?Pjz992s2bY9ao01+AvKWmCwqrbehdYNIsU/1QNtQV9cv9biKaj8A3PKYLEVc?=
 =?us-ascii?Q?u2b6ctaRLCfxDIq4HCeRHEZzQ6cGfVRDaXxbpfDfo+wIRGTX+vloEky7YdZr?=
 =?us-ascii?Q?y+CPVxmPUNHAZeRW8HtLJeoiJW3oqwCP9/+JTkRJU/1mgMezdjX1qwuhe95V?=
 =?us-ascii?Q?VrXRgoGjyyl0BhMpW4pezIPBYjta0VSqjH59VfbYcM48UyTQL4+ANOWPyAit?=
 =?us-ascii?Q?BlIe3fkqA2ALBjFdDQ0NhBFqCWs+WQ1iHac4RIvwCenn4tH5fPkPAIliOxZW?=
 =?us-ascii?Q?1A6LQpKHBsfRDUU4vx1UJZGdU82mwQ0B5KFYh2F950Hzqt9bbD/fnXD+c6M0?=
 =?us-ascii?Q?qaFUIlWU+jtxMTknOPQNtK+3u0ZGVXoBcCdFRGsY2K0vs47b1NSda98af8kb?=
 =?us-ascii?Q?qcqeU+T881VTtQoM7LtHqWour92rM0RYmxV8480jXWXz+Mg48dU2HS+Ni12N?=
 =?us-ascii?Q?3XtrRTJW0pRm08jfBJDw0ak/Zq0LDthbZiUYFqq6FMPsZMU7JbUFdXWfAixR?=
 =?us-ascii?Q?+JIIqPUB60SiAXqH2RErQifYaVHu8fIR2eDf53LNDBWGuNK0MLe2DnN4QcUy?=
 =?us-ascii?Q?fb6KW7bE4vHCrXUnEmc+AqgRTfI+5pcD+kGwsYd6F2EDFfJBhIZSC9TDRPFa?=
 =?us-ascii?Q?vbCBRZUj7UQ39jGWul0KKDYuuEgAe+lTDhsQhVkszzuG2HEaiawmqzAhiadW?=
 =?us-ascii?Q?Jvp9D6oPrJROUT0Hi+21Dv+MWZfQv9I8gBxv9tPKJVm/RzRxxGR2QVEQykgN?=
 =?us-ascii?Q?GfAaqg5DdNfdb2d2CpuBLEiR1IuDQHnb7JLXkhls4rEk3m7KsbY/VhLna5/d?=
 =?us-ascii?Q?Cw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f99e164-31a4-45b7-3018-08db04f014a4
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 07:35:38.9742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3O3nj+ZbX7NJ9x780HVMUS5zOUa6thoCkYQv7TamtrKMejCRrhRTVBLVrif7CK2p0LTngWVmyuTV0jei701K9l0H8YkPRHnIfVOII25Xf6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2389
Received-SPF: pass client-ip=2a01:111:f400:7d00::70e;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

RSS for VFs is only enabled if VMOLR[n].RSSE is set.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index eab140070b..9bedaa1e5f 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1051,8 +1051,15 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
         if (queues) {
             igb_rss_parse_packet(core, core->rx_pkt,
                                  external_tx != NULL, rss_info);
+            /* Sec 8.26.1: PQn = VFn + VQn*8 */
             if (rss_info->queue & 1) {
-                queues <<= 8;
+                for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
+                    if ((queues & BIT(i)) &&
+                        (core->mac[VMOLR0 + i] & E1000_VMOLR_RSSE)) {
+                        queues |= BIT(i + IGB_NUM_VM_POOLS);
+                        queues &= ~BIT(i);
+                    }
+                }
             }
         }
     } else {
-- 
2.34.1


