Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E260F68295D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 10:45:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnAS-0002FF-Fr; Tue, 31 Jan 2023 04:43:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnAI-0002CX-2W
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:43:03 -0500
Received: from mail-he1eur04on2115.outbound.protection.outlook.com
 ([40.107.7.115] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnAC-0001hD-UG
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:42:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWoSC+6gkIOs+IhONUqHhy/hwY56xmnS4tQ2KusX6Oy320KdPM1HmwlxxSSENpqzeC3fSJM3Wf1vm8tEAdqhg19r2ibQYETZvsdyvB2P7+Iwlhm7Hn8ZgWRYLxW4KpzyZksfzF56fI0XMFwPBthuoqH3ZErR0pxTmA7vji9DOXZadKUDo5n4c5HDMvWjt8GaGxrdu5L6qtsSODH/drLEGmkWDCTfuE1IN12aRAbZ0bN3fhSG1jJaMc9ug8l8/4+fKaQa/icxsMacZIPzEsPfWxZId02ig6+Vac/m6lH+EnT56slGClkVqGipyJchc6gOTM9gU47yQ4DlRKprdsRhDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mT3d5lRRKP4RYLIl4Zw4MdhUJe8lDEy0JwhoB86bm1s=;
 b=AS5gq58FxkqogV0FWrrDmyD8fPQlvwnNoGFybnFd+2Y+fz4+yo3wGpreVeT8f6DNpC0iPwn2GU76iwC/oUwmvQWgGkB8ce7cHynV5XcdNkA3r7Ghwpqdz0uMVHZGOV0OQtaXLyGNemOMPR6qisRiN9xnzgBkr3OPfCL74F2e7WCn+Xpo+kcKE7J5P2KHttq0Z/JxHpG/BnvONm8GqUcDpq59kZHb31wj49rFoLaYjL5InmLkRW9UnJ4CYe4/O7ZSKiFMfYhnhGbL45en17D8DFF3xR0T1tyZMetl1NoKMKcUHMp5E7DTynMur15mhNAUoISWCOBum29G+5eQ1Kknyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mT3d5lRRKP4RYLIl4Zw4MdhUJe8lDEy0JwhoB86bm1s=;
 b=BGUCJe4NmITcPc4dFyDbSApmER1YKGNE9TZ9LPJs6e4ohdShxT8XajAjeT/bMY3SzUpDGZi1WwJYQoLUwjra+04rCPr+zMgPllpEqo+FYTvYGeAskdQWMx9whzzdvRraWP8Up/X0unpzIwYRL0VMfJSDJA7ujArrroS+Lzgohrs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by VI1P18901MB0733.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 09:42:37 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 09:42:37 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v3 2/9] igb: handle PF/VF reset properly
