Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65F413DF27
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 16:49:00 +0100 (CET)
Received: from localhost ([::1]:44090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is7OF-0004zs-0n
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 10:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35605)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1is7Lo-0003I8-Go
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:46:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1is7Ln-0004KR-Eb
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:46:28 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56055
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1is7Ln-0004K9-BA
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:46:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579189586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YfN4OvMuMhLfWmnUcjvz0Y38ObGnr4KhgpoUNU0OeuU=;
 b=iiBterVAfwPHrXoONrYMiqG5xhDJQ8FSorRFH0VbrivdZmT47nu85b6xztsC2ck2mTGLTe
 nFDlENUAwu+aWbD74PMfjoYmkLBlkMEbnrJAKqXlxy7Jp2UNheM4OIc5HLW447nCSAGBym
 VPNFpZuDRI5EBZkqSjx2f2XGcnhEDP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-D-lTetRGPoyPH6k6kWPHUg-1; Thu, 16 Jan 2020 10:46:25 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D651B100550E
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 15:46:23 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76F411E2;
 Thu, 16 Jan 2020 15:46:17 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] Fix multifd + cancel + multifd
Date: Thu, 16 Jan 2020 16:46:11 +0100
Message-Id: <20200116154616.11569-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: D-lTetRGPoyPH6k6kWPHUg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

In the v3 series:
- Add back the ->shutdown fix
  Dave found the problem, we need to setup an error if we do shutdown.
- Make iotests to work back (we need to setup ->active for savevm)
- So postcopy/recovery is fixed again.

Please review, if there are not outstanding issues, I plan to push it.

Thanks, Juan

In the v2 series:
- get the multifd test patch
- drop the ->shutdown fix
  it break postcopy recovery test.  Still trying to determine if the
  problem is inside the recover test or the recover code.
- upgrade the migrate_cancel test

Please review.

[v1]
This series:
- create a test that does:
  launch multifd on target
  migrate to target
  cancel on source
  create another target
  migrate again

- And fixes the cases that made it fail:
* Make sure that we don't try ever IO after shutdown/error

Please, review.

Juan Quintela (5):
  multifd: Make sure that we don't do any IO after an error
  migration: Create MigrationState active field
  migration: Don't wait in semaphore for thread we know has finished
  qemu-file: Don't do IO after shutdown
  migration-test: Make sure that multifd and cancel works

 migration/migration.c        |   5 ++
 migration/migration.h        |   5 ++
 migration/qemu-file.c        |  22 ++++++-
 migration/ram.c              |  28 ++++++---
 migration/savevm.c           |   2 +
 tests/qtest/migration-test.c | 112 ++++++++++++++++++++++++++++++++++-
 6 files changed, 163 insertions(+), 11 deletions(-)

--=20
2.24.1


