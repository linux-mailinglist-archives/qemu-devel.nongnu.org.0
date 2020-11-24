Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E0B2C2C49
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 17:07:46 +0100 (CET)
Received: from localhost ([::1]:50978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khar3-0006QS-RF
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 11:07:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1khamf-00025L-QF
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:03:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1khamb-0006ds-VF
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606233786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F0kuPxf3uaKd5lsZHnng6cZbEN6wAd6JCM9kAgtHLOc=;
 b=HMHY6R1x2hsQ14gFJFCqX64qWWP9F/XIdV1bDJg1Tzw2fZRLMlqyytNkzedTl1lB0kR+g9
 wYsHFSYjMj0GJtkRkzA7GSwKFyp+Fqm1a9ye20awHHg29WBfT727lBGLioCWJ/iiOPyMR4
 6IIZeYNtAFZfpsUVANOxBhKOn8GtBSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-9bYq3Q8UOGyjyiu4esnt-Q-1; Tue, 24 Nov 2020 11:03:03 -0500
X-MC-Unique: 9bYq3Q8UOGyjyiu4esnt-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1618F612A4
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 16:03:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4451B1346D;
 Tue, 24 Nov 2020 16:02:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4E7BE16E31; Tue, 24 Nov 2020 17:02:55 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] [RfC] fix tracing for modules
Date: Tue, 24 Nov 2020 17:02:51 +0100
Message-Id: <20201124160255.28111-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

First version that actually works.  Only qxl covered for this RfC, other=0D
modules will follow once the basics are hashed out.=0D
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
  meson: add module_trace & module_trace_src=0D
  meson: move qxl trace events to separate file=0D
=0D
 hw/display/qxl-render.c     |  1 +=0D
 hw/display/qxl.c            |  1 +=0D
 hw/display/meson.build      |  5 +++=0D
 hw/display/trace-events     | 67 -------------------------------------=0D
 hw/display/trace-events-qxl | 66 ++++++++++++++++++++++++++++++++++++=0D
 meson.build                 |  7 ++--=0D
 trace/meson.build           | 37 +++++++++++++++-----=0D
 7 files changed, 106 insertions(+), 78 deletions(-)=0D
 create mode 100644 hw/display/trace-events-qxl=0D
=0D
--=20=0D
2.27.0=0D
=0D


