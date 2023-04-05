Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9C36D7F4B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 16:24:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk43E-0006jt-PE; Wed, 05 Apr 2023 10:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pk43C-0006jC-LK
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:23:50 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pk42x-0007u0-7h
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 10:23:36 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230405142333euoutp026f182a0471f96f26440f67182f525bf8~TD-DrLvKN2495224952euoutp02_
 for <qemu-devel@nongnu.org>; Wed,  5 Apr 2023 14:23:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230405142333euoutp026f182a0471f96f26440f67182f525bf8~TD-DrLvKN2495224952euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1680704613;
 bh=PfFHP0VC8oXdIUSF5dWKZwqPFvDk4dpSSBI/e1Wmpnw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hjZc8q1wrUCDLSjr27vnV9rqVv/30Mpjk3AKxuRXQ8jKIIDeuFHTKok/JE6M+KgXx
 CFodEexmyT9KnW4sLnhtgE+hGtArbJUW09dt77va1uQKN0aITLpYMpguOAth8ZB0Rb
 6yQpnsL9w9BYIA5gjbmysLfwU6YKRJv+tOaqVQwo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230405142333eucas1p2ea37f1e5bab299c4481e8586c48981c0~TD-DcMPFX2156021560eucas1p2z;
 Wed,  5 Apr 2023 14:23:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 12.6D.10014.4648D246; Wed,  5
 Apr 2023 15:23:32 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230405142332eucas1p24f5d40917f8e6e8c0f95a1a319ceaedb~TD-DF5Lo-0219902199eucas1p26;
 Wed,  5 Apr 2023 14:23:32 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230405142332eusmtrp122bf4cbedbb4684693b0ff50aabdfca0~TD-DFYmGi3067930679eusmtrp1M;
 Wed,  5 Apr 2023 14:23:32 +0000 (GMT)
X-AuditID: cbfec7f5-b8bff7000000271e-73-642d84641e28
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 45.4F.08862.4648D246; Wed,  5
 Apr 2023 15:23:32 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230405142332eusmtip2f7654f90015ae68726c26f4117a04ce1~TD-CpBjG_0790407904eusmtip2N;
 Wed,  5 Apr 2023 14:23:32 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org
