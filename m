Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D17ED374A0C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:21:12 +0200 (CEST)
Received: from localhost ([::1]:39446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leOxD-00029N-Si
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOnn-00007u-6e
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOnl-0004M8-Cf
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9DeDJRSrcFnDQNmIkG6F/kfPkHZxpE7XVa4zWVp8nf8=;
 b=Ov9ZeTwBlwa5jDQjKtINww8X24yBGz738ggWFh8QHl5QIqyGIWk7yA/0EiCeQyIXh4hHXh
 wgNSTVY6lYlMqrt92gykXxqS+qbEzQ0ES0ibjuYZRRmtJD81ZT+4Pd+yKlbxYaI0Kcxod7
 elzjqtaP70bEgZR9LUV6vLgoSdvkpts=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-Istx_fdjP4GtE0uKe4YfVg-1; Wed, 05 May 2021 17:11:23 -0400
X-MC-Unique: Istx_fdjP4GtE0uKe4YfVg-1
Received: by mail-wr1-f70.google.com with SMTP id
 91-20020adf94640000b029010b019075afso1201947wrq.17
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9DeDJRSrcFnDQNmIkG6F/kfPkHZxpE7XVa4zWVp8nf8=;
 b=tHGtihCsCPjOeyX9GWPLSnRVmGfujaYFwN5u/OZz+DlfKJNTbSlZ/9uFTwDnv9girb
 aZJfHs04P3cTFy9ITWE4I7RaWCHrTcsJpcY2+KbwRe+iW5bDsKunWHaT19gup9zDW7mm
 jHiIVFzM5z4GgNw0KoViUIQOLokS5+Hb8xttncdneg2G6FvkwR/7JtnQ1QSVo5T7v6W9
 0ZrPWoTEnZYuqdbJoA0HNbo1csW5pQscTRbKJaTIhozKvIg6h5aXkLNv6QC5VTbNmFvV
 3ankZlxu9O4/UE+taEkuexi0LmJRje1BKxKKalJhB8zAFmGLR0B3VvSxeE7WbzVGtHej
 lh1w==
X-Gm-Message-State: AOAM532gM7uIiIJCemSNAUmTtHE+FymbFXzM+LYf1eQ16M4bBfPcmimC
 YU349c4kmllPtanvKbyK72e6od5/w4DYcrWB4hT36m6Av5UAZz0hpXPErqCboaJ9Q/G90gfNUNV
 N+4sOfY/UQVmVdY3TlnI9lopvjEZ+s6L6tVit8ZuwMdGfvEXg7YHdwqkVvZvCUtID
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr1060563wrs.134.1620249082051; 
 Wed, 05 May 2021 14:11:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzS5Qr3wU5Lp4hbHG25TcbnfsLrDkX4onOIoj6qKX3yY4Q8C3km01/ViqExk7L5ILTFTLVVug==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr1060535wrs.134.1620249081829; 
 Wed, 05 May 2021 14:11:21 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id o15sm678082wru.42.2021.05.05.14.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:11:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/23] hw/block/dataplane/virtio-blk: Avoid dynamic stack
 allocation
Date: Wed,  5 May 2021 23:10:30 +0200
Message-Id: <20210505211047.1496765-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505211047.1496765-1-philmd@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index e9050c8987e..53f5e4d8aa6 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -60,11 +60,12 @@ static void notify_guest_bh(void *opaque)
 {
     VirtIOBlockDataPlane *s = opaque;
     unsigned nvqs = s->conf->num_queues;
-    unsigned long bitmap[BITS_TO_LONGS(nvqs)];
+    long bitmap_nr = BITS_TO_LONGS(nvqs);
+    g_autofree unsigned long *bitmap = g_new(unsigned long, bitmap_nr);
     unsigned j;
 
-    memcpy(bitmap, s->batch_notify_vqs, sizeof(bitmap));
-    memset(s->batch_notify_vqs, 0, sizeof(bitmap));
+    memcpy(bitmap, s->batch_notify_vqs, bitmap_nr * sizeof(*bitmap));
+    memset(s->batch_notify_vqs, 0, bitmap_nr * sizeof(*bitmap));
 
     for (j = 0; j < nvqs; j += BITS_PER_LONG) {
         unsigned long bits = bitmap[j / BITS_PER_LONG];
-- 
2.26.3


