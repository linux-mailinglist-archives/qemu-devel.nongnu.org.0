Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBDA1B6EB1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 09:13:26 +0200 (CEST)
Received: from localhost ([::1]:52822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRsWb-0008Lv-4p
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 03:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41294)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jRsVA-0006l9-NO
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 03:11:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jRsV8-0001pb-Qz
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 03:11:56 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33251
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jRsV8-0001nK-EI
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 03:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587712313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3D7+TEXu52OJEwYP6dOLbXBesEEcPpwX4TTk9D4Bftk=;
 b=Sb/tvogn89jXA0+clJ+vkQ2mfJBBALrN2FWOFEjbDhhmzvrn3y1NuXjwpaZWWRe8zQT3kD
 O5yAY2HmuDSvnrN/SyOMZ0yW0/eHB/9UXXvtv84XpvKxnVzCEmPMQKCRCwNtk00gvGQePI
 rExdO5HffrSG4eK4XCl+2rshS1nn0G8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-30Ib5hyQPtm2UzZTt_-g-g-1; Fri, 24 Apr 2020 03:11:50 -0400
X-MC-Unique: 30Ib5hyQPtm2UzZTt_-g-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF7051895A29;
 Fri, 24 Apr 2020 07:11:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90DA51002380;
 Fri, 24 Apr 2020 07:11:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 049BD11358BC; Fri, 24 Apr 2020 09:11:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] fuzz: Probably there is a better way to do this
Date: Fri, 24 Apr 2020 09:11:39 +0200
Message-Id: <20200424071142.3525-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 03:11:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: lvivier@redhat.com, thuth@redhat.com, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

... the comment next to qos_set_machines_devices_available() wonders.
Yup, there is!

Markus Armbruster (3):
  Makefile: Drop unused, broken target recurse-fuzz
  fuzz: Simplify how we compute available machines and types
  libqos: Give get_machine_allocator() internal linkage

 Makefile                          |  1 -
 tests/qtest/libqos/qos_external.h | 10 +++--
 tests/qtest/fuzz/qos_fuzz.c       | 34 ++++-----------
 tests/qtest/libqos/qos_external.c | 72 +++++++++++--------------------
 tests/qtest/qos-test.c            | 29 +++++++++----
 5 files changed, 60 insertions(+), 86 deletions(-)

--=20
2.21.1


