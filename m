Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B69354C68F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 12:56:50 +0200 (CEST)
Received: from localhost ([::1]:60212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Qhd-00061E-3I
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 06:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1QdN-0003BG-PH
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 06:52:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1QdJ-0001x2-QC
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 06:52:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655290340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NrAwvBCYT029c5ubdiWv1r43fcVPYpoLg3lO5cQ/gIg=;
 b=GB4mxW2cEDwfTsjdZtB0APElkHV9FOYFKFT6beTGHYABIBOSxpZpJtXReFlgrORC9rj4jF
 Yir6p59tJ4zoJi61Ah+2pLvmwUnr58HudlMmLfTox2My4RLhapvtMK93PUfAbl1A0hl8ly
 O5Aa90ibwi4jnCTXZF5pFBLVxuhtTVA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-OaKTQSHHP9KXA05eWHKqqA-1; Wed, 15 Jun 2022 06:52:17 -0400
X-MC-Unique: OaKTQSHHP9KXA05eWHKqqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 208451C3E984;
 Wed, 15 Jun 2022 10:52:17 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BD1F111F5;
 Wed, 15 Jun 2022 10:52:13 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 0/4] softmmu: make qemu_find_file more flexible wrt build
 dir layout
Date: Wed, 15 Jun 2022 11:52:08 +0100
Message-Id: <20220615105212.780256-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qemu_find_file method impl is rather crude with a variety of=0D
problems (detailed in commit message of first patch).=0D
=0D
This series addresses those problems, making qemu_find_file=0D
much more flexible and able to be trivially extended to find=0D
any type of file, both in a (optionally relocated) install=0D
tree location and the local build tree.=0D
=0D
This is proposed as an alternative to=0D
=0D
  https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg02589.html=0D
=0D
avoiding the need to add many more meson rules to simulate=0D
results of 'make install' in the build dir.=0D
=0D
It has been tested as follows:=0D
=0D
  mkdir -p build/quick=0D
  cd build/quick=0D
  ./configure --target-list=3Dx86_64-softmmu --prefix=3D/usr=0D
  make -j 8 install DESTDIR=3D`pwd`/../vroot=0D
=0D
Now running from build dir:=0D
=0D
    $ ./build/local/qemu-system-x86_64 -vnc :1 -k fr -trace 'datadir*' -dis=
play sdl=0D
    datadir_init default data dir /home/berrange/src/virt/qemu/build/local/=
../share/qemu icon dir /home/berrange/src/virt/qemu/build/local/../share/ic=
ons helper dir /home/berrange/src/virt/qemu/build/local/../libexec in build=
 dir 1=0D
    datadir_load_file name bios-256k.bin location /home/berrange/src/virt/q=
emu/build/local/pc-bios/bios-256k.bin errno 0=0D
    datadir_load_file name bios-256k.bin location /home/berrange/src/virt/q=
emu/build/local/pc-bios/bios-256k.bin errno 0=0D
    datadir_load_file name kvmvapic.bin location /home/berrange/src/virt/qe=
mu/build/local/pc-bios/kvmvapic.bin errno 0=0D
    datadir_load_file name vgabios-stdvga.bin location /home/berrange/src/v=
irt/qemu/build/local/pc-bios/vgabios-stdvga.bin errno 0=0D
    datadir_load_file name efi-e1000.rom location /home/berrange/src/virt/q=
emu/build/local/pc-bios/efi-e1000.rom errno 0=0D
    datadir_load_file name 128x128/apps/qemu.png location /home/berrange/sr=
c/virt/qemu/build/local/ui/icons/128x128/apps/qemu.png errno 0=0D
    datadir_load_file name fr location /home/berrange/src/virt/qemu/build/l=
ocal/ui/keymaps/fr errno 0=0D
=0D
    $ ./build/local/qemu-system-x86_64 -vnc :1 -k fr -trace 'datadir*' -dis=
play sdl -net bridge=0D
    datadir_init default data dir /home/berrange/src/virt/qemu/build/local/=
../share/qemu icon dir /home/berrange/src/virt/qemu/build/local/../share/ic=
ons helper dir /home/berrange/src/virt/qemu/build/local/../libexec in build=
 dir 1=0D
    datadir_load_file name qemu-bridge-helper location /home/berrange/src/v=
irt/qemu/build/local/qemu-bridge-helper errno 0=0D
    Helper /home/berrange/src/virt/qemu/build/local/qemu-bridge-helper=0D
    access denied by acl file=0D
=0D
And running from the (relocated) install dir:=0D
=0D
    $ ./build/vroot/usr/bin/qemu-system-x86_64 -vnc :1 -k fr -trace 'datadi=
r*' -display sdl=0D
    datadir_init default data dir /home/berrange/src/virt/qemu/build/vroot/=
usr/bin/../share/qemu icon dir /home/berrange/src/virt/qemu/build/vroot/usr=
/bin/../share/icons helper dir /home/berrange/src/virt/qemu/build/vroot/usr=
/bin/../libexec in build dir 0=0D
    datadir_load_file name bios-256k.bin location /home/berrange/src/virt/q=