Date: Tue, 31 Jan 2023 10:42:25 +0100
Message-Id: <20230131094232.28863-3-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
References: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0051.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::35) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|VI1P18901MB0733:EE_
X-MS-Office365-Filtering-Correlation-Id: e235eb0b-26f6-404f-49c4-08db036f7ca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c9rzybYv+Y++nDwZyqEbevMI8aWgpI+tIPuFPudZV69aStaXmQmD3d3mzudwG3nGmXK7fz7b9277Vr9TNN/t2GZUUPGbxe+onPQv7T2Ecgl3cPi5t9uQ++p42s+jo5q79F74IrpU6BnCKK5NM8QgEQ7K6YxKRhPMEb5A41TOUURT/SfR5oXwCJVe6G/K7VFE2RUQXGudl5evVW4NAtQ3LP9WwqjKSRgvjovr3gnl3luC4M/huMcDBv+XCDi9+a//JykIPlxTtQ2o+qjVWGgaru16OD8UOzZLmevBk9M2Dddo5xkhipkRt7whwNRGpCS/mCkf1VMj2ZOkk4DsUXaZ+gEk92enE6ANBY3s6ZfSa4nYdvUbVB0dFMmPqAzj9j9nhTjzk8bAGSNjtey4c2TrPuLMTfgOTxoGCy1bbuQA2Iy+Pq4T8Qe9ER6CjAySAwIIIHevN0fp9o8T/gVbC114TYZZbuKkgPaY78OL1wPQEhcmVvNthe4LizT71pRDGFXMg851VCwh+GorNXwGNIPyljw6m3fACo1d4alY8KPPhWmODQAQXuuPKZqfn7uL1JjOeCl8oydZZzOSpowNYFSTuqswVkvAJi+DCPZLzBGfDbKcWS7yVVw2PTmY0NQD5zejp4IAfWKViILx3HdKuQxSoJTmUJDAEovO8JBV3bgqWrcgq1ZeuUQx6c9Su5NBQ4C8AimiCU53LeBNNVhIQ6kb/I4PzOuWdFC4asFRztW3cck=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39840400004)(396003)(346002)(376002)(136003)(451199018)(109986016)(316002)(66946007)(70586007)(66556008)(83380400001)(86362001)(38100700002)(54906003)(36756003)(6512007)(26005)(186003)(2616005)(478600001)(6486002)(6506007)(6666004)(1076003)(5660300002)(44832011)(8936002)(2906002)(41300700001)(66476007)(4326008)(8676002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iVmdJn7lkIKh3Miga7tHKZ665jQcV9+j8wcpwcpXhKtCR+IhC8XXdNY9eWyl?=
 =?us-ascii?Q?0VrCCPto0k7K7B1UFdfieq0kOv/W/dAtL9GY5wIo0GHsiLi43DWbRqwd5xBk?=
 =?us-ascii?Q?rNGUOFNXaJFVUeNjF9FsoR03N0XMks2vK4ozdMo9H4awrjABjHU4MZ+v+w5d?=
 =?us-ascii?Q?yXJUsilhL4WBPFVC3QIUrFUlzSSpRshTfTXY2Ev63HDd2lxvQ7Lt2nMRA6xj?=
 =?us-ascii?Q?PwWt/owI1QAuKYcJoigB1L2ydKrG/U+VY9kiMFsBMxA1PmS8PIaE0mn8t+WM?=
 =?us-ascii?Q?b5aZrlbcr4whuLUSau5RBFslSQVIyncK7aZT9fuJaPKV8R00dGUYHyFcl72r?=
 =?us-ascii?Q?VF7Lsqa//Xpjn7D49gbKll9tbw8MygV2po5YyUMUMVpH1IwD9ug7Buy+9DzY?=
 =?us-ascii?Q?u0M9HA4R2Z4Di1+KMXkx3a6ptt6WCzxHOBlFbMBAIYmhlTCXHuswvTNpgVfC?=
 =?us-ascii?Q?g1OXabK3zY+MC5nyEqSEFoNjNc1X2FsjlEqBgomJsNaUZShWfjDULblv5Uny?=
 =?us-ascii?Q?diefcUY3oaRQu5SHW2CyfEU0+Hx+6CR4/y0NFhKl8sqHklbvuwtsGo+OB31k?=
 =?us-ascii?Q?O0mns6NGupOsAAaFUYGkjzvcaHqhwg7xrg2t7RX3xmqiibKkk/5a/97nMoHZ?=
 =?us-ascii?Q?B4EsA+IyyDH7CtiiorO6244TpTeBxXtM/RnsRzfpwIoJOlMcxGAVjlsdUdwl?=
 =?us-ascii?Q?80sMs50jcBuxRorwqU9UpsQ60ag0VlL/jgWk4mPtIw6PnYhFjj9RLwkeiwGI?=
 =?us-ascii?Q?/dWdafZQSryizRQ/pv+1T4SDGoYeY2vkdcn/sJS0SmPBgXge8ifiyYa3dZ44?=
 =?us-ascii?Q?+vKHNW8GD7XfCPTSFsntNmXjibAra5ztgU1oY6hh8ShZVKad3SOnd2zuBj15?=
 =?us-ascii?Q?FETy2cbkFcQBG6X4kZ2eigYlUZcDOn7Y4aCbYCGOoMyLsnOAkdjrvMG4+ikL?=
 =?us-ascii?Q?FzcGHeQgOMUuHbUtkijvZ5s9Vj0buCP8kVsYKm/7Z/F27OMY4xAyeRZ0Is34?=
 =?us-ascii?Q?Pv9jxs2On2GEr/bBots6NGnwIwC3+hebjiiFrvzt6CweLNvnjgH7oYPSwCnO?=
 =?us-ascii?Q?DdiJm242JFWMCLHeO17QQWz3IGFWRxEoQBZZ3hx+bHJRtsO43Y4bYNcFNf4d?=
 =?us-ascii?Q?G2TMly4aqlg+Ln1iiCymmExRQ/7MV7lJf+dVZyydpsVFTpsT22ewJLgUp7rz?=
 =?us-ascii?Q?dhmzX77OM1nb8Leen16z51hlI0yvvKBgQh4/JOYwSvRNKzwRku3nO8vGne2G?=
 =?us-ascii?Q?AjgQPj3atp07d78lH9mBYi5vBFzfdGe/3xGxMubFraLfHlQ3DceGzTgzdl0Y?=
 =?us-ascii?Q?eMuxo8UM9zGDpmVPkjoW/CwioGc6tHHU98GiyrkIrNNY0YQBnba0VopXyzSw?=
 =?us-ascii?Q?QhedoGIH1/um5eG793e9bTlRnc7HjOD317lekF/HyW9w+PnBPw1KPSfDr0jj?=
 =?us-ascii?Q?m+vTQS6vA5szYuPQtk9Ni5p/nT4o6DZRO7d0shsnUaKQWkPoL8DHpR2KFZwo?=
 =?us-ascii?Q?J9XhsjOYC6R4haz8WABe5l8SaRwMAaUD9YdwlFF2jwoRmKsv5tsHWL7/WcIu?=
 =?us-ascii?Q?kPtLUNc0rDDsm/l5lw3bxZrCi/OCrBRERy7KyAR3fs/Hb1jyv71zfwoIYh7y?=
 =?us-ascii?Q?Eg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e235eb0b-26f6-404f-49c4-08db036f7ca3
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 09:42:37.2261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yn58x0JpyL/xt3va08+YkYLbTnKHMU11wTRbIEf47NTlOuJv/XPNYhGGZ6emBtvVTiraNkKTJpEgO7RQNNK847sVLxk+DzQneQnFwCOQdCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0733
Received-SPF: pass client-ip=40.107.7.115;
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

