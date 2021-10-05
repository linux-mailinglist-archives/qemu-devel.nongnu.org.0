Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87496423087
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 21:05:54 +0200 (CEST)
Received: from localhost ([::1]:33210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXplB-0004PS-Hf
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 15:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXpdv-000476-RK
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 14:58:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mXpds-0004eE-II
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 14:58:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633460299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/l+iPsFyRbttZ9o4aXnxrKdZE8dURbTJQ5ld8MPAwxM=;
 b=Ks6t+r+0xhweM0DhqwcrEw5e0d9UnAg7QP44SrlDTyNyizkokTXeDm6zdVf7TQhFNXClvg
 UtdWDiyWsNWEUHQBoDaT5zW2rw/4ix4oRwGXSh8Q1yAdUvFi15JUZu62KVKutE3RtQWXA3
 ZwWNhzfl1pu+aThwwaUFicvor/2OUPk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-Z1cQ_Z5VOdKFQbX4s1COLA-1; Tue, 05 Oct 2021 14:58:19 -0400
X-MC-Unique: Z1cQ_Z5VOdKFQbX4s1COLA-1
Received: by mail-wr1-f69.google.com with SMTP id
 v15-20020adfa1cf000000b00160940b17a2so69774wrv.19
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 11:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/l+iPsFyRbttZ9o4aXnxrKdZE8dURbTJQ5ld8MPAwxM=;
 b=R7A1xRkvzo0Rk2+k6pBD3g+0yF2m2WD4O2+Frem87ivpnuUBTSVvlw5vRfQXRsYSzt
 GLKip3QGRuniZhUbWmXdPnwUwkWH/A4+pvym4BxZF9o7ehHkKJ1JJ8bEnpZA5sCrtUDU
 715wOPiUXUfUwb4TSIVLnf1AdueSQ1oVe7j+ejwzneLZbZ7yzs8X/EkUje3oxByAglNb
 pla07aeaTt0hijH+og/pwq1Gnv6zXID+a6DQMQQvZWxMXSskZfC+EcAG2C8dS8Byg2dE
 YTrVjK5mCLaiuwJgxBql7TTMF6qN4y2ljqS+zA5FVnS82h/V7VtYN9J2KmSoC8QShut4
 qXMw==
X-Gm-Message-State: AOAM533gaIG4N3rWRtueZBiHiu210Wj8PE/1NZc+DF/ovzBD6AdoORAL
 sv/f7WldRfeNFe20hxEZ9Rt+98mAppMRhfp+9/QC1k3MKXqk82C735ohQLOqNYsJY1UZSmZ7dR6
 OMOiiYKkbpXmw6OCSm5y9un/dahvW3MWyPMaXHfcNg/UX3gy77An6H3ZXhIB7m1TK
X-Received: by 2002:a7b:cb49:: with SMTP id v9mr5161655wmj.76.1633460297604;
 Tue, 05 Oct 2021 11:58:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/WOij0B7vKYjkaYr9RjdMJscd/g/HhX+NhQVooN2vCuHpKCTMULPRmmyt2cuPyL5QOyySyg==
X-Received: by 2002:a7b:cb49:: with SMTP id v9mr5161627wmj.76.1633460297427;
 Tue, 05 Oct 2021 11:58:17 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id k128sm3020741wme.41.2021.10.05.11.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 11:58:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/4] hw/scsi/scsi-disk: Use automatic AIO context lock
Date: Tue,  5 Oct 2021 20:58:05 +0200
Message-Id: <20211005185807.4134557-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005185807.4134557-1-philmd@redhat.com>
References: <20211005185807.4134557-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the automatic AIO context acquire/release in scsi_block_realize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/scsi/scsi-disk.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index e8a547dbb7d..fa2d8543718 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2605,7 +2605,6 @@ static int get_device_type(SCSIDiskState *s)
 static void scsi_block_realize(SCSIDevice *dev, Error **errp)
 {
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, dev);
-    AioContext *ctx;
     int sg_version;
     int rc;
 
@@ -2620,8 +2619,7 @@ static void scsi_block_realize(SCSIDevice *dev, Error **errp)
                           "be removed in a future version");
     }
 
-    ctx = blk_get_aio_context(s->qdev.conf.blk);
-    aio_context_acquire(ctx);
+    AIO_CONTEXT_ACQUIRE_GUARD(blk_get_aio_context(dev->conf.blk));
 
     /* check we are using a driver managing SG_IO (version 3 and after) */
     rc = blk_ioctl(s->qdev.conf.blk, SG_GET_VERSION_NUM, &sg_version);
@@ -2630,18 +2628,18 @@ static void scsi_block_realize(SCSIDevice *dev, Error **errp)
         if (rc != -EPERM) {
             error_append_hint(errp, "Is this a SCSI device?\n");
         }
-        goto out;
+        return;
     }
     if (sg_version < 30000) {
         error_setg(errp, "scsi generic interface too old");
-        goto out;
+        return;
     }
 
     /* get device type from INQUIRY data */
     rc = get_device_type(s);
     if (rc < 0) {
         error_setg(errp, "INQUIRY failed");
-        goto out;
+        return;
     }
 
     /* Make a guess for the block size, we'll fix it when the guest sends.
@@ -2661,9 +2659,6 @@ static void scsi_block_realize(SCSIDevice *dev, Error **errp)
 
     scsi_realize(&s->qdev, errp);
     scsi_generic_read_device_inquiry(&s->qdev);
-
-out:
-    aio_context_release(ctx);
 }
 
 typedef struct SCSIBlockReq {
-- 
2.31.1


