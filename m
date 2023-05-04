Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E369E6F7163
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:44:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucq3-000302-8U; Thu, 04 May 2023 13:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1puYk1-0003yj-Mn
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:11:25 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1puYjn-0002uO-SO
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:11:25 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230504131108euoutp01f837154ffd754bb3b69d1900663369d7~b8tGz7i201880118801euoutp01f
 for <qemu-devel@nongnu.org>; Thu,  4 May 2023 13:11:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230504131108euoutp01f837154ffd754bb3b69d1900663369d7~b8tGz7i201880118801euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683205868;
 bh=mvzc7FgrOPTpbNOFZpnMcMUrx5xvfU2kqBw6hkajnT8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W1CWh4sDhpi5cD35ii/B5RIK033V+gEuM0AFpuo96ByDQTWWVxoCk10L1PF8ch2iF
 /GfXweFe1J24ZDoExn845nYQBbrShkzi+tWWm3Syf11vJff7LkKujYPoubukxoP6eM
 ngIkeuZHbMDfCj1MRKF5axXzeEzUosJDCQ0UQKkw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230504131107eucas1p2add039c8c025487e046c263e13df592a~b8tGlnZ552682926829eucas1p23;
 Thu,  4 May 2023 13:11:07 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id B8.24.42423.BEEA3546; Thu,  4
 May 2023 14:11:07 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230504131107eucas1p1bb75dd2ba7baf4f269ec2476feba69ac~b8tGFB7V90728907289eucas1p10;
 Thu,  4 May 2023 13:11:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230504131107eusmtrp183e4b97ce97ea6dae19bd5b127bfe3a9~b8tGEaibt2679726797eusmtrp1K;
 Thu,  4 May 2023 13:11:07 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-b2-6453aeeb47cd
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B0.1E.14344.BEEA3546; Thu,  4
 May 2023 14:11:07 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230504131106eusmtip165a107b8569490db78200a7a8a96d0a5~b8tFjdMG42036220362eusmtip1W;
 Thu,  4 May 2023 13:11:06 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v4 4/5] igb: add IPv6 extended headers traffic detection
