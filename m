Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65EB687C29
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:27:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXjj-0003kd-2s; Thu, 02 Feb 2023 06:26:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNXjf-0003iQ-Ri
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:26:35 -0500
Received: from mail-vi1eur05on2092.outbound.protection.outlook.com
 ([40.107.21.92] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNXja-0001Vo-T4
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:26:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkaZ8tWrC7Ow00iPB+Ki2BVox4/76lUfIrQm6z34D6rh5/nG7e4j7Xraz+UpncVrPePhbvNtexnEEMbWWXugWDAuifyHkAVyf7MuO6sK0HQ0htgC4O6w1t9OteObuHB58RYKPu7Igcuv3vJD8kmD3031jEpR/3opmlIizjj4GgjURz9bsqfslyW5rdW12l/HHDk+ssh11d8Yda6UkfbC53kW+KficOPT3HRdvS+4Gfcl+CTxilvsZQoupwJGiM1h5H0ADw/WRlCv/2r3OA//PRGZaV4M9hlRiYdB1VyxC2EY4M0MSVV0E8CCwWVViFsbmFWpe4PvaPdffiLC3/SeQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ml7PYWUwcO9OgfgeE8wjUWxpwkyeQMPKGixdTVNt8zo=;
 b=eiXMfk7VaoINfdFrAbhgfQd4OiF7fujgCqFtwH0dnII6J02fzz/Ls+zj3dRv1zsZHTzfrlIdsL+1sPdb3IGs2FZ2n/4yUZKP2OhbicecElfmb1S1L3BrgtpcDForWs+F+avJSUvS2gs9X+gpnrIMCGf3EyqsNpw07bXX0ztJGJh4G6P9P6Etsqm5h+3MOs6xuUwhasWFT7AwubZebmmPCX6gIH/xuRNP8Zd8tOMjkT9SJzwWSwL3Hi2TCgCq7GGceFC6ophcqSK24WbaDm0YoU/9UX7Q1LOh0fUiBQW80x4b600Box1kBbNu9tKlcPp08IerLSRK/dtA2eohFwQVJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ml7PYWUwcO9OgfgeE8wjUWxpwkyeQMPKGixdTVNt8zo=;
 b=LQjSx6wJQ+0TwDflvGbaVSwvAn3RQrbLYZchAZQVV+mZA8HLj8Kn5rV6zddPnJYZ0/N+q1h/joQePBE4r6mzHkn8cznY9T9tt1R4rbQAqPoV5liZSOSx3OzW1tMQ3VI/mF9N5KW88NAvPCaWxzsZRsiuaaz3EN0TzlqvTjwjrl4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB8P189MB1014.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:16c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 11:21:20 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 11:21:20 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v6 3/8] igb: add ICR_RXDW
