Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177D5E1A40
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 14:31:42 +0200 (CEST)
Received: from localhost ([::1]:34720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNFng-0004Ow-E1
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 08:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34596)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fziglio@redhat.com>) id 1iNFjK-0002Dh-Cm
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 08:27:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fziglio@redhat.com>) id 1iNFjI-00006u-DK
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 08:27:10 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57445
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fziglio@redhat.com>) id 1iNFjI-00006e-9c
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 08:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571833626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QVCVfHYT96hzaV66WzMe1iyTCsyaP84kD6J7u1JNZGM=;
 b=QyryMRBqKceVGD16zr231utK9gC1n/QPtZz3q8fG/KaV6V52Z2QrBbHx9mKN8k8V7T7y6z
 uFF4fVTtbH/wT4InuFF0M5cDaIAEClMhlpb2qoGVa9wYvMJrsb6EDExSgdB9kRBRcZ78uq
 NgmHhghi2wxNZfh1unFFKRjAc1WHyuw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-ZLdWZhaDOEek3e7twv2YEg-1; Wed, 23 Oct 2019 08:26:59 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA14F107AD31;
 Wed, 23 Oct 2019 12:26:58 +0000 (UTC)
Received: from fziglio.remote.csb (unknown [10.34.247.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D520600CC;
 Wed, 23 Oct 2019 12:26:57 +0000 (UTC)
From: Frediano Ziglio <fziglio@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 2/3] event_notifier: avoid dandling file descriptor in
 event_notifier_cleanup
Date: Wed, 23 Oct 2019 13:26:51 +0100
Message-Id: <20191023122652.2999-2-fziglio@redhat.com>
In-Reply-To: <20191023122652.2999-1-fziglio@redhat.com>
References: <20191023122652.2999-1-fziglio@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: ZLdWZhaDOEek3e7twv2YEg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Frediano Ziglio <fziglio@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If rfd is equal to wfd the file descriptor is closed but
rfd will still have the closed value.
The EventNotifier structure should not be used again after calling
event_notifier_cleanup or should be initialized again but make
sure to not have dandling file descriptors around.

Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
---
 util/event_notifier-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/event_notifier-posix.c b/util/event_notifier-posix.c
index 73c4046b58..00d93204f9 100644
--- a/util/event_notifier-posix.c
+++ b/util/event_notifier-posix.c
@@ -80,8 +80,8 @@ void event_notifier_cleanup(EventNotifier *e)
 {
     if (e->rfd !=3D e->wfd) {
         close(e->rfd);
-        e->rfd =3D -1;
     }
+    e->rfd =3D -1;
     close(e->wfd);
     e->wfd =3D -1;
 }
--=20
2.21.0


