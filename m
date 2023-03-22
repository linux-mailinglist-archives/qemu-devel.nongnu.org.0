Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7039B6C4658
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 10:28:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peul5-0007Pr-Sq; Wed, 22 Mar 2023 05:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1peuky-0007P8-Un
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:27:45 -0400
Received: from mail-dbaeur03on2070e.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::70e]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1peukx-0003H5-D5
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:27:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZ5jPnGz2jQ0/PNvYsll396YMQ+gLAqicAAeJh+ztlyWE1Lu93kHyw2KVjotoR7EzObvomafTCJeVYuZqzu8NazPbaqXpVKVxywSJ/dej8I664aZlls9rJ01w7ifLLSN4M6c42ab/wm14DfXgmeOBBQCyvhACvrH52D8AxLQsluhnYSpxnnIYpWxe14lqoAfGt3cfbbfoy9ZXVsRdahPU4mk4ow71lEoo9XN+HvPkzugvlLOj+RuGV8hd/QyYdFg5KXvQ2dYzvCY1m8/KmlMJ/Qlf9cKnEXs1pKzuykHtViDx3yup2p1oYRKyNsNalhRZAuRQHQrQL/Y/6mQkF18zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nWM9ltnWY3L8+VD7hQpCVRtUmGk9VTwAy+SSzLu3U0=;
 b=MQZiSjaBN37EphzY0MeDQFZLkNY8pBiOIe/yE76c5KAXDiEqd7OZl8vO4DVnxP9hrGaAuSkkmF1rt81wgD5O+iegLW9GzfYhqmgWBHIDlEbXjAdalLqkwKTKS1nBb3uFIiFv6IM6m+VJJ246P5zLIywhiNj1nTZbO8PIFi+l8suKrchsl63ZDWD9H/HyYUddmsL5Q5yTVXTEZqDXqf5iq7xj3y6wjGVbtEoDpy7ZubTCkVisFENkIxvAVblVldWRVbC63CTKyDOGd7FYqwxB3sr2K/bCpCs8oaY+u22GlHY786dasFCClxTcH1cFpe2t77MfwQzoLr4bEkUiAFcvfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nWM9ltnWY3L8+VD7hQpCVRtUmGk9VTwAy+SSzLu3U0=;
 b=HqCUYJvnYRVfzrIVxogwEfIF631Lf61iy8NxyTzWuFPbcxkPCurSTxJl1hrSH61LeeASDqa2ScVq8VboSKPSyvUy1bNRYUFHtChUD0cJq7uc2FgQzR1s4KSxwQSnd1FF51I5/tRoDgkXwDnVB2weKTp2uBVkQl/7bz07RVt59zI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DU0P189MB2201.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:27:40 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:27:40 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v8 2/8] igb: handle PF/VF reset properly
