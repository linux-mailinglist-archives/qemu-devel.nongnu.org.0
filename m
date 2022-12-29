Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4D86590CF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 20:18:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAyHH-0006jI-IG; Thu, 29 Dec 2022 14:09:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pAyHF-0006iw-LA
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 14:09:17 -0500
Received: from mail-db3eur04on2132.outbound.protection.outlook.com
 ([40.107.6.132] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pAyHE-00075d-7r
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 14:09:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MV33zEg0kHnNQ/mGUw576MJ5riyaeTgjGPQ9XOymZa8ssSMRdxgH5BFvKy3+F1gD4UZzrSe0SZJrpwz4NLlarEcdos0SrjZSr03o69PdinGkDDmd5a4eKiq51tgxhmAyucVmlBzPRojZ0PpeEjGg25DFRPL/3CbRhwWCQDrzzi1mbSy3PprDv4FpHP9h1KFZ0Y4eyR3WnR7dULqA+5b0xeH9ku7Q7hbbwlkdTD/KW0gvJCzUFApm7OQ73GDD2TCeI10ZXr4Cex8AOTGXHEIs6om7+qzpTfnEBnhlJNDzoHO4wywzgY5Ljyxwk5gI6gMev+1wSx0OH1sDFyBk+36tvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqcTWvHyLYRl57rMJtS0bOUtzDmy3Og6pnT5xSZWFic=;
 b=OaIQ3P4d2xz0irmE/PpAzd+feojPPQT5pPu0sKffyamB3gLi22AZcMfWS28dfpVSQtZspMtcZuevjRY25IRwDf6IJeH2+VYJD3VcOlzgn4NSGWgWh11x2ouQw5sN2X2EdTXffC9zQ3sE9hFJlLpUf2t+TL2tkqPOyXruD29i2j3Cil+MKUixlwIPKdQf8n+9LPZIkeaF1uvKuk9ZQqp8KT6xMsHuyXOKeNEWy5T7hipRoapTwmIzpZwWp5XgKvMGKARAnCDoxtXMs58qck9WAGTj+a3kVdWKIt0sfo8d97nIjB3imhHgGSx0aWzcOYcVbXBth/J0K03Ukv4di1Amyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqcTWvHyLYRl57rMJtS0bOUtzDmy3Og6pnT5xSZWFic=;
 b=XwMI9866+HsAnSKyYCFsrrmty95prIi8Viaj3T0hnNV65ZpTyUE0uZbDtA415JCfWaNHcef/HsPXAvQp/RUx2ygQ6+zW9Ll7nqulSUSqZeJlc7apMDqG+6goDT/8pteXDJuX+FQ5p8vEzr+o/QKQsJ36JLlCOhYPOtftug7LJ5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PR3P189MB1049.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.17; Thu, 29 Dec
 2022 19:08:38 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%4]) with mapi id 15.20.5966.017; Thu, 29 Dec 2022
 19:08:38 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v2 2/6] hw/net/net_tx_pkt: helper function to get l2 hdr
