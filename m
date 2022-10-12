Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BB55FC55C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 14:33:35 +0200 (CEST)
Received: from localhost ([::1]:57752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiavW-0002ct-R6
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 08:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oiaql-0005yC-Kc
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:28:39 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:33687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oiaqj-0000ln-30
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:28:39 -0400
Received: by mail-ej1-x636.google.com with SMTP id q9so33104167ejd.0
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 05:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudlinux.com; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1882Zwqnx9UsOatVCVkFLks6YCuscpGCGgUYAmeJbWk=;
 b=PZTNMuF1zhOWxSwY/q0vMjaISiuLT1Wu2e0N0YibUQ/08D/S8djQGg1oAoxz0i96Wr
 NqWApbZCY4zBEmBHazEftThwDylVkHIBfLfbrHfmPTSLGqXp+to9+2VzZrqdouhLw4pG
 FBd8ovJ13OLD9Xjm0Jx5CV5nSRwaa75q04pFwlWc604/FHr8qwcQ0hzMfhn4RY+90ync
 2tTwC4fHpUCTDnK+Pqy+yasgwZeKp/E4zVAam6w8MJ3Li3tJnIrCkieNrvm2QrqP0c8I
 BBkK3W66Fj8HyVgA116hm7vG/4VrifqBUCc+SJEQaLURPdxxWbJUTmhhKri38D6wlWcj
 r/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1882Zwqnx9UsOatVCVkFLks6YCuscpGCGgUYAmeJbWk=;
 b=MMKrZ/3eMwOt9wP0Cxsaob3qqhCP23uAApiar7T7azOGunV3M93ICKbqcf2k7l043q
 777GyxFtTRA6e5UN1Vx6dj4XOhBmgOl6wXtEf0oJgtuh4wyrvwhX5NzbC430bcTC2GD/
 ou7sijRvUyRUSt7s/lQPQSqnCGxXTFTNpjRelTGWHLWDJJP6/nPBGharOrnddHxOMCUY
 fD02egG4M6b8epbxeQpF9Jej774p69VU/eNAfZOJjINCAeG0nxlpYiDm6CXErG2JCBEi
 /QHRQqJ0746BxEpW2yN+YQ5LG0NRAD4CDNRna89jWBV9wETzkdzvZcnU8FhfUniF3qbt
 relg==
X-Gm-Message-State: ACrzQf3pZeZZ4zTehsSWJxpeTYSFAqx1/T5ttbFGe+5cwNOKA8Rk8GPp
 y8+v6L4+L2oEakbgomDoRDQYBX2Eaqa7HcLpnk15b0Jf+BCPJvyo
X-Google-Smtp-Source: AMsMyM7Aff3WYwXLT+LZlNLgMSMsl89Bxjd02VDVzwLKRMxfNeW+a1Nno0gplLYZxsfs/+xy0J0n3C8J2+F59XFI6vo=
X-Received: by 2002:a17:907:78a:b0:78d:9ac7:b697 with SMTP id
 xd10-20020a170907078a00b0078d9ac7b697mr16546962ejb.457.1665577714549; Wed, 12
 Oct 2022 05:28:34 -0700 (PDT)
MIME-Version: 1.0
From: Nikita Ivanov <nivanov@cloudlinux.com>
Date: Wed, 12 Oct 2022 15:28:23 +0300
Message-ID: <CAAJ4Ao-4+a4UtWKf0XyrQ6kQD8EsyDbn3H5O=R2DdzP76VSdZQ@mail.gmail.com>
Subject: [PATCH v2 1/2] Refactoring: refactor TFR() macro to RETRY_ON_EINTR()
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Greg Kurz <groug@kaod.org>, Jason Wang <jasowang@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="00000000000005a2a805ead588e6"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=nivanov@cloudlinux.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000005a2a805ead588e6
Content-Type: text/plain; charset="UTF-8"

Rename macro name to more transparent one and refactor
it to expression.

Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
---
 chardev/char-fd.c    | 2 +-
 chardev/char-pipe.c  | 8 +++++---
 include/qemu/osdep.h | 8 +++++++-
 net/tap-bsd.c        | 6 +++---
 net/tap-linux.c      | 2 +-
 net/tap-solaris.c    | 8 ++++----
 os-posix.c           | 2 +-
 7 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/chardev/char-fd.c b/chardev/char-fd.c
index cf78454841..d2c4923359 100644
--- a/chardev/char-fd.c
+++ b/chardev/char-fd.c
@@ -198,7 +198,7 @@ int qmp_chardev_open_file_source(char *src, int flags,
Error **errp)
 {
     int fd = -1;

-    TFR(fd = qemu_open_old(src, flags, 0666));
+    fd = RETRY_ON_EINTR(qemu_open_old(src, flags, 0666));
     if (fd == -1) {
         error_setg_file_open(errp, errno, src);
     }
diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
index 66d3b85091..5ad30bcc59 100644
--- a/chardev/char-pipe.c
+++ b/chardev/char-pipe.c
@@ -131,8 +131,8 @@ static void qemu_chr_open_pipe(Chardev *chr,

     filename_in = g_strdup_printf("%s.in", filename);
     filename_out = g_strdup_printf("%s.out", filename);
-    TFR(fd_in = qemu_open_old(filename_in, O_RDWR | O_BINARY));
-    TFR(fd_out = qemu_open_old(filename_out, O_RDWR | O_BINARY));
+    fd_in = RETRY_ON_EINTR(qemu_open_old(filename_in, O_RDWR | O_BINARY));
+    fd_out = RETRY_ON_EINTR(qemu_open_old(filename_out, O_RDWR |
O_BINARY));
     g_free(filename_in);
     g_free(filename_out);
     if (fd_in < 0 || fd_out < 0) {
@@ -142,7 +142,9 @@ static void qemu_chr_open_pipe(Chardev *chr,
         if (fd_out >= 0) {
             close(fd_out);
         }
-        TFR(fd_in = fd_out = qemu_open_old(filename, O_RDWR | O_BINARY));
+        fd_in = fd_out = RETRY_ON_EINTR(
+            qemu_open_old(filename, O_RDWR | O_BINARY)
+        );
         if (fd_in < 0) {
             error_setg_file_open(errp, errno, filename);
             return;
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index b1c161c035..a470905475 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -243,7 +243,13 @@ void QEMU_ERROR("code path is reachable")
 #define ESHUTDOWN 4099
 #endif

-#define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
+#define RETRY_ON_EINTR(expr) \
+    (__extension__                                          \
+        ({ typeof(expr) __result;                               \
+           do {                                             \
+                __result = (typeof(expr)) (expr);         \
+           } while (__result == -1L && errno == EINTR);     \
+           __result; }))

 /* time_t may be either 32 or 64 bits depending on the host OS, and
  * can be either signed or unsigned, so we can't just hardcode a
diff --git a/net/tap-bsd.c b/net/tap-bsd.c
index 005ce05c6e..4c98fdd337 100644
--- a/net/tap-bsd.c
+++ b/net/tap-bsd.c
@@ -56,7 +56,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
         } else {
             snprintf(dname, sizeof dname, "/dev/tap%d", i);
         }
-        TFR(fd = open(dname, O_RDWR));
+        fd = RETRY_ON_EINTR(open(dname, O_RDWR));
         if (fd >= 0) {
             break;
         }
@@ -111,7 +111,7 @@ static int tap_open_clone(char *ifname, int
ifname_size, Error **errp)
     int fd, s, ret;
     struct ifreq ifr;

-    TFR(fd = open(PATH_NET_TAP, O_RDWR));
+    fd = RETRY_ON_EINTR(open(PATH_NET_TAP, O_RDWR));
     if (fd < 0) {
         error_setg_errno(errp, errno, "could not open %s", PATH_NET_TAP);
         return -1;
@@ -159,7 +159,7 @@ int tap_open(char *ifname, int ifname_size, int
*vnet_hdr,
     if (ifname[0] != '\0') {
         char dname[100];
         snprintf(dname, sizeof dname, "/dev/%s", ifname);
-        TFR(fd = open(dname, O_RDWR));
+        fd = RETRY_ON_EINTR(open(dname, O_RDWR));
         if (fd < 0 && errno != ENOENT) {
             error_setg_errno(errp, errno, "could not open %s", dname);
             return -1;
diff --git a/net/tap-linux.c b/net/tap-linux.c
index 304ff45071..f54f308d35 100644
--- a/net/tap-linux.c
+++ b/net/tap-linux.c
@@ -45,7 +45,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
     int len = sizeof(struct virtio_net_hdr);
     unsigned int features;

-    TFR(fd = open(PATH_NET_TUN, O_RDWR));
+    fd = RETRY_ON_EINTR(open(PATH_NET_TUN, O_RDWR));
     if (fd < 0) {
         error_setg_errno(errp, errno, "could not open %s", PATH_NET_TUN);
         return -1;
diff --git a/net/tap-solaris.c b/net/tap-solaris.c
index a44f8805c2..38e15028bf 100644
--- a/net/tap-solaris.c
+++ b/net/tap-solaris.c
@@ -84,13 +84,13 @@ static int tap_alloc(char *dev, size_t dev_size, Error
**errp)
     if( ip_fd )
        close(ip_fd);

-    TFR(ip_fd = open("/dev/udp", O_RDWR, 0));
+    ip_fd = RETRY_ON_EINTR(open("/dev/udp", O_RDWR, 0));
     if (ip_fd < 0) {
         error_setg(errp, "Can't open /dev/ip (actually /dev/udp)");
         return -1;
     }

-    TFR(tap_fd = open("/dev/tap", O_RDWR, 0));
+    tap_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
     if (tap_fd < 0) {
         error_setg(errp, "Can't open /dev/tap");
         return -1;
@@ -104,7 +104,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error
**errp)
     if ((ppa = ioctl (tap_fd, I_STR, &strioc_ppa)) < 0)
         error_report("Can't assign new interface");

-    TFR(if_fd = open("/dev/tap", O_RDWR, 0));
+    if_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
     if (if_fd < 0) {
         error_setg(errp, "Can't open /dev/tap (2)");
         return -1;
@@ -137,7 +137,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error
**errp)
     if (ioctl (ip_fd, I_PUSH, "arp") < 0)
         error_report("Can't push ARP module (3)");
     /* Open arp_fd */
-    TFR(arp_fd = open ("/dev/tap", O_RDWR, 0));
+    arp_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
     if (arp_fd < 0)
         error_report("Can't open %s", "/dev/tap");

diff --git a/os-posix.c b/os-posix.c
index 321fc4bd13..bb27f67bac 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -266,7 +266,7 @@ void os_setup_post(void)
             error_report("not able to chdir to /: %s", strerror(errno));
             exit(1);
         }
-        TFR(fd = qemu_open_old("/dev/null", O_RDWR));
+        fd = RETRY_ON_EINTR(qemu_open_old("/dev/null", O_RDWR));
         if (fd == -1) {
             exit(1);
         }
--
2.37.3
-- 
Best Regards,
*Nikita Ivanov* | C developer
*Telephone:* +79140870696
*Telephone:* +79015053149

--00000000000005a2a805ead588e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Rename macro name to more transparent one and refactor<br>=
it to expression.<br><br>Signed-off-by: Nikita Ivanov &lt;<a href=3D"mailto=
:nivanov@cloudlinux.com">nivanov@cloudlinux.com</a>&gt;<br>---<br>=C2=A0cha=
rdev/char-fd.c =C2=A0 =C2=A0| 2 +-<br>=C2=A0chardev/char-pipe.c =C2=A0| 8 +=
++++---<br>=C2=A0include/qemu/osdep.h | 8 +++++++-<br>=C2=A0net/tap-bsd.c =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br>=C2=A0net/tap-linux.c =C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>=C2=A0net/tap-solaris.c =C2=A0 =C2=A0| 8 ++++----<br>=
=C2=A0os-posix.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>=C2=A07 files=
 changed, 22 insertions(+), 14 deletions(-)<br><br>diff --git a/chardev/cha=
r-fd.c b/chardev/char-fd.c<br>index cf78454841..d2c4923359 100644<br>--- a/=
chardev/char-fd.c<br>+++ b/chardev/char-fd.c<br>@@ -198,7 +198,7 @@ int qmp=
_chardev_open_file_source(char *src, int flags, Error **errp)<br>=C2=A0{<br=
>=C2=A0 =C2=A0 =C2=A0int fd =3D -1;<br><br>- =C2=A0 =C2=A0TFR(fd =3D qemu_o=
pen_old(src, flags, 0666));<br>+ =C2=A0 =C2=A0fd =3D RETRY_ON_EINTR(qemu_op=
en_old(src, flags, 0666));<br>=C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_file_open(errp, errno, src);<b=
r>=C2=A0 =C2=A0 =C2=A0}<br>diff --git a/chardev/char-pipe.c b/chardev/char-=
pipe.c<br>index 66d3b85091..5ad30bcc59 100644<br>--- a/chardev/char-pipe.c<=
br>+++ b/chardev/char-pipe.c<br>@@ -131,8 +131,8 @@ static void qemu_chr_op=
en_pipe(Chardev *chr,<br><br>=C2=A0 =C2=A0 =C2=A0filename_in =3D g_strdup_p=
rintf(&quot;%<a href=3D"http://s.in">s.in</a>&quot;, filename);<br>=C2=A0 =
=C2=A0 =C2=A0filename_out =3D g_strdup_printf(&quot;%s.out&quot;, filename)=
;<br>- =C2=A0 =C2=A0TFR(fd_in =3D qemu_open_old(filename_in, O_RDWR | O_BIN=
ARY));<br>- =C2=A0 =C2=A0TFR(fd_out =3D qemu_open_old(filename_out, O_RDWR =
| O_BINARY));<br>+ =C2=A0 =C2=A0fd_in =3D RETRY_ON_EINTR(qemu_open_old(file=
name_in, O_RDWR | O_BINARY));<br>+ =C2=A0 =C2=A0fd_out =3D RETRY_ON_EINTR(q=
emu_open_old(filename_out, O_RDWR | O_BINARY));<br>=C2=A0 =C2=A0 =C2=A0g_fr=
ee(filename_in);<br>=C2=A0 =C2=A0 =C2=A0g_free(filename_out);<br>=C2=A0 =C2=
=A0 =C2=A0if (fd_in &lt; 0 || fd_out &lt; 0) {<br>@@ -142,7 +142,9 @@ stati=
c void qemu_chr_open_pipe(Chardev *chr,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (fd_out &gt;=3D 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0close(fd_out);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>- =C2=A0 =C2=A0=
 =C2=A0 =C2=A0TFR(fd_in =3D fd_out =3D qemu_open_old(filename, O_RDWR | O_B=
INARY));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fd_in =3D fd_out =3D RETRY_ON_EINT=
R(<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_open_old(filename, O_=
RDWR | O_BINARY)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0);<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (fd_in &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0error_setg_file_open(errp, errno, filename);<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>diff --git a/include/qemu/osdep.h=
 b/include/qemu/osdep.h<br>index b1c161c035..a470905475 100644<br>--- a/inc=
lude/qemu/osdep.h<br>+++ b/include/qemu/osdep.h<br>@@ -243,7 +243,13 @@ voi=
d QEMU_ERROR(&quot;code path is reachable&quot;)<br>=C2=A0#define ESHUTDOWN=
 4099<br>=C2=A0#endif<br><br>-#define TFR(expr) do { if ((expr) !=3D -1) br=
eak; } while (errno =3D=3D EINTR)<br>+#define RETRY_ON_EINTR(expr) \<br>+ =
=C2=A0 =C2=A0(__extension__ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0({ typeof(expr=
) __result; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 do { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0__result =3D (typeof(expr)) (expr); =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } while (__result =3D=3D -1L &amp;=
&amp; errno =3D=3D EINTR); =C2=A0 =C2=A0 \<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __result; }))<br><br>=C2=A0/* time_t may be either 32 or 64 bits de=
pending on the host OS, and<br>=C2=A0 * can be either signed or unsigned, s=
o we can&#39;t just hardcode a<br>diff --git a/net/tap-bsd.c b/net/tap-bsd.=
c<br>index 005ce05c6e..4c98fdd337 100644<br>--- a/net/tap-bsd.c<br>+++ b/ne=
t/tap-bsd.c<br>@@ -56,7 +56,7 @@ int tap_open(char *ifname, int ifname_size=
, int *vnet_hdr,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(dname, sizeof dname, &quo=
t;/dev/tap%d&quot;, i);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0TFR(fd =3D open(dname, O_RDWR));<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fd =3D RETRY_ON_EINTR(open(dname, O_RDWR));<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (fd &gt;=3D 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>@@ -111,7 +11=
1,7 @@ static int tap_open_clone(char *ifname, int ifname_size, Error **err=
p)<br>=C2=A0 =C2=A0 =C2=A0int fd, s, ret;<br>=C2=A0 =C2=A0 =C2=A0struct ifr=
eq ifr;<br><br>- =C2=A0 =C2=A0TFR(fd =3D open(PATH_NET_TAP, O_RDWR));<br>+ =
=C2=A0 =C2=A0fd =3D RETRY_ON_EINTR(open(PATH_NET_TAP, O_RDWR));<br>=C2=A0 =
=C2=A0 =C2=A0if (fd &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_se=
tg_errno(errp, errno, &quot;could not open %s&quot;, PATH_NET_TAP);<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>@@ -159,7 +159,7 @@ int tap_op=
en(char *ifname, int ifname_size, int *vnet_hdr,<br>=C2=A0 =C2=A0 =C2=A0if =
(ifname[0] !=3D &#39;\0&#39;) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char d=
name[100];<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(dname, sizeof dnam=
e, &quot;/dev/%s&quot;, ifname);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(fd =3D=
 open(dname, O_RDWR));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D RETRY_ON_EINT=
R(open(dname, O_RDWR));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &lt; 0 =
&amp;&amp; errno !=3D ENOENT) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0error_setg_errno(errp, errno, &quot;could not open %s&quot;, dnam=
e);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>diff -=
-git a/net/tap-linux.c b/net/tap-linux.c<br>index 304ff45071..f54f308d35 10=
0644<br>--- a/net/tap-linux.c<br>+++ b/net/tap-linux.c<br>@@ -45,7 +45,7 @@=
 int tap_open(char *ifname, int ifname_size, int *vnet_hdr,<br>=C2=A0 =C2=
=A0 =C2=A0int len =3D sizeof(struct virtio_net_hdr);<br>=C2=A0 =C2=A0 =C2=
=A0unsigned int features;<br><br>- =C2=A0 =C2=A0TFR(fd =3D open(PATH_NET_TU=
N, O_RDWR));<br>+ =C2=A0 =C2=A0fd =3D RETRY_ON_EINTR(open(PATH_NET_TUN, O_R=
DWR));<br>=C2=A0 =C2=A0 =C2=A0if (fd &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0error_setg_errno(errp, errno, &quot;could not open %s&quot;, PATH=
_NET_TUN);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>diff --git a/=
net/tap-solaris.c b/net/tap-solaris.c<br>index a44f8805c2..38e15028bf 10064=
4<br>--- a/net/tap-solaris.c<br>+++ b/net/tap-solaris.c<br>@@ -84,13 +84,13=
 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)<br>=C2=
=A0 =C2=A0 =C2=A0if( ip_fd )<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(ip_fd);<b=
r><br>- =C2=A0 =C2=A0TFR(ip_fd =3D open(&quot;/dev/udp&quot;, O_RDWR, 0));<=
br>+ =C2=A0 =C2=A0ip_fd =3D RETRY_ON_EINTR(open(&quot;/dev/udp&quot;, O_RDW=
R, 0));<br>=C2=A0 =C2=A0 =C2=A0if (ip_fd &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0error_setg(errp, &quot;Can&#39;t open /dev/ip (actually /dev/u=
dp)&quot;);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>=C2=A0 =C2=
=A0 =C2=A0}<br><br>- =C2=A0 =C2=A0TFR(tap_fd =3D open(&quot;/dev/tap&quot;,=
 O_RDWR, 0));<br>+ =C2=A0 =C2=A0tap_fd =3D RETRY_ON_EINTR(open(&quot;/dev/t=
ap&quot;, O_RDWR, 0));<br>=C2=A0 =C2=A0 =C2=A0if (tap_fd &lt; 0) {<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Can&#39;t open /dev/t=
ap&quot;);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>@@ -104,7 +10=
4,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)<br>=
=C2=A0 =C2=A0 =C2=A0if ((ppa =3D ioctl (tap_fd, I_STR, &amp;strioc_ppa)) &l=
t; 0)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;Can&#39;t ass=
ign new interface&quot;);<br><br>- =C2=A0 =C2=A0TFR(if_fd =3D open(&quot;/d=
ev/tap&quot;, O_RDWR, 0));<br>+ =C2=A0 =C2=A0if_fd =3D RETRY_ON_EINTR(open(=
&quot;/dev/tap&quot;, O_RDWR, 0));<br>=C2=A0 =C2=A0 =C2=A0if (if_fd &lt; 0)=
 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Can&#39;t op=
en /dev/tap (2)&quot;);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>=
@@ -137,7 +137,7 @@ static int tap_alloc(char *dev, size_t dev_size, Error =
**errp)<br>=C2=A0 =C2=A0 =C2=A0if (ioctl (ip_fd, I_PUSH, &quot;arp&quot;) &=
lt; 0)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;Can&#39;t pu=
sh ARP module (3)&quot;);<br>=C2=A0 =C2=A0 =C2=A0/* Open arp_fd */<br>- =C2=
=A0 =C2=A0TFR(arp_fd =3D open (&quot;/dev/tap&quot;, O_RDWR, 0));<br>+ =C2=
=A0 =C2=A0arp_fd =3D RETRY_ON_EINTR(open(&quot;/dev/tap&quot;, O_RDWR, 0));=
<br>=C2=A0 =C2=A0 =C2=A0if (arp_fd &lt; 0)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0error_report(&quot;Can&#39;t open %s&quot;, &quot;/dev/tap&quot;);<br=
><br>diff --git a/os-posix.c b/os-posix.c<br>index 321fc4bd13..bb27f67bac 1=
00644<br>--- a/os-posix.c<br>+++ b/os-posix.c<br>@@ -266,7 +266,7 @@ void o=
s_setup_post(void)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error=
_report(&quot;not able to chdir to /: %s&quot;, strerror(errno));<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(fd =3D qemu_open_old(&qu=
ot;/dev/null&quot;, O_RDWR));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D RETRY_=
ON_EINTR(qemu_open_old(&quot;/dev/null&quot;, O_RDWR));<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0exit(1);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>--<br>2=
.37.3<br>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">Best Regards,<div><b>Nikita Ivanov</b=
> | C developer</div><div><b>Telephone:</b> +79140870696<br></div><div><div=
><b>Telephone:</b>=C2=A0+79015053149</div></div></div></div></div>

--00000000000005a2a805ead588e6--

