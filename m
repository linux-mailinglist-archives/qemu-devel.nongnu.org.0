Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610692DB69C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 23:44:52 +0100 (CET)
Received: from localhost ([::1]:58174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJ3q-0000VQ-US
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 17:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpJ0x-00071r-4O
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:41:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpJ0u-00070a-4o
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608072103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LLd4VoaXdHyEgQHum5Q/p5FAG0y2adh0T+vNOqyXuh0=;
 b=IdnBsbJcqb3Vu+VIruYzV3vy/YErHCD/eXbd0vOBti9u4udHnxBY13g5Xpr+0Pb8PTvK+7
 QXRV7YyY46WYyqLqhIKiuAWxiCu0dEYywwu33lmUqzUv4z1U4eR8wh/yR2QXBUTdjI32nR
 IbbPY8doU7KkvwNWWA3WSdSxeKjYu34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-li45VsEYNsickwQhxRkZDw-1; Tue, 15 Dec 2020 17:41:40 -0500
X-MC-Unique: li45VsEYNsickwQhxRkZDw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05567C73A1;
 Tue, 15 Dec 2020 22:41:39 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DB7960854;
 Tue, 15 Dec 2020 22:41:34 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 0/2] Fix test-char reference counting bug
Date: Tue, 15 Dec 2020 17:41:31 -0500
Message-Id: <20201215224133.3545901-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series addresses a bug that seems to be the cause of the=0D
following crash, that is reported by Patchew and other CI systems=0D
once in a while:=0D
=0D
  Running test test-char=0D
  Unexpected error in object_property_try_add() at ../qom/object.c:1220: at=
tempt to add duplicate property 'serial-id' to object (type 'container')=0D
  ERROR test-char - too few tests run (expected 38, got 9)=0D
  make: *** [run-test-86] Error 1=0D
=0D
This is what seems to be happening:=0D
=0D
- char_file_test_internal() creates chr using qemu_chardev_new().=0D
- qemu_chardev_new() automatically assigns ID, adds=0D
  chardev to the QOM tree.=0D
- char_file_test_internal() does _not_ own the reference=0D
  to the created object.=0D
- char_file_test_internal() incorrectly calls object_unref().=0D
- object is freed but, but /containers now has a dangling=0D
  pointer.=0D
- char_serial_test() creates a chardev with ID "serial-id", and=0D
  it ends up being allocated at the same address as the old=0D
  object.=0D
- char_serial_test() correctly calls object_unparent().=0D
- object_property_del_child() looks for the right child property=0D
  in the hashtable, finds the dangling pointer with the same=0D
  address, removes the wrong property, leaves a dangling=0D
  "serial-id" property.=0D
- New object is created by char_serial_test() with ID "serial-id".=0D
- object_property_try_add_child() will fail because of the=0D
  dangling "serial-id" property.=0D
=0D
Eduardo Habkost (2):=0D
  test-char: Destroy chardev correctly at char_file_test_internal()=0D
  qom: Assert that objects being destroyed have no parent=0D
=0D
 qom/object.c      | 1 +=0D
 tests/test-char.c | 2 +-=0D
 2 files changed, 2 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.28.0=0D
=0D


