Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C2914C9FB
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 12:58:12 +0100 (CET)
Received: from localhost ([::1]:45054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwlz1-00068H-96
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 06:58:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46889)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iwlxx-0004n7-K9
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 06:57:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iwlxv-0005vb-GJ
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 06:57:04 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41500
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iwlxv-0005tK-60
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 06:57:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580299022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qlwRzw0lgVZNQBON/VubX+BQXhxwmR8b3bktfZ159uw=;
 b=gnT2FGg+s3a3xQRGDS4lFmOvl8OA+sJleng7FIK8Wuz3O6wr21biZWwezq7Y471WrGu/WE
 7LPoPN3zWtIVQYXJmtJ0n7S34OGLLU4Hq5RUuOLvhNM9OysX2poDcUZWGkVQAN37TVPr7f
 rIMO2G0d+sLXtQyUMrU/KZ05tBe94aA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-zv_7_fUUPj2O8RokQcqkyg-1; Wed, 29 Jan 2020 06:56:59 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 483CDDB3C
 for <qemu-devel@nongnu.org>; Wed, 29 Jan 2020 11:56:58 +0000 (UTC)
Received: from secure.mitica (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02B7B19E9C;
 Wed, 29 Jan 2020 11:56:55 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/8] Multifd Migration Compression
Date: Wed, 29 Jan 2020 12:56:47 +0100
Message-Id: <20200129115655.10414-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: zv_7_fUUPj2O8RokQcqkyg-1
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: 20200129111536.9497-1-quintela@redhat.com

[v5]
- rebased on top of latest pull request
- check zlib/zstd return codes in loops (denis suggestions)
- check that we do the right thing in error cases (I corrupted the
  stream, make buffers too small, etc by hand)

[v4]
- create new parameters: multifd-zlib-level & multifd-zstd-level
- use proper "conditionals" for qapi (thanks markus)
- more than half of the patches moved to the migration PULL request
  that this series are based on
- method type has moved to one int from a set of flags
- fixed all reviews comments

Please review.

[v3]
- rebased on top of upstream + previous multifd cancel series
- split multifd code into its own file (multifd.[ch])
- split zstd/zlib compression methods (multifd-zstd/zlib.c)
- use qemu module feauture to avoid ifdefs
  (my understanding is that zlib needs to be present, but
  we setup zstd only if it is not there or is disabled)
- multifd-method: none|zlib|zstd

  As far as I can see, there is no easy way to convince qapi that zstd
  option could/couldn't be there depending on compliation flags. I
  ended just checking in migrate_parameters_check() if it is enabled
  and giving an error message otherwise.

Questions:
- I am "reusing" the compress-level parameter for both zstd and zlib,
  but it poses a problem:
  * zlib values: 1-9 (default: 6?)
  * zstd values: 1-19 (default: 3)
So, what should I do:
  * create multifd-zstd-level and multifd-zlib-level (easier)
  * reuse compress-level, and change its maximum values depending on
    multifd-method
  * any other good option?

Please, review.

[v2] - rebase on top of previous arguments posted to the list -
introduces zlib compression - introduces zstd compression

Please help if you know anything about zstd/zlib compression.

This puts compression on top of multifd. Advantages about current
compression:

- We copy all pages in a single packet and then compress the whole
  thing.

- We reuse the compression stream for all the packets sent through the
  same channel.

- We can select nocomp/zlib/zstd levels of compression.

Please, review.

Juan Quintela (8):
  multifd: Add multifd-method parameter
  migration: Add support for modules
  multifd: Make no compression operations into its own structure
  multifd: Add multifd-zlib-level parameter
  multifd: Add zlib compression multifd support
  configure: Enable test and libs for zstd
  multifd: Add multifd-zstd-level parameter
  multifd: Add zstd compression multifd support

 configure                    |  30 ++++
 hw/core/qdev-properties.c    |  13 ++
 include/hw/qdev-properties.h |   3 +
 include/qemu/module.h        |   2 +
 migration/Makefile.objs      |   2 +
 migration/migration.c        |  70 ++++++++
 migration/migration.h        |   3 +
 migration/multifd-zlib.c     | 325 +++++++++++++++++++++++++++++++++
 migration/multifd-zstd.c     | 337 +++++++++++++++++++++++++++++++++++
 migration/multifd.c          | 191 +++++++++++++++++++-
 migration/multifd.h          |  29 +++
 migration/ram.c              |   2 +-
 monitor/hmp-cmds.c           |  21 +++
 qapi/migration.json          |  80 ++++++++-
 tests/qtest/migration-test.c |  30 +++-
 vl.c                         |   1 +
 16 files changed, 1123 insertions(+), 16 deletions(-)
 create mode 100644 migration/multifd-zlib.c
 create mode 100644 migration/multifd-zstd.c

--=20
2.24.1


