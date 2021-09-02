Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ABA3FE9A7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:03:25 +0200 (CEST)
Received: from localhost ([::1]:56342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLgku-0003Ly-CZ
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgiB-0000T7-4e
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:00:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgi8-0007pu-5N
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630566030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G11yS83SYPSi71JWCodPXBqZwp3R/qnqULwsrrlwKIU=;
 b=STGIYIRV4itFRH9x8OY9HNXj8kmglxC3tSqQxXheLkkRhK8Xtl26kIZUB5+mq2+Jtdrhgf
 XTzzmlomjfDkigk5PbrUzqZDLUc7dY6fJWYFaqlBxZws7zqYulZ5wrkPZff39HwBAl+TgW
 aNHhCVsVCWAsTTkEdsujLZwwUjssqlQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-7-ipZpv7N324rn9HDTX6zg-1; Thu, 02 Sep 2021 03:00:29 -0400
X-MC-Unique: 7-ipZpv7N324rn9HDTX6zg-1
Received: by mail-wr1-f69.google.com with SMTP id
 z16-20020adfdf90000000b00159083b5966so206771wrl.23
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7z+jkYJuV71NjqPJKVRZAnSidnNf9jpxe0FKFvfdYws=;
 b=Uv6fW2VX4+oXhZPam7x8FRKf9peDPcOK+7usR5kKymzGe02/eZ/XuoIT4BnHOpz1NW
 CseQKDcERClaq1Yd+JNEV8aDErw8SOuICi4cvoUhapdB9UY4wyYtOHxhpQ1GF0kYPUYT
 0TsGv45KfaUM8b85yknVwmo5zkQsV53SuZj0XnjmUd456bIPdIq+gtvwDPOn+oS32MH+
 qbuwEoH5ry3ivYavCivxQDXm6ZFY7T2wVedYFBbgUh7EoXXxqGK3b1oozMBftzqAzwex
 x+t30AzDhTPffQC9k9AaAkiTlsZ+SB1S/IpmfdHwBNqvR/wa6Ahw+PrOcq12xdbDZlKH
 e7AQ==
X-Gm-Message-State: AOAM531Bwx5wubLrM1R5DQ8E6zFz6WxQWnxfWCTwCp2cmtuQEDbB0Khc
 8ZjgSqVD2gh4KN7IQaSxsHQmzCTYoHMShB7D+5CB3voB+u/2wQnK+r48swwitEP1blOPh+UqxZr
 Vt8X1Ldof1lYXcPYP3IaWFN9+WxSu93MqMUXNPq2uXTlLs+xLynAtF8Jsze9Y0bVA
X-Received: by 2002:adf:9d4b:: with SMTP id o11mr1889590wre.29.1630566027749; 
 Thu, 02 Sep 2021 00:00:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyM+tJEloLn5Go7pbCsDxbmr25/0pDenaf5hrDCvlfm4gKTqb/O4n87cIWtzUtJTKdVItOYkg==
X-Received: by 2002:adf:9d4b:: with SMTP id o11mr1889538wre.29.1630566027335; 
 Thu, 02 Sep 2021 00:00:27 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id 17sm743356wmj.20.2021.09.02.00.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 00:00:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/11] block/nvme: Rework error reporting
Date: Thu,  2 Sep 2021 09:00:14 +0200
Message-Id: <20210902070025.197072-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Series fully reviewed)=0D
=0D
Hi,=0D
=0D
This series contains various patches sent last year with=0D
review comments addressed, few more cleanups, and a new=0D
patch which remove the spurious "VFIO_MAP_DMA failed: No=0D
space left on device" now poping up since commit 15a730e7a.=0D
(it is the expected behavior, which is why we retry the=0D
same call after flushing the DMA mappings).=0D
=0D
Since v2:=0D
- qemu_vfio_find_[fixed/temp]_iova retun bool (Klaus)=0D
- Add Klaus's R-b=0D
=0D
Since v1:=0D
- Addressed Klaus review comments (cleaner Error* handling)=0D
- Add Klaus's R-b=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (11):=0D
  block/nvme: Use safer trace format string=0D
  util/vfio-helpers: Let qemu_vfio_verify_mappings() use error_report()=0D
  util/vfio-helpers: Replace qemu_mutex_lock() calls with=0D
    QEMU_LOCK_GUARD=0D
  util/vfio-helpers: Remove unreachable code in qemu_vfio_dma_map()=0D
  block/nvme: Have nvme_create_queue_pair() report errors consistently=0D
  util/vfio-helpers: Pass Error handle to qemu_vfio_dma_map()=0D
  util/vfio-helpers: Extract qemu_vfio_water_mark_reached()=0D
  util/vfio-helpers: Use error_setg in qemu_vfio_find_[fixed/temp]_iova=0D
  util/vfio-helpers: Simplify qemu_vfio_dma_map() returning directly=0D
  util/vfio-helpers: Let qemu_vfio_do_mapping() propagate Error=0D
  block/nvme: Only report VFIO error on failed retry=0D
=0D
 include/qemu/vfio-helpers.h |  2 +-=0D
 block/nvme.c                | 29 +++++++----=0D
 util/vfio-helpers.c         | 99 ++++++++++++++++++++-----------------=0D
 block/trace-events          |  2 +-=0D
 4 files changed, 76 insertions(+), 56 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


