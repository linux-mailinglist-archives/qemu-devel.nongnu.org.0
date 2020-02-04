Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A3215193B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 12:06:22 +0100 (CET)
Received: from localhost ([::1]:56332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyw28-0006hw-H1
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 06:06:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34060)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iyw13-0005PL-NB
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 06:05:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iyw12-0008BN-BB
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 06:05:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58114
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iyw12-00088b-6m
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 06:05:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580814311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MnUeb82UNuzIjDsD8D7+kjLSNmQlQlfaat2HpBLAbdY=;
 b=aGYzZycfuTaqUQVBBoPEW79m6SJUqy9Kp8t2o2RaHwTG3tkxTaWMIbrw72UIqa5V00LqBI
 NfgOgTjeGJUqIfR4VWKVIA3IRiVmPvEClp/Vf5cj8+pG4vQclLvfQV7dT0zUg+a5DTrVC0
 U9+7d7IaQdzBRYn0j9sy4U8uNmz1hQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-n7iX2OBiNd-6YWTrl90ZzA-1; Tue, 04 Feb 2020 06:05:08 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67A4EDBA5
 for <qemu-devel@nongnu.org>; Tue,  4 Feb 2020 11:05:07 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20FA6196AE;
 Tue,  4 Feb 2020 11:05:03 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PATCH 0/4] virtiofsd coverity fixes
Date: Tue,  4 Feb 2020 11:04:57 +0000
Message-Id: <20200204110501.10731-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: n7iX2OBiNd-6YWTrl90ZzA-1
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Hi,
  This is a set of fixes that fixes things that coverity pointed out.
Only the last one (the NULL check in do_read) is probably important.

Dave

Dr. David Alan Gilbert (4):
  virtiofsd: Remove fuse_req_getgroups
  virtiofsd: fv_create_listen_socket error path socket leak
  virtiofsd: load_capng missing unlock
  virtiofsd: do_read missing NULL check

 tools/virtiofsd/fuse.h           | 20 --------
 tools/virtiofsd/fuse_lowlevel.c  | 81 ++------------------------------
 tools/virtiofsd/fuse_lowlevel.h  | 21 ---------
 tools/virtiofsd/fuse_virtio.c    |  2 +
 tools/virtiofsd/passthrough_ll.c |  1 +
 5 files changed, 7 insertions(+), 118 deletions(-)

--=20
2.24.1


