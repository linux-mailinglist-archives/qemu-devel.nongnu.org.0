Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021E86C1399
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:38:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFh3-0002xV-2g; Mon, 20 Mar 2023 09:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1peFgz-0002xN-P7
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:36:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1peFgy-0000BI-AJ
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:36:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679319411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RL7R4+BLQRYCapu2sFDDTQoEdLdVYW8LhjLo8DkWvLs=;
 b=VFZB0BPhtbHAZI8Ih5/o3amru4AazuBHrcNYf8h1/4j2zKAldQh3fVYwknK4ZBMX6BNiBO
 qXgRdlWrhAFs096uQqjV89rJeu4rxZZwDSVmIDSAHMA2VKyY53+/VOEPlECG6gY/Vgwbb+
 iS4imAUIe/CisWbkImW33enDIEd44W8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-o51AAQYsNMyl8UwoW8k4cA-1; Mon, 20 Mar 2023 09:36:47 -0400
X-MC-Unique: o51AAQYsNMyl8UwoW8k4cA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8545C3C0E443;
 Mon, 20 Mar 2023 13:36:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CDA740C6E67;
 Mon, 20 Mar 2023 13:36:46 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, berrange@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 0/3] Fix Spice regression on win32
Date: Mon, 20 Mar 2023 17:36:40 +0400
Message-Id: <20230320133643.1618437-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

v2: (suggestions from Daniel Berrange)
- change function qemu_close_socket_osfhandle()
- add some documentation for it
- simplify a bit the dbus-related code

Marc-André Lureau (3):
  win32: add qemu_close_socket_osfhandle()
  ui/spice: fix SOCKET handling regression
  ui/dbus: fix passing SOCKET to GSocket API & leak

 include/sysemu/os-win32.h | 15 ++++++--
 ui/dbus.c                 |  9 +++++
 ui/spice-core.c           | 29 +++++++++++++--
 util/oslib-win32.c        | 75 +++++++++++++++++++++------------------
 4 files changed, 89 insertions(+), 39 deletions(-)

-- 
2.39.2


