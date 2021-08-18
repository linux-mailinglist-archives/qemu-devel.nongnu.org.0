Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AA53F0390
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 14:11:16 +0200 (CEST)
Received: from localhost ([::1]:41036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGKPb-0008Em-F3
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 08:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mGKJp-0003Po-2x
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 08:05:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mGKJm-00009b-LB
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 08:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629288313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dv5NwYLoshj7diUrcyg+aw8Nq96H8hRPJFOOeziOKuY=;
 b=in6ycX6I+WhtPhQiWL59fQjrJxCxuvI8qmRO2kNEY8WP3OipuI3SkWGkUlIsUKjLO2jukj
 bvP38eestetNiMKYDGfzMutMlBnj9NqO4DnHZVCXkYlkbzr7TXSeNfBHKl46Ex0BPsTlmw
 ogK+TJzj4ir6qIdwq7TjTNkDqLtoK80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-2KDh29XONHWJOInMqNVvIQ-1; Wed, 18 Aug 2021 08:05:11 -0400
X-MC-Unique: 2KDh29XONHWJOInMqNVvIQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E66E61082921
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:05:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D64F068D97;
 Wed, 18 Aug 2021 12:05:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 61B1A1800929; Wed, 18 Aug 2021 14:05:05 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] uas: add stream number sanity checks.
Date: Wed, 18 Aug 2021 14:05:05 +0200
Message-Id: <20210818120505.1258262-2-kraxel@redhat.com>
In-Reply-To: <20210818120505.1258262-1-kraxel@redhat.com>
References: <20210818120505.1258262-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The device uses the guest-supplied stream number unchecked, which can
lead to guest-triggered out-of-band access to the UASDevice->data3 and
UASDevice->status3 fields.  Add the missing checks.

Fixes: CVE-2021-3713
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-uas.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index 263056231c79..f6309a5ebfdc 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -840,6 +840,9 @@ static void usb_uas_handle_data(USBDevice *dev, USBPacket *p)
         }
         break;
     case UAS_PIPE_ID_STATUS:
+        if (p->stream > UAS_MAX_STREAMS) {
+            goto err_stream;
+        }
         if (p->stream) {
             QTAILQ_FOREACH(st, &uas->results, next) {
                 if (st->stream == p->stream) {
@@ -867,6 +870,9 @@ static void usb_uas_handle_data(USBDevice *dev, USBPacket *p)
         break;
     case UAS_PIPE_ID_DATA_IN:
     case UAS_PIPE_ID_DATA_OUT:
+        if (p->stream > UAS_MAX_STREAMS) {
+            goto err_stream;
+        }
         if (p->stream) {
             req = usb_uas_find_request(uas, p->stream);
         } else {
@@ -902,6 +908,11 @@ static void usb_uas_handle_data(USBDevice *dev, USBPacket *p)
         p->status = USB_RET_STALL;
         break;
     }
+
+err_stream:
+    error_report("%s: invalid stream %d", __func__, p->stream);
+    p->status = USB_RET_STALL;
+    return;
 }
 
 static void usb_uas_unrealize(USBDevice *dev)
-- 
2.31.1