Cc: akihiko.odaki@daynix.com, jasowang@redhat.com, k.kwiecien@samsung.com
Subject: [PATCH 2/2] igb: TX SCTP checksum offload
Date: Wed,  5 Apr 2023 16:23:25 +0200
Message-Id: <20230405142325.1339-2-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230405142325.1339-1-t.dzieciol@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNIsWRmVeSWpSXmKPExsWy7djP87opLbopBqce2lh8PrWW3WLZpc9M
 Fo3z57BaHO/dweLA4nHi7UFWjyfXNjN5vN93lc2jb8sqxgCWKC6blNSczLLUIn27BK6MnZun
 sxcsYq/YeG09YwPjAdYuRk4OCQETicuPb7CD2EICKxgl2rfaQthfGCU6P8l2MXIB2Z8ZJX78
 bIBrOPNoJztEYjmjxOl9jUwQTjuTxP/ja8FGsQmYSTz6Mg+sQ0RAUuJ312lmEJtZwFNiafsz
 oDgHh7CAkcTXv4YgYRYBVYlpZz+zgNi8Ak4SXcs+M0Isk5eYeek72EhOAWeJtuk9rBA1ghIn
 Zz5hgRgpL9G8dTYzyA0SAnM5JK7+a2KDaHaROPq+D8oWlnh1fAs7hC0jcXpyDwuEXS7x8+w2
 dojmFkaJPVMnQxVZS1za+hPsUGYBTYn1u/Qhwo4SX1aAPMwBZPNJ3HgrCHEDn8SkbdOZIcK8
 Eh1tQhDVOhLfNs1kgwhLSSy8UQcR9pDoeruSbQKj4iwkz8xC8swshLULGJlXMYqnlhbnpqcW
 G+ellusVJ+YWl+al6yXn525iBKaP0/+Of93BuOLVR71DjEwcjIcYJTiYlUR4Vbu0UoR4UxIr
 q1KL8uOLSnNSiw8xSnOwKInzatueTBYSSE8sSc1OTS1ILYLJMnFwSjUw+dp+KZnsE8Z0ynOF
 bVB9ZXbFq971n/6HGN1ayiVu+iZnYXJk8OyYKXZpNzSPGxxb4yi9UipB/eoWofT53tmVxyoN
 zwjtE7Bq0rQSC9i2XTel/KPojPK/ti6p/HyKwrkM1zyepT8NZZH6vjv5qL5YjtkhLjeB0lde
 U4X+rnGp0Gcp/hOynGHl1j9uCy41BtYFVuwoKTL8xDfJlEknQ8R977sP8ZM3mPEWzgm+6Pjv
 V/CfxV+tjDUElgYW3Ftteow5Strp6PR/E3Z1aRisaGDm7ptlsPlYvqHqZb1azht3z8ipLNYO
 3HPcZ15rR8osudYHG1ybgpZHX8zcVOIZrnJv/436VbpvtQNufWOsW63EUpyRaKjFXFScCABi
 eJbYjgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsVy+t/xe7opLbopBidWqFl8PrWW3WLZpc9M
 Fo3z57BaHO/dweLA4nHi7UFWjyfXNjN5vN93lc2jb8sqxgCWKD2bovzSklSFjPziElulaEML
 Iz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MnZunsxcsYq/YeG09YwPjAdYuRk4O
 CQETiTOPdrJ3MXJxCAksZZRou7GODSIhJbGv5z87hC0s8edaFxtEUSuTxKJ5u8CK2ATMJB59
 mQc2SURAUuJ312lmEJtZwFdi7pF/jF2MHBzCAkYSX/8agoRZBFQlpp39zAJi8wo4SXQt+8wI
 MV9eYual72C7OAWcJdqm94CNFAKquf5qIlS9oMTJmU9YIMbLSzRvnc08gVFgFpLULCSpBYxM
 qxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQKDfduxn5t3MM579VHvECMTB+MhRgkOZiURXtUu
 rRQh3pTEyqrUovz4otKc1OJDjKZAd09klhJNzgfGW15JvKGZgamhiZmlgamlmbGSOK9nQUei
 kEB6YklqdmpqQWoRTB8TB6dUA5Oz4/ktHJse+h+dYSkqYNe93rf3fiFXX3hZWNOunz2lidlL
 UpWOnvG9E1HB4hUS8bE3z2nVmtTQR7Mu1cdfmlEgtn9ikcbdgMIna9gdj895fm/WjAfh/64u
 frT0bWzBL9dILrW2tmdpbsrbWjTE3ncI/5R9vnByw5ETAgmnal6zi/rd3ngiT4k7yc7orT7/
 1bofK/cEvD9puVfISP/HW6V0NTbz48WHRWzXXNq6ca+J9Zsj7q+Svhx9wDSF4Ysc141VB9l/
 mVlvPr1n4+XC9MCruu75F3599LtSb91gEarnVOcWlx7uo2inJvKQSYXHZd9BEflgwXuHnKJT
 Q/yvnp874Vq98p/Ffya3Htfa6arEUpyRaKjFXFScCAAc67A7/wIAAA==
X-CMS-MailID: 20230405142332eucas1p24f5d40917f8e6e8c0f95a1a319ceaedb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230405142332eucas1p24f5d40917f8e6e8c0f95a1a319ceaedb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230405142332eucas1p24f5d40917f8e6e8c0f95a1a319ceaedb
References: <20230405142325.1339-1-t.dzieciol@partner.samsung.com>
 <CGME20230405142332eucas1p24f5d40917f8e6e8c0f95a1a319ceaedb@eucas1p2.samsung.com>
Received-SPF: none client-ip=210.118.77.12;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout2.w1.samsung.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Use TX SCTP checksumming offload as supported by IGB devices.

Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
---
 hw/net/igb_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index e1b99f312b..8cc8682c66 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -394,6 +394,7 @@ igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)
             return false;
         }
 
+        net_tx_pkt_update_sctp_crc(tx->tx_pkt);
         net_tx_pkt_update_ip_checksums(tx->tx_pkt);
         e1000x_inc_reg_if_not_full(core->mac, TSCTC);
         return true;
@@ -403,6 +404,8 @@ igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)
         if (!net_tx_pkt_build_vheader(tx->tx_pkt, false, true, 0)) {
             return false;
         }
+
+        net_tx_pkt_update_sctp_crc(tx->tx_pkt);
     }
 
     if (tx->ixsm) {
-- 
2.25.1


