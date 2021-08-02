Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F253DD667
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:05:03 +0200 (CEST)
Received: from localhost ([::1]:51642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXcs-0002rq-Pn
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAXb7-0000d2-Rb
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:03:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAXb5-0000O9-SK
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627909391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=22a1jw9/3KN14HyC13uKjYxuOykekOiOJH/3hUmJfro=;
 b=M/2Y9MX233LxouGIUJdw9oFToDCcdk6HsF7Nx3STxUDvo5GW6nhpUtJE+myVnwyaJOqHW6
 jzzphYSXQVhomCpwKHlDc5wKN0Hp1ZULmPVfKeU/Sp/geqAp1L0u8lyLEbTrqc48X5zp7R
 Ly1U0ob0T/lwtvns2sg2/RPGfgYhfxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-FbxIn_1eMr6dlunqAmN5Pg-1; Mon, 02 Aug 2021 09:03:10 -0400
X-MC-Unique: FbxIn_1eMr6dlunqAmN5Pg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3653787D541
 for <qemu-devel@nongnu.org>; Mon,  2 Aug 2021 13:03:09 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EF6A2C607;
 Mon,  2 Aug 2021 13:03:03 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] seccomp: fix hole in blocking forks
Date: Mon,  2 Aug 2021 14:02:58 +0100
Message-Id: <20210802130303.3300108-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Blocking the 'fork' syscall on Linux is not sufficient to block the=0D
'fork' C library function, because the latter is essentially always=0D
implemented using the 'clone' syscall these days.=0D
=0D
Blocking 'clone' is difficult as that also blocks pthread creation,=0D
so it needs careful filtering.=0D
=0D
Daniel P. Berrang=C3=A9 (5):=0D
  seccomp: allow action to be customized per syscall=0D
  seccomp: add unit test for seccomp filtering=0D
  seccomp: fix blocking of process spawning=0D
  seccomp: block use of clone3 syscall=0D
  seccomp: block setns, unshare and execveat syscalls=0D
=0D
 MAINTAINERS               |   1 +=0D
 softmmu/qemu-seccomp.c    | 282 +++++++++++++++++++++++++++++---------=0D
 tests/unit/meson.build    |   4 +=0D
 tests/unit/test-seccomp.c | 269 ++++++++++++++++++++++++++++++++++++=0D
 4 files changed, 490 insertions(+), 66 deletions(-)=0D
 create mode 100644 tests/unit/test-seccomp.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