Date: Thu, 29 Dec 2022 20:08:13 +0100
Message-Id: <20221229190817.25500-3-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229190817.25500-1-sriram.yagnaraman@est.tech>
References: <20221229190817.25500-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0082.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::10) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PR3P189MB1049:EE_
X-MS-Office365-Filtering-Correlation-Id: 38da0056-8238-4ea6-176c-08dae9d01796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GyuAn1SqdDtSjj3ZDOz7hr8P6lF8Yb7nkIzSZ/9h+qI8kh3/FFn69G7GgrBN9fk+UZSgZiKPhs2nS2PTHILIjtTwbRKTYztGr6dLEhO9a51xD5VpluUZyZaNXYknPt7X1PoPJrpKdbwFf+QvnoZkdOrZZZ95rFv5XH/EoHPP9KeLAjmrjfEQAdKHt/LVT1eNQ0eGI8LMxIE3jN4Or+PV6b6Qpq5Ns8q3K5hOiMzhdb2njx1mJLlqCWU8BkEjc1rrAERS3zAWSoAJjOGGQnVnoZRKgnqtth+Gcf93MzGsWZatxZSNnfCUvxuGnzZRXx29ZJljIiMDdRuGJDpGeCZ9yhqb9FN2OnIrVwrld918OsX10gYyjm8y330FwbvQopVEIheWpmtP5Q/6M27M9PMiqFymqaU28kmzRcn3Ke7JTkSgJnoaddNKbGSR/cYfecRRn+QjeF6WKvc8Y3hA1HlJsS2BwUTV+YDFta5t86gdgRdDH9xUKwsr5JRtzmYnHi17q/T0LrvyrSJUVoOVVOt6+2sd3ruKLxB4ESh1qAhUNPzCs8CR95WL5QUM9GUJf4wXd+Xlm3wdrP9Jc2tCWV4QrLgaZGsnaoU3+wG1eSMe45pjmSqYwP/YUsUvKfOZQgVGS0oWTGQj2ILhJRtzc+Mn4s9KWJn2Fch8ZjWzYm8rrhzeWW8VLJIce8HlzAnlegoyR6bgEf1VY33FM6rCL1ImzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(39830400003)(346002)(376002)(396003)(136003)(451199015)(6512007)(36756003)(186003)(110136005)(26005)(316002)(66476007)(5660300002)(44832011)(83380400001)(2616005)(70586007)(66946007)(66556008)(38100700002)(4326008)(1076003)(8676002)(2906002)(6486002)(8936002)(86362001)(478600001)(41300700001)(6666004)(6506007)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QDuETJyTfUFsLnwXzhWXTUSJ4ScwcQazqwApO6wfESyEC6cW8u/HLeQ5f4jX?=
 =?us-ascii?Q?uFdm4XR3s20Yic6wj2elJuK1d5LzA9QiLH9JP7+4GCG/dCAw0Sbpjsg6GLEs?=
 =?us-ascii?Q?drWrHQKvzGKY3VA0xmDD2Bpftz/jTKyFJVkxU0gYbPZmJpusmqX9fHY1CQ3+?=
 =?us-ascii?Q?VMdvjKboG2ZClOV9ydw6Bn8f49DeKei97DuvSBgHQq8frDfWgAF7BFksVdUi?=
 =?us-ascii?Q?LRsyjhU1PXDkqITkKbLzKADIY0BtZtZj0HKnxpww/qAbLJruTZOsL4+HvfMS?=
 =?us-ascii?Q?v1WsyD5n0DH4ngaT7FEX9oRvMA7eFwPy6lQzQuLVSoG0hLdmDylShLrIrvQ+?=
 =?us-ascii?Q?gzwjuZW8OWwuu0PdvpWB2yqzumtROjme+ZX47TiOCR+fwUluKYxvBdFel4SN?=
 =?us-ascii?Q?w6EXajQGXrNA1awXett7JW9m0Pv6EIZVHXKU7cCFGDTfnZ22SQqAZuNpMjce?=
 =?us-ascii?Q?XULaahpGui/J0cxggjD/56LPztR6Lz1UymYIUkVHZRcDP6FcFWNl9beAoVQM?=
 =?us-ascii?Q?DJv7iz6/RjS1dMYU79KGx5u9BvpPzDwdymhj0omvE9a14inwFZ1Uu4/iMAjy?=
 =?us-ascii?Q?K+Ut0hXYZNwndWBpTHD9jABtPIKHrjk7qwaBOUgofigpL77f+bOc0gYOUaVs?=
 =?us-ascii?Q?nQXzNnIao+m3TUwELLE53W1A/SAW+RwuIwyjejFI2bdZ8ZemlF8aZRO98vnN?=
 =?us-ascii?Q?T+9JqH6gk1E7cLoYoyoa/x/0fSYVFT4KEJ9lCEjAv8UorjmiL+3eFh2FN68A?=
 =?us-ascii?Q?ss4ImEIK9JLoWtX4d0bm3XH3T/Q1kelqXgme7dORRLtv91Fk/aKeesdCYpuJ?=
 =?us-ascii?Q?Js9SPTHpBlUbHEzeNs0hGxoQtp6NPef52SwXf2P9OgKiRCjs0r+N89goXtyA?=
 =?us-ascii?Q?TkWbtyk+UCvAVYxvlcN3apDUpu4lz/Lk2m7RHggXWIq+bc3YKZDCHzeZ4cWo?=
 =?us-ascii?Q?nfrvX0Tuff/jZcIQp7lNiCiz1Bl4wluv5Ya5Y1IAG52PEePWbayasLLoQdkm?=
 =?us-ascii?Q?mRyltt8bAzKCNh6zStVgdK4AZvva/IiMeg0B2Y/77h89JijLTNQ0R/AWYMFm?=
 =?us-ascii?Q?ogbYCuKsuuDX+CdMS63IZ0d9uvLuPbNmf65uweBfzSF6RrEt2WjyBNTO78r0?=
 =?us-ascii?Q?mnnlXIyGsbE9zAGKRslr+9hBIUAojsgRiUL6iKeqmh2LghmfEuG+t6bvOqYI?=
 =?us-ascii?Q?y+JV5fn69XNohKi9MPmOsBFDIjVerofYjYwSUAqYisNsrOS+MntQ8wH57rOx?=
 =?us-ascii?Q?ubkYRPIrqfHwF67I3H0qhNktGvkANAoFcLo/T1eWQEX79GpvI5xmQ3IsaphU?=
 =?us-ascii?Q?GAnxjivKUgGlwSnTpKLj4sgvukqUSLZDK6BwisYkIIEEQ9g+o40xwjy0zL38?=
 =?us-ascii?Q?xy5zpAYhSeYTq5mL4/kR2f8oLglPKm/0p42P/WXiWoiXcjylv9n0F6Q2v7So?=
 =?us-ascii?Q?1i90YijLloV1TO13quQP2BBm1wssiZzO92ewDwuP9kwW2N8pBC/PFT3asrgd?=
 =?us-ascii?Q?e+Uud1u56+ettUpY+W+jUFglL6qMr46/kJr08XDHjYhVDAV/XqQwsVdxsQ58?=
 =?us-ascii?Q?zFKu3fCVuTl0sY9QuQe6R98ucuwdSsc3ac9euBEcOnXGPS7lQoWUszDxjE0x?=
 =?us-ascii?Q?WQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 38da0056-8238-4ea6-176c-08dae9d01796
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2022 19:08:38.5777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vt+ZDjBTaxcTmAnCSZPy9xuP8gZRx/0qIR8k8cjguBVyH7YwKL7EVlC0sKpu049VRSPTN8H1H78kORDiOqnKLUJNuq6j2n9MRZ9BIxK08Cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1049
Received-SPF: pass client-ip=40.107.6.132;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Also add return value for to send functions

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/net_tx_pkt.c | 17 +++++++++++------
 hw/net/net_tx_pkt.h |  8 ++++++++
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index 1cb1125d9f..f2e14008b6 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -284,6 +284,12 @@ struct virtio_net_hdr *net_tx_pkt_get_vhdr(struct NetTxPkt *pkt)
     return &pkt->virt_hdr;
 }
 
