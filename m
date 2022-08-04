Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82701589CFD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 15:43:28 +0200 (CEST)
Received: from localhost ([::1]:44990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJb8I-00043D-Cw
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 09:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oJVEe-0004wd-Gt
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:25:37 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:42534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oJVEb-0002dv-6N
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:25:35 -0400
Received: by mail-ed1-x531.google.com with SMTP id m8so24147981edd.9
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 00:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudlinux.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=EB2gY2OKNZotM9bDmROhMc+jvwEmK3M2FM1i0qFZJjA=;
 b=h0wQtkwCuYRSIGJrEAfFV+/sQGu94EnxkgIvg3veYkON5hl27qhgvgUC/Kxh/OIpKT
 HSc+58MDShr2rHoAzZfkztjQ41ph4GWry78NK+h46PxOP7HIF/PhqtNTx/L4oi/MKxRC
 VTIx9Z4mJxRzSgFRY6pXA9lgJTAtnK21sm2Wq0eS50F7A/Lt4gUEDRv4RqBTQj+btnPV
 iTd5rVwYU4i/3w/4/B3chQ47FNidVAPWQE0i1A/t4XqhMplOd6Z2mnd9tElgSfVYwowx
 kORLBM7ysFVgeEbxKwzug/fytZPuHBGxkDGv9em+Q7Dga9xfKbycTewnF4mzSlfJqWKO
 qtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=EB2gY2OKNZotM9bDmROhMc+jvwEmK3M2FM1i0qFZJjA=;
 b=unv2hWlMSaplPkEchEqgmQdlQL0uqBuMxzABHOt6Et2LlqgQ7kMWlcBO3qixUFmPni
 HLoY7u27F5O+DFoCXiDC+ZyR5ajW8glpiO/dbbsjDuity2nTj8Bt5mfyUyPNICmGLmO7
 H+iD0pqNPWz/TCb1H06uK+MEG4dCe8e9Rku7NEGqvHwNOFyAjctlCWvxt/ZrqifMQi4g
 v8e6gkpjPRM+HWN+zSwKiwDoyM3nX44gcBO2jJLV8Y7zO/ihvSelGHiwGcQQ8hIg4WSh
 WDy6yRA1V3z4fuWx9X68pJVK+0PGi4JqjpNLmtKPEUdF0TJNyoxfkecoxwnV3VhPFjdg
 pa9Q==
X-Gm-Message-State: ACgBeo2BdtAhDxx95ydwVLj7h/bC0NFwnZ/80hc0n3ONtk+Kge2tP9Zd
 xGbqszXV8MUGR724IpehDe/+McbGK2RBDqo8CBb5THc8YsUFwJESovM=
X-Google-Smtp-Source: AA6agR5XraAxPEQ7ueLqj1L8wrlyLlg+i/g/D7ogmKX2P4HAjXFDg11In08EetsJdy25BY8uqa2wr5T1NfzzG9oiNEY=
X-Received: by 2002:a05:6402:42cb:b0:43d:bf29:cf89 with SMTP id
 i11-20020a05640242cb00b0043dbf29cf89mr663986edc.400.1659597928856; Thu, 04
 Aug 2022 00:25:28 -0700 (PDT)
MIME-Version: 1.0
From: Nikita Ivanov <nivanov@cloudlinux.com>
Date: Thu, 4 Aug 2022 10:25:17 +0300
Message-ID: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
Subject: [PATCH] error handling: Use TFR() macro where applicable
To: qemu-devel@nongnu.org
Cc: Nikita Ivanov <nivanov@cloudlinux.com>, Greg Kurz <groug@kaod.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Jason Wang <jasowang@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000005141705e5654188"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=nivanov@cloudlinux.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 04 Aug 2022 09:33:20 -0400
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

--00000000000005141705e5654188
Content-Type: text/plain; charset="UTF-8"

From 0ceb04ada1ed5a863914f4449469d7572d3443ed Mon Sep 17 00:00:00 2001
From: Nikita Ivanov <nivanov@cloudlinux.com>
Date: Wed, 3 Aug 2022 12:54:00 +0300
Subject: [PATCH] error handling: Use TFR() macro where applicable

There is a defined TFR() macro in qemu/osdep.h which
handles the same while loop.
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/415

Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
---
 hw/9pfs/9p-local.c   |  8 ++------
 net/l2tpv3.c         | 15 +++------------
 net/tap.c            |  8 ++------
 qga/commands-posix.c |  4 +---
 util/main-loop.c     |  4 +---
 util/osdep.c         |  4 +---
 6 files changed, 10 insertions(+), 33 deletions(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index d42ce6d8b8..c90ab947ba 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -470,9 +470,7 @@ static ssize_t local_readlink(FsContext *fs_ctx,
V9fsPath *fs_path,
         if (fd == -1) {
             return -1;
         }
-        do {
-            tsize = read(fd, (void *)buf, bufsz);
-        } while (tsize == -1 && errno == EINTR);
+        TFR(tsize = read(fd, (void *)buf, bufsz));
         close_preserve_errno(fd);
     } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
                (fs_ctx->export_flags & V9FS_SM_NONE)) {
@@ -908,9 +906,7 @@ static int local_symlink(FsContext *fs_ctx, const char
*oldpath,
         }
         /* Write the oldpath (target) to the file. */
         oldpath_size = strlen(oldpath);
-        do {
-            write_size = write(fd, (void *)oldpath, oldpath_size);
-        } while (write_size == -1 && errno == EINTR);
+        TFR(write_size = write(fd, (void *)oldpath, oldpath_size));
         close_preserve_errno(fd);

         if (write_size != oldpath_size) {
diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index af373e5c30..adfdbdb84c 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -240,9 +240,7 @@ static ssize_t
net_l2tpv3_receive_dgram_iov(NetClientState *nc,
     message.msg_control = NULL;
     message.msg_controllen = 0;
     message.msg_flags = 0;
-    do {
-        ret = sendmsg(s->fd, &message, 0);
-    } while ((ret == -1) && (errno == EINTR));
+    TFR(ret = sendmsg(s->fd, &message, 0));
     if (ret > 0) {
         ret -= s->offset;
     } else if (ret == 0) {
@@ -285,9 +283,7 @@ static ssize_t net_l2tpv3_receive_dgram(NetClientState
*nc,
     message.msg_control = NULL;
     message.msg_controllen = 0;
     message.msg_flags = 0;
-    do {
-        ret = sendmsg(s->fd, &message, 0);
-    } while ((ret == -1) && (errno == EINTR));
+    TFR(ret = sendmsg(s->fd, &message, 0));
     if (ret > 0) {
         ret -= s->offset;
     } else if (ret == 0) {
@@ -434,12 +430,7 @@ static void net_l2tpv3_send(void *opaque)

     msgvec = s->msgvec + s->queue_head;
     if (target_count > 0) {
-        do {
-            count = recvmmsg(
-                s->fd,
-                msgvec,
-                target_count, MSG_DONTWAIT, NULL);
-        } while ((count == -1) && (errno == EINTR));
+        TFR(count = recvmmsg(s->fd, msgvec, target_count, MSG_DONTWAIT,
NULL));
         if (count < 0) {
             /* Recv error - we still need to flush packets here,
              * (re)set queue head to current position
diff --git a/net/tap.c b/net/tap.c
index b3ddfd4a74..b047eca8b5 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -102,9 +102,7 @@ static ssize_t tap_write_packet(TAPState *s, const
struct iovec *iov, int iovcnt
 {
     ssize_t len;

-    do {
-        len = writev(s->fd, iov, iovcnt);
-    } while (len == -1 && errno == EINTR);
+    TFR(len = writev(s->fd, iov, iovcnt));

     if (len == -1 && errno == EAGAIN) {
         tap_write_poll(s, true);
@@ -577,9 +575,7 @@ static int net_bridge_run_helper(const char *helper,
const char *bridge,

         close(sv[1]);

-        do {
-            fd = recv_fd(sv[0]);
-        } while (fd == -1 && errno == EINTR);
+        TFR(fd = recv_fd(sv[0]));
         saved_errno = errno;

         close(sv[0]);
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 954efed01b..90f83aa9b6 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -68,9 +68,7 @@ static void ga_wait_child(pid_t pid, int *status, Error
**errp)

     *status = 0;

-    do {
-        rpid = waitpid(pid, status, 0);
-    } while (rpid == -1 && errno == EINTR);
+    TFR(rpid = waitpid(pid, status, 0));

     if (rpid == -1) {
         error_setg_errno(errp, errno, "failed to wait for child (pid: %d)",
diff --git a/util/main-loop.c b/util/main-loop.c
index f00a25451b..58e14db2d4 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -64,9 +64,7 @@ static void sigfd_handler(void *opaque)
     ssize_t len;

     while (1) {
-        do {
-            len = read(fd, &info, sizeof(info));
-        } while (len == -1 && errno == EINTR);
+        TFR(len = read(fd, &info, sizeof(info)));

         if (len == -1 && errno == EAGAIN) {
             break;
diff --git a/util/osdep.c b/util/osdep.c
index 60fcbbaebe..d35c473ac7 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -244,9 +244,7 @@ static int qemu_lock_fcntl(int fd, int64_t start,
int64_t len, int fl_type)
         .l_type   = fl_type,
     };
     qemu_probe_lock_ops();
-    do {
-        ret = fcntl(fd, fcntl_op_setlk, &fl);
-    } while (ret == -1 && errno == EINTR);
+    TFR(ret = fcntl(fd, fcntl_op_setlk, &fl));
     return ret == -1 ? -errno : 0;
 }

-- 
2.37.1

--00000000000005141705e5654188
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From 0ceb04ada1ed5a863914f4449469d7572d3443ed Mon Sep 17 0=
0:00:00 2001<br>From: Nikita Ivanov &lt;<a href=3D"mailto:nivanov@cloudlinu=
x.com">nivanov@cloudlinux.com</a>&gt;<br>Date: Wed, 3 Aug 2022 12:54:00 +03=
00<br>Subject: [PATCH] error handling: Use TFR() macro where applicable<br>=
<br>There is a defined TFR() macro in qemu/osdep.h which<br>handles the sam=
e while loop.<br>Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/=
-/issues/415">https://gitlab.com/qemu-project/qemu/-/issues/415</a><br><br>=
Signed-off-by: Nikita Ivanov &lt;<a href=3D"mailto:nivanov@cloudlinux.com">=
nivanov@cloudlinux.com</a>&gt;<br>---<br>=C2=A0hw/9pfs/9p-local.c =C2=A0 | =
=C2=A08 ++------<br>=C2=A0net/l2tpv3.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 15 +++=
------------<br>=C2=A0net/tap.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A08 ++------<br>=C2=A0qga/commands-posix.c | =C2=A04 +---<br>=C2=A0util=
/main-loop.c =C2=A0 =C2=A0 | =C2=A04 +---<br>=C2=A0util/osdep.c =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A04 +---<br>=C2=A06 files changed, 10 insertions(+)=
, 33 deletions(-)<br><br>diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local=
.c<br>index d42ce6d8b8..c90ab947ba 100644<br>--- a/hw/9pfs/9p-local.c<br>++=
+ b/hw/9pfs/9p-local.c<br>@@ -470,9 +470,7 @@ static ssize_t local_readlink=
(FsContext *fs_ctx, V9fsPath *fs_path,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (fd =3D=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn -1;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tsize =3D read(fd,=
 (void *)buf, bufsz);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0} while (tsize =3D=3D=
 -1 &amp;&amp; errno =3D=3D EINTR);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(tsi=
ze =3D read(fd, (void *)buf, bufsz));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
close_preserve_errno(fd);<br>=C2=A0 =C2=A0 =C2=A0} else if ((fs_ctx-&gt;exp=
ort_flags &amp; V9FS_SM_PASSTHROUGH) ||<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (fs_ctx-&gt;export_flags &amp; V9FS_SM_NONE)) {<br=
>@@ -908,9 +906,7 @@ static int local_symlink(FsContext *fs_ctx, const char=
 *oldpath,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* Write the oldpath (target) to the file. */<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0oldpath_size =3D strlen(oldpath);<br>- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_size =
=3D write(fd, (void *)oldpath, oldpath_size);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0} while (write_size =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0TFR(write_size =3D write(fd, (void *)oldpath, oldpa=
th_size));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close_preserve_errno(fd);<b=
r>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (write_size !=3D oldpath_s=
ize) {<br>diff --git a/net/l2tpv3.c b/net/l2tpv3.c<br>index af373e5c30..adf=
dbdb84c 100644<br>--- a/net/l2tpv3.c<br>+++ b/net/l2tpv3.c<br>@@ -240,9 +24=
0,7 @@ static ssize_t net_l2tpv3_receive_dgram_iov(NetClientState *nc,<br>=
=C2=A0 =C2=A0 =C2=A0message.msg_control =3D NULL;<br>=C2=A0 =C2=A0 =C2=A0me=
ssage.msg_controllen =3D 0;<br>=C2=A0 =C2=A0 =C2=A0message.msg_flags =3D 0;=
<br>- =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D sendmsg(s-&=
gt;fd, &amp;message, 0);<br>- =C2=A0 =C2=A0} while ((ret =3D=3D -1) &amp;&a=
mp; (errno =3D=3D EINTR));<br>+ =C2=A0 =C2=A0TFR(ret =3D sendmsg(s-&gt;fd, =
&amp;message, 0));<br>=C2=A0 =C2=A0 =C2=A0if (ret &gt; 0) {<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ret -=3D s-&gt;offset;<br>=C2=A0 =C2=A0 =C2=A0} els=
e if (ret =3D=3D 0) {<br>@@ -285,9 +283,7 @@ static ssize_t net_l2tpv3_rece=
ive_dgram(NetClientState *nc,<br>=C2=A0 =C2=A0 =C2=A0message.msg_control =
=3D NULL;<br>=C2=A0 =C2=A0 =C2=A0message.msg_controllen =3D 0;<br>=C2=A0 =
=C2=A0 =C2=A0message.msg_flags =3D 0;<br>- =C2=A0 =C2=A0do {<br>- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ret =3D sendmsg(s-&gt;fd, &amp;message, 0);<br>- =C2=A0=
 =C2=A0} while ((ret =3D=3D -1) &amp;&amp; (errno =3D=3D EINTR));<br>+ =C2=
=A0 =C2=A0TFR(ret =3D sendmsg(s-&gt;fd, &amp;message, 0));<br>=C2=A0 =C2=A0=
 =C2=A0if (ret &gt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret -=3D s-&g=
t;offset;<br>=C2=A0 =C2=A0 =C2=A0} else if (ret =3D=3D 0) {<br>@@ -434,12 +=
430,7 @@ static void net_l2tpv3_send(void *opaque)<br>=C2=A0<br>=C2=A0 =C2=
=A0 =C2=A0msgvec =3D s-&gt;msgvec + s-&gt;queue_head;<br>=C2=A0 =C2=A0 =C2=
=A0if (target_count &gt; 0) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>- =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0count =3D recvmmsg(<br>- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;fd,<br>- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msgvec,<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_count, MSG_DONTWAIT, NULL);<br>- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0} while ((count =3D=3D -1) &amp;&amp; (errno =3D=
=3D EINTR));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(count =3D recvmmsg(s-&gt;f=
d, msgvec, target_count, MSG_DONTWAIT, NULL));<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (count &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* Recv error - we still need to flush packets here,<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * (re)set queue head to current positio=
n<br>diff --git a/net/tap.c b/net/tap.c<br>index b3ddfd4a74..b047eca8b5 100=
644<br>--- a/net/tap.c<br>+++ b/net/tap.c<br>@@ -102,9 +102,7 @@ static ssi=
ze_t tap_write_packet(TAPState *s, const struct iovec *iov, int iovcnt<br>=
=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0ssize_t len;<br>=C2=A0<br>- =C2=A0 =C2=A0do =
{<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D writev(s-&gt;fd, iov, iovcnt);<br=
>- =C2=A0 =C2=A0} while (len =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<br>+=
 =C2=A0 =C2=A0TFR(len =3D writev(s-&gt;fd, iov, iovcnt));<br>=C2=A0<br>=C2=
=A0 =C2=A0 =C2=A0if (len =3D=3D -1 &amp;&amp; errno =3D=3D EAGAIN) {<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tap_write_poll(s, true);<br>@@ -577,9 +575,7=
 @@ static int net_bridge_run_helper(const char *helper, const char *bridge=
,<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(sv[1]);<br>=C2=A0<br=
>- =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fd =3D recv_fd(sv[0]);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0} while (fd =
=3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0T=
FR(fd =3D recv_fd(sv[0]));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0saved_errno=
 =3D errno;<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(sv[0]);<br=
>diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>index 954efed0=
1b..90f83aa9b6 100644<br>--- a/qga/commands-posix.c<br>+++ b/qga/commands-p=
osix.c<br>@@ -68,9 +68,7 @@ static void ga_wait_child(pid_t pid, int *statu=
s, Error **errp)<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0*status =3D 0;<br>=C2=A0<=
br>- =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0rpid =3D waitpid(pid=
, status, 0);<br>- =C2=A0 =C2=A0} while (rpid =3D=3D -1 &amp;&amp; errno =
=3D=3D EINTR);<br>+ =C2=A0 =C2=A0TFR(rpid =3D waitpid(pid, status, 0));<br>=
=C2=A0<br>=C2=A0 =C2=A0 =C2=A0if (rpid =3D=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0error_setg_errno(errp, errno, &quot;failed to wait for child =
(pid: %d)&quot;,<br>diff --git a/util/main-loop.c b/util/main-loop.c<br>ind=
ex f00a25451b..58e14db2d4 100644<br>--- a/util/main-loop.c<br>+++ b/util/ma=
in-loop.c<br>@@ -64,9 +64,7 @@ static void sigfd_handler(void *opaque)<br>=
=C2=A0 =C2=A0 =C2=A0ssize_t len;<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0while (1)=
 {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0len =3D read(fd, &amp;info, sizeof(info));<br>- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0} while (len =3D=3D -1 &amp;&amp; errno =3D=3D EINTR);<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(len =3D read(fd, &amp;info, sizeof(info)));<=
br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (len =3D=3D -1 &amp;&amp;=
 errno =3D=3D EAGAIN) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
break;<br>diff --git a/util/osdep.c b/util/osdep.c<br>index 60fcbbaebe..d35=
c473ac7 100644<br>--- a/util/osdep.c<br>+++ b/util/osdep.c<br>@@ -244,9 +24=
4,7 @@ static int qemu_lock_fcntl(int fd, int64_t start, int64_t len, int f=
l_type)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.l_type =C2=A0 =3D fl_type,<br=
>=C2=A0 =C2=A0 =C2=A0};<br>=C2=A0 =C2=A0 =C2=A0qemu_probe_lock_ops();<br>- =
=C2=A0 =C2=A0do {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D fcntl(fd, fcntl_o=
p_setlk, &amp;fl);<br>- =C2=A0 =C2=A0} while (ret =3D=3D -1 &amp;&amp; errn=
o =3D=3D EINTR);<br>+ =C2=A0 =C2=A0TFR(ret =3D fcntl(fd, fcntl_op_setlk, &a=
mp;fl));<br>=C2=A0 =C2=A0 =C2=A0return ret =3D=3D -1 ? -errno : 0;<br>=C2=
=A0}<br>=C2=A0<br>-- <br>2.37.1</div>

--00000000000005141705e5654188--

