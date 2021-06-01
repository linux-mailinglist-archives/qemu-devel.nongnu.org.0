Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB39139742A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 15:28:03 +0200 (CEST)
Received: from localhost ([::1]:56358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo4R8-0007na-S6
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 09:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4Nb-0001JQ-Nf
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:24:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4NZ-0007Ag-SK
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622553861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/ylVBsmi4uMi5kcvIyEP92G9T/1U7SscG3NgsLgV5Ko=;
 b=OyCAvqfmix1JsASCi/7grR4RhFOqmgZEtjG7AOAevAtTcLV5Xh2MBFwOfiG96B22S7xfWR
 NueCQBIelthT8LqwzRZ8TIjLfqplWpEfFx7aKM/B01otu4MVQ7X8c2tqvCF2hU9lhhQ/AM
 kOAGSEiUlxIn64phOjen5QQkEO66iFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-ciJXnTMFOCCGQcFCYmWsBQ-1; Tue, 01 Jun 2021 09:24:18 -0400
X-MC-Unique: ciJXnTMFOCCGQcFCYmWsBQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77F391012D95
 for <qemu-devel@nongnu.org>; Tue,  1 Jun 2021 13:24:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B7595D9CD;
 Tue,  1 Jun 2021 13:24:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 31EA418000A0; Tue,  1 Jun 2021 15:24:14 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/13] [RfC] fix tracing for modules
Date: Tue,  1 Jun 2021 15:24:01 +0200
Message-Id: <20210601132414.432430-1-kraxel@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First version that actually works.  Only qxl covered for this RfC,=0D
other modules will follow once the basics are hashed out.=0D
=0D
v4:=0D
 - rebase to latest master.=0D
 - fix systemtap tracing.=0D
 - also cover virtio-gpu modules.=0D
 - pick up some review tags.=0D
 - misc minor tweaks.=0D
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
Gerd Hoffmann (13):=0D
  qemu-trace-stap: changing SYSTEMTAP_TAPSET considered harmful.=0D
  trace: iter init tweaks=0D
  trace: add trace_event_iter_init_group=0D
  trace/simple: pass iter to st_write_event_mapping=0D
  trace/simple: add st_init_group=0D
  meson: add trace_events_config[]=0D
  meson: move up hw subdir (specifically before trace subdir)=0D
  meson: add module_trace & module_trace_src=0D
  trace/stap: build stap files for modules=0D
  meson: move qxl trace events to separate file=0D
  virtio-gpu: split trace points=0D
  meson: move virtio trace events to separate file=0D
  meson: move virtio-gl trace events to separate file=0D
=0D
 hw/display/trace-qxl.h            |  1 +=0D
 hw/display/trace-virtio-gl.h      |  1 +=0D
 hw/display/trace-virtio.h         |  1 +=0D
 trace/control.h                   | 30 ++++++++--=0D
 trace/simple.h                    |  1 +=0D
 hw/display/qxl-render.c           |  2 +-=0D
 hw/display/qxl.c                  |  2 +-=0D
 hw/display/virtio-gpu-base.c      |  2 +-=0D
 hw/display/virtio-gpu-virgl.c     | 50 ++++++++--------=0D
 hw/display/virtio-gpu.c           |  2 +-=0D
 monitor/misc.c                    |  4 +-=0D
 trace/control-target.c            |  2 +-=0D
 trace/control.c                   | 39 ++++++++++---=0D
 trace/qmp.c                       |  6 +-=0D
 trace/simple.c                    | 22 +++++--=0D
 hw/display/meson.build            | 12 ++++=0D
 hw/display/trace-events           | 95 -------------------------------=0D
 hw/display/trace-events-qxl       | 66 +++++++++++++++++++++=0D
 hw/display/trace-events-virtio    | 16 ++++++=0D
 hw/display/trace-events-virtio-gl | 18 ++++++=0D
 meson.build                       | 43 +++++++++++++-=0D
 scripts/qemu-trace-stap           | 14 ++---=0D
 trace/meson.build                 | 36 +++++++++---=0D
 23 files changed, 298 insertions(+), 167 deletions(-)=0D
 create mode 100644 hw/display/trace-qxl.h=0D
 create mode 100644 hw/display/trace-virtio-gl.h=0D
 create mode 100644 hw/display/trace-virtio.h=0D
 create mode 100644 hw/display/trace-events-qxl=0D
 create mode 100644 hw/display/trace-events-virtio=0D
 create mode 100644 hw/display/trace-events-virtio-gl=0D
=0D
--=20=0D
2.31.1=0D
=0D


