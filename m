Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A16D64CDFAA
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 22:18:28 +0100 (CET)
Received: from localhost ([::1]:51228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQFJj-0003KR-N0
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 16:18:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nQFIB-0001kQ-Eh
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 16:16:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nQFI9-0003fq-1R
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 16:16:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646428608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NdT8zDvsJDHiraOVeHcwjnNH0oUrIhJUEknDrt+82IE=;
 b=YsU0vIg6UsZIShqd7w/Or/fqZUq/baVzg7cYgm2mElInUCjegefSwaVPBVAeLSv47NnVgE
 JJoN3gvuTPc2L+5z2hkGwH3J8nVamj7wZnJlr4YWBKa+mZveJSDVLA+zia2PQOVk7bXWOa
 CLB0jTw3VAtssa1eeKYbm0rETDzNQtc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-BnATs81WNZOTzA1P3HpvIQ-1; Fri, 04 Mar 2022 16:16:45 -0500
X-MC-Unique: BnATs81WNZOTzA1P3HpvIQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 347B8180FD71;
 Fri,  4 Mar 2022 21:16:43 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7F074ABAD;
 Fri,  4 Mar 2022 21:16:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] Remove qemu_gettimeofday()
Date: Sat,  5 Mar 2022 01:16:13 +0400
Message-Id: <20220304211618.3715999-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Marek Vasut <marex@denx.de>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Chris Wulff <crwulff@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Here is a few patches to replace qemu_gettimeofday() helper with functions=
=0D
provided by GLib.=0D
=0D
v2:=0D
- fix return of get-time in nanoseconds=0D
- qga: replace with a common get-time function for qga posix/win32=0D
- split qga patch=0D
- add r-b tags, drop RFC=0D
=0D
Marc-Andr=C3=A9 Lureau (5):=0D
  m68k/nios2-semi: fix gettimeofday() result check=0D
  qtest: replace gettimeofday with GTimer=0D
  qga: replace qemu_gettimeofday() with g_get_real_time()=0D
  Replace qemu_gettimeofday() with g_get_real_time()=0D
  oslib: drop qemu_gettimeofday()=0D
=0D
 include/sysemu/os-posix.h  |  3 ---=0D
 include/sysemu/os-win32.h  |  6 ------=0D
 blockdev.c                 |  8 ++++----=0D
 hw/rtc/m41t80.c            |  6 +++---=0D
 hw/virtio/virtio-balloon.c |  9 +--------=0D
 qapi/qmp-event.c           | 12 +++++-------=0D
 qemu-img.c                 |  8 ++++----=0D
 qga/commands-posix.c       | 14 --------------=0D
 qga/commands-win32.c       | 19 -------------------=0D
 qga/commands.c             |  5 +++++=0D
 softmmu/qtest.c            | 39 ++++++++++----------------------------=0D
 target/m68k/m68k-semi.c    | 22 ++++++++++-----------=0D
 target/nios2/nios2-semi.c  | 23 ++++++++++------------=0D
 util/oslib-win32.c         | 20 -------------------=0D
 14 files changed, 52 insertions(+), 142 deletions(-)=0D
=0D
--=20=0D
2.35.1.273.ge6ebfd0e8cbb=0D
=0D


