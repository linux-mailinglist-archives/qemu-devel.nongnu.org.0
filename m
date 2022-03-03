Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E914A4CBD53
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 13:04:13 +0100 (CET)
Received: from localhost ([::1]:52928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPkBp-0005Q0-0V
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 07:04:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1nPk7y-00028K-OU
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:00:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1nPk7u-0003M8-GG
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:00:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646308807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RkYx8BXwwh5aXXB4HkCwMQFLwcuxo1yn4UgLAsD1Dfs=;
 b=CogcfqHap0LM1IBTOBRTHiUMyc6psVyvZ7HLiorQMJWPP4nBmOv1h34Q52kGF1CZU6YAhJ
 asVmhzhq9N/ry+9p6Z4BlTY5T2M3vqJ9BjNnfWbbef7N0RxcTYIz6JuH5Q3GKNqAwmIlma
 5wA724Ykddf/Y8UX4ClR53hz1I9QNZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-UiBKztlxOvKZl7V-c7T0JQ-1; Thu, 03 Mar 2022 07:00:04 -0500
X-MC-Unique: UiBKztlxOvKZl7V-c7T0JQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4045AFC81;
 Thu,  3 Mar 2022 12:00:02 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.33.37.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD960842DE;
 Thu,  3 Mar 2022 11:58:51 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] Enable vhost-user to be used on BSD systems
Date: Thu,  3 Mar 2022 12:59:07 +0100
Message-Id: <20220303115911.20962-1-slp@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Matthew Rosato <mjrosato@linux.ibm.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 David Hildenbrand <david@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since QEMU is already able to emulate ioeventfd using pipefd, we're already=
=0D
pretty close to supporting vhost-user on non-Linux systems.=0D
=0D
This two patches bridge the gap by:=0D
=0D
1. Adding a new event_notifier_get_wfd() to return wfd on the places where=
=0D
   the peer is expected to write to the notifier.=0D
=0D
2. Modifying the build system to it allows enabling vhost-user on BSD.=0D
=0D
v1->v2:=0D
  - Drop: "Allow returning EventNotifier's wfd" (Alex Williamson)=0D
  - Add: "event_notifier: add event_notifier_get_wfd()" (Alex Williamson)=0D
  - Add: "vhost: use wfd on functions setting vring call fd"=0D
  - Rename: "Allow building vhost-user in BSD" to "configure, meson: allow=
=0D
    enabling vhost-user on all POSIX systems"=0D
  - Instead of making possible enabling vhost-user on Linux and BSD systems=
,=0D
    allow enabling it on all non-Windows platforms. (Paolo Bonzini)=0D
=0D
v2->v3:=0D
  - Add a section to docs/interop/vhost-user.rst explaining how vhost-user=
=0D
    is supported on non-Linux platforms. (Stefan Hajnoczi)=0D
=0D
Sergio Lopez (4):=0D
  event_notifier: add event_notifier_get_wfd()=0D
  vhost: use wfd on functions setting vring call fd=0D
  configure, meson: allow enabling vhost-user on all POSIX systems=0D
  docs: vhost-user: add subsection for non-Linux platforms=0D
=0D
 configure                     |  4 ++--=0D
 docs/interop/vhost-user.rst   | 18 ++++++++++++++++++=0D
 hw/virtio/vhost.c             |  6 +++---=0D
 include/qemu/event_notifier.h |  1 +=0D
 meson.build                   |  2 +-=0D
 util/event_notifier-posix.c   |  5 +++++=0D
 6 files changed, 30 insertions(+), 6 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D


