Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DE6341B5B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:23:27 +0100 (CET)
Received: from localhost ([::1]:47944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDDy-0001QP-Cv
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lNDCb-0008Hn-8v
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:22:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lNDCZ-0007eg-5Y
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:22:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616152918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GGUJpQ5+XqAn1PMe/K5LDRJ3lprVU74tjw01fuZtBuw=;
 b=KgB1yz77LnWNk6tY0HRRyR6uE+bN8SILNk1MAQeKeeahjU4QYW2fA7u+Xv4D3mrF7Fkkup
 vAbf67kp1hZznOUW6Yr+YqeKKAllXy6ihc/HTMcZ/xqRZ94osMPmolKH3LHHEXyhG5uIyC
 y76R4SoJhbuXXbbVn7EosWB87weNB5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-WGb7LH1SNhyr5iDBQyaeGw-1; Fri, 19 Mar 2021 07:21:56 -0400
X-MC-Unique: WGb7LH1SNhyr5iDBQyaeGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE79181620;
 Fri, 19 Mar 2021 11:21:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 336531992D;
 Fri, 19 Mar 2021 11:21:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B432318000B3; Fri, 19 Mar 2021 12:21:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/15] virtio-gpu: split into two devices.
Date: Fri, 19 Mar 2021 12:21:32 +0100
Message-Id: <20210319112147.4138943-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 vivek.kasireddy@intel.com, tina.zhang@intel.com
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
Gerd Hoffmann (15):=0D
  virtio-gpu: rename virgl source file.=0D
  virtio-gpu: add virtio-gpu-gl-device=0D
  virtio-gpu: add virtio-gpu-gl-pci=0D
  virtio-gpu: add virtio-vga-gl=0D
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
=0D
 include/hw/virtio/virtio-gpu.h                |  31 +++-=0D
 hw/display/virtio-gpu-base.c                  |   6 +-=0D
 hw/display/virtio-gpu-gl.c                    | 163 ++++++++++++++++++=0D
 hw/display/virtio-gpu-pci.c                   |  27 +++=0D
 .../{virtio-gpu-3d.c =3D> virtio-gpu-virgl.c}   |   0=0D
 hw/display/virtio-gpu.c                       | 142 +++------------=0D
 hw/display/virtio-vga.c                       |  30 ++++=0D
 util/module.c                                 |   5 +=0D
 hw/display/meson.build                        |  11 +-=0D
 9 files changed, 281 insertions(+), 134 deletions(-)=0D
 create mode 100644 hw/display/virtio-gpu-gl.c=0D
 rename hw/display/{virtio-gpu-3d.c =3D> virtio-gpu-virgl.c} (100%)=0D
=0D
--=20=0D
2.30.2=0D
=0D


