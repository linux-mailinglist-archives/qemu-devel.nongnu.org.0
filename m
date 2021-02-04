Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A7130F153
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:58:10 +0100 (CET)
Received: from localhost ([::1]:36758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cKv-0004EJ-IG
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cFm-0004z5-9U
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:52:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cFj-0007GN-Gk
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:52:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612435965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cldcvQGn+u/2uT9ncNtfLdMamqFbSjHsTtO9JtV26po=;
 b=X20h25YPQU1LcmUEFC2IkVpsMZGbApQXtbivR7JVze5/wZpYFzmFMpLjwPFFF1JcjwhqLH
 aARDiKleC+amvLqsvemo7/GFEjePBYVO+idc0ZYJ7M6sdsYDYhunTslcKtz4ocsEMdxNbK
 QYRxXB4U9XEC9K7sC9qo21DDaG2ILbQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-i8PswyVFORa_96j_BzcQ0w-1; Thu, 04 Feb 2021 05:52:44 -0500
X-MC-Unique: i8PswyVFORa_96j_BzcQ0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3232F801967
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 10:52:43 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A66918227;
 Thu,  4 Feb 2021 10:52:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/20] Various vhost-user-gpu & UI fixes
Date: Thu,  4 Feb 2021 14:52:12 +0400
Message-Id: <20210204105232.834642-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Here is a collection of fixes and improvements mostly around vhost-user-gpu=
. In=0D
combination with spice, they work best with the previously sent fixes ("[PA=
TCH=0D
0/2] Fix (non-vga) QXL async screendump" & "[PATCH v2] spice: delay startin=
g=0D
until display are initialized"). I also use virgl from git, which seems to =
work=0D
better. You also need mesa with the recent fix !8663 from last week if you =
test=0D
this.=0D
=0D
The last patch is a simple RFC avocado test to have the basics under some=
=0D
control and avoid simple regressions.=0D
=0D
I have further refactoring work pending to separate the DisplayChangeListen=
er=0D
from the GL context. This should allow to run a GL-less qemu with Spice cli=
ent &=0D
vhost-user-gpu/virgl for example.=0D
=0D
v2:=0D
 - styles fixes=0D
 - drop RFC from avocado test=0D
=0D
Marc-Andr=C3=A9 Lureau (20):=0D
  vhost-user-gpu: check backend for EDID support=0D
  vhost-user-gpu: handle vhost-user-gpu features in a callback=0D
  vhost-user-gpu: use an extandable state enum for commands=0D
  vhost-user-gpu: handle display-info in a callback=0D
  ui: remove extra #ifdef CONFIG_OPENGL=0D
  ui: remove gl_ctx_get_current=0D
  ui: add gd_gl_area_scanout_disable=0D
  ui: annotate DCLOps callback requirements=0D
  ui: remove console_has_gl_dmabuf()=0D
  vhost-user-gpu: add a configuration flag for dmabuf usage=0D
  ui: add an optional get_flags callback to GraphicHwOps=0D
  ui: add a DCLOps callback to check dmabuf support=0D
  ui: check hw requirements during DCL registration=0D
  ui: add qemu_egl_has_dmabuf helper=0D
  ui: check gtk-egl dmabuf support=0D
  ui: add egl dmabuf import to gtkglarea=0D
  virtio-gpu: avoid re-entering cmdq processing=0D
  display/ui: add a callback to indicate GL state is flushed=0D
  chardev: check if the chardev is registered for yanking=0D
  tests: add some virtio-gpu & vhost-user-gpu acceptance test=0D
=0D
 contrib/vhost-user-gpu/vugpu.h          |  10 +-=0D
 include/hw/virtio/virtio-gpu.h          |   6 +-=0D
 include/ui/console.h                    |  35 +++++-=0D
 include/ui/egl-context.h                |   1 -=0D
 include/ui/egl-helpers.h                |   1 +=0D
 include/ui/gtk.h                        |   4 +=0D
 include/ui/sdl2.h                       |   1 -=0D
 chardev/char-socket.c                   |  53 +++++---=0D
 contrib/vhost-user-gpu/vhost-user-gpu.c |  78 +++++++++---=0D
 contrib/vhost-user-gpu/virgl.c          |   2 +-=0D
 hw/display/vhost-user-gpu.c             |  17 +--=0D
 hw/display/virtio-gpu-base.c            |  31 ++++-=0D
 hw/display/virtio-gpu.c                 |   9 +-=0D
 hw/display/virtio-vga.c                 |  20 +++=0D
 hw/vfio/display.c                       |   6 +=0D
 ui/console.c                            |  64 +++++++---=0D
 ui/egl-context.c                        |   5 -=0D
 ui/egl-headless.c                       |   1 -=0D
 ui/egl-helpers.c                        |  10 ++=0D
 ui/gtk-egl.c                            |   3 +=0D
 ui/gtk-gl-area.c                        |  28 +++++=0D
 ui/gtk.c                                |  43 +++++--=0D
 ui/sdl2-gl.c                            |  10 +-=0D
 ui/sdl2.c                               |   1 -=0D
 ui/spice-display.c                      |   2 +-=0D
 tests/acceptance/virtio-gpu.py          | 161 ++++++++++++++++++++++++=0D
 26 files changed, 501 insertions(+), 101 deletions(-)=0D
 create mode 100644 tests/acceptance/virtio-gpu.py=0D
=0D
--=20=0D
2.29.0=0D
=0D


