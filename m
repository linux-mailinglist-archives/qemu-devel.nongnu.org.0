Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1632D3D38AC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 12:31:15 +0200 (CEST)
Received: from localhost ([::1]:40184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6sSY-0003UJ-0w
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 06:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m6sQ3-0001oi-J0
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:28:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m6sQ1-0001Vk-Dz
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627036114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XZ9RnnH1buHM0+JSflYS60sBfiAZyxgUaEogktykaMA=;
 b=AmkAeRaVM0vmRs9r0DcHGFLaa6165WPUOobp58v2wDQ0+mhyOcvOh0C5S5oixvD/JIqoFX
 76hXNi0N9NNxeX+Y2/selhnsxuGSn1AKR/WAM2KSDIKqswF7HcRWX2K9szS8LIPUl4zWZb
 a0tLRs7gm1QXvOz6c4dn80JvgF7VyF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-_yF4dZjEMCmQeP8IkUKcjw-1; Fri, 23 Jul 2021 06:28:33 -0400
X-MC-Unique: _yF4dZjEMCmQeP8IkUKcjw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFE6E94DC1
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:28:32 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 916A85C1D1;
 Fri, 23 Jul 2021 10:28:28 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] chardev fixes
Date: Fri, 23 Jul 2021 14:28:21 +0400
Message-Id: <20210723102825.1790112-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 berrange@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Two small fixes related to fd handling for "serial" and "file" backend and =
some=0D
API comments and minor improvement.=0D
=0D
Marc-Andr=C3=A9 Lureau (4):=0D
  chardev: fix qemu_chr_open_fd() being called with fd=3D-1=0D
  chardev: fix qemu_chr_open_fd() with fd_in=3D=3Dfd_out=0D
  chardev: remove needless class method=0D
  chardev: add some comments about the class methods=0D
=0D
 include/chardev/char.h | 34 +++++++++++++++++++++++++++++++++-=0D
 chardev/char-fd.c      | 31 +++++++++++++++++++++++--------=0D
 chardev/char-mux.c     |  6 ++----=0D
 3 files changed, 58 insertions(+), 13 deletions(-)=0D
=0D
--=20=0D
2.32.0.264.g75ae10bc75=0D
=0D