Date: Wed, 22 Mar 2023 10:26:58 +0100
Message-Id: <20230322092704.22776-3-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322092704.22776-1-sriram.yagnaraman@est.tech>
References: <20230322092704.22776-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF000013EB.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::17) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DU0P189MB2201:EE_
X-MS-Office365-Filtering-Correlation-Id: ab846445-c2e2-437e-7961-08db2ab7ae76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1qw2+I5Csoz/dEH/miu7GtBdPV/hEN6F7sIO5LHYxj50+YQlKDWotCT2rAKzqPjDZr4X1HkbGpVwM+3BrlnKSo5tQYMJfszyIhS+Ps1kRM6IBTvhH7WXMXZzo/KdbPNm56+zIGNTtk3t79Kq/ZXR6gsLQtJBsQEsI55H0EUUxo0yg5gpWZ2E0SU2AGseoBzzFgHeaCesU4/fGChBUdqnqHV6oTlTKq1yIyo7o6qYu5hegBGwiRifxpadMfCrMxliiEPjjPsxlAzOFIgl/hf7iP12pY/f1+fCTyLgYie1deqyroGBB0lnX1CfU3f11oSGqLP10dnsydRV9lcCFNaNxKpsP/VzMkAkUuFgWkpNYQs+dAqVNx2WQGfAn+ZrbWNu5v04D3UWQUOBMdnwCb6y1RgfoK0fxp6Eubt2vN8SvHWbyAT1M+iDohnBj13N01a3yRTz7P79O1YUxSboQP6jvmE+PekmCO05fiWbRPqknciqwIq0ZA+KD45c81Xp75FglnxATayYuHezMfDbTxt4HgpZkeZwcC1/qqQzZ3iKUgKD7nLiL0VZV4Em/+X83IbZA+bY3abnrtwDua+x14GgcTg3ZehH7sro1LwfbcUg3ZprRTg1Ypq1HmpK55xjOewvWdeWnpedUotNEEuN7Wr3MPH9w6X5xuxGTXPIOKI00LBewcsEnCKkXgc0WgejHitnETW2rBaUoSoJ0P3inebt/P7Go8/aMujsClwuYFE9rXI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(39840400004)(346002)(109986016)(451199018)(36756003)(44832011)(8936002)(5660300002)(41300700001)(83380400001)(2906002)(2616005)(316002)(478600001)(6486002)(54906003)(86362001)(38100700002)(1076003)(6512007)(26005)(8676002)(70586007)(6506007)(66476007)(66556008)(66946007)(4326008)(186003)(6666004)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y40/qMyf2soBpo63mKCEiTFj365wWANoC9bt5zm0d2bs1sZUmfEq9/2bIgs1?=
 =?us-ascii?Q?X7SHJjR4y5UeSwghq6+mb7rEU9jkhMUmR+0p1OkpBL/SFyHDizPT4VkciwAR?=
 =?us-ascii?Q?CbHxxGdjEs0u2eY+Vl8faYCUsFkPpJUtlf52r0WBptxmvFATLH2ld8ELRorW?=
 =?us-ascii?Q?g81C4y/CXX0m8kH6rMBlVke8VC/DAi7rKIQm7IG1FNPpEe5yqUnVbPq2I/ug?=
 =?us-ascii?Q?CrXyuKZGAzqU/h9/RH7w7tqQYgUf4klHVK0cXrPBZBySP8vWHgGId5ACQxVF?=
 =?us-ascii?Q?5hORqtgohEOBDQhE0ng+0hPpsx05tNImvP+Gv/iPwRF5clKhXMlZ5QQrM2LX?=
 =?us-ascii?Q?gt+smlBYWEKxQFc1YZ744odVEmINfJvmFfLua5SzEIriRpXsqS+TtxLJeRLG?=
 =?us-ascii?Q?DW8aD3AOZeokHJntNvTxvcfBe9zHOIuy2qGP5IO9dDE9M4OdkR8ago7wRrB4?=
 =?us-ascii?Q?lHLSosulFZCzumzedD/YdL5kAYBtngyOrlLXJWiSZkjq7eNPZwE+k+osneBn?=
 =?us-ascii?Q?pn+JUS4dZKikxZJ/fxUJ/tE2VWb3YPbCW3ilLr93ZLDt6p/dbMkRI9/CeYoX?=
 =?us-ascii?Q?HRDfD1n/XC9FzHGKjc7st/3llS6NXU8mMSh58spqznxnXvKA3pvRtF4gMb6q?=
 =?us-ascii?Q?lHp3cgLYxYvX5Fm8vKayB1HNcA4bvRwU54LUrRivGMsfItjJymIlXubvYrhR?=
 =?us-ascii?Q?BLnkurF4hd3I4PPGv9bxVXV6WPgCBJhzdjVjXHBk1A9DJ1flDdrbVrtfza/R?=
 =?us-ascii?Q?9UIIQuiv2CbqWnjwXPTgmIf+qg7Ntqeu01JlOS6HIF7lj3GQQkj33tkS8vBq?=
 =?us-ascii?Q?L5ICkGsbq++PyKs7PmbBJzYsViPae+9tk9oWnqfn/vC1OhxP09RO/6tqK6mC?=
 =?us-ascii?Q?yAfzoKfa3mD+VvjHPUC6GuSEYGb9G5pdEsCJkHw4SodkEN86DsSUFGNCLbl1?=
 =?us-ascii?Q?CDuKeRoCPqoFaq4MOXjMcObpSzA7glwJDxbh1lP+emzUnj8N5i0ariLgqroK?=
 =?us-ascii?Q?x2PIZ4PChoJ+NZh4nCyxJraOhIuZ5baZkFUXvfmu1TdqrURR2cNk+bIB+Lhs?=
 =?us-ascii?Q?VKyPcMFw92IIa/kAn6nKVXHjtWqAW5az2MH8QV5uzZbWXXvrgu8zHzTpJnLx?=
 =?us-ascii?Q?GeBUzOP2rqEUseQsdpy4//mPD5KaMfzPxgzqpIMopJ5Zxuj0lWewPUw319AI?=
 =?us-ascii?Q?rEkuJI9GdqFl3vbYy2QPIjDzqvMx94MqitJXtphvrQcQhTeWpbtHVjzGQxp4?=
 =?us-ascii?Q?2Xezpe5tatkFWLfyloJISNNH/TubLTNrNwxyh7HiX/FiMxAhuNIkjmRcgZkB?=
 =?us-ascii?Q?SRqo38Bcz4gdyB3BWK0FLOOsSBoXykFPjK5iisotGrPR34vPPHOwe4Lx58PN?=
 =?us-ascii?Q?j4yKMzCy8h1HMix6qKTr2rAi+qKQAcUvo+d5vn8k60NKjrvxbUUQ5EQUyFcl?=
 =?us-ascii?Q?aTyIzhCt95GHEL+bVJGaDj135yjaqlDxT9ENHLDw1sn73l4IkUXLyyMqRW9H?=
 =?us-ascii?Q?+2iLmfKQMSZoo8LTSOu1MfvIVbCJ4BmZZWwKo4rKiMRHaiqOElibnBV6fctb?=
 =?us-ascii?Q?j9riQ2a37O1uemLjgHkPcCQ7fuWqsB0jF/OLV7m1rEOY/naCUqJb+Tx40aFu?=
 =?us-ascii?Q?oQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ab846445-c2e2-437e-7961-08db2ab7ae76
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:27:39.9782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSY1q819KJsVbUkJhrwLeb7RxRWoK6UO/v68kvVW5MFbS81b7EAZ/7uIcpKuhk+oP5I2C31FLUYmabMUJh4FIyPmESyigEqHq/KA5BnHpuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2201
Received-SPF: pass client-ip=2a01:111:f400:fe1a::70e;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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

