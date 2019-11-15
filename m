Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5577CFE4AF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 19:13:45 +0100 (CET)
Received: from localhost ([::1]:44164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVg6K-0005hi-BH
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 13:13:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45755)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1iVg1S-0000av-V0
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 13:08:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1iVg1R-00022N-BO
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 13:08:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21017
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1iVg1R-00021i-6k
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 13:08:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573841320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yRrqDu5FThD9Ne62Ck5Qnx/6kWisiS5hV1UUaSebfFM=;
 b=hIH1PqxVsWH2+3b1Trn0YVzUxnhTC2yzh9wsAzP7lgWnp2jkaTDUBhLXnClyCawCkD3OF6
 eTEFXyWjtFXdZ3wwIzjXF4i/Dd0pA/nLYOdq68LqktmWJFRd1ryMGAay4g5MzWf6B8qpPu
 JqXsBY8xH00Rw9GJvwPdVoOEQgjfFlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-98HIxdaJOxuiUEBnxTYagQ-1; Fri, 15 Nov 2019 13:08:38 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4546718B5F6A;
 Fri, 15 Nov 2019 18:08:36 +0000 (UTC)
Received: from virtlab501.virt.lab.eng.bos.redhat.com
 (virtlab501.virt.lab.eng.bos.redhat.com [10.19.152.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0134E60490;
 Fri, 15 Nov 2019 18:08:29 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] python/qemu: New accel module and improvements
Date: Fri, 15 Nov 2019 13:08:25 -0500
Message-Id: <20191115180829.10275-1-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 98HIxdaJOxuiUEBnxTYagQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: fam@euphon.net, ehabkost@redhat.com, philmd@redhat.com, jsnow@redhat.com,
 crosa@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On commit abf0bf998dcb John Snow moved some code out of __init__.py
to machine.py. kvm_available() remained in though. So on patch 01
I continue his work by creating a home for that method (the new
'accel' module). Honestly I was unsure about whether move the code
to any existing module or make a new, but since I am adding more
methods related with accelerators then I thought they would=20
deserve a module.

The patches 02-04 introduce new helpers and make improvements. Later
I intend to use those methods on the acceptance tests such as
to automatically set the accelerator in QEMUMachine VM via Avocado
tags, and skip the test if the accelerator is not available.

Git:
 - Tree: https://github.com/wainersm/qemu
 - Branch: python_accel

CI:
 - Travis (FAIL): https://travis-ci.org/wainersm/qemu/builds/612382935
   Non-related fail due build timeout

Wainer dos Santos Moschetta (4):
  python/qemu: Move kvm_available() to its own module
  python/qemu: accel: Add list_accel() method
  python/qemu: accel: Strengthen kvm_available() checks
  python/qemu: accel: Add tcg_available() method

 python/qemu/__init__.py | 20 +----------
 python/qemu/accel.py    | 79 +++++++++++++++++++++++++++++++++++++++++
 tests/vm/basevm.py      |  2 +-
 3 files changed, 81 insertions(+), 20 deletions(-)
 create mode 100644 python/qemu/accel.py

--=20
2.18.1


