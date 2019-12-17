Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B981233A8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 18:36:55 +0100 (CET)
Received: from localhost ([::1]:44222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihGmE-0003dY-8y
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 12:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45988)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihGkF-0001Sf-Kf
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 12:34:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihGkE-000827-Kc
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 12:34:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44522
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihGkE-000812-Gw
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 12:34:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576604089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nO8L9Ff0gTs0Ghul9qOGY/vgywrMy48c7WRyGNxm0bk=;
 b=EOhYqfoxAYGrhWZIvpRW5Shdf8tIoiM5hT15Uz+IkVkBhGH168zm9s6XuxGoUCg4gerSiR
 ckYyJGOGs+ykh2rKOTEzOOqZxygV3vpKShNzlDE0tNQoRZjvo2Qp/y7YP0h1u9lB3lAoag
 C5LfyaczIMV+OTT0sNRj3lrIQUmH0q8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-DndLY13tOwGjhVK3iHR_uQ-1; Tue, 17 Dec 2019 12:34:48 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54908100551A;
 Tue, 17 Dec 2019 17:34:46 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B89226DC6;
 Tue, 17 Dec 2019 17:34:31 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] Fix more GCC9 -O3 warnings
Date: Tue, 17 Dec 2019 18:34:19 +0100
Message-Id: <20191217173425.5082-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: DndLY13tOwGjhVK3iHR_uQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Hannes Reinecke <hare@suse.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Reitz <mreitz@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?= <dirty.ice.hu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix some trivial warnings when building with -O3.

Philippe Mathieu-Daud=C3=A9 (6):
  audio/audio: Add missing fall through comment
  hw/display/tcx: Add missing fall through comments
  hw/net/imx_fec: Rewrite fall through comments
  hw/timer/aspeed_timer: Add a fall through comment
  hw/scsi/megasas: Silent GCC9 duplicated-cond warning
  qemu-io-cmds: Silent GCC9 format-overflow warning

 audio/audio.c           | 1 +
 hw/display/tcx.c        | 2 ++
 hw/net/imx_fec.c        | 8 +++++---
 hw/scsi/megasas.c       | 3 ++-
 hw/timer/aspeed_timer.c | 2 +-
 qemu-io-cmds.c          | 1 +
 6 files changed, 12 insertions(+), 5 deletions(-)

--=20
2.21.0


