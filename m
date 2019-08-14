Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1398DC7A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Aug 2019 19:57:33 +0200 (CEST)
Received: from localhost ([::1]:34728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxxWf-0000qI-0t
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 13:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38386)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1hxxV0-0007sx-5n
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 13:55:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hxxUz-0005A5-1h
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 13:55:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48358)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hxxUy-00059i-Sx
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 13:55:49 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 00EF730A00DC;
 Wed, 14 Aug 2019 17:55:48 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-212.ams2.redhat.com
 [10.36.117.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80173909F8;
 Wed, 14 Aug 2019 17:55:37 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com,
	mst@redhat.com
Date: Wed, 14 Aug 2019 18:55:32 +0100
Message-Id: <20190814175535.2023-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 14 Aug 2019 17:55:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/3] Fix MemoryRegionSection alignment and
 comparison
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
Cc: peter.maydell@linaro.org, maxime.coquelin@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

This fixes a symptom I've seen on vhost-user on aarch64 where the
daemon would be falsely notified of memory region changes that didn't
exist.
The underlying problem was me memcmp'ing MemoryRegionSections even
though they had padding in.

(Discovered while getting virtiofs working on aarch)

Dave

v2
  Split 1st patch and fix spelling [Philippe's review]

Dr. David Alan Gilbert (3):
  memory: Align MemoryRegionSections fields
  memory: Provide an equality function for MemoryRegionSections
  vhost: Fix memory region section comparison

 hw/virtio/vhost.c     |  9 +++++++--
 include/exec/memory.h | 14 +++++++++++++-
 2 files changed, 20 insertions(+), 3 deletions(-)

--=20
2.21.0