Date: Thu,  2 Feb 2023 08:52:52 +0100
Message-Id: <20230202075257.16033-4-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202075257.16033-1-sriram.yagnaraman@est.tech>
References: <20230202075257.16033-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0030.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::35) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB8P189MB1014:EE_
X-MS-Office365-Filtering-Correlation-Id: 7805159b-f710-4981-696f-08db050f9bea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 05HuHCNeQX/TnEfMvl13FSWI1z+/NNir1m5q0jDZGIgSfe736jOab5odesIMuUjolWAVfVzr5pes2Jjyb0FEeb1mGIGxHkj5Sp4ZdzJ/xI8L6STg3cwF5PL6rUG/48KFM3Udw6LfPuVhHGCXGICPwgR+ZnlwedQCRv9Wy0JfWsdygts7q/+S6R0Q/gSzBsWjYW64+AS0FWkIZMlFupySUySpggzMYe0JTEv10pdz4y7X9MgjXSB2n8yK9VXeXvRpVQjLXUTET2T2c6ixKsRnt9tjIxsti/nAw5GG9F2dYbLDkpuQh5QOtpDmxsBz15UTcoyAsYfdj3Du8xriMNP/sm+ONMqPx+CVpPVbsYFAQ5QA1TH+0OHDE7e+6F49Ti5f9+PcnhXiRgHA+jekWofnInag+mnW5EX7TZPHO9TUOEuSpcal3EQqmltBrT98HtGw4PTyhZxJc5LoLy3e/aJjM8B9UXas4t9seJaVZ9u7RcYYO6KAniQebfScULMiznoFQI+saKeoflTJII2uHtYrTHpCyHMPTqxqR++Z0N/9bu9z4VvmkKswfHxkG7t4T/0x+tqr+yePkqg72g4wKcCKz8KkZlrroQb/Yu9lGY4EOmUmLY6CLKN9XCf+E7JyRtBv2xejROfyaWVHn6dkwbZtcFoGqmKkf80cJOLA+jTJ1ygN+8PE3a0lRvsfpt8vBho8yV9jLHVj+LnaM4Fx8pWCQLIVIVQDv0Z1LnAPSiXBMas=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(136003)(39840400004)(396003)(451199018)(109986016)(316002)(70586007)(54906003)(2906002)(38100700002)(36756003)(44832011)(86362001)(8676002)(66476007)(66946007)(66556008)(83380400001)(4326008)(41300700001)(5660300002)(8936002)(2616005)(6666004)(6512007)(6486002)(478600001)(186003)(26005)(6506007)(1076003)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Eor5lWMh7YclBPtirxzSx789NvexJGYxI5bZ9bVdc7A+mb7pMrCQZn9A42NM?=
 =?us-ascii?Q?ax+ONQF1JrffhSSzmyRXKEv8C4SM+VkA35l3wpgjEAA4f/js6ffjGdHPlgtm?=
 =?us-ascii?Q?Fh4S4vc9TLBX5ITMlkiCG/NjGkHOjOhJ+3MQAx/MPzqZdgqHhMSHKR3Wxvlt?=
 =?us-ascii?Q?KkNOpaMlcu2CNBOuoXKguUcMkrvs8QayG3DfgAUHo01DzrwHydgFgJV2ibK6?=
 =?us-ascii?Q?80oGODef8CTFqgHuoH+c/Jxe3wtG3iIBWobyFHBEi9obdPEhtt6fhrPcF8Vj?=
 =?us-ascii?Q?QANKyYiM3lCWZT7UnChDDtuFjKddfuJljVHY0HuhmJQnzMhjSCUopPz8IE56?=
 =?us-ascii?Q?6MHnPPk+FjQaJ3kudGSaq4FWLskhypJ6wCGgTl0Rxq81+aTVogWwx8qc7VhP?=
 =?us-ascii?Q?yoAJYmu0KoEg9MZYlM/JoC79YiVV+rEye4Tmcd+V13CPzvyyX76Go128JDVs?=
 =?us-ascii?Q?w2uNcvGpowVbWDOdUVE+KjL8JNzhUp7EiWOim/JFm5UCEmoaeRDF8JzsKwII?=
 =?us-ascii?Q?+e1KmmAeFkePfnggGJ9U/jw2bpVY0Y816tV0lkOsl2KJn1AvI8+xaqmuMWum?=
 =?us-ascii?Q?ZKJDv79qOlzENz/hGoSo6nO/hRGvFtZIWUZ7jqTh2g6Uo0+ObKNgFNlyORev?=
 =?us-ascii?Q?zbRECw91iZLZ0zaBpyZY2cWeQxU7/gwWkTX3DVgRxBm4hijabHR04/+ICrGk?=
 =?us-ascii?Q?A60K2HT0d7m/SqL3cuamA4e0MGQLwbigJpUFnjfoix2wD4fjrGfjvp7wQo0h?=
 =?us-ascii?Q?+lsnFhSWtrimDih/WCoTSNjZT7boMXJ1i8o/+Aj2AeyTypaBhddxaEFDFWdh?=
 =?us-ascii?Q?OREHpTG/FtzPD8gp5Bhx6PfpiqhNE37aclq1EbRrewwsVudAa/GL1s/0KK5+?=
 =?us-ascii?Q?gqBmJZWe+HqyBew4Y/maT00DUkhXgiO15JKmdRqe5kbqvAsiqFVj2QWmTZ5d?=
 =?us-ascii?Q?h4g/PSGGZpO50q/+JN6kQ9U42iD0qyUywTrSTZxCvKi/3QwwFt2G7D9T0Zhj?=
 =?us-ascii?Q?PYLR1pNJZ8vEsqttgxkQPFbLUwv72oU+KP2nrI3eFIFTHcgHCECg3WOseMdG?=
 =?us-ascii?Q?KdsYUZ/eF6rkUIMhkVDGMBCAH2j39eBmhB95Qol8QxDTW9oXMTOs5qadGAXV?=
 =?us-ascii?Q?Rwwn+xArJkKcKadCaH8I8kSp0sRlYCEIXNie967HROzMh2qQFPi9uYqbfHky?=
 =?us-ascii?Q?C3pXQi/WHk/MmYGXRUYee7wWDVQ6oUIpWuKCgxm1B9LKUtuyoCC6wDMKV1tA?=
 =?us-ascii?Q?ZoaKX5BHQeiP0BsqiTXhm2hPgKg3Ge2wj5spvyU1JyOMZKxp+av1w2VFH/A1?=
 =?us-ascii?Q?MY5ZBV9o/W0l/9trv71RkPf6gPGKpMHQ5jjXLXZfgBKKx9YrpUNhm1TJq1nl?=
 =?us-ascii?Q?Ku5RtvhKDxSVRXG/MGgv1R16ICI2nknM91j08Kg8JnNODZD3H2x+IMtQlbiv?=
 =?us-ascii?Q?FP/R/T41BxgoXKC60nGw8M2oRSmxjihB1QkTK1Bpk4i2wjIxfCbVtsyg9oKo?=
 =?us-ascii?Q?va7bU1uuET5bWU5Uuv30G4UWLui74TLPNpNYkOxoiAtFqVRhv9Otwah7GfKy?=
 =?us-ascii?Q?bzdKlzt5O30uwhkSyL5kXzB+zcXg51nKK1a/tOay9rXgdt/nxzxG6aqRMlfv?=
 =?us-ascii?Q?GQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7805159b-f710-4981-696f-08db050f9bea
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 11:21:20.2786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thWEnRYhaayjCtx/a7cCNumJcGwDE1VJjJ0B92Dc44u7SbZ4DpQdu29HvpB/Wh3Kvl34vYAxBH3NYwfkjVCY98ODfqk/EsBpRhiW8xnhbA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB1014
Received-SPF: pass client-ip=40.107.21.92;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