Use PFRSTD to reset RSTI bit for VFs, and raise VFLRE interrupt when VF
is reset.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c   | 33 +++++++++++++++++++++------------
 hw/net/igb_regs.h   |  3 +++
 hw/net/trace-events |  2 ++
 3 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index bf1bcac747..9c32ad5e36 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1904,14 +1904,6 @@ static void igb_set_eims(IGBCore *core, int index, uint32_t val)
     igb_update_interrupt_state(core);
 }
 
-static void igb_vf_reset(IGBCore *core, uint16_t vfn)
-{
-    /* TODO: Reset of the queue enable and the interrupt registers of the VF. */
-
-    core->mac[V2PMAILBOX0 + vfn] &= ~E1000_V2PMAILBOX_RSTI;
-    core->mac[V2PMAILBOX0 + vfn] = E1000_V2PMAILBOX_RSTD;
-}
-
 static void mailbox_interrupt_to_vf(IGBCore *core, uint16_t vfn)
 {
     uint32_t ent = core->mac[VTIVAR_MISC + vfn];
@@ -1989,6 +1981,17 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
     }
 }
 
+static void igb_vf_reset(IGBCore *core, uint16_t vfn)
+{
+    /* disable Rx and Tx for the VF*/
+    core->mac[VFTE] &= ~BIT(vfn);
+    core->mac[VFRE] &= ~BIT(vfn);
+    /* indicate VF reset to PF */
+    core->mac[VFLRE] |= BIT(vfn);
+    /* VFLRE and mailbox use the same interrupt cause */
+    mailbox_interrupt_to_pf(core);
+}
+
 static void igb_w1c(IGBCore *core, int index, uint32_t val)
 {
     core->mac[index] &= ~val;
@@ -2243,14 +2246,20 @@ igb_set_status(IGBCore *core, int index, uint32_t val)
 static void
 igb_set_ctrlext(IGBCore *core, int index, uint32_t val)
 {
-    trace_e1000e_link_set_ext_params(!!(val & E1000_CTRL_EXT_ASDCHK),
-                                     !!(val & E1000_CTRL_EXT_SPD_BYPS));
-
-    /* TODO: PFRSTD */
+    trace_igb_link_set_ext_params(!!(val & E1000_CTRL_EXT_ASDCHK),
+                                  !!(val & E1000_CTRL_EXT_SPD_BYPS),
+                                  !!(val & E1000_CTRL_EXT_PFRSTD));
 
     /* Zero self-clearing bits */
     val &= ~(E1000_CTRL_EXT_ASDCHK | E1000_CTRL_EXT_EE_RST);
     core->mac[CTRL_EXT] = val;
+
+    if (core->mac[CTRL_EXT] & E1000_CTRL_EXT_PFRSTD) {
+        for (int vfn = 0; vfn < IGB_MAX_VF_FUNCTIONS; vfn++) {
+            core->mac[V2PMAILBOX0 + vfn] &= ~E1000_V2PMAILBOX_RSTI;
+            core->mac[V2PMAILBOX0 + vfn] |= E1000_V2PMAILBOX_RSTD;
+        }
+    }
 }
 
 static void
diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index ebf3e95023..ddc0f931d6 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -240,6 +240,9 @@ union e1000_adv_rx_desc {
 
 /* from igb/e1000_defines.h */
 
+/* Physical Func Reset Done Indication */
+#define E1000_CTRL_EXT_PFRSTD   0x00004000
+
 #define E1000_IVAR_VALID     0x80
 #define E1000_GPIE_NSICR     0x00000001
 #define E1000_GPIE_MSIX_MODE 0x00000010
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 2f791b9b57..e94172e748 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -281,6 +281,8 @@ igb_core_mdic_read_unhandled(uint32_t addr) "MDIC READ: PHY[%u] UNHANDLED"
 igb_core_mdic_write(uint32_t addr, uint32_t data) "MDIC WRITE: PHY[%u] = 0x%x"
 igb_core_mdic_write_unhandled(uint32_t addr) "MDIC WRITE: PHY[%u] UNHANDLED"
 
+igb_link_set_ext_params(bool asd_check, bool speed_select_bypass, bool pfrstd) "Set extended link params: ASD check: %d, Speed select bypass: %d, PF reset done: %d"
+
 igb_rx_desc_buff_size(uint32_t b) "buffer size: %u"
 igb_rx_desc_buff_write(uint64_t addr, uint16_t offset, const void* source, uint32_t len) "addr: 0x%"PRIx64", offset: %u, from: %p, length: %u"
 
-- 
2.34.1


