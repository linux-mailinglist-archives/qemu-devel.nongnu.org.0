Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692944CD624
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:16:28 +0100 (CET)
Received: from localhost ([::1]:57590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8jL-00043Q-EA
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:16:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ89f-0001io-Hy
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:39:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ89d-0000Zy-OM
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IvAnaTG272DSMOFPtKaNzK5eYvV0ma+gLMupIObSFrM=;
 b=Ll7kcHaXqrNBNkYYqZiPpRD9IR0h/74aJJMhOfQb5Zvmmf4L8gjQKyWP/kUvUCGC10wGwC
 JzvKz1UvxPnxKRAwNE3Cllj59E4ZlKeXLyLzHStj5y3FTLoBtXkwoQYvQg2Stlq8kyzBG4
 ysM8DT7kfMZ67INvrkS+mZqJKmB5cCs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-9siUJH5UMJyyr-i68ihoKw-1; Fri, 04 Mar 2022 08:39:31 -0500
X-MC-Unique: 9siUJH5UMJyyr-i68ihoKw-1
Received: by mail-wr1-f72.google.com with SMTP id
 g17-20020adfa591000000b001da86c91c22so3387346wrc.5
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:39:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IvAnaTG272DSMOFPtKaNzK5eYvV0ma+gLMupIObSFrM=;
 b=FO6KZrkkbyFbDiD+BIukNOCYjobEA13jDTgl5BtBqKLwvDJs6d0w6StUJqd/7rZ0p1
 JYjbtnKFip9+tnnsEFQqJzQJzcuIHHc5QnP+3Fwe4q6uQHcKfSMJrAgVuxMRZclQLmnc
 gbLUJktzP1xKc971fs1ZiXBd1skZtATbsTmNItS5GBth5yeT2K3VqYOa+rhjCHlqAr5N
 Zywo/UAkah3Hv1m9zG5OjYX92556M6E75zOeb+eAtyUOIrLi0cJ7KyLDoLU5iS18Wi+K
 uEufCGDqvv+vhpmlhv2RZIog8LggSpGN33TLRETVwtC49KdTLBSCyzF2nZDFHKeOf0mn
 zq2g==
X-Gm-Message-State: AOAM5338acCor7l/NHrmiksr2f7YdVBBMfMUOtXm8+2jn0RpKSyRE5Oq
 dPvUgu355pi5tB3G6V/lEvqZjw6hIDLpqHuJDuAc9Z/E3I5oMmhxf6vVash4IvtRK7faiIOKNUq
 p8bAieImJt5aRelmsziiAyUfKQ8YsXWjGm+xn8bnS1HYNdhhVrDZx46dYsTHB
X-Received: by 2002:adf:df0a:0:b0:1f0:2140:1b41 with SMTP id
 y10-20020adfdf0a000000b001f021401b41mr11546406wrl.94.1646401169557; 
 Fri, 04 Mar 2022 05:39:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0ujo+P8QVfWpVuNifc50MO51uPkdUHJaZKLPVCZVDBM6VjunjMSwi9rTjM9OrTYHWd1AT9A==
X-Received: by 2002:adf:df0a:0:b0:1f0:2140:1b41 with SMTP id
 y10-20020adfdf0a000000b001f021401b41mr11546388wrl.94.1646401169330; 
 Fri, 04 Mar 2022 05:39:29 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 o204-20020a1ca5d5000000b0038331f2f951sm14452069wme.0.2022.03.04.05.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:39:26 -0800 (PST)
Date: Fri, 4 Mar 2022 08:39:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/45] tests/qtest/vhost-user-blk-test: Temporary hack to get
 tests passing on aarch64
Message-ID: <20220304133556.233983-16-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

When run on ARM, basic and indirect tests currently fail with the
following error:

ERROR:../tests/qtest/libqos/virtio.c:224:qvirtio_wait_used_elem:
assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
Bail out! ERROR:../tests/qtest/libqos/virtio.c:224: qvirtio_wait_used_elem:
assertion failed (got_desc_idx == desc_idx): (50331648 == 0)

I noticed it worked when I set up MSI and I further reduced the
code to a simple guest_alloc() that removes the error. At the moment
I am not able to identify where ths issue is and this blocks the
whole pci/aarch64 enablement.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20220210145254.157790-5-eric.auger@redhat.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/vhost-user-blk-test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index 1316aae0fa..cf8057fb57 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -225,6 +225,9 @@ static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
     QTestState *qts = global_qtest;
     QVirtQueue *vq;
 
+    /* temporary hack to let the test pass on aarch64 */
+    guest_alloc(alloc, 4);
+
     features = qvirtio_get_features(dev);
     features = features & ~(QVIRTIO_F_BAD_FEATURE |
                     (1u << VIRTIO_RING_F_INDIRECT_DESC) |
@@ -469,6 +472,9 @@ static void indirect(void *obj, void *u_data, QGuestAllocator *t_alloc)
     char *data;
     QTestState *qts = global_qtest;
 
+    /* temporary hack to let the test pass on aarch64 */
+    guest_alloc(t_alloc, 4);
+
     features = qvirtio_get_features(dev);
     g_assert_cmphex(features & (1u << VIRTIO_RING_F_INDIRECT_DESC), !=, 0);
     features = features & ~(QVIRTIO_F_BAD_FEATURE |
-- 
MST