IGB uses RXDW ICR bit to indicate that rx descriptor has been written
back. This is the same as RXT0 bit in older HW.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/e1000x_regs.h | 4 ++++
 hw/net/igb_core.c    | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/net/e1000x_regs.h b/hw/net/e1000x_regs.h
index fb5b861135..f509db73a7 100644
--- a/hw/net/e1000x_regs.h
+++ b/hw/net/e1000x_regs.h
@@ -335,6 +335,7 @@
 #define E1000_ICR_RXDMT0        0x00000010 /* rx desc min. threshold (0) */
 #define E1000_ICR_RXO           0x00000040 /* rx overrun */
 #define E1000_ICR_RXT0          0x00000080 /* rx timer intr (ring 0) */
+#define E1000_ICR_RXDW          0x00000080 /* rx desc written back */
 #define E1000_ICR_MDAC          0x00000200 /* MDIO access complete */
 #define E1000_ICR_RXCFG         0x00000400 /* RX /c/ ordered set */
 #define E1000_ICR_GPI_EN0       0x00000800 /* GP Int 0 */
@@ -378,6 +379,7 @@
 #define E1000_ICS_RXDMT0    E1000_ICR_RXDMT0    /* rx desc min. threshold */
 #define E1000_ICS_RXO       E1000_ICR_RXO       /* rx overrun */
 #define E1000_ICS_RXT0      E1000_ICR_RXT0      /* rx timer intr */
+#define E1000_ICS_RXDW      E1000_ICR_RXDW      /* rx desc written back */
 #define E1000_ICS_MDAC      E1000_ICR_MDAC      /* MDIO access complete */
 #define E1000_ICS_RXCFG     E1000_ICR_RXCFG     /* RX /c/ ordered set */
 #define E1000_ICS_GPI_EN0   E1000_ICR_GPI_EN0   /* GP Int 0 */
@@ -407,6 +409,7 @@
 #define E1000_IMS_RXDMT0    E1000_ICR_RXDMT0    /* rx desc min. threshold */
 #define E1000_IMS_RXO       E1000_ICR_RXO       /* rx overrun */
 #define E1000_IMS_RXT0      E1000_ICR_RXT0      /* rx timer intr */
+#define E1000_IMS_RXDW      E1000_ICR_RXDW      /* rx desc written back */
 #define E1000_IMS_MDAC      E1000_ICR_MDAC      /* MDIO access complete */
 #define E1000_IMS_RXCFG     E1000_ICR_RXCFG     /* RX /c/ ordered set */
 #define E1000_IMS_GPI_EN0   E1000_ICR_GPI_EN0   /* GP Int 0 */
@@ -441,6 +444,7 @@
 #define E1000_IMC_RXDMT0    E1000_ICR_RXDMT0    /* rx desc min. threshold */
 #define E1000_IMC_RXO       E1000_ICR_RXO       /* rx overrun */
 #define E1000_IMC_RXT0      E1000_ICR_RXT0      /* rx timer intr */
+#define E1000_IMC_RXDW      E1000_ICR_RXDW      /* rx desc written back */
 #define E1000_IMC_MDAC      E1000_ICR_MDAC      /* MDIO access complete */
 #define E1000_IMC_RXCFG     E1000_ICR_RXCFG     /* RX /c/ ordered set */
 #define E1000_IMC_GPI_EN0   E1000_ICR_GPI_EN0   /* GP Int 0 */
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index b484e6ac30..1ddf54f630 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1582,7 +1582,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
             n |= E1000_ICS_RXDMT0;
         }
 
-        n |= E1000_ICR_RXT0;
+        n |= E1000_ICR_RXDW;
 
         trace_e1000e_rx_written_to_guest(rxr.i->idx);
     }
-- 
2.34.1


