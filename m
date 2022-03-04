Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2494CD848
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:49:54 +0100 (CET)
Received: from localhost ([::1]:59508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQABl-0005LH-1w
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:49:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nQ9pv-0001Tz-19
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:27:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nQ9pr-0004uW-EX
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646407634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y1syFBjvKEtbA1QphEAAAA0VRhVDz40j8uGQREPqUgc=;
 b=Z12bEw9gaCDPxXORVnHlSCHm8372VtRS1CYbiLJROBCc5MDV0pPCTFqRK5wEEW8/pyH8Jx
 fEdnNUCzAeef/plgOnr3YYQHMzjRXNG6ntZHY/mWMmmtIYYsvC4UbuADkKG6a2RGyFG0/9
 lSykHrdKEDaYLKHrQv70G1WkuFZiEUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-CGwvcCbIM0-48N9cjGgYQQ-1; Fri, 04 Mar 2022 10:27:11 -0500
X-MC-Unique: CGwvcCbIM0-48N9cjGgYQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 166EC1006AA5;
 Fri,  4 Mar 2022 15:27:09 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7BD92ED95;
 Fri,  4 Mar 2022 15:27:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] RFC: remove qemu_gettimeofday()
Date: Fri,  4 Mar 2022 19:27:00 +0400
Message-Id: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Here is a few patches to replace qemu_gettimeofday() helper with functions=
=0D
provided by GLib.=0D
=0D
Marc-Andr=C3=A9 Lureau (4):=0D
  m68k/nios2-semi: fix gettimeofday() result check=0D
  qtest: replace gettimeofday with GTimer=0D
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
 qga/commands-posix.c       | 11 +----------=0D
 softmmu/qtest.c            | 39 ++++++++++----------------------------=0D
 target/m68k/m68k-semi.c    | 22 ++++++++++-----------=0D
 target/nios2/nios2-semi.c  | 24 +++++++++++------------=0D
 util/oslib-win32.c         | 20 -------------------=0D
 12 files changed, 49 insertions(+), 119 deletions(-)=0D
=0D
--=20=0D
2.35.1.273.ge6ebfd0e8cbb=0D
=0D


