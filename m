Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF3627568E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 12:43:26 +0200 (CEST)
Received: from localhost ([::1]:44832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL2FB-0000cj-UQ
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 06:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kL2DC-000837-LN
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 06:41:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kL2DA-0006wr-Ob
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 06:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600857679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9Qijfm6XLcC2OCXAPlPFsmW1AdwbUaETxOTIW7t1nOA=;
 b=FS0jKURo7SP73qoA2QvWHDL91BmBv2Pdzbkm++MI/Iag6UuJ8njg+hJ+rYfVXG7gx7wBEL
 R4+gVKd2CVunXG/hKik1p4avp2rpRBgm+KMx19GMw5wdx6OjOM7Diq/Yv3RNGP75vg6iKl
 48O6eYsYNV2BJZaX0QVqWSKaLUPbqpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-Ajj-12TjO-Ckm2jh-Nbo2g-1; Wed, 23 Sep 2020 06:41:16 -0400
X-MC-Unique: Ajj-12TjO-Ckm2jh-Nbo2g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFAA764091;
 Wed, 23 Sep 2020 10:41:14 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-73.ams2.redhat.com
 [10.36.114.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F9DE1002382;
 Wed, 23 Sep 2020 10:41:03 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] Add support for loading SMBIOS OEM strings from a file
Date: Wed, 23 Sep 2020 11:40:59 +0100
Message-Id: <20200923104102.2068416-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Richard Henderson <rth@twiddle.net>
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
IIUC, SMBIOS 3.0 should only be limited by what you can fit into RAM,=0D
but in testing, EDK2 appears to hang shortly after the SMBIOS 3.0 data=0D
size exceeds 128 KB. I've not spotted an obvious flaw in EDK2 or QEMU,=0D
nor do I attempt to enforce a limit in QEMU for SMBIOS 3.0.=0D
=0D
Changed in v2:=0D
=0D
 - Drop the patches that allowed choice of SMBIOS 2.1 / 3.0 entry=0D
   point. There's no compelling reason to need 3.0 on x86 while=0D
   aarch64 is 3.0 only.=0D
=0D
Daniel P. Berrang=3DC3=3DA9 (3):=0D
  hw/smbios: support loading OEM strings values from a file=0D
  hw/smbios: report error if table size is too large=0D
  qemu-options: document SMBIOS type 11 settings=0D
=0D
 hw/smbios/smbios.c | 86 +++++++++++++++++++++++++++++++++++++++-------=0D
 qemu-options.hx    | 41 ++++++++++++++++++++++=0D
 2 files changed, 114 insertions(+), 13 deletions(-)=0D
=0D
--=3D20=0D
2.26.2=0D
=0D


