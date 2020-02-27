Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A09C1726EB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 19:20:00 +0100 (CET)
Received: from localhost ([::1]:36200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7NlP-0004s6-4t
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 13:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33651)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j7Njs-0003Sz-OC
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 13:18:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j7Njr-0003zE-Fb
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 13:18:24 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39794
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j7Njq-0003yC-AY
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 13:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582827501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JlQqUxmMUsFPefT4UyFHH91gtGrdC3wMJLbHik3Yu+8=;
 b=IKpj2ujC/iiIMi9oAR+IZH2ynR8t9anlvwDZzcHL3Hg27K+iA5Gj4kur1ej7h5lvWjm/eA
 5qhBwqOK9YHZmzfazmlIOKUgNViStG7J/3mu2hNk1Me94Z++5+Ys6u6a8eQgRMZNRso7S8
 MJUqEYXcMM686Q9sKDXDPHkBrFsONLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-lEgi9j8WMHCZLkfrsjt4MQ-1; Thu, 27 Feb 2020 13:18:18 -0500
X-MC-Unique: lEgi9j8WMHCZLkfrsjt4MQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3DB4800053;
 Thu, 27 Feb 2020 18:18:16 +0000 (UTC)
Received: from linux.fritz.box.com (unknown [10.36.118.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 526348C087;
 Thu, 27 Feb 2020 18:18:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] block: bdrv_reopen() with backing file in different
 AioContext
Date: Thu, 27 Feb 2020 19:18:02 +0100
Message-Id: <20200227181804.15299-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berto@igalia.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf (2):
  iotests: Refactor blockdev-reopen test for iothreads
  block: bdrv_reopen() with backing file in different AioContext

 block.c                    | 36 +++++++++++++++++++++++++---------
 tests/qemu-iotests/245     | 40 ++++++++++++++++++++++++++++----------
 tests/qemu-iotests/245.out |  4 ++--
 3 files changed, 59 insertions(+), 21 deletions(-)

--=20
2.20.1


