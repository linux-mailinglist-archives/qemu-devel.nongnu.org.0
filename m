Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DB1450A06
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:48:03 +0100 (CET)
Received: from localhost ([::1]:33072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmf9G-0003gg-7G
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:48:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf0N-0003Nx-P4
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf0L-0005GS-Cv
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TuamMpNTeUOPZaWH0fD/y6G0iKsFC/c1mwJN93yAuFU=;
 b=D/uFWjhgPsS4wk6x0euoks+zcnEI7EVDw5C8RbZGcelJB5EEV3a/9Vuab2sKqhQa6ZUqQC
 gGzGQJpycRZY9yXK5kIHSiWtUlK5eM7nM4jFZ7JYGsgu+lrX4geMWZky6fxkhiZyt9MD9/
 JNZMyIBfiANzrFUQ9ggzvDabrcRCODM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-1LfsDRNRPmS_oP1q6ib5oA-1; Mon, 15 Nov 2021 11:38:47 -0500
X-MC-Unique: 1LfsDRNRPmS_oP1q6ib5oA-1
Received: by mail-ed1-f71.google.com with SMTP id
 h18-20020a056402281200b003e2e9ea00edso14500034ede.16
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:38:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TuamMpNTeUOPZaWH0fD/y6G0iKsFC/c1mwJN93yAuFU=;
 b=J/5kuaI/yTZZXInDDHhHWJhMcH2PGAVy5zAefaLA8bBDsP1nVOVF9sYpT/D8FPEw4B
 NbNCj41PkyzfWmZeypwDmpVxV2c0vBuLTVovw/wo/YgNbt2XhsjagkJaUiDH7Bc8sc13
 zd1I4TcD7AkLHLh6jizZIuD98oiSPKKwdmBVX1+TBV05wtC5Z1DkR6eE2ZkRe8/Wdl94
 VSwt1HVcOkDhZce4hekSq/GRlTx08cqNaD4WuprAesIbJHfUYXDY+GOWmKy63tMcq2ES
 uqVoHS5n0B/CyfeC7F1X9MtWvGcdhvMrYqbnuWRP9Vt9Coh7OYQpyyVe6XLPGdtddxuj
 rbcQ==
X-Gm-Message-State: AOAM532lpnWzOcfq92y3/JgVWfiIwqT60iVpSc2akhibps6nUeib7e/4
 Oq9ItIaSNY4Gi19pKe+BL5A+mUSJU0GcPYsHXkdGwHhp+rpUeszGy0e2bMFUa5HtfF7CEvPlNzi
 TOfMeHyTfeZ9F0QBkW9ZEwKFMiU7hIekiEhoFUqm6F25o/SCceVEQSnYeXVDd
X-Received: by 2002:a05:6402:1c84:: with SMTP id
 cy4mr29755edb.358.1636994325965; 
 Mon, 15 Nov 2021 08:38:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz37KprdFt6G4YjkKOMpluizX7VcFzM4FRRjKxlO/wQSUSRWAnN6pk5GM2SGRuDenMXiGxquw==
X-Received: by 2002:a05:6402:1c84:: with SMTP id
 cy4mr29717edb.358.1636994325770; 
 Mon, 15 Nov 2021 08:38:45 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id nd22sm6983693ejc.98.2021.11.15.08.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:38:45 -0800 (PST)
Date: Mon, 15 Nov 2021 11:38:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/20] vdpa: Check for existence of opts.vhostdev
Message-ID: <20211115163607.177432-15-mst@redhat.com>
References: <20211115163607.177432-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

Since net_init_vhost_vdpa is trying to open it. Not specifying it in the
command line crash qemu.

Fixes: 7327813d17 ("vhost-vdpa: open device fd in net_init_vhost_vdpa()")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20211112193431.2379298-3-eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 1a7250b980..2e3c22a8c7 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -260,6 +260,10 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
+    if (!opts->vhostdev) {
+        error_setg(errp, "vdpa character device not specified with vhostdev");
+        return -1;
+    }
 
     vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
     if (vdpa_device_fd == -1) {
-- 
MST


