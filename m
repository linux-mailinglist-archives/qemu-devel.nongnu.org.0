Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FDD2615C1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 18:56:03 +0200 (CEST)
Received: from localhost ([::1]:37742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFguY-0007id-B1
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 12:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kFgta-0006cg-NA
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 12:55:02 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34532
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kFgtX-000486-Vk
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 12:55:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599584098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xChAJfksluoJ4gGGMqRpilMygrKMPZ8vHyLA+0pd1Sw=;
 b=QCeuF4citZ+BKKC92Ob57Xs2YjOAZ5h4a6yPwUryp9gZqdCPSN7ogZDhqDlxiSShyzNsk0
 M/+BAZ/fgn1uWHRYqbm3Q+y9aJdMD/eEXq2DR/ho9PBKGul+7A6LZRaGqWZyKu8Fm9ZPo7
 ilbDbBUbphrqajMem6B4LSCzj8YAUbQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-uBnZ8_0KPP6qOi23pDsHDQ-1; Tue, 08 Sep 2020 12:54:54 -0400
X-MC-Unique: uBnZ8_0KPP6qOi23pDsHDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF9B7CD003;
 Tue,  8 Sep 2020 16:54:50 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-154.ams2.redhat.com
 [10.36.113.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A01A60C0F;
 Tue,  8 Sep 2020 16:54:39 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] Add support for loading SMBIOS OEM strings from a file
Date: Tue,  8 Sep 2020 17:54:33 +0100
Message-Id: <20200908165438.1008942-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:08:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I previously added support for SMBIOS OEM strings tables but only=0D
allowed for data to be passed inline. Potential users indicated they=0D
wanted to pass some quite large data blobs which is inconvenient todo=0D
inline. Thus I'm adding support for passing the data from a file.=0D
=0D
In testing this I discovered the hard way that on x86 we're limited to=0D
using the SMBIOS 2.1 entry point currently. This has a maximum size of=0D
0xffff, and if you exceed this all sorts of wierd behaviour happens.=0D
=0D
QEMU forces SMBIOS 2.1 on x86 because the default SeaBIOS firmware does=0D
not support SMBIOS 3.0. The EDK2 firmware supports SMBIOS 3.0 and QEMU=0D
defaults to this on the ARM virt machine type.=0D
=0D
This series adds support for checking the SMBIOS 2.1 limits to protect=0D
users from impossible to diagnose problems.=0D
=0D
There is also a fix needed to SeaBIOS which fails to check for=0D
integer overflow when it appends the type 0 table.=0D
=0D
  https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/3EMI=
OY=3D=0D
6YS6MG5UQN3JJJS2A3DJZOVFR6/=0D
=0D
IIUC, SMBIOS 3.0 should onlky be limited by what you can fit into RAM,=0D
but in testing, EDK2 appears to hang shortly after the SMBIOS 3.0 data=0D
size exceeds 128 KB. I've not spotted an obvious flaw in EDK2 or QEMU,=0D
nor do I attempt to enforce a limit in QEMU for SMBIOS 3.0.=0D
=0D
The 4th and 5th patches are what I used to test x86 machine types with=0D
EDK2 support for SMBIOS 3.0.  I'm ambivalent on whether we really need=0D
them or not, but it does feel desirable to have parity of features=0D
between x86 and ARM when using SMBIOS with EDK2.=0D
=0D
Daniel P. Berrang=3DC3=3DA9 (5):=0D
  hw/smbios: support loading OEM strings values from a file=0D
  hw/smbios: report error if table size is too large=0D
  qemu-options: document SMBIOS type 11 settings=0D
  hw/smbios: use qapi for SMBIOS entry point type enum=0D
  hw/i386: expose a "smbios_ep" PC machine property=0D
=0D
 hw/arm/virt.c                |  2 +-=0D
 hw/i386/pc.c                 | 26 ++++++++++=0D
 hw/i386/pc_piix.c            |  2 +-=0D
 hw/i386/pc_q35.c             |  2 +-=0D
 hw/smbios/smbios.c           | 93 +++++++++++++++++++++++++++++-------=0D
 include/hw/firmware/smbios.h |  9 +---=0D
 include/hw/i386/pc.h         |  3 ++=0D
 qapi/machine.json            | 12 +++++=0D
 qemu-options.hx              | 41 ++++++++++++++++=0D
 9 files changed, 164 insertions(+), 26 deletions(-)=0D
=0D
--=3D20=0D
2.26.2=0D
=0D


