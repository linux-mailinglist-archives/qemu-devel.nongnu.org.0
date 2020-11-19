Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43D12B8DD5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 09:47:31 +0100 (CET)
Received: from localhost ([::1]:57318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kffbG-0007Ro-RT
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 03:47:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kffYv-0005ew-Ei
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:45:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kffYt-0002M5-LP
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:45:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605775502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xMnmAeQxxB8IvxQ5bXl536NyIbrixJlPRFWDAeXLhpU=;
 b=QF/skEDuey8f54VsmshJGaGLXm2P2EF7S6mHakmGXDqOttu4FS+wRQXSkTyfsdRNrV4y1v
 mRcoifmxTWJJV+swvBOrn+om45QVOu+KDD9+L67ZDZ2c44oUi3dWDnKGNdL7/N03YqGJ7C
 fa5u4MXLftSwJCJmzQFB9wcrkj5YzOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-RPQdVQQ5O7-JIBOOy1C9Mg-1; Thu, 19 Nov 2020 03:45:00 -0500
X-MC-Unique: RPQdVQQ5O7-JIBOOy1C9Mg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBB9464161
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 08:44:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E66FC10016F4;
 Thu, 19 Nov 2020 08:44:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0C7BA17532; Thu, 19 Nov 2020 09:44:48 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] [RfC] try fix tracing for modules
Date: Thu, 19 Nov 2020 09:44:44 +0100
Message-Id: <20201119084448.24397-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Problem only partly solved so far.=0D
Building separate object files for modules works.=0D
Actually linking those to the module not yet.=0D
See last patch of the series for my not working approach.=0D
=0D
More context:=0D
  https://bugzilla.redhat.com/show_bug.cgi?id=3D1898700=0D
  https://bugzilla.redhat.com/show_bug.cgi?id=3D1869642=0D
=0D
take care,=0D
  Gerd=0D
=0D
Gerd Hoffmann (4):=0D
  meson: add trace_events_config[]=0D
  meson: move up hw subdir (specifically before trace subdir)=0D
  meson: move qxl trace events to separate file=0D
  [broken] meson: try link tracepoints to module=0D
=0D
 hw/display/qxl-render.c     |  1 +=0D
 hw/display/qxl.c            |  1 +=0D
 hw/display/meson.build      |  5 +++=0D
 hw/display/trace-events     | 67 -------------------------------------=0D
 hw/display/trace-events-qxl | 66 ++++++++++++++++++++++++++++++++++++=0D
 meson.build                 |  4 ++-=0D
 trace/meson.build           | 30 ++++++++++++-----=0D
 7 files changed, 97 insertions(+), 77 deletions(-)=0D
 create mode 100644 hw/display/trace-events-qxl=0D
=0D
--=20=0D
2.27.0=0D
=0D


