Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF9D68294F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 10:44:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnAT-0002GT-En; Tue, 31 Jan 2023 04:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnAI-0002CW-26
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:43:03 -0500
Received: from mail-he1eur04on2117.outbound.protection.outlook.com
 ([40.107.7.117] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnAC-0001hQ-Ss
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:42:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8vqKPa/46VQtZaC6oJrDgj1qQyouIZWZ9GAd/dpSOcQOJCedW7448/GA/AjfF/AlWwNzg87Hd7BSg+YLDXJl6R1X1RgVUxgui39q+ghNir6xbu+TrT0hTBiuVEYc+ggSvmO2W+9e3A5E2huw74exMTgWS1RYsBjTb9KzrXEMHIGnGfm1H1NdIgVNqDC3UH4dmukwoL22JUEbZv215qLf5mcoNWNU/krBMQLQYcagRhC8AbniKXyrIeknkWBLgvVITDAagvd5DRUQKtCQp0xUI74SBTpUn/YaxocF1Q3RC8elzEBfwzjD4VAshcsOx+GjdUMQs1ueg5zgLQVsL272A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0psK1jd92SmXnoMCkWbTmBMvN2Wl87290S5I1gN+Pg=;
 b=ffOY0+Eyvp3mGEucXnskwvq1VXyLus1Dco++WMGcse0OLJ3DdV8Hmw+9Vp/AGFRILCgmcjiTaJuQeYBhSlUUrSAaBd+9kVqs1GHv6ddvDpTaS8eAkwkF0T60cBBLn3jahksvvrY9v3KHiGsSOhwtFWkiRAignoLiAmCtPfq7Gkbe4kqHuZ9uxzy/JMsjg7jQ4ztSHm9RCzeJEoC3df5RlMT6yL/BlUa0t77deWGPOK77uj7180RxQ3IDZT7WHIpsGj9Cqczvy7+UM0UWUf0qJSLjWVlzREC/98zEw6f5iYrPeBxdKn98eGzrgNvd1CD46IdGj8/JEOz1Z2sxGIczaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0psK1jd92SmXnoMCkWbTmBMvN2Wl87290S5I1gN+Pg=;
 b=FSjaheqFeLmy2CkMnjAmDjRVJaVibDGDlpZLtypcvMFqOvRLw9yfDZ6VaX2rJNROZ2NURC0StZNWwh2ppWx+Eexp65XnBgk7Zy4VgCSACHFB2Lm3udGCYnuSEF2Js3S+VZl/ynzX0CQER8EVgEHTiMlbNPBcUk8qRBOiHk//wH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by VI1P18901MB0733.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 09:42:41 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 09:42:41 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v3 6/9] igb: respect E1000_VMOLR_RSSE
Date: Tue, 31 Jan 2023 10:42:29 +0100
Message-Id: <20230131094232.28863-7-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
References: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0048.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::29) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|VI1P18901MB0733:EE_
X-MS-Office365-Filtering-Correlation-Id: 035796bb-18e2-4d3d-e2f7-08db036f7d3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tM4DdkRGy0BEpiGsCiEHNuKG8uzTCclIOGsbvIxwXomUfDSKcr2OIAcEMLyK85NRnhUdRsG7g6Xg2UyPPg/RqxAi/Bdecng0SvohBJZ8w816YLsgr4YJBDRqn2Dy0pwLUVcWVBf0n3VSbNGgTaHwhJoAcV3ln/Zaer2XbqhKleiCREAHM//VeqU+VKXW2CiVpKtx1l+5tyxfOtv8P+6RREyiLQl9VPLrYiRz3fsEHj9NgI8vspoXiW8D4ort2oIo3xFoDuiPwmtU3Wihj8oPDmDwEg23ukcDdnXchsNkYH/ZpWZZ7shv+h9Rv+IzbOKtoZL6g5J+cWAItEI+XT7DPccqOnUoZouVbsWdSkhldfnnqil4y92QyjeUEpfCv3B6AquamtzOJq/DAEb8X8muDP4C73f1u/huTanI6Bj4E9vqr8/uUm8/sWK1RJ+XnnGLUJMe4hMs/8Mo64oUVlYFtOadIzkKhAD1jz2WVe5EScI5WzLmqaF2jYGi8Cu5n+zu11HqY7PbgwGReJI1O7DeDOBkhVz0s1VBzJjovnQW8dPpf6wOIOd+ikNE74y3qRmV48Bbf5+z7Vl6NpEowE/JBxk50RwsStmzZ8JdCUo8pGPFWqIABMy22QGMwLHDfiUxdLCb5xMiptLVCXSiA6outZBxCEaet8gI3a0qIGRvlL+SAXpgjWvHouI1nxWJbRfqEP0kSHsXW/i3+AjIvF+pfOtP11w+2Iym4rpBajuUJPw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39840400004)(396003)(346002)(376002)(136003)(451199018)(109986016)(316002)(66946007)(70586007)(66556008)(83380400001)(86362001)(38100700002)(54906003)(36756003)(6512007)(26005)(186003)(2616005)(478600001)(6486002)(6506007)(6666004)(1076003)(5660300002)(4744005)(44832011)(8936002)(2906002)(41300700001)(66476007)(4326008)(8676002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UDOyWduPQW90llm9ovN+yh1oSs/oWoNq8asRdM20O1wJrR/QcMvJ0DX4jMeh?=
 =?us-ascii?Q?IIClpO1mBMMXwX8oTqb5ZyMogSXTQBvuUVRpeU6cin0/jFJV8zXeivcktFSS?=
 =?us-ascii?Q?PqiWXaaIKVxtD4fpctkdxq6dUHtcjgx7XmQ4EV3qQTc7VqWnL4JPw0brAjJF?=
 =?us-ascii?Q?6MCS16ifhFU5rILBjRCZRwzwV2AZ/DXGoFzPy764xgG5wKHl+h6iQ2WjdvcQ?=
 =?us-ascii?Q?HCOmtwvOaEZzsMt4xh1JvoIjxuN3gnIDVui7MChRpSeb18FGevS9q02jsot8?=
 =?us-ascii?Q?Z6bt/71F6+xzj5U8I4MxiImrmu7cjAcJzS3EuzHkYrhhSINOjkD1X6jD9A4u?=
 =?us-ascii?Q?uha5xZ+o8Fp82ad231zT3iVWRUstD7w44THdoS+yKhZqC9O9sKBlk+cbJ6Tk?=
 =?us-ascii?Q?tl8QrEzg4TGGDGvDfex27NSzsSYRa0S8IrfpjhqhugE1IPgvV2c8EhnZk5Pn?=
 =?us-ascii?Q?Nyxvo46apX0ZUViMt3i0eX0iwJ/s7r2KmprJrcGLS26zy8UodfMcSSAdpw5V?=
 =?us-ascii?Q?+onTdjh4YSImIjWf1LkXkiFAjRu7F47QL4sdiC+3XdXZReFlfW/bRuUqfdOE?=
 =?us-ascii?Q?nm+5fYcjotPW9DNk426BUgxxugXXo5p9Xo59qKjWrKHyzbhcxTP7ZV3R1nxe?=
 =?us-ascii?Q?GZYV6tScXTiE4nMN/LPw1r8yKfTC8/cvTdwF5WwKcVsPRtqwq499xBaaDySY?=
 =?us-ascii?Q?54HjdtIKQY2mTmMXQBpTUVfH8YefkJOOFUpsoU2HqTnoprqh/U0yDg5e1cEM?=
 =?us-ascii?Q?vX/qZerM7LXHleI2AXKDE61L5SvuRh8hmZYzXBDB0OUPeXZuIoYqZWvzLiGe?=
 =?us-ascii?Q?Uq/K86KYNSZ/J693yizHQcDSRlNfTjZXvJHa7sIyGhHSsRPDgBiguho5UrsW?=
 =?us-ascii?Q?i75SJAP9QYF75v5GuNbRAEFLgc0ideCK1A4vkztf4FGlSscC5NUtAqBG0atX?=
 =?us-ascii?Q?4Tobm/3LS88hrqeQUKk1+M23w5XO5h7lMCuOF3WMOLnzT+O2w4p5y3s9MSXR?=
 =?us-ascii?Q?HT+d7KourZQwbDjU1TaR48m6I7I6RVoqSAtARm+alUBK7A7V6Jh1UoyP8utC?=
 =?us-ascii?Q?aXoMXYtPHqNCD2sn74zsN1vgl3BJAy8vvaLeagIdTdxUUQ0jwQavYam3K14G?=
 =?us-ascii?Q?o/O925yejju7aGGfa02kzfDAtySvTT5BEMrg6mtZDKJJBXobRISPRIx+ZRHT?=
 =?us-ascii?Q?lI8Q+ujBrXaicdty/JC5uE2/WTsLgpH4Xtt5HVcG9kHE02PIspN95+Q2GHo7?=
 =?us-ascii?Q?HFCeC/4WqnpM50E+cM7gfXRYbYtm//rrSdjpoH7VqfnBOGU0WfDUOTUJj/Cr?=
 =?us-ascii?Q?sUT0c6+poKT+vcQ7heFNrxVFvu9P/X1CXRcZkeXHTbuD+2nAn2NYnQTDzw2W?=
 =?us-ascii?Q?WJiCNcqbShWc/d4XIQn09MbG93FQCsuyT8zfkMWR0HCN2UlXlyw6S7A+r6Q7?=
 =?us-ascii?Q?J6BQZstRJkaApIFyW/WJ+S2slM+y5Mi4LzQClxOpq+rozLLd235PBh72x8Yg?=
 =?us-ascii?Q?7eFf7cRlTX7Hsc9laKz5ZtkxHk5smKEMd7cxe2lNnUSvOyOe68E5L+uQNs6p?=
 =?us-ascii?Q?W5q+xa5JEkYpM/MKM26hzfW2S8h9fQ39PDyXaz+yVg1NhO/uWTbtHZA9SLu8?=
 =?us-ascii?Q?DA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 035796bb-18e2-4d3d-e2f7-08db036f7d3d
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 09:42:38.2405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOUQherxDgAPcYys9GvwtHBobHJDWglqa3IRIhhkpRU9SUG86lPkqGNWvyZZKSnoOZVAvdJBGqtNrEHDU0wnp3BrNeu7GMfFAlmZJvTMVBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0733
Received-SPF: pass client-ip=40.107.7.117;
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

RSS for VFs is only enabled if VMOLR[n].RSSE is set.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 2f6f30341f..31a325d374 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1049,8 +1049,15 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
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


