Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB60E12DAF3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Dec 2019 19:37:18 +0100 (CET)
Received: from localhost ([::1]:45372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imMOL-00048w-8R
	for lists+qemu-devel@lfdr.de; Tue, 31 Dec 2019 13:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43964)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1imMKS-00080Q-55
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 13:33:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1imMKR-000096-3D
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 13:33:16 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:39336
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1imMKQ-000075-VN
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 13:33:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577817194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=suRJMyDa4aeB+jIH8Xme7rpKL09yPd7NjRFWjqk8R0k=;
 b=gIms6YX9gxNVp83oD0A1y0Uk/bLX4NE3P4dvxhfWWciWKZzl4RUFI0guVmtuTM+0hMFg2w
 g6KQXUfeJFQqcPg47JUrX7SZC1K21xmsGkUP3cXHTz04/oEQPANgteqI4lLYaExzvlHxXj
 FbgaybODBCoNGOFp5LfrGXeqi0EVnpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-xjLcmU8XPSWJP53R_Jzlsw-1; Tue, 31 Dec 2019 13:33:13 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C644DB20;
 Tue, 31 Dec 2019 18:33:11 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-30.ams2.redhat.com [10.36.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F92167673;
 Tue, 31 Dec 2019 18:32:59 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 04/14] hw/i386: Restrict fw_cfg to the PC machines
Date: Tue, 31 Dec 2019 19:32:06 +0100
Message-Id: <20191231183216.6781-5-philmd@redhat.com>
In-Reply-To: <20191231183216.6781-1-philmd@redhat.com>
References: <20191231183216.6781-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: xjLcmU8XPSWJP53R_Jzlsw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only the PC-based machines use the fw_cfg device. In particular,
the MicroVM machine does not use it. Only compile/link it when
machines require it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Sergio Lopez <slp@redhat.com>
---
 hw/i386/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
index 6ebb6d0cf0..48f2693546 100644
--- a/hw/i386/Makefile.objs
+++ b/hw/i386/Makefile.objs
@@ -5,7 +5,7 @@ obj-$(CONFIG_PC) +=3D pc.o pc_sysfw.o
 obj-$(CONFIG_I440FX) +=3D pc_piix.o
 obj-$(CONFIG_Q35) +=3D pc_q35.o
 obj-$(CONFIG_MICROVM) +=3D microvm.o
-obj-y +=3D fw_cfg.o
+obj-$(CONFIG_PC) +=3D fw_cfg.o
 obj-$(CONFIG_X86_IOMMU) +=3D x86-iommu.o
 obj-$(CONFIG_VTD) +=3D intel_iommu.o
 obj-$(CONFIG_AMD_IOMMU) +=3D amd_iommu.o
--=20
2.21.0


