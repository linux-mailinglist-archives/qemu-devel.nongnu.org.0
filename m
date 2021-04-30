Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AD836FA1C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:25:58 +0200 (CEST)
Received: from localhost ([::1]:39988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSDV-0003Mb-7o
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRRU-0000P4-3m
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:36:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRRF-0001Fu-B8
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619782561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cZBrFKttVAeW1iZ9CYiBIgM+ZL69o4N+eXyu85OvZas=;
 b=IyXykFPpgRErxmQfndmTEk0gsQf305wCOt4Wubkqfh+4w+ocZ3HOVTFz+Am9C5/Y+9hWIa
 W00iictbnRrwbp/l400GWz4K55z528IadeeTXjR89cqwHp+kvsXK7V4aJS2DPkeF/4HyLm
 S7KqpJvVZrJI/stAPvIR8miH0JyckdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-MWFgJxTOMgaougUHPe7DxA-1; Fri, 30 Apr 2021 07:35:59 -0400
X-MC-Unique: MWFgJxTOMgaougUHPe7DxA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BC7F107ACCA;
 Fri, 30 Apr 2021 11:35:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C248B19C45;
 Fri, 30 Apr 2021 11:35:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1659C1800380; Fri, 30 Apr 2021 13:35:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/16] virtio-gpu: split into two devices.
Date: Fri, 30 Apr 2021 13:35:31 +0200
Message-Id: <20210430113547.1816178-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, tina.zhang@intel.com,
 Gerd Hoffmann <kraxel@redhat.com>, vivek.kasireddy@intel.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we have one virtio-gpu device.  Problem with this approach is=0D
that if you compile a full-featured qemu you'll get a virtio-gpu device=0D
which depends on opengl and virgl, so these dependencies must be=0D
installed and the libraries will be loaded into memory even if you don't=0D
use virgl.  Also the code is cluttered with #ifdefs and a bit messy.=0D
=0D
This patch series splits the virtio-gpu device into two:=0D
=0D
 (1) virtio-gpu-device becomes the non-virgl device, same as=0D
     virtio-gpu-device,virgl=3Doff today.=0D
 (2) virtio-gpu-gl-device is the new virgl device, same as=0D
     virtio-gpu-device,virgl=3Don today.=0D
=0D
When compiling qemu without virglrenderer support virtio-gpu-device=0D
behavior doesn't change.=0D
=0D
v2:=0D
 - rebase to latest master.=0D
 - move pci and vga wrappers to separate modules.=0D
 - fix ci failures.=0D
=0D
Gerd Hoffmann (16):=0D
  virtio-gpu: rename virgl source file.=0D
  virtio-gpu: add virtio-gpu-gl-device=0D
  virtio-gpu: move virgl realize + properties=0D
  virtio-gpu: move virgl reset=0D
  virtio-gpu: use class function for ctrl queue handlers=0D
  virtio-gpu: move virgl handle_ctrl=0D
  virtio-gpu: move virgl gl_flushed=0D
  virtio-gpu: move virgl process_cmd=0D
  virtio-gpu: move update_cursor_data=0D
  virtio-gpu: drop VIRGL() macro=0D
  virtio-gpu: move virtio-gpu-gl-device to separate module=0D
  virtio-gpu: drop use_virgl_renderer=0D
  virtio-gpu: move fields to struct VirtIOGPUGL=0D
  virtio-gpu: add virtio-gpu-gl-pci=0D
  modules: add have_vga=0D
  virtio-gpu: add virtio-vga-gl=0D
=0D
 include/hw/display/vga.h                      |   6 +=0D
 include/hw/virtio/virtio-gpu.h                |  31 +++-=0D
 hw/display/vga.c                              |   2 +=0D
 hw/display/virtio-gpu-base.c                  |   6 +-=0D
 hw/display/virtio-gpu-gl.c                    | 163 ++++++++++++++++++=0D
 hw/display/virtio-gpu-pci-gl.c                |  55 ++++++=0D
 .../{virtio-gpu-3d.c =3D> virtio-gpu-virgl.c}   |   0=0D
 hw/display/virtio-gpu.c                       | 142 +++------------=0D
 hw/display/virtio-vga-gl.c                    |  47 +++++=0D
 util/module.c                                 |   7 +=0D
 hw/display/meson.build                        |  19 +-=0D
 11 files changed, 344 insertions(+), 134 deletions(-)=0D
 create mode 100644 hw/display/virtio-gpu-gl.c=0D
 create mode 100644 hw/display/virtio-gpu-pci-gl.c=0D
 rename hw/display/{virtio-gpu-3d.c =3D> virtio-gpu-virgl.c} (100%)=0D
 create mode 100644 hw/display/virtio-vga-gl.c=0D
=0D
--=20=0D
2.30.2=0D
=0D