emu/build/vroot/usr/bin/../qemu-firmware/bios-256k.bin errno 2=0D
    datadir_load_file name bios-256k.bin location /home/berrange/src/virt/q=
emu/build/vroot/usr/bin/../share/qemu/bios-256k.bin errno 0=0D
    datadir_load_file name bios-256k.bin location /home/berrange/src/virt/q=
emu/build/vroot/usr/bin/../qemu-firmware/bios-256k.bin errno 2=0D
    datadir_load_file name bios-256k.bin location /home/berrange/src/virt/q=
emu/build/vroot/usr/bin/../share/qemu/bios-256k.bin errno 0=0D
    datadir_load_file name kvmvapic.bin location /home/berrange/src/virt/qe=
mu/build/vroot/usr/bin/../qemu-firmware/kvmvapic.bin errno 2=0D
    datadir_load_file name kvmvapic.bin location /home/berrange/src/virt/qe=
mu/build/vroot/usr/bin/../share/qemu/kvmvapic.bin errno 0=0D
    datadir_load_file name vgabios-stdvga.bin location /home/berrange/src/v=
irt/qemu/build/vroot/usr/bin/../qemu-firmware/vgabios-stdvga.bin errno 2=0D
    datadir_load_file name vgabios-stdvga.bin location /home/berrange/src/v=
irt/qemu/build/vroot/usr/bin/../share/qemu/vgabios-stdvga.bin errno 0=0D
    datadir_load_file name efi-e1000.rom location /home/berrange/src/virt/q=
emu/build/vroot/usr/bin/../qemu-firmware/efi-e1000.rom errno 2=0D
    datadir_load_file name efi-e1000.rom location /home/berrange/src/virt/q=
emu/build/vroot/usr/bin/../share/qemu/efi-e1000.rom errno 0=0D
    datadir_load_file name 128x128/apps/qemu.png location /home/berrange/sr=
c/virt/qemu/build/vroot/usr/bin/../share/icons/hicolor/128x128/apps/qemu.pn=
g errno 0=0D
    datadir_load_file name fr location /home/berrange/src/virt/qemu/build/v=
root/usr/bin/../share/qemu/keymaps/fr errno 0=0D
=0D
    $ ./build/vroot/usr/bin/qemu-system-x86_64 -vnc :1 -k fr -trace 'datadi=
r*' -display sdl -net bridge=0D
    datadir_init default data dir /home/berrange/src/virt/qemu/build/vroot/=
usr/bin/../share/qemu icon dir /home/berrange/src/virt/qemu/build/vroot/usr=
/bin/../share/icons helper dir /home/berrange/src/virt/qemu/build/vroot/usr=
/bin/../libexec in build dir 0=0D
    datadir_load_file name qemu-bridge-helper location /home/berrange/src/v=
irt/qemu/build/vroot/usr/bin/../libexec/qemu-bridge-helper errno 0=0D
    Helper /home/berrange/src/virt/qemu/build/vroot/usr/bin/../libexec/qemu=
-bridge-helper=0D
    access denied by acl file=0D
=0D
=0D
These trace messages show it searching the correct paths to find the=0D
files in both installed and build root cases.=0D
=0D
NB, I've been unable to actually test the cocoa.m change since I=0D
lack macOS.=0D
=0D
Daniel P. Berrang=C3=A9 (4):=0D
  softmmu: rewrite handling of qemu_find_file=0D
  ui: move 'pc-bios/keymaps' to 'ui/keymaps'=0D
  ui: find icons using qemu_find_file=0D
  net: convert to use qemu_find_file to locate bridge helper=0D
