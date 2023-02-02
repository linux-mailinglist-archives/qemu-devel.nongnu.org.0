Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A769687844
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 10:07:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNVYO-0003i2-DT; Thu, 02 Feb 2023 04:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNVXr-0003Zv-Lo
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:06:19 -0500
Received: from mail-db3eur04on0721.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::721]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNVXq-00065l-7e
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:06:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwB4SJRM1p49ETIr2Xt/ux0WjDaLeHLLHeeTpyRT1sR0K23T5aC35Jwdb9RKkdJhcH5ReDyt4KCcWvCaZxkdMYPtToHdvVIIeqApiU3itH2O6nhDb8P8134oT1As5ykXZuUBTTq3o9LOAxwy9D1YaPVTPnyZhH59RPwckZe8HvMaaI7OwTZE94so8VlUgKlYpv/cL0EGFNejiFxWd+FXopRQ2Vu8EnJzkQL0Nr0Gl8ZMYXThqCGX4ySq6thsVr8vWKV02DCx+q15HF9vJS7eqSWThf3pCINhSCCuepdLow1K2q833+OCVnwFlhP7Nvcvh6kI3VNUnmC7b5sKfyuyoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aQ9Q1DqfrhWLfhv2Y18Qs6g1oBJZ/8cfEbc910HHis=;
 b=X7DK+ALkZZK6kaiIPE3AnvyIU0u1PLk45jPyg/hsdPHqyjXv+rgpMeLrKUQbwu7baubBQEqPY4WRv8DYyDyK2FILLUDBvfkQ61nYjWu7gAbSsItLOXqkVvkPQplX49PPdaTHpMckEWq6RTzalqKl1sVC/IP7DHQu91SzxA2jVmslkxX6q+NEb2w+w8UgbQ7wRBPHiryud+zQ/+HYqmjc/oLHnl7A306mUM2oJb9mXZPFqFO36Hml70vZGuxcNmaro789ObG8dd9wn0SmPGmucd0XWca6dsHP0gtxbbDxWVUL1n/4FsqCVqXws9F2ctHGvEHX9AjE7H35uT71ndLG1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aQ9Q1DqfrhWLfhv2Y18Qs6g1oBJZ/8cfEbc910HHis=;
 b=SiqUvXXGoVEeIsCt4xCY7GzgNeDXWEHtU3MSoTvMEtOepom5oW0bGFIZ8xO8hn08AfR7iPNM6maBoAmv4WsIlyrnKhjESfbru0KPf9eUp4hR41OmB623I+RtZwLwbF6hF/vxNnpIq5kNF/RLklWLu7oi45ovkpn/dHLqkYFMZvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PAWP189MB2592.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:362::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 09:05:59 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 09:05:59 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v6 6/8] igb: respect E1000_VMOLR_RSSE