Use PFRSTD to reset RSTI bit for VFs, and raise VFLRE interrupt when VF
is reset.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c   | 33 +++++++++++++++++++++------------
 hw/net/igb_regs.h   |  3 +++
 hw/net/trace-events |  2 ++
 3 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 596039aab8..fe6c7518e9 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1895,14 +1895,6 @@ static void igb_set_eims(IGBCore *core, int index, uint32_t val)
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
@@ -1980,6 +1972,17 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
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
@@ -2234,14 +2237,20 @@ igb_set_status(IGBCore *core, int index, uint32_t val)
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
index 00934d4f20..a658f9b53f 100644
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
index 65753411fc..d35554fce8 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -280,6 +280,8 @@ igb_core_mdic_read_unhandled(uint32_t addr) "MDIC READ: PHY[%u] UNHANDLED"
 igb_core_mdic_write(uint32_t addr, uint32_t data) "MDIC WRITE: PHY[%u] = 0x%x"
 igb_core_mdic_write_unhandled(uint32_t addr) "MDIC WRITE: PHY[%u] UNHANDLED"
 
+igb_link_set_ext_params(bool asd_check, bool speed_select_bypass, bool pfrstd) "Set extended link params: ASD check: %d, Speed select bypass: %d, PF reset done: %d"
+
 igb_rx_desc_buff_size(uint32_t b) "buffer size: %u"
 igb_rx_desc_buff_write(uint64_t addr, uint16_t offset, const void* source, uint32_t len) "addr: 0x%"PRIx64", offset: %u, from: %p, length: %u"
 
-- 
2.34.1


