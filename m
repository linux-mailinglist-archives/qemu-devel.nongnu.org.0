Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38112D493B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:43:33 +0100 (CET)
Received: from localhost ([::1]:34160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4R2-0007CI-NH
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3tf-0002ip-Fi
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3tc-0008Dw-8f
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1HmGkQSaM8Ns8AyuR8g7tRnebE3hC78fFmzSbnpEopQ=;
 b=Ir3AiDokgeK75PmRxq0rllbP7HhHiD1BolYYIiwN1JsglF5t563gy41QXUrhrMoKMJtgqj
 DH2M22E4uTbwRKNfQjJeaG0Q+G695OX7cm1klvwsGCFuAh3fkq6rvglXnCLT6O2g6Gihty
 3OColdETQ+JhCT7kcigUo8/8AMi2xrA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-fveyL0Q3MIGBt_iXRLfhqw-1; Wed, 09 Dec 2020 13:08:53 -0500
X-MC-Unique: fveyL0Q3MIGBt_iXRLfhqw-1
Received: by mail-wr1-f69.google.com with SMTP id v1so948194wri.16
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:08:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1HmGkQSaM8Ns8AyuR8g7tRnebE3hC78fFmzSbnpEopQ=;
 b=ri7HAZKJx6edU0lza9i17CQuSoEzLnQdI2PA1UM2INchNStNTExXtuo9XzvLppcChI
 rKj4FcUs2uFocezF9oXOQzdZZoHnNFLQHNxGcxLaF63fXavnNKbyzOtW7I65ash/ZCZW
 Fzz4FdjgpuyUPg7ctRKZZ45M7BdT5VAevpqz/wWJGnO0dDiVkQ3qB1b5ogC/Mh5fnwAl
 HQ884WePiNhif7MvByLAYDxKmsqMw7bLNse/QAkNWE5DXaDOXAjvuV7ZMnsnUdkNTWYC
 MPXGSVujoJntnh5f0v8AkYdzkHzR4Ag2mUwBPKF9UV/d7fUYuJOj7Z3eGKPn8cTE+i8x
 p3cQ==
X-Gm-Message-State: AOAM530QbY6aZVwbZadSEr6wtt+lJRTzovNJInoe4e07co8F0UkWC2l2
 N8u7aNO3nf1QhQ6nTXUN/jQEGbnsRtlM8ne/Wzqxxj8jfWcJALT4DvGAP9AR3i62q9oEqvznZ34
 x9aaUJES5PyadGrTPGYV4OZzBv+c8odiNWeDGTdrp5NoJnR8/r8v6nWG2NcMc
X-Received: by 2002:adf:e552:: with SMTP id z18mr4230541wrm.29.1607537332296; 
 Wed, 09 Dec 2020 10:08:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykm+WUqpTC8T9v0NnSfkVfdPzS0VtT+wBO9+K5YUYm3mCYijuKmtxs5m+nllmKgW8FKBAaig==
X-Received: by 2002:adf:e552:: with SMTP id z18mr4230516wrm.29.1607537332074; 
 Wed, 09 Dec 2020 10:08:52 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id c190sm5010008wme.19.2020.12.09.10.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:08:51 -0800 (PST)
Date: Wed, 9 Dec 2020 13:08:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 28/65] failover: Remove memory leak
Message-ID: <20201209180546.721296-29-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

Two things, at this point:

* n->primary_device_id has to be set, otherwise
  virtio_net_find_primary don't work.  So we have a leak here.

* it has to be exactly the same that prim_dev->id because what
  qdev_find_recursive() does is just compare this two values.

So remove the unneeded assignment and leaky bits.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-14-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 6e5a56a230..70fa372c08 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -854,9 +854,7 @@ static DeviceState *virtio_connect_failover_devices(VirtIONet *n, Error **errp)
     Error *err = NULL;
 
     prim_dev = virtio_net_find_primary(n, &err);
-    if (prim_dev) {
-        n->primary_device_id = g_strdup(prim_dev->id);
-    } else {
+    if (!prim_dev) {
         error_propagate(errp, err);
     }
 
-- 
MST


