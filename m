Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E27680EEF
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:29:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMU94-0001V3-41; Mon, 30 Jan 2023 08:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU7y-00076j-7g
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:18 -0500
Received: from mail-he1eur04on2137.outbound.protection.outlook.com
 ([40.107.7.137] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU7w-0006AC-CR
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cD9ulSOZO2S33InwVqumb5Opz4LxcynYqoUl2hff5GOAvC2/cgbZ/s684vX1iZtz5MD8R3Zlu2edPQnNo+jG4aAlWT4yxl9YE9nqwBHFTgRGKrGaFUyx1ZdO6wz+ufXoZZ/ARf3p+1oo9RjF9e7KMqPyV8/HTc+A6zz5ebzT1MP5AZ0fCD877gDUw2TTBBbhmdzINFRGtF8PnO//ZpNipEjWmoyOrXhyti32wjXiRK1FMvuQGSgWJDPcCVXfejF77KGLNn2mbm7Nu/s+9KrwdO51eAvnMmVCYMuu5hHmek2sfJIQnzj1TtzZk1r1zArbzopJr1wPlCVSL7CuKV3wcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woo7TaDTom4wY/00Y/W2xorfn6Bl5eeqmuBC3DGiR2E=;
 b=LHHn1NK+SFg2GLhnIOmgWxhX28jne2voXmQxOqLxTBl9p85FlvilNPgbembxu0PixVAhJspxOgYSqn+S/dwHWEW+RNEkogvX6lpvHuozm+1n4/5PVzsSdft+12vMZDTtsls4s2lf82eIXKvGzmW6C6PjTCSpA7zE0XdqfHFgG6v5C74L2Fx36FcoYE38rLI1hX1DhCTmWeNk4QWIoegRSQgm2z17b6lO0pC3zUJVbACn420NSvGtTi6OUsTxaU596qxQePqT91WrnSGb6oJxo/dvkMoROzEY0rqP1rsKPR3XZDlX2kq/AgPsPRrENCrNX/Q91oZt0SVpSf3vY9rXiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woo7TaDTom4wY/00Y/W2xorfn6Bl5eeqmuBC3DGiR2E=;
 b=GrwhYnpOc34+ymTZD9Gee61SyLfhja6F5dJTMvpN+/mFbgYEbYL4h9R+POZb5EdjHIjX2+epIBNdCi8po5mkfLFEru5tTnjy+0BpGb60ZVfa9jGyX8i5v7b7758Y7hesvz8ITJlv0WRsLC76SnRzhx08uUjStTbsctYUK5rBsXE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB4P189MB2237.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:38f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 13:23:13 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 13:23:13 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v2 8/9] igb: respect VT_CTL ignore MAC field