Date: Thu,  2 Feb 2023 08:52:55 +0100
Message-Id: <20230202075257.16033-7-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202075257.16033-1-sriram.yagnaraman@est.tech>
References: <20230202075257.16033-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0020.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::16) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PAWP189MB2592:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f2d670e-9e82-4a16-57b5-08db04fcb2e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ruXgpvk+3FotSuF+tyfgU59M0KiSR+qYYlG8qZoIqBOwmH8LjUBFDA1lAfUj+YIoO5Y+pORrz/CWZZ6SJ8zazjRdOTc6cVjGuNNYJa9Zg3AzwsZ7RT0kZBroTclpacNECTZaFeSZ960MoJ4sXtv4InEyOjuW0/MjiZwarKATTr2OO4TTN5+EOzKf7Ma9N3Zk4L04YKEjHIKp7IMau6gTe+1BjZ8UOWC92Ymw8WSVKLKCpnpEp8RQSxdcy3jAIp4k9eet73Fj7cqoF8RXl1c6oAK/PheFfmHbzrtrwMEGTewPcpNH32tQHP9geB7nltt2L6MsYdjO6uvAZpv7oSQv9s2dSLd45rs/yFPw2YfxtnWqHZwcvDZaYDAJr+ffIXk8Te/nKsmkEV2TwTfZ3aHGEimzGB1Qu0AsFeIM0aviv408+OwSxeTIOhLrJSQq/a964XgjnBCbD3L2twikJn77wloNiAOSNhn8QOgIPXVQi4RV7h/6rOWNt7ZbHM+ghnHDXAttybbCgc6+KxMeh6q6UQKvXRQlKuRXstJGlt2/uGHglOF6LC76drWB4zvXqBvGeev8ztOqrtD57Lz+qHGE1V6kxojc5vtqZZawrKAhghrO9OSyuwaeiSJtUBGBRjpQU3AvpOKsHtEyKwVvbKEfrZ0tDt2EHTkCGkaGzXZs0I1AxsmAKXFHuDL/ySMLrOGuFG5SysRDyOsEFfp2G+vjbwsl9Pl4CPrcEXct1EAaLE8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(346002)(39840400004)(451199018)(109986016)(70586007)(83380400001)(66476007)(1076003)(316002)(8936002)(4326008)(6666004)(6506007)(66556008)(8676002)(54906003)(66946007)(41300700001)(478600001)(6512007)(2616005)(26005)(6486002)(86362001)(186003)(36756003)(44832011)(4744005)(5660300002)(2906002)(38100700002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nbq1puXmAIZo0vqlGnuLQHWp2yAYIklabbNji/FkJqLxGMIKv5wvxjT105da?=
 =?us-ascii?Q?XJvlSwD5TVrfzFosGEJN71vkFBHW1+h7rjCFQ2cueF/x/U/7GlRqtIDpa3zN?=
 =?us-ascii?Q?QxgMKQXhPSH/ThssgG5uDuivOAmlvUv+OQ6gmcPmCIb12iuPICnRKgTsLart?=
 =?us-ascii?Q?KHVIeMZ2vixdAId//bqLgmKVx2+i1vBD/gO2sFP9KfKOeG3IbAgJTT1v2QGe?=
 =?us-ascii?Q?Ix1Joaxkm2BXpEaHU8tccaLe8gEKF7Y1zQCiPAITJqO6CoF0qk3GiArXyNpU?=
 =?us-ascii?Q?TQhamp0BmYwjJk45zVgY9gRIOsD20vLmsfGsKc9HDtrrr3qJWcVILIxw35th?=
 =?us-ascii?Q?8bOl/EQwSRuib0SMM2oK/hQgAlbYQlXEk3EE7pJv+BqLMZ/wXgpD9ts0Mqm/?=
 =?us-ascii?Q?BmfoumOEp3W4oU8KOpZndgYrQzOosjUEzBWkDIderfPdRmsivE8sIHmgpOpf?=
 =?us-ascii?Q?XnugFQnkRBEASAOwYcILQK+du8i25JZvN7/1VA3CLjj2Zvwcc1/cozYSMNs6?=
 =?us-ascii?Q?Y74T1VbkMZpYbLMXqN0u3y71I579CW6YVyFT121bEzc7b6SJYHdn4RAuNKSZ?=
 =?us-ascii?Q?EEOl+Zf3Dm4TLP3yiPkJf45Ykrr3fDwdnKT4GpTZWvwJJazW0PcKs2QyUJvd?=
 =?us-ascii?Q?oQRYiszCu+j9yf7uoZPtto3TZX3087nV39sb7fVAi/n0Mx1myic5xAKQEV8X?=
 =?us-ascii?Q?8QQGqxopRtc6fAm6+HFMqMS/Zzcd9+/a3ClUXFt6DFtI6iKpU27Gskfr9dGt?=
 =?us-ascii?Q?xUgZX+bpPJbiva+0aYd00F/DKIWQp/trQqUbSJmu8ELkPWC/SJlpXYKcgAcY?=
 =?us-ascii?Q?062T0Vdd8xsEBqTuqN8D0EkNiUgUmm5DHINxOsHkyLwCjSeZ9yQVz6l1INKt?=
 =?us-ascii?Q?VBUo4AnMcejEULdmgdEK9eMm9KBNjofb5Cbh3pPnOj7aNy5uJUCBrYy7xvXp?=
 =?us-ascii?Q?g0SkxFSvrXaqFlRENZ3y+ZBwRRg+ii7WRW0ANVR9EOpXHDfhhR/TntCyoBEF?=
 =?us-ascii?Q?bV9HEP+TXHodS/y/BUaUaN6X5bPctC7NfYPfb77/zt83kmOG287hLPf6WdS4?=
 =?us-ascii?Q?hg9suW/2CHTLkmIjeuRa3oJGJ05rcBYt8UEvhe2BzXHR60aNa4eL79D6TtGa?=
 =?us-ascii?Q?ZxYkAFhj7yu9mfRKYN0EjUrv64P98mRDHg4Ts7HJ2T6lGVVblCu1/6P6TpJX?=
 =?us-ascii?Q?2EKPA0sUxqUA4Ih6dTYeblBSYXgJA8ombagkvNJ2c5XH7TykGx6jEG6VQgQ0?=
 =?us-ascii?Q?2zuEVcWWGpdSn2sGYDKdQmMS5u6pFSFjP1+y1fypPr9FYSBh5ihi18twDeXV?=
 =?us-ascii?Q?+SObxtIvXkIDRkrcKE+I9VtdmYGHjagmL2s8Ty/MCDaC+1JzjElltv9+hiG6?=
 =?us-ascii?Q?x8/P+BM8t8D8J5CTwBA52m4tJ2QYWJH9zJUQ00LO+O2rSFv1mSUEkGbXS7W/?=
 =?us-ascii?Q?40oabR7lIMcGBHZY00L9WkoDoZ64vu6QxCTmDBcTNXWsS5c67Mwur2RR/4gI?=
 =?us-ascii?Q?xM7++zFLLn0IuIkUYlMmhhcpO6cBjM6f3BdL2jbEaLOsuqap1GoqgYs2+kGX?=
 =?us-ascii?Q?Xsy+d/4NhdEy2L6DlPpbDWLpa0T+iAt+opHyxil6F6tl4Ys/XBur5j3GXtjx?=
 =?us-ascii?Q?mQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2d670e-9e82-4a16-57b5-08db04fcb2e1
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 09:05:58.3689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGjhxxaR3+7d68+Y5/Mq29/JwZ50h13FqA/lod8mffB6fEzrPI0npQ5cYSZEGWJdLkPIC2Y1f9YvG0Yb7J5dca6cW6iLBpZxthj0nYWt3g0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2592
Received-SPF: pass client-ip=2a01:111:f400:fe0c::721;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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
index 03139c76f7..9994724a39 100644
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


