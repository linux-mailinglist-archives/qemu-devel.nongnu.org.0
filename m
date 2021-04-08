Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D8D358065
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 12:16:22 +0200 (CEST)
Received: from localhost ([::1]:48692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lURi0-0005Yo-FB
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 06:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1lURfG-0003z1-Gu
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:13:30 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1lURfA-0008Lr-Oj
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:13:28 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso1064030pjb.3
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 03:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gkruCtQ5S/OZWNWHF1MZHWfdXooksconxayMSeMDdnE=;
 b=gTKDWPprPRv7FM9/v3yPHYCp6bjErrFD5rzYjozkDdsuh9Y5wosT07cyy8JpAtKdNt
 mmMjag+SV87amvRm9Z5qslpis1D0FFF9G1umaRxLjtooDGUWqcNk1B9MDD1LcT2hfPiN
 5u9zy6osRSpb1O/31lY6JfYwzipUSvTQevOHn85QkKa8wRV0HIt6dCUj8ZlwAxivl2YM
 OYy7WaIQCaqREU2DYxeepaUyHtWTAH8tz6FNR8C3FCdV1yXi4quLPZOsY594dtFpZEZe
 52HBZPK22knyRq3BIX/sxiCSswTVQMDDOeav29mi0MJ/qtEMFPMzyCYlhWOfj3wqiDJU
 F1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gkruCtQ5S/OZWNWHF1MZHWfdXooksconxayMSeMDdnE=;
 b=VStoDkCGnDzMC3MzCNuSbUYlSefaUG310CeiEdeshDiqL3RF7Rw4Ldg/ErIognq+uM
 0uUdcq5O9/WLbxoMF/FxgTtxsHF6H01u4HhwEKzeyffPv2oy7h9Z0kC/en2UY52j/fWu
 nC0u8lgd2lo/lD0KRvsd4OGCawUqOXqqw6ZPnxi7T92xEBBrP/ExNmdgToTg9dW+q1zd
 pe3MQcHisSyO7FLhoM58YxacyxfmrtOeEFX9zHYeHnVbIcZS45zww71sy1R7rkn4KBRL
 wBeRJ3l1CoDLhfR0lTeK3TgH2zGUlfnKFhYE83FmFple/KCjfZ/tVM4tK2xQky3OWHCg
 RgCQ==
X-Gm-Message-State: AOAM532FtQIs0r9FzJtgvG0vddq1KX1p1B1lh/Jwhlv3enLomFMGx6qp
 RkbJTJwg0kBQqvmg6Ttwly4K
X-Google-Smtp-Source: ABdhPJxAo/tpp7wwyCuiP42nEOB300F+7Yvui5FG5TgllIRuNT286IY9U/DqExWKh3ZEhRPCGM6pYw==
X-Received: by 2002:a17:90b:1b4e:: with SMTP id
 nv14mr7730943pjb.115.1617876801108; 
 Thu, 08 Apr 2021 03:13:21 -0700 (PDT)
Received: from localhost ([139.177.225.243])
 by smtp.gmail.com with ESMTPSA id gm10sm7872154pjb.4.2021.04.08.03.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 03:13:20 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, stefanha@redhat.com, sgarzare@redhat.com,
 raphael.norwitz@nutanix.com, lingshan.zhu@intel.com,
 changpeng.liu@intel.com, jasowang@redhat.com, kwolf@redhat.com,
 mreitz@redhat.com
Subject: [PATCH 0/3] Introduce vhost-vdpa block device
Date: Thu,  8 Apr 2021 18:12:49 +0800
Message-Id: <20210408101252.552-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=xieyongji@bytedance.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we already have some ways to emulate vDPA block device
in kernel[1] or userspace[2]. This series tries to introduce a
new vhost-vdpa block device for that. To use it, we can add
something like:

qemu-system-x86_64 \
    -device vhost-vdpa-blk-pci,vdpa-dev=/dev/vhost-vdpa-0

You can also get the code and kernel changes from below repositories:

https://github.com/bytedance/qemu/tree/vhost-vdpa-blk
https://github.com/bytedance/linux/tree/vhost-vdpa-blk

Thank you!

[1] https://lore.kernel.org/kvm/20210315163450.254396-1-sgarzare@redhat.com/
[2] https://lore.kernel.org/kvm/20210331080519.172-1-xieyongji@bytedance.com/

Xie Yongji (3):
  Remove redundant declaration of address_space_memory
  vhost-blk: add vhost-blk-common abstraction
  vhost-vdpa-blk: Introduce vhost-vdpa-blk host device

 hw/block/Kconfig                     |   5 +
 hw/block/meson.build                 |   3 +-
 hw/block/vhost-blk-common.c          | 291 +++++++++++++++++++++++++
 hw/block/vhost-user-blk.c            | 306 +++++----------------------
 hw/block/vhost-vdpa-blk.c            | 227 ++++++++++++++++++++
 hw/virtio/meson.build                |   1 +
 hw/virtio/vhost-user-blk-pci.c       |   7 +-
 hw/virtio/vhost-vdpa-blk-pci.c       | 101 +++++++++
 hw/virtio/vhost-vdpa.c               |   1 +
 include/hw/virtio/vhost-blk-common.h |  50 +++++
 include/hw/virtio/vhost-user-blk.h   |  20 +-
 include/hw/virtio/vhost-vdpa-blk.h   |  30 +++
 include/hw/virtio/vhost-vdpa.h       |   1 -
 13 files changed, 762 insertions(+), 281 deletions(-)
 create mode 100644 hw/block/vhost-blk-common.c
 create mode 100644 hw/block/vhost-vdpa-blk.c
 create mode 100644 hw/virtio/vhost-vdpa-blk-pci.c
 create mode 100644 include/hw/virtio/vhost-blk-common.h
 create mode 100644 include/hw/virtio/vhost-vdpa-blk.h

-- 
2.25.1