+struct eth_header *net_tx_pkt_get_l2hdr(struct NetTxPkt *pkt)
+{
+    assert(pkt);
+    return PKT_GET_ETH_HDR(&pkt->l2_hdr);
+}
+
 static uint8_t net_tx_pkt_get_gso_type(struct NetTxPkt *pkt,
                                           bool tso_enable)
 {
@@ -551,13 +557,13 @@ static size_t net_tx_pkt_fetch_fragment(struct NetTxPkt *pkt,
     return fetched;
 }
 
-static inline void net_tx_pkt_sendv(struct NetTxPkt *pkt,
+static inline ssize_t net_tx_pkt_sendv(struct NetTxPkt *pkt,
     NetClientState *nc, const struct iovec *iov, int iov_cnt)
 {
     if (pkt->is_loopback) {
-        qemu_receive_packet_iov(nc, iov, iov_cnt);
+        return qemu_receive_packet_iov(nc, iov, iov_cnt);
     } else {
-        qemu_sendv_packet(nc, iov, iov_cnt);
+        return qemu_sendv_packet(nc, iov, iov_cnt);
     }
 }
 
@@ -632,9 +638,8 @@ bool net_tx_pkt_send(struct NetTxPkt *pkt, NetClientState *nc)
     if (pkt->has_virt_hdr ||
         pkt->virt_hdr.gso_type == VIRTIO_NET_HDR_GSO_NONE) {
         net_tx_pkt_fix_ip6_payload_len(pkt);
-        net_tx_pkt_sendv(pkt, nc, pkt->vec,
-            pkt->payload_frags + NET_TX_PKT_PL_START_FRAG);
-        return true;
+        return (net_tx_pkt_sendv(pkt, nc, pkt->vec,
+            pkt->payload_frags + NET_TX_PKT_PL_START_FRAG) >= 0);
     }
 
     return net_tx_pkt_do_sw_fragmentation(pkt, nc);
diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
index 4ec8bbe9bd..64fae67c58 100644
--- a/hw/net/net_tx_pkt.h
+++ b/hw/net/net_tx_pkt.h
@@ -52,6 +52,14 @@ void net_tx_pkt_uninit(struct NetTxPkt *pkt);
  */
 struct virtio_net_hdr *net_tx_pkt_get_vhdr(struct NetTxPkt *pkt);
 
+/**
+ * get L2 header
+ *
+ * @pkt:            packet
+ * @ret:            L2 header
+ */
+struct eth_header *net_tx_pkt_get_l2hdr(struct NetTxPkt *pkt);
+
 /**
  * build virtio header (will be stored in module context)
  *
-- 
2.34.1


