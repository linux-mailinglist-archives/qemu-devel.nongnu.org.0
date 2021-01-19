Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ABA2FBCF4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:53:35 +0100 (CET)
Received: from localhost ([::1]:45170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uG6-0006N6-IR
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1l1u4G-0003ym-OT; Tue, 19 Jan 2021 11:41:23 -0500
Received: from mail-co1nam11on2134.outbound.protection.outlook.com
 ([40.107.220.134]:28384 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1l1u49-0000EO-VJ; Tue, 19 Jan 2021 11:41:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJw7KRAjJ/H76BHbiAG1Rr/cpOAf7FMVCuXJDzM1m74nGXRPT2L+dw9LfvtXMe9tgfelDaX3fSjjdJTwYULwEO3SuFfCoYanBpno7aAL1ZH2gSjdGzDTpPNu3ymaj1OtAZJVEGM2OgosdGzrAJJsv6ZoinxelWd9hlnXrGW45jCeLtgldPpi2vshN6DgKsb1j7YSHHb9OORrMUz+amO7r3NKKSjd3tvOgrUREg3/WWFetP2lCG14xu3DdKEeRNY+MaN/oHOFjpjkqbExW/NFYXEUvP7J2XpF6M7OixznmF1rHEA74BJWRDgUAsD5NY+x/4sQ4cObq6w9ke+d1Mwx5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdvkesjHJd122VPKtGbhb08/Y3rRR/SbUJrwZHMpTEE=;
 b=B6rB2VJu0aAMYQ0NrSRev6ZG+umu30Qgm4iRHtCAuMia/cK3cIEhlNuH9lsty3EiOt0MInP07CflJgFcAb5HrDsE1qTvZ7mu7WLxPfxBj3q9Lu3MUXg09TK+utKtPaEFNOIicCR//omroKWvwVAIJ1dfG1Ub9c3ljC4D0uNIX9OSZA0RQB3mvwpEhXJHU3A6y7eQqn/8qbHhpmAv4bz3PGEhAl8ecC9y3F5hL/pQGnKn3UPKxNcEnaQdRJk3OowH+esrXnLI3kFNp8JZkWq8GY6wfPI6/zI8YheQyyRi4oGfxru8UCU+wpsSgJuds5tXmJi27+bN7rJk0UAel8T+zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdvkesjHJd122VPKtGbhb08/Y3rRR/SbUJrwZHMpTEE=;
 b=3H/FHzRc/CC4Jv07gX6P62VugqAAB0bH0wd2u0w4QiWvYd+ZyYSGb8rKPIf200BwHj7X9jZt2YDl5DDIunE9GdTS2k5qa/l2G+wUxeds23XaNweVc4Upk4np/OQpg0pvzrKW8hbh7sveOIMTCg2asC7DiidjyeMaflocEySzT4U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4176.namprd03.prod.outlook.com (2603:10b6:805:c0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 16:41:04 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 16:41:04 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/ide/ahci: map cmd_fis as DMA_DIRECTION_TO_DEVICE
Date: Tue, 19 Jan 2021 11:40:51 -0500
Message-Id: <20210119164051.89268-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR20CA0011.namprd20.prod.outlook.com
 (2603:10b6:208:e8::24) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR20CA0011.namprd20.prod.outlook.com (2603:10b6:208:e8::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 16:41:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b56203f3-3926-4789-3561-08d8bc990316
X-MS-TrafficTypeDiagnostic: SN6PR03MB4176:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4176C2B74516CF8959DEFA6FBAA30@SN6PR03MB4176.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:651;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CrVJ8W/HPY2fuV9oLNrQgFoaQKdK6ROWul+T4SfKXYWAmFC5ONF8ArD6q3SvQt08JOWs4k5iGVTTmKBPgCKKbquRGqF13mQHymmxhUUsMM6UG3QWxD2obaNTYFFaxrUkFO8hLh9+cfP1HpCzvZsqHWosVNP+KJfXvSEx2O8KB5DrnlwyZH57krgmh03ES7uC0Z9JuQARR62seZS4egnf3+OTNN62Px4DPqLM2vfHvezC6gvJV1Wpltf9V1xeQFqPeLZ0NgrhL00UtEKdzs23jhY+buGkDLfk84ku5JQisK01lFszq4gQB8yhmsM37hXS/MQHRzSdwQLtvL+P3cUqpNE5pSF1GHGVQ/b0C289RoRBoczsdoYzsmMnoc2fVR+SigMA9V3eZReEm9z9ab2eNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(186003)(16526019)(786003)(316002)(26005)(86362001)(75432002)(6916009)(2906002)(8936002)(1076003)(6512007)(36756003)(4326008)(478600001)(52116002)(6666004)(6486002)(54906003)(6506007)(83380400001)(8676002)(66476007)(66556008)(2616005)(956004)(5660300002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1ah9NtdtWMjw9JKyiJWg+1ou5UrA9XvJxhIAYpG+3llKto0Z5RqHl6UV9FrP?=
 =?us-ascii?Q?n5oPXp9mG5lXo7hvLH8IocFdlNGC54vTodRIcVw9GjmEw91nPbFPd+17NTPu?=
 =?us-ascii?Q?DCGUh6Iq4SlFa2U5/WmKKUZqzc0wL4nTTPm6mRhvuR+lzV/jr0ZEnP/u1Uey?=
 =?us-ascii?Q?SC+6DDAO9qmm57RHEPLebNDH0rdp+oOKcZUL/pERdUqnlUNAPp5d9liOTDTz?=
 =?us-ascii?Q?vyz6lMtu2p0GUQvFG702gxQ0pGS5doI7cqUaiWZg/dNJi7Y9fWR0fcmPKpQx?=
 =?us-ascii?Q?GvemZJwR8IfPf/sH6SaVlgvmI7/9fOzCoJJ5CESF/iqZWMQZV3sSr2pVED8Y?=
 =?us-ascii?Q?vHZ04mypauEvdgsplfBddOaSsYTzDFTChgUZsnHziHfHkU5EXVU3E43nZQxh?=
 =?us-ascii?Q?ZmVxFYSZGrJ2kIiG1IG4l/WPtcitVJbM2ybpKMRcLS6UyMt9jKi9Dk+nJi8G?=
 =?us-ascii?Q?q60ycLjr+1t/Y3R0qXOwqoUQviThoStA20BgFwcPISGMmmoUIyF8UJyVwMBx?=
 =?us-ascii?Q?0qr+9r7KvT5TX5bAU/PlyjUJCiiqfbowUkew1/cXjDTcFPFWym8LLG7+K5UE?=
 =?us-ascii?Q?KFdzhhrbUIoLzaHWtcvCXKbRuzJTm+sLjyYDdDFxnkJv1cmfQzEoRKjKWCaF?=
 =?us-ascii?Q?1i1H89hv1ByRJsKMYpXbOOdy3FyHmqzHjGq60E/g/HZJlMozPaYr6A4DU9I+?=
 =?us-ascii?Q?nPaZbn3a0VgImGacF4ABqY+zM5bfbgp9shKAFNYtgUYUX/lO2EF05YNhQUp6?=
 =?us-ascii?Q?qLOQhlQ/wolYFw2Mr+39qjyyv3u7H8iA+V6gfOI+Qsw6IeEl6F14vajROkOn?=
 =?us-ascii?Q?FDbUseoIDJ9a5zotHIBsa2C1s5pfre2aJNAvpVD6NG6oLR5EjLlGDKdfoB/a?=
 =?us-ascii?Q?B0/6VoqPqViHIfNPiBKqWU1zs8pq8OjNF+SN5AH33PpJJOFkDHFqbTi6zVYr?=
 =?us-ascii?Q?x6UPPGDZr4re4SXr5izt55JSlZQruFRBUux72IUuTErEiGVxffa6Vuxclr2M?=
 =?us-ascii?Q?WzZl?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: b56203f3-3926-4789-3561-08d8bc990316
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 16:41:04.2876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyDE9nbFESFbRznmMPZ10DbLgCJLLeXnwqXjM9WexEfutPUrCRAYCOgVjN1Ivu33
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4176
Received-SPF: pass client-ip=40.107.220.134; envelope-from=alxndr@bu.edu;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, John Snow <jsnow@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cmd_fis is mapped as DMA_DIRECTION_FROM_DEVICE, however, it is read
from, and not written to anywhere. Fix the DMA_DIRECTION and mark
cmd_fis as read-only in the code.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/ide/ahci.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 4b675b9cfd..6432d44ad8 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -699,7 +699,7 @@ static void ahci_reset_port(AHCIState *s, int port)
 }
 
 /* Buffer pretty output based on a raw FIS structure. */
-static char *ahci_pretty_buffer_fis(uint8_t *fis, int cmd_len)
+static char *ahci_pretty_buffer_fis(const uint8_t *fis, int cmd_len)
 {
     int i;
     GString *s = g_string_new("FIS:");
@@ -1099,11 +1099,11 @@ static void execute_ncq_command(NCQTransferState *ncq_tfs)
 }
 
 
-static void process_ncq_command(AHCIState *s, int port, uint8_t *cmd_fis,
+static void process_ncq_command(AHCIState *s, int port, const uint8_t *cmd_fis,
                                 uint8_t slot)
 {
     AHCIDevice *ad = &s->dev[port];
-    NCQFrame *ncq_fis = (NCQFrame*)cmd_fis;
+    const NCQFrame *ncq_fis = (NCQFrame *)cmd_fis;
     uint8_t tag = ncq_fis->tag >> 3;
     NCQTransferState *ncq_tfs = &ad->ncq_tfs[tag];
     size_t size;
@@ -1183,7 +1183,7 @@ static AHCICmdHdr *get_cmd_header(AHCIState *s, uint8_t port, uint8_t slot)
 }
 
 static void handle_reg_h2d_fis(AHCIState *s, int port,
-                               uint8_t slot, uint8_t *cmd_fis)
+                               uint8_t slot, const uint8_t *cmd_fis)
 {
     IDEState *ide_state = &s->dev[port].port.ifs[0];
     AHCICmdHdr *cmd = get_cmd_header(s, port, slot);
@@ -1299,7 +1299,7 @@ static int handle_cmd(AHCIState *s, int port, uint8_t slot)
     tbl_addr = le64_to_cpu(cmd->tbl_addr);
     cmd_len = 0x80;
     cmd_fis = dma_memory_map(s->as, tbl_addr, &cmd_len,
-                             DMA_DIRECTION_FROM_DEVICE);
+                             DMA_DIRECTION_TO_DEVICE);
     if (!cmd_fis) {
         trace_handle_cmd_badfis(s, port);
         return -1;
@@ -1324,7 +1324,7 @@ static int handle_cmd(AHCIState *s, int port, uint8_t slot)
     }
 
 out:
-    dma_memory_unmap(s->as, cmd_fis, cmd_len, DMA_DIRECTION_FROM_DEVICE,
+    dma_memory_unmap(s->as, cmd_fis, cmd_len, DMA_DIRECTION_TO_DEVICE,
                      cmd_len);
 
     if (s->dev[port].port.ifs[0].status & (BUSY_STAT|DRQ_STAT)) {
-- 
2.28.0


