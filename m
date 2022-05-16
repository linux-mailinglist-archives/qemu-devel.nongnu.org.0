Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F633529326
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:49:46 +0200 (CEST)
Received: from localhost ([::1]:35228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqib3-0006uJ-Mg
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhib-00084S-6v
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhiZ-0006dS-Id
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i+YlGleK5qI0hFp4EYOAKzD2I2xIa/qb4OpuKEhy36c=;
 b=FFkkWx9MQLi46lGkw05Prv7fdpDpveWvN+gibQqQV+Ht+Rw0Z3JsED2nlnlb15sAuOY4Sm
 8zqI2EB8dI439ceBTA7i1OuMe4AqdBYt5qci1NGYy5kzU3X4r1w8SM/Kj24R/LVnjULkvA
 PjVa1UnI1aK6m+YedsvB6EIrP0g2+GY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-UB1uXWBoNxW-0F8WCTvLjw-1; Mon, 16 May 2022 16:53:26 -0400
X-MC-Unique: UB1uXWBoNxW-0F8WCTvLjw-1
Received: by mail-ed1-f72.google.com with SMTP id
 n7-20020a05640206c700b0042aaeb9d702so2917458edy.19
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=i+YlGleK5qI0hFp4EYOAKzD2I2xIa/qb4OpuKEhy36c=;
 b=zFAf9RaDul030y7ebovUP6925XVkCWIjL6YGQBnvES6Byq6DOTqALsSLFrIlMc8q/f
 PnLKAAdkWwLSp6MEwpI+h8OYBcIxncuGq84d5x+fnat6coTnLA5GrYWMykqpwPu0Q6nA
 +2h90txlXOz6s+5vyC0Nn7Pjy+xelPmjpob9YPH+WY9brh77W8dHT50kJY5JWksyGZ4T
 +GrOtBqQSGBqUvnBiUmFSxQjGJethK24Mi6MwbvhFNvivorawSOhwds+NfjJTZtZRV9y
 uaZy92orJJh8/0d5eldmW9vRLPDNyOQGx4abbKP0WlELKBU0KxYR6OV2+u5k7rwjOldP
 cF3g==
X-Gm-Message-State: AOAM532kvQVAzBzqcPZyPY1aMgn4BQkvnKudU/hOFqXYFnxp4xF1XROl
 5fn8qZOYUFxA4Q67oLe4hapnLlb6mj19G5viCGF1NbA5Q0aCG8CsgUZEizfeu9kg29/WMrnR2sr
 Fjm6WL+MpHUGJx9RDPw427yHGHsHWbjLT40CEaq54nqY+mGRigQ1+XzhZihUP
X-Received: by 2002:a05:6402:1f07:b0:42a:9efb:71b1 with SMTP id
 b7-20020a0564021f0700b0042a9efb71b1mr12564873edb.397.1652734404019; 
 Mon, 16 May 2022 13:53:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXcIqo1AFk8zhoo13xfiFiLQvY2gJ0kvTBemw2WCn/TWdf+O4LKePqKC0Y6R36Gn1BtzDw6A==
X-Received: by 2002:a05:6402:1f07:b0:42a:9efb:71b1 with SMTP id
 b7-20020a0564021f0700b0042a9efb71b1mr12564858edb.397.1652734403818; 
 Mon, 16 May 2022 13:53:23 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 en19-20020a056402529300b0042617ba63casm5592915edb.84.2022.05.16.13.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:53:23 -0700 (PDT)
Date: Mon, 16 May 2022 16:53:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PULL v2 47/86] hw/virtio: Replace g_memdup() by g_memdup2()
Message-ID: <20220516204913.542894-48-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Acked-by: Jason Wang <jasowang@redhat.com>
Acked-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20220512175747.142058-6-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c       | 3 ++-
 hw/virtio/virtio-crypto.c | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 1067e72b39..e4748a7e6c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1443,7 +1443,8 @@ static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         }
 
         iov_cnt = elem->out_num;
-        iov2 = iov = g_memdup(elem->out_sg, sizeof(struct iovec) * elem->out_num);
+        iov2 = iov = g_memdup2(elem->out_sg,
+                               sizeof(struct iovec) * elem->out_num);
         s = iov_to_buf(iov, iov_cnt, 0, &ctrl, sizeof(ctrl));
         iov_discard_front(&iov, &iov_cnt, sizeof(ctrl));
         if (s != sizeof(ctrl)) {
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index dcd80b904d..0e31e3cc04 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -242,7 +242,7 @@ static void virtio_crypto_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         }
 
         out_num = elem->out_num;
-        out_iov_copy = g_memdup(elem->out_sg, sizeof(out_iov[0]) * out_num);
+        out_iov_copy = g_memdup2(elem->out_sg, sizeof(out_iov[0]) * out_num);
         out_iov = out_iov_copy;
 
         in_num = elem->in_num;
@@ -605,11 +605,11 @@ virtio_crypto_handle_request(VirtIOCryptoReq *request)
     }
 
     out_num = elem->out_num;
-    out_iov_copy = g_memdup(elem->out_sg, sizeof(out_iov[0]) * out_num);
+    out_iov_copy = g_memdup2(elem->out_sg, sizeof(out_iov[0]) * out_num);
     out_iov = out_iov_copy;
 
     in_num = elem->in_num;
-    in_iov_copy = g_memdup(elem->in_sg, sizeof(in_iov[0]) * in_num);
+    in_iov_copy = g_memdup2(elem->in_sg, sizeof(in_iov[0]) * in_num);
     in_iov = in_iov_copy;
 
     if (unlikely(iov_to_buf(out_iov, out_num, 0, &req, sizeof(req))
-- 
MST


