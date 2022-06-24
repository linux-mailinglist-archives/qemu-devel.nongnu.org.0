Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E59559CA9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:50:21 +0200 (CEST)
Received: from localhost ([::1]:43742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kdX-0008PK-T1
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1o4kUB-0002hq-S7
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 10:40:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1o4kU8-0006Eu-Re
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 10:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656081636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=n/Ld4MJ8F58aU4WR8h84iq6VwsNtL3FBRQCaOyozcsY=;
 b=XHqOELnvIlpgFNuEyh12/KZsJ8MK84WZQaILp/jhutdqoi9BpWC6ZKVhKpvbqpTMPvH+bT
 NGSXbsuafZr4rXm+Rc9daAx+8fM2XofMCG2Ni6cHETvukPOH7n6q3kANw/Ae8nFG7wk+vH
 PTVFl5TchaLYc5D3e6G7Q7V/3udF/Xs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-POzoTNMxNH2CjA4IOKVDTQ-1; Fri, 24 Jun 2022 10:40:33 -0400
X-MC-Unique: POzoTNMxNH2CjA4IOKVDTQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD3E01C05143;
 Fri, 24 Jun 2022 14:40:32 +0000 (UTC)
Received: from f35-work.redhat.com (unknown [10.39.193.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FA45492C3B;
 Fri, 24 Jun 2022 14:40:31 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Cc: mcascell@redhat.com, jiri@resnulli.us, jasowang@redhat.com,
 arayz_w@icloud.com
Subject: [PATCH] hw/net/rocker: avoid NULL pointer dereference in
 of_dpa_cmd_add_l2_flood
Date: Fri, 24 Jun 2022 16:39:12 +0200
Message-Id: <20220624143912.1234427-1-mcascell@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

rocker_tlv_parse_nested could return early because of no group ids in
the group_tlvs. In such case tlvs is NULL; tlvs[i + 1] in the next
for-loop will deref the NULL pointer.

Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Reported-by: <arayz_w@icloud.com>
---
 hw/net/rocker/rocker_of_dpa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/net/rocker/rocker_of_dpa.c b/hw/net/rocker/rocker_of_dpa.c
index b3b8c5bb6d..1611b79227 100644
--- a/hw/net/rocker/rocker_of_dpa.c
+++ b/hw/net/rocker/rocker_of_dpa.c
@@ -2039,6 +2039,11 @@ static int of_dpa_cmd_add_l2_flood(OfDpa *of_dpa, OfDpaGroup *group,
     rocker_tlv_parse_nested(tlvs, group->l2_flood.group_count,
                             group_tlvs[ROCKER_TLV_OF_DPA_GROUP_IDS]);
 
+    if (!tlvs) {
+        err = -ROCKER_EINVAL;
+        goto err_out;
+    }
+
     for (i = 0; i < group->l2_flood.group_count; i++) {
         group->l2_flood.group_ids[i] = rocker_tlv_get_le32(tlvs[i + 1]);
     }
-- 
2.35.3


