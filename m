Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B92FEAD6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:57:58 +0100 (CET)
Received: from localhost ([::1]:58844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ZXB-0004c8-4z
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:57:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2ZQK-0005VM-7r
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:50:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2ZQA-0003Qu-PE
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:50:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611233441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i6Ij6RjmEcV/gfJ4ay3JdP1Xosqw7Urv7hgS3bVKuv8=;
 b=jGQ4UsyuDB6Uf3q501s0TLmVMZ57nBiACKmlLqw6HRg7Z7ARAL/pqnE+a5Z+4LHdpXMs6x
 iyFod2CPF+p9u8WRz3rwVvv5AVmvYK6VXyoL4zSmVl201q8lhK4ndIXrd3mvPkjsmXCuNG
 3tkka4/9YZH8yn+/9hQQGVa5vcBLF2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-aRaHeV7KOTa1KMt3NinK8g-1; Thu, 21 Jan 2021 07:50:37 -0500
X-MC-Unique: aRaHeV7KOTa1KMt3NinK8g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 439F08030AC
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 12:50:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 565E75D9C6;
 Thu, 21 Jan 2021 12:50:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C285D180039C; Thu, 21 Jan 2021 13:50:28 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/8] [RfC] fix tracing for modules
Date: Thu, 21 Jan 2021 13:50:20 +0100
Message-Id: <20210121125028.3247190-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First version that actually works.  Only qxl covered for this RfC,=0D
other modules will follow once the basics are hashed out.=0D
=0D
v3:=0D
 - handle initialization of modular tracepoints.=0D
=0D
TODO:=0D
Enabling modular tracepoints via -trace cmd line doesn't work yet.=0D
Guess we need to store the list somewhere for later re-processing.=0D
Error handling is tricky, specifically the "tracepoint doesn't exist"=0D
error.  Suggestions / ideas are welcome.=0D
=0D
More context:=0D
  https://bugzilla.redhat.com/show_bug.cgi?id=3D1898700=0D
  https://bugzilla.redhat.com/show_bug.cgi?id=3D1869642=0D
=0D
take care,=0D
  Gerd=0D
=0D
Gerd Hoffmann (8):=0D
  meson: add trace_events_config[]=0D
  meson: move up hw subdir (specifically before trace subdir)=0D
  meson: add module_trace & module_trace_src=0D
  meson: move qxl trace events to separate file=0D
  trace: iter init tweaks=0D
  trace: add trace_event_iter_init_group=0D
  trace/simple: pass iter to st_write_event_mapping=0D
  trace/simple: add st_init_group=0D
=0D
 trace/control.h             | 30 ++++++++++++++---=0D
 trace/simple.h              |  1 +=0D
 hw/display/qxl-render.c     |  1 +=0D
 hw/display/qxl.c            |  1 +=0D
 monitor/misc.c              |  4 +--=0D
 trace/control-target.c      |  2 +-=0D
 trace/control.c             | 39 ++++++++++++++++-----=0D
 trace/qmp.c                 |  6 ++--=0D
 trace/simple.c              | 22 +++++++++---=0D
 hw/display/meson.build      |  5 +++=0D
 hw/display/trace-events     | 67 -------------------------------------=0D
 hw/display/trace-events-qxl | 66 ++++++++++++++++++++++++++++++++++++=0D
 meson.build                 |  7 ++--=0D
 trace/meson.build           | 37 +++++++++++++++-----=0D
 14 files changed, 187 insertions(+), 101 deletions(-)=0D
 create mode 100644 hw/display/trace-events-qxl=0D
=0D
--=20=0D
2.29.2=0D
=0D


