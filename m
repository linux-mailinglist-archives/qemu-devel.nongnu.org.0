Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC392DA200
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 21:53:32 +0100 (CET)
Received: from localhost ([::1]:51846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kouqZ-0000o9-Hk
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 15:53:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kount-0006GD-1d
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:50:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kounq-0001er-Or
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:50:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607979039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e8s0qM6SVULiVakZ+lFdI424N9CKza+D/1TsLuhzs68=;
 b=HRZqDRFQMCsDcBV/VeRolcLVyrIzoo31566u6gobvRniLSZpSa2EF88FQfVP5CtXA61sUz
 3oPaaLcTEcA821DwhdrvAMiZxJHhs8Tm96TJjmjKixiI9XlI8i66lNB2OJDKpmGdh3d4AJ
 aOUe9bgVkeDavsmRnvpe6xqSwKZ6kBI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-_zrDCkvEOv65EhIZL6k0Fw-1; Mon, 14 Dec 2020 15:50:36 -0500
X-MC-Unique: _zrDCkvEOv65EhIZL6k0Fw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7506190A7A0;
 Mon, 14 Dec 2020 20:50:34 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E58760BE2;
 Mon, 14 Dec 2020 20:50:31 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] pc: Support configuration of SMBIOS entry point type
Date: Mon, 14 Dec 2020 15:50:26 -0500
Message-Id: <20201214205029.2991222-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes code previously submitted[1] by Daniel P. Berrang=C3=A9=0D
to add a "smbios-ep" machine property on PC.=0D
=0D
SMBIOS 3.0 is necessary to support more than ~720 VCPUs, as a=0D
large number of VCPUs can easily hit the table size limit of=0D
SMBIOS 2.1 entry points.=0D
=0D
[1] https://lore.kernel.org/qemu-devel/20200908165438.1008942-5-berrange@re=
dhat.com=0D
    https://lore.kernel.org/qemu-devel/20200908165438.1008942-6-berrange@re=
dhat.com=0D
=0D
Daniel P. Berrang=C3=A9 (1):=0D
  hw/i386: expose a "smbios-ep" PC machine property=0D
=0D
Eduardo Habkost (2):=0D
  smbios: Rename SMBIOS_ENTRY_POINT_* enums=0D
  hw/smbios: Use qapi for SmbiosEntryPointType=0D
=0D
 qapi/qapi-schema.json        |  1 +=0D
 qapi/smbios.json             | 11 +++++++++++=0D
 include/hw/firmware/smbios.h | 10 ++--------=0D
 include/hw/i386/pc.h         |  3 +++=0D
 hw/arm/virt.c                |  2 +-=0D
 hw/i386/pc.c                 | 26 ++++++++++++++++++++++++++=0D
 hw/i386/pc_piix.c            |  2 +-=0D
 hw/i386/pc_q35.c             |  2 +-=0D
 hw/smbios/smbios.c           |  8 ++++----=0D
 qapi/meson.build             |  1 +=0D
 10 files changed, 51 insertions(+), 15 deletions(-)=0D
 create mode 100644 qapi/smbios.json=0D
=0D
--=20=0D
2.28.0=0D
=0D


