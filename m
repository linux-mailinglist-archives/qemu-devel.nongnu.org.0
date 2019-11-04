Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0339DEDB45
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Nov 2019 10:08:40 +0100 (CET)
Received: from localhost ([::1]:58644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRYLm-0004Ei-QB
	for lists+qemu-devel@lfdr.de; Mon, 04 Nov 2019 04:08:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34736)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iRYHJ-0007MT-Px
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 04:04:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iRYHF-0002y6-AE
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 04:04:01 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:25338
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iRYHD-0002uu-Dc
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 04:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572858233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hsInyKxAekr/73cu9ypbm4mQK5co9xxqt+ZM3Emg74g=;
 b=Qj+9rnRjuZhZeSTHJ1KTvmEn3anWjE0vMvR51uyVGg2oi3Kwr/Wx1/qBnlUYU6jBtTK7XG
 UCCcDHCcsz88jJUqsKVzNFh3/wrBeeJsmKi+3hArgz5csFXXTXiL1oZzRN1bomDwbxjQgL
 Gp+G/TMT12OqKaQs3pxJNNh8/lZ1qik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-wC-yCm-TMY-w6f8cdh27DA-1; Mon, 04 Nov 2019 04:03:52 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A9278017E0;
 Mon,  4 Nov 2019 09:03:51 +0000 (UTC)
Received: from localhost (ovpn-117-85.ams2.redhat.com [10.36.117.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F160A60BF1;
 Mon,  4 Nov 2019 09:03:50 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 1/5] nvme: fix NSSRS offset in CAP register
Date: Mon,  4 Nov 2019 10:03:43 +0100
Message-Id: <20191104090347.27278-2-mreitz@redhat.com>
In-Reply-To: <20191104090347.27278-1-mreitz@redhat.com>
References: <20191104090347.27278-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: wC-yCm-TMY-w6f8cdh27DA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <its@irrelevant.dk>

Fix the offset of the NSSRS field the CAP register.

From NVME 1.4, section 3 ("Controller Registers"), subsection 3.1.1
("Offset 0h: CAP =E2=80=93 Controller Capabilities") CAP_NSSRS_SHIFT is bit=
 36,
not 33.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reported-by: Javier Gonzalez <javier.gonz@samsung.com>
Message-id: 20191023073315.446534-1-its@irrelevant.dk
Reviewed-by: John Snow <jsnow@redhat.com>
[mreitz: Added John's note on the location in the specification where
         this information can be found]
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/nvme.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index ab5943b90a..8fb941c653 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -23,7 +23,7 @@ enum NvmeCapShift {
     CAP_AMS_SHIFT      =3D 17,
     CAP_TO_SHIFT       =3D 24,
     CAP_DSTRD_SHIFT    =3D 32,
-    CAP_NSSRS_SHIFT    =3D 33,
+    CAP_NSSRS_SHIFT    =3D 36,
     CAP_CSS_SHIFT      =3D 37,
     CAP_MPSMIN_SHIFT   =3D 48,
     CAP_MPSMAX_SHIFT   =3D 52,
--=20
2.21.0


