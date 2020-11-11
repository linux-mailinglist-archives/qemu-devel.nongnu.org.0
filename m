Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311572AE93A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 07:50:30 +0100 (CET)
Received: from localhost ([::1]:45644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcjxc-0000UW-O1
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 01:50:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hhan@redhat.com>) id 1kcjwH-0008N0-Iz
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 01:49:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <hhan@redhat.com>) id 1kcjwF-0003oC-63
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 01:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605077341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dPiocdT4Eok7UlM3ngfAOXYIX54kaY55VIb7vIIprbA=;
 b=Avaw2ggjkC1XaKu9rXPI1dzB/mkmFuEAkK+7o5vS3WzndJy1h/TyFDTmLskguZncpt6fkC
 Dv+NZmu2PR4GLFXRaQofX7Rrzzzl7rhucysGY6yUQ4hvNRsNr8DNxO/tDUPBUBlgqQQcDw
 kIGPvC5RYvuTDBphXjNu3yho7vvDDsI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-ntwuhe1aMz6wBlOIn9LXjg-1; Wed, 11 Nov 2020 01:47:50 -0500
X-MC-Unique: ntwuhe1aMz6wBlOIn9LXjg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73BE3809DDB;
 Wed, 11 Nov 2020 06:47:49 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-135.pek2.redhat.com
 [10.72.13.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D327413C;
 Wed, 11 Nov 2020 06:47:46 +0000 (UTC)
From: Han Han <hhan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] dev-uas: Fix a error of variable sized type not at end
Date: Wed, 11 Nov 2020 14:47:37 +0800
Message-Id: <20201111064737.576673-1-hhan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hhan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hhan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org, laurent@vivier.eu, Han Han <hhan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the following error when compiling:

FAILED: libcommon.fa.p/hw_usb_dev-uas.c.o
clang -Ilibcommon.fa.p -I. -I.. -Iqapi -Itrace -Iui -Iui/shader -I/usr/incl=
ude/libusb-1.0 -I/usr/include/spice-1 -I/usr/include/spice-server -I/usr/in=
clude/cacard -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/i=
nclude/nss3 -I/usr/include/nspr4 -I/usr/include/libmount -I/usr/include/blk=
id -I/usr/include/pixman-1 -I/usr/include/vte-2.91 -I/usr/include/pango-1.0=
 -I/usr/include/harfbuzz -I/usr/include/freetype2 -I/usr/include/libpng16 -=
I/usr/include/fribidi -I/usr/include/libxml2 -I/usr/include/cairo -I/usr/in=
clude/gtk-3.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/gio-unix-2.0 -I/=
usr/include/atk-1.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/dbus-1.0 =
-I/usr/lib64/dbus-1.0/include -I/usr/include/at-spi-2.0 -I/usr/include/SDL2=
 -I/usr/include/slirp -I/usr/include/virgl -I/usr/include/capstone -Xclang =
-fcolor-diagnostics -pipe -Wall -Winvalid-pch -Werror -std=3Dgnu99 -O2 -g -=
fsanitize=3Dundefined -fsanitize=3Daddress -m64 -mcx16 -D_GNU_SOURCE -D_FIL=
E_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decl=
s -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-co=
mmon -fwrapv -Wold-style-definition -Wtype-limits -Wformat-security -Wforma=
t-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendi=
f-labels -Wexpansion-to-defined -Wno-initializer-overrides -Wno-missing-inc=
lude-dirs -Wno-shift-negative-value -Wno-string-plus-int -Wno-typedef-redef=
inition -Wno-tautological-type-limit-compare -Wno-psabi -fstack-protector-s=
trong -fsanitize=3Dfuzzer-no-link -isystem /home/hhan/Software/qemu/linux-h=
eaders -isystem linux-headers -iquote /home/hhan/Software/qemu/tcg/i386 -iq=
uote . -iquote /home/hhan/Software/qemu -iquote /home/hhan/Software/qemu/ac=
cel/tcg -iquote /home/hhan/Software/qemu/include -iquote /home/hhan/Softwar=
e/qemu/disas/libvixl -pthread -fPIC -DSTRUCT_IOVEC_DEFINED -D_REENTRANT -Wn=
o-undef -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=3D600 -DNCURSES_WIDECHAR -MD -MQ =
libcommon.fa.p/hw_usb_dev-uas.c.o -MF libcommon.fa.p/hw_usb_dev-uas.c.o.d -=
o libcommon.fa.p/hw_usb_dev-uas.c.o -c ../hw/usb/dev-uas.c
../hw/usb/dev-uas.c:158:31: error: field 'status' with variable sized type =
'uas_iu' not at the end of a struct or class is a GNU extension [-Werror,-W=
gnu-variable-sized-type-not-at-end]

Signed-off-by: Han Han <hhan@redhat.com>
---
 hw/usb/dev-uas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index cec071d96c..5ef3f4fec9 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -154,9 +154,9 @@ struct UASRequest {
=20
 struct UASStatus {
     uint32_t                  stream;
-    uas_iu                    status;
     uint32_t                  length;
     QTAILQ_ENTRY(UASStatus)   next;
+    uas_iu                    status;
 };
=20
 /* --------------------------------------------------------------------- *=
/
--=20
2.28.0


