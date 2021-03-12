Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DDE3385CD
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 07:25:32 +0100 (CET)
Received: from localhost ([::1]:43572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKbEp-0003fN-6I
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 01:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lKb6Q-0000BA-Ce
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:16:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lKb6N-0005kf-TA
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:16:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615529807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=cHDylX3VDgnAxGpHNhSOXdMfRX+mhcDAqVY6r7JPZHo=;
 b=J3QuzWaWBwk2GsqaH88TeMmpG6WIODGC4UD1CjV38siO0MK34TuGZsO7Zdg/e284v4fc63
 jUGsnVAIwUvGRK96ImiVdgubmo2brOdqyBbFNlZ8fcnVtQQTMzyeIoycMLkslBgWKbc0qI
 XYmqXoP9klcC7yeR+8/BAWY5ZK3lauI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-yFEswhfvOS6EqEuctrtHXg-1; Fri, 12 Mar 2021 01:16:42 -0500
X-MC-Unique: yFEswhfvOS6EqEuctrtHXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8046E1005E6C;
 Fri, 12 Mar 2021 06:16:41 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-126.pek2.redhat.com
 [10.72.12.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D1CB1037E80;
 Fri, 12 Mar 2021 06:16:39 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 05/16] e1000: fail early for evil descriptor
Date: Fri, 12 Mar 2021 14:16:15 +0800
Message-Id: <1615529786-30763-6-git-send-email-jasowang@redhat.com>
In-Reply-To: <1615529786-30763-1-git-send-email-jasowang@redhat.com>
References: <1615529786-30763-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Prasad J Pandit <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During procss_tx_desc(), driver can try to chain data descriptor with
legacy descriptor, when will lead underflow for the following
calculation in process_tx_desc() for bytes:

            if (tp->size + bytes > msh)
                bytes = msh - tp->size;

This will lead a infinite loop. So check and fail early if tp->size if
greater or equal to msh.

Reported-by: Alexander Bulekov <alxndr@bu.edu>
Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
Reported-by: Ruhr-University Bochum <bugs-syssec@rub.de>
Cc: Prasad J Pandit <ppandit@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index d8da2f6..4345d86 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -670,6 +670,9 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
         msh = tp->tso_props.hdr_len + tp->tso_props.mss;
         do {
             bytes = split_size;
+            if (tp->size >= msh) {
+                goto eop;
+            }
             if (tp->size + bytes > msh)
                 bytes = msh - tp->size;
 
@@ -695,6 +698,7 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
         tp->size += split_size;
     }
 
+eop:
     if (!(txd_lower & E1000_TXD_CMD_EOP))
         return;
     if (!(tp->cptse && tp->size < tp->tso_props.hdr_len)) {
-- 
2.7.4