=0D
 configure                                     |   1 +=0D
 docs/conf.py                                  |   4 +-=0D
 include/net/net.h                             |   3 +-=0D
 include/qemu/datadir.h                        |   8 +-=0D
 net/tap.c                                     |   5 +-=0D
 pc-bios/meson.build                           |   1 -=0D
 qemu-options.hx                               |   4 +-=0D
 softmmu/datadir.c                             | 164 +++++++++++-------=0D
 softmmu/trace-events                          |   5 +-=0D
 softmmu/vl.c                                  |   2 +-=0D
 tests/qtest/fuzz/fuzz.c                       |   2 +-=0D
 ui/cocoa.m                                    |   3 +-=0D
 ui/gtk.c                                      |   3 +-=0D
 .../apps/qemu.png}                            | Bin=0D
 .../{qemu_16x16.png =3D> 16x16/apps/qemu.png}   | Bin=0D
 .../{qemu_24x24.png =3D> 24x24/apps/qemu.png}   | Bin=0D
 .../apps/qemu.png}                            | Bin=0D
 .../{qemu_32x32.bmp =3D> 32x32/apps/qemu.bmp}   | Bin=0D
 .../{qemu_32x32.png =3D> 32x32/apps/qemu.png}   | Bin=0D
 .../{qemu_48x48.png =3D> 48x48/apps/qemu.png}   | Bin=0D
 .../apps/qemu.png}                            | Bin=0D
 .../{qemu_64x64.png =3D> 64x64/apps/qemu.png}   | Bin=0D
 ui/icons/meson.build                          |  27 ++-=0D
 ui/icons/{ =3D> scalable/apps}/qemu.svg         |   0=0D
 {pc-bios =3D> ui}/keymaps/ar                    |   0=0D
 {pc-bios =3D> ui}/keymaps/bepo                  |   0=0D
 {pc-bios =3D> ui}/keymaps/cz                    |   0=0D
 {pc-bios =3D> ui}/keymaps/da                    |   0=0D
 {pc-bios =3D> ui}/keymaps/de                    |   0=0D
 {pc-bios =3D> ui}/keymaps/de-ch                 |   0=0D
 {pc-bios =3D> ui}/keymaps/en-gb                 |   0=0D
 {pc-bios =3D> ui}/keymaps/en-us                 |   0=0D
 {pc-bios =3D> ui}/keymaps/es                    |   0=0D
 {pc-bios =3D> ui}/keymaps/et                    |   0=0D
 {pc-bios =3D> ui}/keymaps/fi                    |   0=0D
 {pc-bios =3D> ui}/keymaps/fo                    |   0=0D
 {pc-bios =3D> ui}/keymaps/fr                    |   0=0D
 {pc-bios =3D> ui}/keymaps/fr-be                 |   0=0D
 {pc-bios =3D> ui}/keymaps/fr-ca                 |   0=0D
 {pc-bios =3D> ui}/keymaps/fr-ch                 |   0=0D
 {pc-bios =3D> ui}/keymaps/hr                    |   0=0D
 {pc-bios =3D> ui}/keymaps/hu                    |   0=0D
 {pc-bios =3D> ui}/keymaps/is                    |   0=0D
 {pc-bios =3D> ui}/keymaps/it                    |   0=0D
 {pc-bios =3D> ui}/keymaps/ja                    |   0=0D
 {pc-bios =3D> ui}/keymaps/lt                    |   0=0D
 {pc-bios =3D> ui}/keymaps/lv                    |   0=0D
 {pc-bios =3D> ui}/keymaps/meson.build           |   0=0D
 {pc-bios =3D> ui}/keymaps/mk                    |   0=0D
 {pc-bios =3D> ui}/keymaps/nl                    |   0=0D
 {pc-bios =3D> ui}/keymaps/no                    |   0=0D
 {pc-bios =3D> ui}/keymaps/pl                    |   0=0D
 {pc-bios =3D> ui}/keymaps/pt                    |   0=0D
 {pc-bios =3D> ui}/keymaps/pt-br                 |   0=0D
 {pc-bios =3D> ui}/keymaps/ru                    |   0=0D
 {pc-bios =3D> ui}/keymaps/sl                    |   0=0D
 {pc-bios =3D> ui}/keymaps/sv                    |   0=0D
 {pc-bios =3D> ui}/keymaps/th                    |   0=0D
 {pc-bios =3D> ui}/keymaps/tr                    |   0=0D
 ui/meson.build                                |   1 +=0D
 ui/sdl2.c                                     |   5 +-=0D
 61 files changed, 152 insertions(+), 86 deletions(-)=0D
 rename ui/icons/{qemu_128x128.png =3D> 128x128/apps/qemu.png} (100%)=0D
 rename ui/icons/{qemu_16x16.png =3D> 16x16/apps/qemu.png} (100%)=0D
 rename ui/icons/{qemu_24x24.png =3D> 24x24/apps/qemu.png} (100%)=0D
 rename ui/icons/{qemu_256x256.png =3D> 256x256/apps/qemu.png} (100%)=0D
 rename ui/icons/{qemu_32x32.bmp =3D> 32x32/apps/qemu.bmp} (100%)=0D
 rename ui/icons/{qemu_32x32.png =3D> 32x32/apps/qemu.png} (100%)=0D
 rename ui/icons/{qemu_48x48.png =3D> 48x48/apps/qemu.png} (100%)=0D
 rename ui/icons/{qemu_512x512.png =3D> 512x512/apps/qemu.png} (100%)=0D
 rename ui/icons/{qemu_64x64.png =3D> 64x64/apps/qemu.png} (100%)=0D
 rename ui/icons/{ =3D> scalable/apps}/qemu.svg (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/ar (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/bepo (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/cz (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/da (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/de (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/de-ch (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/en-gb (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/en-us (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/es (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/et (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/fi (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/fo (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/fr (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/fr-be (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/fr-ca (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/fr-ch (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/hr (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/hu (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/is (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/it (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/ja (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/lt (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/lv (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/meson.build (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/mk (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/nl (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/no (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/pl (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/pt (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/pt-br (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/ru (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/sl (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/sv (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/th (100%)=0D
 rename {pc-bios =3D> ui}/keymaps/tr (100%)=0D
=0D
-- =0D
2.36.1=0D
=0D


