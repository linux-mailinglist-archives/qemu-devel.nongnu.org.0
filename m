Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD9048C019
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 09:41:01 +0100 (CET)
Received: from localhost ([::1]:32814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ZBk-00038m-57
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 03:41:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n7Z3q-0003ex-En
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:32:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n7Z3p-0002eJ-0q
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641976367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L7aFwPgUMiLWMwFCD1YpzYkJRLrfE9A03ldYN2xCSj4=;
 b=a2g9jIKL4ofNbyOCbkeJ/S6CIBsWYCAP6WvYC5NfEQAEMlM8T7wQ1GOooTW1XUrZFCQcv9
 9my2tSNTyIrRhHWQDMY/Q/Qj5BTyzdt1/TVHHh4f7xrg+oHekU0UB8K38FTn+XGqXj4I2i
 0Lmcv224L2L9B8eVKh+pfVQm5oZ164E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-aKsdPSNYOXCek7CkZFphFQ-1; Wed, 12 Jan 2022 03:32:45 -0500
X-MC-Unique: aKsdPSNYOXCek7CkZFphFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFD828042E1;
 Wed, 12 Jan 2022 08:32:43 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-115.pek2.redhat.com
 [10.72.13.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AEF67315F;
 Wed, 12 Jan 2022 08:32:41 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V2 02/13] net/tap: Set return code on failure
Date: Wed, 12 Jan 2022 16:32:09 +0800
Message-Id: <20220112083220.51806-3-jasowang@redhat.com>
In-Reply-To: <20220112083220.51806-1-jasowang@redhat.com>
References: <20220112083220.51806-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Patrick Venture <venture@google.com>, Jason Wang <jasowang@redhat.com>,
 Peter Foley <pefoley@google.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Foley <pefoley@google.com>

Match the other error handling in this function.

Fixes: e7b347d0bf6 ("net: detect errors from probing vnet hdr flag for TAP devices")

Reviewed-by: Patrick Venture <venture@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Peter Foley <pefoley@google.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/tap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/tap.c b/net/tap.c
index f716be3..c5cbeaa 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -900,6 +900,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
             if (i == 0) {
                 vnet_hdr = tap_probe_vnet_hdr(fd, errp);
                 if (vnet_hdr < 0) {
+                    ret = -1;
                     goto free_fail;
                 }
             } else if (vnet_hdr != tap_probe_vnet_hdr(fd, NULL)) {
-- 
2.7.4


