Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF2516C3F0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 15:32:58 +0100 (CET)
Received: from localhost ([::1]:57878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6bGb-0004Ll-GU
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 09:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49063)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j6bFO-0002n8-TT
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 09:31:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j6bFN-0008C9-TE
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 09:31:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48872
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j6bFN-00088C-72
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 09:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582641095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L66u167JVs3H4uKYrBd17I6ZKOMYbhj5M9K8TmYE1yk=;
 b=YmCl5mtsGUcd731HwxRghwpWc5JN4re7/cd6HBiAsP9sRD7xkZMeVMrWKObIy5es+rExzg
 ptqEgE+dz1GH1i/UEMPDTMJTDKDVcBTM35+OLYetZ3cz+xPLS9NWp+bHDGIkhgAL5hy7ml
 iSxZuoK7YPbqXeZSX+otcBqyZFRlCDc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-tFr30o-XPRmmrIn2B2OZJg-1; Tue, 25 Feb 2020 09:31:33 -0500
X-MC-Unique: tFr30o-XPRmmrIn2B2OZJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DBA0DB20;
 Tue, 25 Feb 2020 14:31:32 +0000 (UTC)
Received: from localhost (ovpn-117-215.ams2.redhat.com [10.36.117.215])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E5E3100164D;
 Tue, 25 Feb 2020 14:31:31 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/3] qcow2: Fix alloc_cluster_abort() for pre-existing clusters
Date: Tue, 25 Feb 2020 15:31:27 +0100
Message-Id: <20200225143130.111267-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

With c3b6658c1a5a3fb2, Kevin has fixed a case in alloc_cluster_abort()
where we used to free a cluster that wasn=E2=80=99t even allocated by
handle_alloc(), thus leading to an error and/or corruption.  Besides
external data files, there is another case where alloc_cluster_abort()
must not free the =E2=80=9Cnew=E2=80=9D cluster: Namely when the cluster is=
n=E2=80=99t new
because we=E2=80=99re reusing an existing pre-allocated zero cluster.

I think Berto=E2=80=99s subcluster series fixes this, too, but it=E2=80=99s=
 still an
RFC, so I suppose we have to fix the bug independently of it.

Patch 2 adds a regression test; patch 3 adds a regression test for
Kevin=E2=80=99s patch c3b6658c1a5a3fb2 (which didn=E2=80=99t come with one)=
.


Max Reitz (3):
  qcow2: Fix alloc_cluster_abort() for pre-existing clusters
  iotests/026: Test EIO on preallocated zero cluster
  iotests/026: Test EIO on allocation in a data-file

 block/qcow2-cluster.c              |  2 +-
 tests/qemu-iotests/026             | 53 ++++++++++++++++++++++++++++++
 tests/qemu-iotests/026.out         | 16 +++++++++
 tests/qemu-iotests/026.out.nocache | 16 +++++++++
 4 files changed, 86 insertions(+), 1 deletion(-)

--=20
2.24.1


