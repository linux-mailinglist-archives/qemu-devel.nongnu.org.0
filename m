Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7D22A7F07
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 13:53:16 +0100 (CET)
Received: from localhost ([::1]:33368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaelQ-0005XG-04
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 07:53:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaecX-0003KC-Aw
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 07:44:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaecU-0000m3-88
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 07:44:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604580240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5rFeZdGY+Y6DZxjWAVj/DxxgkYhVHJreKFZrBdZJXJw=;
 b=LlZXlHJApy+/yvLqHuOmtU70iL3Ecg/lQkCr8X/uk2VLV9iPRtzA381hHpx+7DKyGqGevV
 XaJCbZGSkA18wkH62CCvVjHHPX2Ww2Re+CgzPtOtWqdwWO6THW1uK120ukfE2YjR6FG0wv
 g1h5JHRB7TiUa6lRwY8PuqSFTSudzcA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-U7XoNScfNy-hCcPWLeQlMA-1; Thu, 05 Nov 2020 07:43:57 -0500
X-MC-Unique: U7XoNScfNy-hCcPWLeQlMA-1
Received: by mail-wm1-f70.google.com with SMTP id e15so341711wme.4
 for <qemu-devel@nongnu.org>; Thu, 05 Nov 2020 04:43:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iwmOBO5O0PMIuYr6JDEDXgS8lEoJ/PB4jkvPL4eELb4=;
 b=B5qRaa0VfRFY/TLKee801/LTAgIwPzbDUlsxcVwTMxoZ6r0ro8uBcRtzxN1BybK0L3
 y74izEYP9g3b5HvLuliYKTn7IRwTTIyzalL6JGsTCLnM6W+Azy9V3t9gJ/V+o+fiOhDU
 Dgk7pEjGRez7e0mdx2b9+AGVF2VbeZZdx1a/hM2oG3jOCclUhphlMinZKMXKVznmDLuc
 v19B4f4xGQyuKp0aWS23i9ulS1JKg+R7x+/1yHfZewBJ4Dciujh/SrreebcOuAte2tyr
 DakUJ+n1kmyZUVARex8xHPB9k4h4W5idkeXOwf/lueRxYG2LYeODxv+ZFwre3nJsLRtg
 4n8w==
X-Gm-Message-State: AOAM531MvZFbF4BsYJ7aifFiBUUB/38830nwdFmIw3dXWLjbvIRlqZFb
 eYJpVYaR5j/PNsJH/eu092lKX4j7YD5ATkS/NaGIJKT2mVgi5vP+Q7k3rUWCSJujVBnupdEdu7m
 8CvtlmmdW7Qg14xQ=
X-Received: by 2002:a5d:4d0d:: with SMTP id z13mr2625974wrt.23.1604580236242; 
 Thu, 05 Nov 2020 04:43:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQLCIUFSEyhq91BbQZh8qU7H1g8seNvNjJmPY+LizdfeOUC5hyMpbodPUma4ZOWc1Hi3C1JQ==
X-Received: by 2002:a5d:4d0d:: with SMTP id z13mr2625928wrt.23.1604580235963; 
 Thu, 05 Nov 2020 04:43:55 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id n14sm1933681wrt.8.2020.11.05.04.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 04:43:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.0 0/3] hw/virtio: Allow to disable legacy VIRTIO
Date: Thu,  5 Nov 2020 13:43:50 +0100
Message-Id: <20201105124353.3680057-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 22:46:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan told me it would help the multi-process QEMU=0D
series if virtio devices where not arch-specific.=0D
As it didn't seem too complex, I gave it a try.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/virtio: Add configure switch to disable legacy VIRTIO=0D
  hw/virtio: Build most of virtio devices as arch-independent objects=0D
  gitlab-ci: Test the --disable-virtio-legacy option=0D
=0D
 configure                         | 10 ++++++++++=0D
 meson.build                       |  1 +=0D
 include/hw/virtio/virtio-access.h | 19 +++++--------------=0D
 hw/virtio/virtio-legacy.c         | 29 +++++++++++++++++++++++++++++=0D
 .gitlab-ci.yml                    |  1 +=0D
 hw/9pfs/meson.build               |  2 +-=0D
 hw/block/dataplane/meson.build    |  2 +-=0D
 hw/block/meson.build              |  2 +-=0D
 hw/char/meson.build               |  2 +-=0D
 hw/net/meson.build                |  2 +-=0D
 hw/scsi/meson.build               |  2 +-=0D
 hw/virtio/meson.build             | 14 +++++++++-----=0D
 12 files changed, 61 insertions(+), 25 deletions(-)=0D
 create mode 100644 hw/virtio/virtio-legacy.c=0D
=0D
--=20=0D
2.26.2=0D
=0D


