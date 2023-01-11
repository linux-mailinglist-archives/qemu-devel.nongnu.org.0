Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69239665589
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 08:56:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFVui-0004HR-Q8; Wed, 11 Jan 2023 02:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pFVuT-0004EP-CC; Wed, 11 Jan 2023 02:52:34 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pFVuR-0006AY-O5; Wed, 11 Jan 2023 02:52:33 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 69FA4320093A;
 Wed, 11 Jan 2023 02:52:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 11 Jan 2023 02:52:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1673423548; x=
 1673509948; bh=v+pwZ7Xj3smDj+yWBJfTO38yRtfwHhoOqV+E+YskYOM=; b=V
 86+RRzZUFXNNxZDzOtlo6U3wYVgfaF+H5JO2LcTEU68T4tPaChmapFWB+ddYGDdk
 uqxjgKDKdtDgY0E4lrJ8gLYebas3pI+LZyJgkH42WppBjmHgmDrrV1hwlWvbxDZh
 pYnm17y/6QxlSU+iVfLp6l17s0p9sn9ocsdSeT1NWnSNco9v6oKXIPA8beCXRetL
 0Vfcic9H/bpQMM2OTpWzq+hNGMOvRFDmUyvyIY8iLGshCztjYZQLUtoFTfMDRn0V
 oA4gV8nm+9JJ21KZu0PUAH+GqfDsFWSRp4Dfy3DLiPO7cud3pA0fmsWEKxyn186W
 CzPZtsX1+msUEGRkfNFZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673423548; x=1673509948; bh=v+pwZ7Xj3smDj
 +yWBJfTO38yRtfwHhoOqV+E+YskYOM=; b=Ef8W32T/sKtv7Llo142EVPHVWwuNB
 DSu2dghzm7ILS6kvRStJa6Eu+RGvy0eULTfA8ZV87beBj34Dgh7ibJpUL4nrbeIW
 LJ3Lt3rZr9ZIsf/HuC0lAoaYa4YLtNuPaM+qhXpP7wTysgDcmMs8DZxn1txLLdaJ
 lSanDQJqz/CO0I95eqaT0wC5SQ2f485pMgiRMFcIhXGg9EcrC6T6zQyFFkC9MOcy
 pHOS8Of+VsmNLmc8EGWL233fxkydPqXNyRqdsNLBxyXvjThbBueiTEwdv913MfjM
 Foy/3RhBz9iVAvu8U0DDdDaCQ8FPvy8/B4KsvmwQHxfc5VP3Kh8Dbbqdw==
X-ME-Sender: <xms:u2q-Y64eijraS3t0IjKEHYUVb9Jt_IBS9MbdTzivEdz5296ZdRHzsg>
 <xme:u2q-Yz6AvXjd530-ShbCn2oxjwqzRhoD9B9CiXITrjY50FeHOvSzdPHooXQDuVOUw
 D4YxpsWnoO1N2s0XPM>
X-ME-Received: <xmr:u2q-Y5emb577bhb1tgfuXwmHtm3QUMrV0Yn2obU8pahKTnu_jURdGlaZjs7PSqrjYU4xWeSNKr4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleefgdduudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:u2q-Y3IETY8otY622iAs06JWOrTT4V7U_FCEqYKKWHLldvY8Yx2J1g>
 <xmx:u2q-Y-IUJWdUJaV2vC-tci8oPJBJe3sW_4Kn-WT4Bi_6Uk5hunta0Q>
 <xmx:u2q-Y4yMy_jkScXErUh5jQZavF0EHvVOKMxEvinhuxwlITY_xZo5-A>
 <xmx:vGq-Y2-LlMPd-MLqW6O5l0y4HOp3TlV-34DGFX6A77X-169-JKMcWg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jan 2023 02:52:26 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-stable@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PULL 3/6] hw/nvme: fix missing endian conversions for doorbell
 buffers
Date: Wed, 11 Jan 2023 08:52:10 +0100
Message-Id: <20230111075213.70404-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111075213.70404-1-its@irrelevant.dk>
References: <20230111075213.70404-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817; i=k.jensen@samsung.com;
 h=from:subject; bh=X14mTLElADuOBbLWP/86wawuglEhbJ8qpNIESqKJWFQ=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGO+aqxljUACEbfXwlH42GNC3uq0bDKo7lwUFLV5
 ELJcP0EhpokBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjvmqsAAoJEE3hrzFtTw3pE9
 sH/ii66XFPM65x18vTrvjItmY5ak+Z0wI5hc7fypt+C26TM2VcbtpiSWjHQJl0RHL8d5J7c8Rq9nWq
 CrxJsd7qM9iU87s/9s0/9rGbExOm/TQzrqZF4wnfYYH3VA53Q5h2QPSyIDyCM5cuTu7RMupA1PJiGV
 hAJ3LeUFzaGReEHJt2BYyrv0YOKv1On/5ShmBwAc5yKLyvt41VGlAfTBS7rOJ6mrx0P7MjFDWslxgN
 Z1bPxDYTn1Tn9Pm+S8n392jVPTqxKYGRD18UdOFNeG/XDYguaAUTIbdp4GM4BKIxpR9+cWiPCOzopn
 NoQPoe2mehAaExeXzGLNOTvSRW1Guo2ICYT6hB
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

From: Klaus Jensen <k.jensen@samsung.com>

The eventidx and doorbell value are not handling endianness correctly.
Fix this.

Fixes: 3f7fe8de3d49 ("hw/nvme: Implement shadow doorbell buffer support")
Cc: qemu-stable@nongnu.org
Reported-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index cfe16476f0a4..28e02ec7baa6 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1336,8 +1336,11 @@ static inline void nvme_blk_write(BlockBackend *blk, int64_t offset,
 
 static void nvme_update_cq_head(NvmeCQueue *cq)
 {
-    pci_dma_read(PCI_DEVICE(cq->ctrl), cq->db_addr, &cq->head,
-                 sizeof(cq->head));
+    uint32_t v;
+
+    pci_dma_read(PCI_DEVICE(cq->ctrl), cq->db_addr, &v, sizeof(v));
+
+    cq->head = le32_to_cpu(v);
 
     trace_pci_nvme_update_cq_head(cq->cqid, cq->head);
 }
@@ -6148,16 +6151,20 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 
 static void nvme_update_sq_eventidx(const NvmeSQueue *sq)
 {
+    uint32_t v = cpu_to_le32(sq->tail);
+
     trace_pci_nvme_update_sq_eventidx(sq->sqid, sq->tail);
 
-    pci_dma_write(PCI_DEVICE(sq->ctrl), sq->ei_addr, &sq->tail,
-                  sizeof(sq->tail));
+    pci_dma_write(PCI_DEVICE(sq->ctrl), sq->ei_addr, &v, sizeof(v));
 }
 
 static void nvme_update_sq_tail(NvmeSQueue *sq)
 {
-    pci_dma_read(PCI_DEVICE(sq->ctrl), sq->db_addr, &sq->tail,
-                 sizeof(sq->tail));
+    uint32_t v;
+
+    pci_dma_read(PCI_DEVICE(sq->ctrl), sq->db_addr, &v, sizeof(v));
+
+    sq->tail = le32_to_cpu(v);
 
     trace_pci_nvme_update_sq_tail(sq->sqid, sq->tail);
 }
-- 
2.39.0


