Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829F312EB04
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jan 2020 22:04:53 +0100 (CET)
Received: from localhost ([::1]:45634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1in7eG-0006Bx-Hr
	for lists+qemu-devel@lfdr.de; Thu, 02 Jan 2020 16:04:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55253)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1in7bn-0004OV-St
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 16:02:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1in7bm-00027b-Pb
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 16:02:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34250
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1in7bm-00026U-KZ
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 16:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577998938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=49WrcwhgmLKeNLSi0Xl/yoFIFoNOEA1ECXOFvggs1PA=;
 b=LcBmQn7Nm05I/zPQMuVciwztBsufjTfr9B/Zz/MdXmZ+9xxAcxrTHpvBVOQ3zJsC4jNLiN
 dKAsj1nt7OHumwqpDNTwSUa/n85yJrXIvLPGIl43FC9ohdUSu4tmhUID6Ehen9EoUru//0
 gnCbHIf6oiMsrJWnW34Q3Han9uU/YL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-4wXuRmGlPDieiwhuJO-nGg-1; Thu, 02 Jan 2020 16:02:17 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 389E018C8C01;
 Thu,  2 Jan 2020 21:02:16 +0000 (UTC)
Received: from localhost (ovpn-112-20.ams2.redhat.com [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A25947BF80;
 Thu,  2 Jan 2020 21:02:11 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] tpm-ppi: page-align PPI RAM
Date: Fri,  3 Jan 2020 01:01:49 +0400
Message-Id: <20200102210149.926077-3-marcandre.lureau@redhat.com>
In-Reply-To: <20200102210149.926077-1-marcandre.lureau@redhat.com>
References: <20200102210149.926077-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 4wXuRmGlPDieiwhuJO-nGg-1
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-stable@nongnu.org, Stefan Berger <stefanb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

post-copy migration fails on destination with error such as:
2019-12-26T10:22:44.714644Z qemu-kvm: ram_block_discard_range:
Unaligned start address: 0x559d2afae9a0

Use qemu_memalign() to constrain the PPI RAM memory alignment.

Cc: qemu-stable@nongnu.org
Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/tpm/tpm_ppi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/tpm/tpm_ppi.c b/hw/tpm/tpm_ppi.c
index ff314592b4..6d9c1a3e40 100644
--- a/hw/tpm/tpm_ppi.c
+++ b/hw/tpm/tpm_ppi.c
@@ -43,7 +43,8 @@ void tpm_ppi_reset(TPMPPI *tpmppi)
 void tpm_ppi_init(TPMPPI *tpmppi, struct MemoryRegion *m,
                   hwaddr addr, Object *obj)
 {
-    tpmppi->buf =3D g_malloc0(HOST_PAGE_ALIGN(TPM_PPI_ADDR_SIZE));
+    tpmppi->buf =3D qemu_memalign(qemu_real_host_page_size,
+                                HOST_PAGE_ALIGN(TPM_PPI_ADDR_SIZE));
     memory_region_init_ram_device_ptr(&tpmppi->ram, obj, "tpm-ppi",
                                       TPM_PPI_ADDR_SIZE, tpmppi->buf);
     vmstate_register_ram(&tpmppi->ram, DEVICE(obj));
--=20
2.24.0.308.g228f53135a