Date: Thu,  4 May 2023 15:10:54 +0200
Message-Id: <20230504131055.11767-5-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504131055.11767-1-t.dzieciol@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleLIzCtJLcpLzFFi42LZduzned3X64JTDG6/N7f4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLBa9m14wObB5nHh7kNXjwqNzzB5Prm1m8ni/7yqbR9+WVYwBrFFc
 NimpOZllqUX6dglcGS2/3rAXfGOrmPz1OlsD4wrWLkYODgkBE4lptxO6GLk4hARWMErs3LSM
 FcL5wijxcu4M5i5GTiDnM6PE8wP1IDZIw/VHy1ggipYzSnw8fRbKaWeSmDWnnxWkik3ATOLR
 l3lgK0QEjCU+touDhJkFUiWO/jnIAhIWFvCQePpWFCTMIqAqsW91L1gnr4CzxLemBmaIXfIS
 My99ZwexOQVcJLZMmwBVIyhxcuYTFoiR8hLNW2czg5wgIbCWQ+LWws1MEM0uEisuX4OyhSVe
 Hd/CDmHLSJye3MMCYZdL/Dy7jR2iuYVRYs/UyVBF1hKXtv4Eu59ZQFNi/S59iLCjxPYfM9gg
 IccnceOtIMQNfBKTtk1nhgjzSnS0CUFU60h82zQTqlpKYuGNOoiwh8TMDz8YJzAqzkLyzCwk
 z8xCWLuAkXkVo3hqaXFuemqxYV5quV5xYm5xaV66XnJ+7iZGYGo5/e/4px2Mc1991DvEyMTB
 eIhRgoNZSYT3Q6FfihBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFebduTyUIC6YklqdmpqQWpRTBZ
 Jg5OqQamvJhY9wvzl333vVj3VfeXqFSJwd9cDfdvBQwrxe8X+iv+jNftUY+7oXT2VVON9h5O
 4ad3ktfk5TTtOSegcVct5iDrkfrPfmqfLAVX6i3plbDf9ZD3qdMmH+tZ8k7hp6V4FSSNur+Y
 r5rme7S9fP2zI7zXu1SNAvXLrsfP/f3t6DGzFSf6pq9aL1oisaIjIefnmZvXOBMs07dP+BUi
 V/pFdnKY6Jz6PQlP3tRxMB3WZTJd8PTdY4voCRt2CDp/8HvQlPVq1bufU+dnHjEWqKpMbTp+
 KWiynNXmrhUJS6cHnwvfcUd6p9Piwh1r7B1mzDR5Yxjwu7Fz8rpXL6R3yxlnndc+9/qtlUL5
 kSPNMae7lFiKMxINtZiLihMBQV5kS5wDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFLMWRmVeSWpSXmKPExsVy+t/xu7qv1wWnGNxbI27x+dRadotllz4z
 WTTOn8NqsfXqD3aL4707WCx6N71gcmDzOPH2IKvHhUfnmD2eXNvM5PF+31U2j74tqxgDWKP0
 bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mlp+vWEv
 +MZWMfnrdbYGxhWsXYycHBICJhLXHy1j6WLk4hASWMoocWXRf2aIhJTEvp7/7BC2sMSfa11s
 EEWtTBLf+p6BdbMJmEk8+jIPyObgEBEwlXi2VxIkzCyQKXH61T42kLCwgIfE07eiIGEWAVWJ
 fat7wTp5BZwlvjU1QK2Sl5h56TvYKk4BF4kt0yaA1QgB1Zw4/oMNol5Q4uTMJywQ4+UlmrfO
 Zp7AKDALSWoWktQCRqZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgZGw7djPLTsYV776qHeI
 kYmD8RCjBAezkgjvh0K/FCHelMTKqtSi/Pii0pzU4kOMpkB3T2SWEk3OB8ZiXkm8oZmBqaGJ
 maWBqaWZsZI4r2dBR6KQQHpiSWp2ampBahFMHxMHp1QDk01t2nQtZ50HzBffntgn/Xdut51S
 3t/CKumr6eyL3r3MfzKzwjbRw3Yjo/Q25pkO8Q/6C2bw81yX3JXoWlAxSWu1sfLPe5eMdFY2
 Gr+JSvV6+yz1a1+sXWz/v0my4XVBZpmh75/t2RL3is3Gx97kzuXOnZeuZTSJSM++91o933n9
 DntnO0cpC6MnIZYMz2rl4pzm7CxdYWW5SnhWh2LJxvSOhp6MyFnu4n2iD51NHOJEz27bpvK6
 1HKrQ0nK0yuV7VY8ZU89rnn+nvSwSf3q/tezjgTvOuN4V3Pm3faLbMnVAprnmK0uvA4Lt+UI
 mPKuvnCF0vZmtoLyvF/aP1Tyds05X8f+W/VjnJGUU6ASS3FGoqEWc1FxIgBF49jqDQMAAA==
X-CMS-MailID: 20230504131107eucas1p1bb75dd2ba7baf4f269ec2476feba69ac
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230504131107eucas1p1bb75dd2ba7baf4f269ec2476feba69ac
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230504131107eucas1p1bb75dd2ba7baf4f269ec2476feba69ac
References: <20230504131055.11767-1-t.dzieciol@partner.samsung.com>
 <CGME20230504131107eucas1p1bb75dd2ba7baf4f269ec2476feba69ac@eucas1p1.samsung.com>
Received-SPF: none client-ip=210.118.77.11;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
---
 hw/net/igb_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index dbd09b9b46..8c0291665f 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1400,7 +1400,9 @@ igb_rx_desc_get_packet_type(IGBCore *core, struct NetRxPkt *pkt, uint16_t etqf)
     net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
 
     if (hasip6 && !(core->mac[RFCTL] & E1000_RFCTL_IPV6_DIS)) {
-        pkt_type |= E1000_ADVRXD_PKT_IP6;
+        eth_ip6_hdr_info *ip6hdr_info  = net_rx_pkt_get_ip6_info(pkt);
+        pkt_type |= ip6hdr_info->has_ext_hdrs ? E1000_ADVRXD_PKT_IP6E :
+                                                E1000_ADVRXD_PKT_IP6;
     } else if (hasip4) {
         pkt_type = E1000_ADVRXD_PKT_IP4;
     }
-- 
2.25.1


