Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0345C3FFF27
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:26:42 +0200 (CEST)
Received: from localhost ([::1]:43992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7LF-0005ER-26
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM747-0008Fu-Gp
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM744-0001ko-JU
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+/T5ni6234ihtWfiY6ChgUlClrUNMBebZZu1LShGeE=;
 b=fKhf/V9o0yCw71rie0qZw6rMPtGwZsaatLEdvrYZu4Mo2D2PjvCz30sKbIeFNadFNwLD4E
 dD8SWv4mFtvfJzC/SO23B3bWHHfpVXaHDoOvudVJqiRxlZXvXjdWcJBuYRY1O/nEJ29DCr
 QjEO7fIDhPGQ91gpto7qsjl54S9rIto=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-O6IP0hhMP36GlzqelxMUaA-1; Fri, 03 Sep 2021 07:08:55 -0400
X-MC-Unique: O6IP0hhMP36GlzqelxMUaA-1
Received: by mail-wm1-f69.google.com with SMTP id
 c4-20020a1c9a04000000b002e864b7edd1so1766993wme.6
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e+/T5ni6234ihtWfiY6ChgUlClrUNMBebZZu1LShGeE=;
 b=gov4BDcOUqH+ktFKEWxeVNGu+1D8KD4ieySZghNA6i/baVWUiw8Xj8FaOfGQcq4kdu
 8bIfJW5uMJb47KGy5ePV3Dh46nd82+EPVkwi18/3/J8jhjacsoaPWiz0HLwpCm6NUCeO
 2ZhmRGJlEB8lvsX9HMxKsBHKbUx1Anb3GC6JKqfjlyI703lNypbJqULgA8jvPsDo2nlF
 sVex6PDcKhyW46Vlafwy2zNaxEnCWtXJDlaJZZ7uVuoPXmBoWbk27k+xlubBgz7ek5MN
 GPc78/+/TTsI2X9xaIBlqpuslLK/p54ctrFM3VDRq0nIk2l26styN6KINLE0sSRVIoo7
 dAXA==
X-Gm-Message-State: AOAM533IFskoMwV4HpXqF0Tlqir+N3iA1D+H6hUXMZNXPxyt7b3La6ff
 96Dn3mDHuDH4+bIcfSlkxwqi9hP0GVdXOau5eLspHfgx+D4bq2pAflCXAiz7oqIr/ai4VLCGOGA
 R2OpFWR07aDmhlzo9qa/jM7qOjwvWfjsXiEAzvxqAAeVILxNktMokl964refV/Ub/
X-Received: by 2002:adf:816f:: with SMTP id 102mr3412396wrm.368.1630667333585; 
 Fri, 03 Sep 2021 04:08:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKVIhqhQclBigb+uSRWXSSmTSWnWM8sjZh3FL9BO89jaiUDjU5xH1NQtxLg8HHW+REZ68Nfw==
X-Received: by 2002:adf:816f:: with SMTP id 102mr3412332wrm.368.1630667333320; 
 Fri, 03 Sep 2021 04:08:53 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 h16sm4386547wre.52.2021.09.03.04.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:08:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 19/28] hw/virtio: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:53 +0200
Message-Id: <20210903110702.588291-20-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Should we check in_num/out_num in range?
---
 hw/net/virtio-net.c       | 3 ++-
 hw/virtio/virtio-crypto.c | 7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 16d20cdee52..8fa23d5f941 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1449,7 +1449,8 @@ static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         }
 
         iov_cnt = elem->out_num;
-        iov2 = iov = g_memdup(elem->out_sg, sizeof(struct iovec) * elem->out_num);
+        iov2 = iov = g_memdup2_qemu(elem->out_sg,
+                                    sizeof(struct iovec) * elem->out_num);
         s = iov_to_buf(iov, iov_cnt, 0, &ctrl, sizeof(ctrl));
         iov_discard_front(&iov, &iov_cnt, sizeof(ctrl));
         if (s != sizeof(ctrl)) {
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 54f9bbb789c..43c1a39e469 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -242,7 +242,8 @@ static void virtio_crypto_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         }
 
         out_num = elem->out_num;
-        out_iov_copy = g_memdup(elem->out_sg, sizeof(out_iov[0]) * out_num);
+        out_iov_copy = g_memdup2_qemu(elem->out_sg,
+                                      sizeof(out_iov[0]) * out_num);
         out_iov = out_iov_copy;
 
         in_num = elem->in_num;
@@ -605,11 +606,11 @@ virtio_crypto_handle_request(VirtIOCryptoReq *request)
     }
 
     out_num = elem->out_num;
-    out_iov_copy = g_memdup(elem->out_sg, sizeof(out_iov[0]) * out_num);
+    out_iov_copy = g_memdup2_qemu(elem->out_sg, sizeof(out_iov[0]) * out_num);
     out_iov = out_iov_copy;
 
     in_num = elem->in_num;
-    in_iov_copy = g_memdup(elem->in_sg, sizeof(in_iov[0]) * in_num);
+    in_iov_copy = g_memdup2_qemu(elem->in_sg, sizeof(in_iov[0]) * in_num);
     in_iov = in_iov_copy;
 
     if (unlikely(iov_to_buf(out_iov, out_num, 0, &req, sizeof(req))
-- 
2.31.1


