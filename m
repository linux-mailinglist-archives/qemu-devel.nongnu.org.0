Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 963FD158C19
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 10:50:38 +0100 (CET)
Received: from localhost ([::1]:46698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1SBg-0005pM-9b
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 04:50:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46563)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j1SAO-0004X7-Bw
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 04:49:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j1SAN-0000jj-Ev
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 04:49:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47890
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j1SAN-0000jO-C4
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 04:49:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581414554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MZOFpSZp8Q7KRErzT5/1e3xYwVENe03HVdckKrmI6M0=;
 b=YDExWVMEu+Y/IUUcItMr0FtfuVTh30K9jiVMSxLnYckMCjKOcccRfCcN1wLqjPjE03s6ZU
 JMYn+1WfafCG2W5o2DUn7NKmRW6cyOIwVz4/gUrrIAFw4iNUM0UdoCiJXjYRQcv0K8uIfD
 G/YK+l+WShUL21U1e377GDRdr3MOGpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-oRuqPn1OOZSmSEAdENh8aQ-1; Tue, 11 Feb 2020 04:49:10 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27E3C800EBB;
 Tue, 11 Feb 2020 09:49:09 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-79.ams2.redhat.com [10.36.117.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E44BA26FA8;
 Tue, 11 Feb 2020 09:49:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/3] qcow2: Fix write/copy error path with data file
Date: Tue, 11 Feb 2020 10:48:57 +0100
Message-Id: <20200211094900.17315-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: oRuqPn1OOZSmSEAdENh8aQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: kwolf@redhat.com, pbutsykin@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf (3):
  qcow2: update_refcount(): Reset old_table_index after
    qcow2_cache_put()
  qcow2: Fix qcow2_alloc_cluster_abort() for external data file
  iotests: Test copy offloading with external data file

 block/qcow2-cluster.c      |  7 +++++--
 block/qcow2-refcount.c     |  1 +
 tests/qemu-iotests/244     | 14 ++++++++++++++
 tests/qemu-iotests/244.out |  6 ++++++
 4 files changed, 26 insertions(+), 2 deletions(-)

--=20
2.20.1