Date: Mon, 30 Jan 2023 14:23:03 +0100
Message-Id: <20230130132304.2347-9-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
References: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0040.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::14) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB4P189MB2237:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b343794-d037-4bc5-ca3e-08db02c52371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rcpkr0xp/+hP6NXw7CUFnQN9Y6VXE87MJoRCk75Bnm3hfOb08zoomtR0yXhcNa5S98e+mn7Hh7aN9U1aobi1rO9iVL6KyqlxNqxNHC+NdZiwjfDIXslh3WkcmbRK00GgRlDDuMY8t63oHMZL6O4dg0DtX45SQ758yLf6vVH8LLdVFOL3PSBtSqwc6O1Vg1pVy2YmXXHcC65N7ZgkDpes338a0U86tcPvfjMZFoxx904/8HR2hLemWYV5bR9I5I0k+ztuC2uoB8ANYWodxjGEX5NmJDwoF4nRB/BopE0Y2BFqafUpGy3nvqpM2uBmJC3z8nvamS5Mx/UuDMzmhlBYsDxlUnly54NG0yfCRYRmCsTiHiBunO9rMLjoWJTcNwnVb98MlNtWCqHyhhz8Yy0LBKTevkmI2rTe0NzLq0fQDzQRE2KwvPbj2bAoe18wKbrIReQRJZbpic6HL2tqzO2mZoIk66ktey42H3yyGrG/VRYquEOso9Q2OxnA3qOHpsDi4PqdGobl6usSxOk6mi4m7oBf7GWDxPconB6S70c/XIrSE91OZOOuh0KlIGmabei7VzOUdk45CiorBPNKQarKvzpU6MSUM731OO2abKkYdnBHqh7n1Wzs4h/f7fif13z3edy/0VE+YqScGWm+axIW2CFOn4ZlkA0odTmRRKUw8RwgZk7Rwv+IjFCKL4Mw1bqHg9OFb6aDYl0f/MMDXRrGLMebuzzq2ZYu9kxXTTj2VVs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(376002)(396003)(39840400004)(109986016)(451199018)(316002)(8936002)(6666004)(6506007)(1076003)(478600001)(86362001)(38100700002)(6486002)(2616005)(26005)(186003)(44832011)(36756003)(6512007)(54906003)(5660300002)(2906002)(83380400001)(4326008)(8676002)(70586007)(41300700001)(66946007)(66556008)(66476007)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cLEdCaSq4MKmNFrhvHlE6cgLiiioT+PYJIk6hsh4zVLgDx+oxKvAMgMGqQoy?=
 =?us-ascii?Q?KCQp2aKk/kie+q++R6rIWNT/cNPb65cdWnaaPGTNNLjt8fekCAkda2NX6Vln?=
 =?us-ascii?Q?xyCXwhxpsDXN5Zdi2HhAXjrUZjUPWMG0Oot4ACHZFNFmo22XyQJ43a7gx6X6?=
 =?us-ascii?Q?WPzeA5OnMZLy96b/ZVI24lyrG8sWhTNJ8ZIxd8mzZQcD+kB1gIR3ZIOMaVeR?=
 =?us-ascii?Q?9pCrtfBCWdlDzY4UhMSDeGrVTbECjmlOK6vy1u8k72EnxzP+wckfpMlQL+Ix?=
 =?us-ascii?Q?WLAJMFm0lhnXV6zY9F1lNDRq6fcgf5cZjD/O/NCtDgY8FDNK7wizuel8p/Xt?=
 =?us-ascii?Q?uThS1kRRSNqMVBlecJ/zOtt0WzJuuwrF9ow5cMuLJgSiT4xjm4OMTVGCSIiS?=
 =?us-ascii?Q?UgE/7p2Ftx4HtST/TVJ1FZSA/xamztat6yW3KOwLkwmwXrAhB/tPNsk1PO6L?=
 =?us-ascii?Q?u1shwgs6mraJJwagZJjNIcUAIL31eShoPObiWpmZgqT5LN2LWvgZBTvoG0Gu?=
 =?us-ascii?Q?dvi38lH4RTy7+FJgkCBk58fveC4eqrG2bjnLVE76Xfkrpk+MkOEKGyoWFMh3?=
 =?us-ascii?Q?zYSZ4C9c4tHRs2GfKvJE9TZ2qymM1fR7Mu+JzC4CMo0iVrkw8tc3m2DdZ24D?=
 =?us-ascii?Q?Lt56/Xw1/33mfZNmxYCVAv8tPbP7Ls77xEdnt0OKDAjMKg7Hp052JnSL7t6R?=
 =?us-ascii?Q?WJPYHn+GxZ3SO+pHoAoEky2d3ZFf37PLb2dIm5rGIqGsRsA7xU7hr8O1aeSF?=
 =?us-ascii?Q?s6W0OxuHal1K89ZXxoSed5N04GXL914M5NMh6/H34CrbpwtTq68N7GhEgpGx?=
 =?us-ascii?Q?b3MFyikYDZyztbhip+2nMm7Clyr8g8fnqGC9YYPKkE01CxvcuzdYnNxWyewf?=
 =?us-ascii?Q?XVIjqYnn7NeFMHhJ+FGLDWc/jRoJ9Op12jL2qGq0WxnXs4fk1CP8YlKsKMvq?=
 =?us-ascii?Q?Zs/N4vPBZ4SC0cnfHdwgZ+Ms1NXxHaFf9/ZvJ9nwOoQziqr3lUkcwsh6u3en?=
 =?us-ascii?Q?yBq8R1NQZoDe9hO7WfH2KzBt3OT+tlwTWg7Rq0Q484fuzG+xKktFpQE/vcKR?=
 =?us-ascii?Q?rz7i520Gx/67n12VVc/FbyHsIx1DFapTydXUO8MAuudoMjZCkC4KmwpsjDm4?=
 =?us-ascii?Q?H2VFLCRllw6X6uvfOlnpXFqJMhbCy00j3elG5jZpM1MI7p6lOCTqoK5uSBpI?=
 =?us-ascii?Q?8xr4bml3vPla3KADQ9Rm2ghJ5wPySZ8AbHQbWTYbbnSYpTDjGg5P4zn8TFf7?=
 =?us-ascii?Q?p/69IAQZKpZ+ni6+pA5g2qxTEwbkyM94gxKNjhMtSwEafiE2EAIe1dmo7ihZ?=
 =?us-ascii?Q?uWCicB3i+1FAXQ/9vy344IFbIAnVGEsbXVMxTcZRVG5t5IvnLr+bNF6b5qBE?=
 =?us-ascii?Q?6PpK5y3Y9lOx7FpLf4UNRYPbGxHdhSy+VZoBsSlyTCRcoyvofhbCkk22BcId?=
 =?us-ascii?Q?LAYufu75jkfNkiQrWNhf4mjkQV9UsxJvkP/KlqH1Yi/Ws3/AVnPKYoD0nosC?=
 =?us-ascii?Q?9vzZwnWzVRBS515X4lOZw4HzLDahb4Y2pBB+/lAjCqUzj1Y2wwDIsPlITE1Y?=
 =?us-ascii?Q?ZCzLT64BTT7BJOpHrC6C4yGKdCFF/RKt13g+bvbsSsKd2f5yVzagNQRUe69q?=
 =?us-ascii?Q?5Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b343794-d037-4bc5-ca3e-08db02c52371
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 13:23:13.0467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IluocXwpUDd55v7PT/irf64h/ptZJqDy6cPmw90Vg2KxSUCSvwBNq/A4Io3886ZfPvJiWmlriR3kQEKD7pXwUwQwPhwnaGrhLA89X605Rhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2237
Received-SPF: pass client-ip=40.107.7.137;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Also trace out a warning if replication mode is disabled, since we only
support replication mode enabled.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c   | 9 +++++++++
 hw/net/trace-events | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 89cad57cb8..5ca666229e 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -962,6 +962,10 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
     }
 
     if (core->mac[MRQC] & 1) {
+        if (!(core->mac[VT_CTL] & E1000_VT_CTL_VM_REPL_EN)) {
+            trace_igb_rx_vmdq_replication_mode_disabled();
+        }
+
         if (is_broadcast_ether_addr(ehdr->h_dest)) {
             for (i = 0; i < IGB_MAX_VM_POOLS; i++) {
                 if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
@@ -1008,6 +1012,11 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
             }
         }
 
+        /* assume a full pool list if IGMAC is set */
+        if (core->mac[VT_CTL] & E1000_VT_CTL_IGNORE_MAC) {
+            queues = BIT(IGB_MAX_VF_FUNCTIONS) - 1;
+        }
+
         if (e1000x_vlan_rx_filter_enabled(core->mac)) {
             uint16_t mask = 0;
 
diff --git a/hw/net/trace-events b/hw/net/trace-events
index e94172e748..9bc7658692 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -288,6 +288,8 @@ igb_rx_desc_buff_write(uint64_t addr, uint16_t offset, const void* source, uint3
 
 igb_rx_metadata_rss(uint32_t rss) "RSS data: 0x%X"
 
+igb_rx_vmdq_replication_mode_disabled(void) "WARN: Only replication mode enabled is supported"
+
 igb_irq_icr_clear_gpie_nsicr(void) "Clearing ICR on read due to GPIE.NSICR enabled"
 igb_irq_icr_write(uint32_t bits, uint32_t old_icr, uint32_t new_icr) "Clearing ICR bits 0x%x: 0x%x --> 0x%x"
 igb_irq_set_iam(uint32_t icr) "Update IAM: 0x%x"
-- 
2.34.1


