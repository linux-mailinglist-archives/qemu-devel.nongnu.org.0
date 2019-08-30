Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3036A34CE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Aug 2019 12:17:24 +0200 (CEST)
Received: from localhost ([::1]:57714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3dy7-0001Xz-OY
	for lists+qemu-devel@lfdr.de; Fri, 30 Aug 2019 06:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58115)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i3drK-0006fY-7q
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 06:10:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i3drA-0005gO-QD
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 06:10:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42668)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i3drA-0005Kx-Co; Fri, 30 Aug 2019 06:10:12 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B0DD5307D868;
 Fri, 30 Aug 2019 10:10:07 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-243.ams2.redhat.com [10.36.117.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD060600F8;
 Fri, 30 Aug 2019 10:10:00 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 30 Aug 2019 12:09:57 +0200
Message-Id: <20190830100959.26615-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 30 Aug 2019 10:10:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/2] tcg: Introduce probe_access() and
 return a host pointer
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
Cc: Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's return a host pointer from probe_access() if possible and provide
probe_access(). s390x will soon make use of probe_access() and use the
provided host pointer.

v1 -> v2:
- Rebased to tcg-next
- "tcg: Make probe_write() return a pointer to the host page"
-- Rephrase documentation
- "tcg: Factor out probe_write() logic into probe_access()"
-- Don't check the MMU index

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Riku Voipio <riku.voipio@iki.fi>

David Hildenbrand (2):
  tcg: Make probe_write() return a pointer to the host page
  tcg: Factor out probe_write() logic into probe_access()

 accel/tcg/cputlb.c      | 60 +++++++++++++++++++++++++++++++----------
 accel/tcg/user-exec.c   | 28 ++++++++++++++-----
 include/exec/exec-all.h |  9 +++++--
 3 files changed, 75 insertions(+), 22 deletions(-)

--=20
2.21.0


