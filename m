Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99533C89F7
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:43:19 +0200 (CEST)
Received: from localhost ([::1]:47086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iuk-000184-Ca
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3isq-0007Vu-Tz
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:41:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3isn-0008H5-AZ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:41:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626284475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FtOB2iHULJsLoAKGs461AcFQ+8CsmwQuxGwinedPpr0=;
 b=E+JTNZNV1Q4vNow8f/BrYo0bhp4YQFxKA5tN0ok5Y/73rHjYckBrh8L5TcThs1dgmS9ccq
 /IFOvnEB32+dJBaH8A7tleBu8g/VwM3ghEbwjjS+kwAmGSaTPV9XPr/lmGwqMVc6P42HqT
 PkTrIWCTMj0InszbgqJU6R0S4blQpbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-77IzDA-zOQiMeWgRi80bcg-1; Wed, 14 Jul 2021 13:41:13 -0400
X-MC-Unique: 77IzDA-zOQiMeWgRi80bcg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB79F1926DA3;
 Wed, 14 Jul 2021 17:41:12 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 616E66090F;
 Wed, 14 Jul 2021 17:40:57 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.1 0/6] virtio-gpu acceptance test: use current device
 name
Date: Wed, 14 Jul 2021 13:40:45 -0400
Message-Id: <20210714174051.28164-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virtio-gpu acceptance tests are currently broken because of a=0D
mismatch in the device option and name (see patch 5).=0D
=0D
The exact failure is:=0D
=0D
  qemu-system-x86_64: -device virtio-vga,virgl=3Don: Property 'virtio-vga.v=
irgl' not found=0D
=0D
While at it, I've included a few cleanups and improvements to the very=0D
same test file.=0D
=0D
A pipeline can be seen here (applied top of my python-next):=0D
=0D
   https://gitlab.com/cleber.gnu/qemu/-/pipelines/337000139=0D
=0D
I've also applied it on top of current master (4aa2454d9) and verified=0D
the fix.=0D
=0D
If all patches are considered too much for the soft freeze, I can=0D
re-send patch 5 by itself.=0D
=0D
Cleber Rosa (6):=0D
  tests/acceptance/virtio-gpu.py: use require_accelerator()=0D
  tests/acceptance/virtio-gpu.py: combine x86_64 arch tags=0D
  tests/acceptance/virtio-gpu.py: combine CPU tags=0D
  tests/acceptance/virtio-gpu.py: combine kernel command line=0D
  tests/acceptance/virtio-gpu.py: use virtio-vga-gl=0D
  tests/acceptance/virtio-gpu.py: provide kernel and initrd hashes=0D
=0D
 tests/acceptance/virtio-gpu.py | 42 ++++++++++++----------------------=0D
 1 file changed, 15 insertions(+), 27 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


