Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9743236FE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 06:47:10 +0100 (CET)
Received: from localhost ([::1]:40958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEn0u-0006wm-SA
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 00:47:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lEmze-0006R3-6x
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 00:45:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lEmzW-0006w8-4u
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 00:45:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614145538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fLeyEmIDBKrDFh0n7HTfHGe/2G6N1cRDbGx/nGccMf8=;
 b=JrCpAlsp9VZ/nVqQyt52xreSoMEiwTPGLgVfJ9eFUlcTnEoXdK5lPadMvyuYoD15pVUc3r
 zjr8VQpTxLnFPuUgKLX/GkfES2nISIAPkp2kL2KfOl1+KIAh6Ojm9YXcd7laydnccPWmh0
 xXvyNvjmXoX/wyoe6sSaiufKXcZxHVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204--RoMeQnDPyCCIJA9s6N63g-1; Wed, 24 Feb 2021 00:45:34 -0500
X-MC-Unique: -RoMeQnDPyCCIJA9s6N63g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A204107ACC7;
 Wed, 24 Feb 2021 05:45:33 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-164.pek2.redhat.com [10.72.13.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F371B709B8;
 Wed, 24 Feb 2021 05:45:30 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: jasowang@redhat.com
Subject: [PATCH] e1000: fail early for evil descriptor
Date: Wed, 24 Feb 2021 13:45:28 +0800
Message-Id: <20210224054528.491866-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Cheolwoo Myung <cwmyung@snu.ac.kr>,
 Ruhr-University Bochum <bugs-syssec@rub.de>, qemu-devel@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>
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
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index d8da2f6528..4345d863e6 100644
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
2.25.1


