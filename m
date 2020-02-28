Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20A2173773
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 13:45:57 +0100 (CET)
Received: from localhost ([::1]:46390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7f1h-00088A-02
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 07:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49056)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pkrempa@redhat.com>) id 1j7f0v-0007We-Bv
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 07:45:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pkrempa@redhat.com>) id 1j7f0u-0008UT-Gy
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 07:45:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49950
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pkrempa@redhat.com>) id 1j7f0u-0008U9-E2
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 07:45:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582893907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qo6ra9pkhHBVb7Ofvwlk5P61CT0Jn1Iy9EfEGMA4+mU=;
 b=hNl2Kb9MjE2GXGRAqwZRg6wJ3lW6b5q/0KzbZOqYDu46Fj7wXOQgRgvw1H36vKhiUHoUoG
 t6PxMhjB1sY/dW3FQjmG2obWnRLuz0ZGQ/F9w5srnPBUxZbzOl22b7GZm0XQgejwj5NjXU
 PiqG7YEkhnGrM4AUky29lqRvPoNge3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-E3X2gr5yOgijrwvzSsE6zg-1; Fri, 28 Feb 2020 07:45:04 -0500
X-MC-Unique: E3X2gr5yOgijrwvzSsE6zg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0966D8017CC;
 Fri, 28 Feb 2020 12:45:03 +0000 (UTC)
Received: from angien.redhat.com (unknown [10.43.2.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA05C19C7F;
 Fri, 28 Feb 2020 12:45:01 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] block/qcow2: Fix bitmap reopen with 'auto-read-only' file
 child
Date: Fri, 28 Feb 2020 13:44:45 +0100
Message-Id: <cover.1582893284.git.pkrempa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See patch 2/2 for explanation. Also please excuse the lack of tests
caused by my ignorance of not figuring out where to put them.

Peter Krempa (2):
  block: Introduce 'bdrv_reopen_commit_post' step
  block/qcow2: Move bitmap reopen into bdrv_reopen_commit_post

 block.c                   | 9 +++++++++
 block/qcow2.c             | 7 ++++++-
 include/block/block_int.h | 1 +
 3 files changed, 16 insertions(+), 1 deletion(-)

--=20
2.24.1


