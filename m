Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C171FA976
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 09:03:54 +0200 (CEST)
Received: from localhost ([::1]:45506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl5dR-0002XV-Ge
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 03:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jl5Mw-00023J-NJ
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:46:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55653
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jl5Mt-0005ls-00
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:46:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592290002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=knZNVpLUEPruNNfU/OWb2xi+QKiEKywtJZm5h2oG0KI=;
 b=I51eU5cpQogp0eWEi/eS/m7b67IMMD5gNwgHd4iX3fFmRkOl1GxU9KQv2xN8gPE2t6NYwm
 6TiSVk+AIkId0wGvkbeL7Qfc4WpZ2iyC0rRIDYuinTm3gDVgyuwawxinHBpXrA/IGnv308
 0J+pH3nQkShpLug2yZnx1GIXbg1keHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-dDokYR73OBGhHTsub2a11g-1; Tue, 16 Jun 2020 02:46:40 -0400
X-MC-Unique: dDokYR73OBGhHTsub2a11g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE35A1138300;
 Tue, 16 Jun 2020 06:46:38 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-222.pek2.redhat.com
 [10.72.13.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18F4D8202D;
 Tue, 16 Jun 2020 06:46:36 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 21/33] net: cadence_gem: TX_LAST bit should be set by guest
Date: Tue, 16 Jun 2020 14:45:32 +0800
Message-Id: <1592289944-13727-22-git-send-email-jasowang@redhat.com>
In-Reply-To: <1592289944-13727-1-git-send-email-jasowang@redhat.com>
References: <1592289944-13727-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:46:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

TX_LAST bit should not be set by hardware, its set by guest to inform
the last bd of the frame.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/cadence_gem.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index df6d818..78fb9ac 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -350,11 +350,6 @@ static inline unsigned tx_desc_get_last(uint32_t *desc)
     return (desc[1] & DESC_1_TX_LAST) ? 1 : 0;
 }
 
-static inline void tx_desc_set_last(uint32_t *desc)
-{
-    desc[1] |= DESC_1_TX_LAST;
-}
-
 static inline unsigned tx_desc_get_length(uint32_t *desc)
 {
     return desc[1] & DESC_1_LENGTH;
@@ -1298,7 +1293,6 @@ static void gem_transmit(CadenceGEMState *s)
 
             /* read next descriptor */
             if (tx_desc_get_wrap(desc)) {
-                tx_desc_set_last(desc);
 
                 if (s->regs[GEM_DMACFG] & GEM_DMACFG_ADDR_64B) {
                     packet_desc_addr = s->regs[GEM_TBQPH];
-- 
2.5.0


