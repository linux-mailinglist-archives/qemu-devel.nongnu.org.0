Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C4E1FA91F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 08:51:15 +0200 (CEST)
Received: from localhost ([::1]:51936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl5RC-00071u-PA
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 02:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jl5MX-0001iO-A7
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:46:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20548
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jl5MT-0005fL-DU
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592289980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WY9uuhYcrLCiZTe+aHYizIWB/zPu8U68u5vIIhwUxgY=;
 b=IVBa+Uu53Kaspx4G3xHBrvagRosYJi/8kaDNUbe7UQErMOuX2SuhwkKvZYKhmZIBO9HBTh
 WUVnNc73Q4Z1L5vJuktP7sIEEUl8rMrz6D6I2nNqnWbWLOlHqmL5xJP32ZZkW4uikbTugE
 970egiz2hJT/btAd8+FEFXeGkmnBFGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-oHPi5gkJPRuDAOLNOqd7XQ-1; Tue, 16 Jun 2020 02:46:16 -0400
X-MC-Unique: oHPi5gkJPRuDAOLNOqd7XQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4244B100961C;
 Tue, 16 Jun 2020 06:46:15 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-222.pek2.redhat.com
 [10.72.13.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0F5F8202D;
 Tue, 16 Jun 2020 06:46:13 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 10/33] hw/net/tulip: Log descriptor overflows
Date: Tue, 16 Jun 2020 14:45:21 +0800
Message-Id: <1592289944-13727-11-git-send-email-jasowang@redhat.com>
In-Reply-To: <1592289944-13727-1-git-send-email-jasowang@redhat.com>
References: <1592289944-13727-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:45:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Log with GUEST_ERROR what the guest is doing wrong.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/tulip.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index 57ecbe2..4487fd6 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -578,6 +578,9 @@ static int tulip_copy_tx_buffers(TULIPState *s, struct tulip_descriptor *desc)
     int len2 = (desc->control >> TDES1_BUF2_SIZE_SHIFT) & TDES1_BUF2_SIZE_MASK;
 
     if (s->tx_frame_len + len1 > sizeof(s->tx_frame)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: descriptor overflow (ofs: %u, len:%d, size:%zu)\n",
+                      __func__, s->tx_frame_len, len1, sizeof(s->tx_frame));
         return -1;
     }
     if (len1) {
@@ -587,6 +590,9 @@ static int tulip_copy_tx_buffers(TULIPState *s, struct tulip_descriptor *desc)
     }
 
     if (s->tx_frame_len + len2 > sizeof(s->tx_frame)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: descriptor overflow (ofs: %u, len:%d, size:%zu)\n",
+                      __func__, s->tx_frame_len, len2, sizeof(s->tx_frame));
         return -1;
     }
     if (len2) {
-- 
2.5.0


