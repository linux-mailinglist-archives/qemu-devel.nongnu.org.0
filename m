Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37058432E4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 08:15:06 +0200 (CEST)
Received: from localhost ([::1]:37114 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbJ0q-0000gh-Hv
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 02:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32993)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ptoscano@redhat.com>) id 1hbIz0-0008Lt-0q
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 02:13:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ptoscano@redhat.com>) id 1hbIxe-0005UB-1B
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 02:11:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57800)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ptoscano@redhat.com>)
 id 1hbIxZ-0005QB-5i; Thu, 13 Jun 2019 02:11:41 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3F2F130860AE;
 Thu, 13 Jun 2019 06:11:39 +0000 (UTC)
Received: from lindworm.usersys.redhat.com (ovpn-200-20.brq.redhat.com
 [10.40.200.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 740E41001B2B;
 Thu, 13 Jun 2019 06:11:30 +0000 (UTC)
From: Pino Toscano <ptoscano@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Thu, 13 Jun 2019 08:11:25 +0200
Message-Id: <20190613061125.31131-1-ptoscano@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 13 Jun 2019 06:11:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v8] ssh: switch from libssh2 to libssh
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
Cc: kwolf@redhat.com, ptoscano@redhat.com, philmd@redhat.com, rjones@redhat.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rewrite the implementation of the ssh block driver to use libssh instead
of libssh2.  The libssh library has various advantages over libssh2:
- easier API for authentication (for example for using ssh-agent)
- easier API for known_hosts handling
- supports newer types of keys in known_hosts

Use APIs/features available in libssh 0.8 conditionally, to support
older versions (which are not recommended though).

Adjust the various Docker/Travis scripts to use libssh when available
instead of libssh2.

Signed-off-by: Pino Toscano <ptoscano@redhat.com>
---

Changes from v7:
- #if HAVE_LIBSSH_0_8 -> #ifdef HAVE_LIBSSH_0_8
- ptrdiff_t -> size_t

Changes from v6:
- fixed few checkpatch style issues
- detect libssh 0.8 via symbol detection
- adjust travis/docker test material
- remove dead "default" case in a switch
- use variables for storing MIN() results
- adapt a documentation bit

Changes from v5:
- adapt to newer tracing APIs
- disable ssh compression (mimic what libssh2 does by default)
- use build time checks for libssh 0.8, and use newer APIs directly

Changes from v4:
- fix wrong usages of error_setg/session_error_setg/sftp_error_setg
- fix few return code checks
- remove now-unused parameters in few internal functions
- allow authentication with "none" method
- switch to unsigned int for the port number
- enable TCP_NODELAY on the socket
- fix one reference error message in iotest 207

Changes from v3:
- fix socket cleanup in connect_to_ssh()
- add comments about the socket cleanup
- improve the error reporting (closer to what was with libssh2)
- improve EOF detection on sftp_read()

Changes from v2:
- used again an own fd
- fixed co_yield() implementation

Changes from v1:
- fixed jumbo packets writing
- fixed missing 'err' assignment
- fixed commit message

 .travis.yml                                   |   4 +-
 block/Makefile.objs                           |   6 +-
 block/ssh.c                                   | 622 +++++++++---------
 block/trace-events                            |  14 +-
 configure                                     |  65 +-
 docs/qemu-block-drivers.texi                  |   2 +-
 .../dockerfiles/debian-win32-cross.docker     |   1 -
 .../dockerfiles/debian-win64-cross.docker     |   1 -
 tests/docker/dockerfiles/fedora.docker        |   4 +-
 tests/docker/dockerfiles/ubuntu.docker        |   2 +-
 tests/docker/dockerfiles/ubuntu1804.docker    |   2 +-
 tests/qemu-iotests/207.out                    |   2 +-
 12 files changed, 374 insertions(+), 351 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index a08a7b7278..c70dd055ed 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -31,7 +31,7 @@ addons:
       - libseccomp-dev
       - libspice-protocol-dev
       - libspice-server-dev
-      - libssh2-1-dev
+      - libssh-dev
       - liburcu-dev
       - libusb-1.0-0-dev
       - libvte-2.91-dev
@@ -261,7 +261,7 @@ matrix:
             - libseccomp-dev
             - libspice-protocol-dev
             - libspice-server-dev
-            - libssh2-1-dev
+            - libssh-dev
             - liburcu-dev
             - libusb-1.0-0-dev
             - libvte-2.91-dev
diff --git a/block/Makefile.objs b/block/Makefile.objs
index ae11605c9f..bf01429dd5 100644
--- a/block/Makefile.objs
+++ b/block/Makefile.objs
@@ -31,7 +31,7 @@ block-obj-$(CONFIG_CURL) +=3D curl.o
 block-obj-$(CONFIG_RBD) +=3D rbd.o
 block-obj-$(CONFIG_GLUSTERFS) +=3D gluster.o
 block-obj-$(CONFIG_VXHS) +=3D vxhs.o
-block-obj-$(CONFIG_LIBSSH2) +=3D ssh.o
+block-obj-$(CONFIG_LIBSSH) +=3D ssh.o
 block-obj-y +=3D accounting.o dirty-bitmap.o
 block-obj-y +=3D write-threshold.o
 block-obj-y +=3D backup.o
@@ -52,8 +52,8 @@ rbd.o-libs         :=3D $(RBD_LIBS)
 gluster.o-cflags   :=3D $(GLUSTERFS_CFLAGS)
 gluster.o-libs     :=3D $(GLUSTERFS_LIBS)
 vxhs.o-libs        :=3D $(VXHS_LIBS)
-ssh.o-cflags       :=3D $(LIBSSH2_CFLAGS)
-ssh.o-libs         :=3D $(LIBSSH2_LIBS)
+ssh.o-cflags       :=3D $(LIBSSH_CFLAGS)
+ssh.o-libs         :=3D $(LIBSSH_LIBS)
 block-obj-dmg-bz2-$(CONFIG_BZIP2) +=3D dmg-bz2.o
 block-obj-$(if $(CONFIG_DMG),m,n) +=3D $(block-obj-dmg-bz2-y)
 dmg-bz2.o-libs     :=3D $(BZIP2_LIBS)
diff --git a/block/ssh.c b/block/ssh.c
index 6da7b9cbfe..fb458d4548 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -24,8 +24,8 @@
=20
 #include "qemu/osdep.h"
=20
-#include <libssh2.h>
-#include <libssh2_sftp.h>
+#include <libssh/libssh.h>
+#include <libssh/sftp.h>
=20
 #include "block/block_int.h"
 #include "block/qdict.h"
@@ -46,13 +46,11 @@
 #include "trace.h"
=20
 /*
- * TRACE_LIBSSH2=3D<bitmask> enables tracing in libssh2 itself.  Note
- * that this requires that libssh2 was specially compiled with the
- * `./configure --enable-debug' option, so most likely you will have
- * to compile it yourself.  The meaning of <bitmask> is described
- * here: http://www.libssh2.org/libssh2_trace.html
+ * TRACE_LIBSSH=3D<level> enables tracing in libssh itself.
+ * The meaning of <level> is described here:
+ * http://api.libssh.org/master/group__libssh__log.html
  */
-#define TRACE_LIBSSH2 0 /* or try: LIBSSH2_TRACE_SFTP */
+#define TRACE_LIBSSH  0 /* see: SSH_LOG_* */
=20
 typedef struct BDRVSSHState {
     /* Coroutine. */
@@ -60,18 +58,15 @@ typedef struct BDRVSSHState {
=20
     /* SSH connection. */
     int sock;                         /* socket */
-    LIBSSH2_SESSION *session;         /* ssh session */
-    LIBSSH2_SFTP *sftp;               /* sftp session */
-    LIBSSH2_SFTP_HANDLE *sftp_handle; /* sftp remote file handle */
+    ssh_session session;              /* ssh session */
+    sftp_session sftp;                /* sftp session */
+    sftp_file sftp_handle;            /* sftp remote file handle */
=20
-    /* See ssh_seek() function below. */
-    int64_t offset;
-    bool offset_op_read;
-
-    /* File attributes at open.  We try to keep the .filesize field
+    /*
+     * File attributes at open.  We try to keep the .size field
      * updated if it changes (eg by writing at the end of the file).
      */
-    LIBSSH2_SFTP_ATTRIBUTES attrs;
+    sftp_attributes attrs;
=20
     InetSocketAddress *inet;
=20
@@ -91,7 +86,6 @@ static void ssh_state_init(BDRVSSHState *s)
 {
     memset(s, 0, sizeof *s);
     s->sock =3D -1;
-    s->offset =3D -1;
     qemu_co_mutex_init(&s->lock);
 }
=20
@@ -99,20 +93,18 @@ static void ssh_state_free(BDRVSSHState *s)
 {
     g_free(s->user);
=20
+    if (s->attrs) {
+        sftp_attributes_free(s->attrs);
+    }
     if (s->sftp_handle) {
-        libssh2_sftp_close(s->sftp_handle);
+        sftp_close(s->sftp_handle);
     }
     if (s->sftp) {
-        libssh2_sftp_shutdown(s->sftp);
+        sftp_free(s->sftp);
     }
     if (s->session) {
-        libssh2_session_disconnect(s->session,
-                                   "from qemu ssh client: "
-                                   "user closed the connection");
-        libssh2_session_free(s->session);
-    }
-    if (s->sock >=3D 0) {
-        close(s->sock);
+        ssh_disconnect(s->session);
+        ssh_free(s->session); /* This frees s->sock */
     }
 }
=20
@@ -127,13 +119,13 @@ session_error_setg(Error **errp, BDRVSSHState *s, c=
onst char *fs, ...)
     va_end(args);
=20
     if (s->session) {
-        char *ssh_err;
+        const char *ssh_err;
         int ssh_err_code;
=20
-        /* This is not an errno.  See <libssh2.h>. */
-        ssh_err_code =3D libssh2_session_last_error(s->session,
-                                                  &ssh_err, NULL, 0);
-        error_setg(errp, "%s: %s (libssh2 error code: %d)",
+        /* This is not an errno.  See <libssh/libssh.h>. */
+        ssh_err =3D ssh_get_error(s->session);
+        ssh_err_code =3D ssh_get_error_code(s->session);
+        error_setg(errp, "%s: %s (libssh error code: %d)",
                    msg, ssh_err, ssh_err_code);
     } else {
         error_setg(errp, "%s", msg);
@@ -152,18 +144,18 @@ sftp_error_setg(Error **errp, BDRVSSHState *s, cons=
t char *fs, ...)
     va_end(args);
=20
     if (s->sftp) {
-        char *ssh_err;
+        const char *ssh_err;
         int ssh_err_code;
-        unsigned long sftp_err_code;
+        int sftp_err_code;
=20
-        /* This is not an errno.  See <libssh2.h>. */
-        ssh_err_code =3D libssh2_session_last_error(s->session,
-                                                  &ssh_err, NULL, 0);
-        /* See <libssh2_sftp.h>. */
-        sftp_err_code =3D libssh2_sftp_last_error((s)->sftp);
+        /* This is not an errno.  See <libssh/libssh.h>. */
+        ssh_err =3D ssh_get_error(s->session);
+        ssh_err_code =3D ssh_get_error_code(s->session);
+        /* See <libssh/sftp.h>. */
+        sftp_err_code =3D sftp_get_error(s->sftp);
=20
         error_setg(errp,
-                   "%s: %s (libssh2 error code: %d, sftp error code: %lu=
)",
+                   "%s: %s (libssh error code: %d, sftp error code: %d)"=
,
                    msg, ssh_err, ssh_err_code, sftp_err_code);
     } else {
         error_setg(errp, "%s", msg);
@@ -173,15 +165,15 @@ sftp_error_setg(Error **errp, BDRVSSHState *s, cons=
t char *fs, ...)
=20
 static void sftp_error_trace(BDRVSSHState *s, const char *op)
 {
-    char *ssh_err;
+    const char *ssh_err;
     int ssh_err_code;
-    unsigned long sftp_err_code;
+    int sftp_err_code;
=20
-    /* This is not an errno.  See <libssh2.h>. */
-    ssh_err_code =3D libssh2_session_last_error(s->session,
-                                              &ssh_err, NULL, 0);
-    /* See <libssh2_sftp.h>. */
-    sftp_err_code =3D libssh2_sftp_last_error((s)->sftp);
+    /* This is not an errno.  See <libssh/libssh.h>. */
+    ssh_err =3D ssh_get_error(s->session);
+    ssh_err_code =3D ssh_get_error_code(s->session);
+    /* See <libssh/sftp.h>. */
+    sftp_err_code =3D sftp_get_error(s->sftp);
=20
     trace_sftp_error(op, ssh_err, ssh_err_code, sftp_err_code);
 }
@@ -282,82 +274,85 @@ static void ssh_parse_filename(const char *filename=
, QDict *options,
     parse_uri(filename, options, errp);
 }
=20
-static int check_host_key_knownhosts(BDRVSSHState *s,
-                                     const char *host, int port, Error *=
*errp)
+static int check_host_key_knownhosts(BDRVSSHState *s, Error **errp)
 {
-    const char *home;
-    char *knh_file =3D NULL;
-    LIBSSH2_KNOWNHOSTS *knh =3D NULL;
-    struct libssh2_knownhost *found;
-    int ret, r;
-    const char *hostkey;
-    size_t len;
-    int type;
+    int ret;
+#ifdef HAVE_LIBSSH_0_8
+    enum ssh_known_hosts_e state;
=20
-    hostkey =3D libssh2_session_hostkey(s->session, &len, &type);
-    if (!hostkey) {
-        ret =3D -EINVAL;
-        session_error_setg(errp, s, "failed to read remote host key");
-        goto out;
-    }
+    state =3D ssh_session_is_known_server(s->session);
+    trace_ssh_server_status(state);
=20
-    knh =3D libssh2_knownhost_init(s->session);
-    if (!knh) {
-        ret =3D -EINVAL;
-        session_error_setg(errp, s,
-                           "failed to initialize known hosts support");
-        goto out;
-    }
-
-    home =3D getenv("HOME");
-    if (home) {
-        knh_file =3D g_strdup_printf("%s/.ssh/known_hosts", home);
-    } else {
-        knh_file =3D g_strdup_printf("/root/.ssh/known_hosts");
-    }
-
-    /* Read all known hosts from OpenSSH-style known_hosts file. */
-    libssh2_knownhost_readfile(knh, knh_file, LIBSSH2_KNOWNHOST_FILE_OPE=
NSSH);
-
-    r =3D libssh2_knownhost_checkp(knh, host, port, hostkey, len,
-                                 LIBSSH2_KNOWNHOST_TYPE_PLAIN|
-                                 LIBSSH2_KNOWNHOST_KEYENC_RAW,
-                                 &found);
-    switch (r) {
-    case LIBSSH2_KNOWNHOST_CHECK_MATCH:
+    switch (state) {
+    case SSH_KNOWN_HOSTS_OK:
         /* OK */
-        trace_ssh_check_host_key_knownhosts(found->key);
+        trace_ssh_check_host_key_knownhosts();
         break;
-    case LIBSSH2_KNOWNHOST_CHECK_MISMATCH:
+    case SSH_KNOWN_HOSTS_CHANGED:
         ret =3D -EINVAL;
-        session_error_setg(errp, s,
-                      "host key does not match the one in known_hosts"
-                      " (found key %s)", found->key);
+        error_setg(errp, "host key does not match the one in known_hosts=
");
         goto out;
-    case LIBSSH2_KNOWNHOST_CHECK_NOTFOUND:
+    case SSH_KNOWN_HOSTS_OTHER:
         ret =3D -EINVAL;
-        session_error_setg(errp, s, "no host key was found in known_host=
s");
+        error_setg(errp,
+                   "host key for this server not found, another type exi=
sts");
         goto out;
-    case LIBSSH2_KNOWNHOST_CHECK_FAILURE:
+    case SSH_KNOWN_HOSTS_UNKNOWN:
         ret =3D -EINVAL;
-        session_error_setg(errp, s,
-                      "failure matching the host key with known_hosts");
+        error_setg(errp, "no host key was found in known_hosts");
+        goto out;
+    case SSH_KNOWN_HOSTS_NOT_FOUND:
+        ret =3D -ENOENT;
+        error_setg(errp, "known_hosts file not found");
+        goto out;
+    case SSH_KNOWN_HOSTS_ERROR:
+        ret =3D -EINVAL;
+        error_setg(errp, "error while checking the host");
         goto out;
     default:
         ret =3D -EINVAL;
-        session_error_setg(errp, s, "unknown error matching the host key=
"
-                      " with known_hosts (%d)", r);
+        error_setg(errp, "error while checking for known server");
         goto out;
     }
+#else /* !HAVE_LIBSSH_0_8 */
+    int state;
+
+    state =3D ssh_is_server_known(s->session);
+    trace_ssh_server_status(state);
+
+    switch (state) {
+    case SSH_SERVER_KNOWN_OK:
+        /* OK */
+        trace_ssh_check_host_key_knownhosts();
+        break;
+    case SSH_SERVER_KNOWN_CHANGED:
+        ret =3D -EINVAL;
+        error_setg(errp, "host key does not match the one in known_hosts=
");
+        goto out;
+    case SSH_SERVER_FOUND_OTHER:
+        ret =3D -EINVAL;
+        error_setg(errp,
+                   "host key for this server not found, another type exi=
sts");
+        goto out;
+    case SSH_SERVER_FILE_NOT_FOUND:
+        ret =3D -ENOENT;
+        error_setg(errp, "known_hosts file not found");
+        goto out;
+    case SSH_SERVER_NOT_KNOWN:
+        ret =3D -EINVAL;
+        error_setg(errp, "no host key was found in known_hosts");
+        goto out;
+    case SSH_SERVER_ERROR:
+        ret =3D -EINVAL;
+        error_setg(errp, "server error");
+        goto out;
+    }
+#endif /* !HAVE_LIBSSH_0_8 */
=20
     /* known_hosts checking successful. */
     ret =3D 0;
=20
  out:
-    if (knh !=3D NULL) {
-        libssh2_knownhost_free(knh);
-    }
-    g_free(knh_file);
     return ret;
 }
=20
@@ -401,18 +396,34 @@ static int compare_fingerprint(const unsigned char =
*fingerprint, size_t len,
=20
 static int
 check_host_key_hash(BDRVSSHState *s, const char *hash,
-                    int hash_type, size_t fingerprint_len, Error **errp)
+                    enum ssh_publickey_hash_type type, Error **errp)
 {
-    const char *fingerprint;
+    int r;
+    ssh_key pubkey;
+    unsigned char *server_hash;
+    size_t server_hash_len;
=20
-    fingerprint =3D libssh2_hostkey_hash(s->session, hash_type);
-    if (!fingerprint) {
+#ifdef HAVE_LIBSSH_0_8
+    r =3D ssh_get_server_publickey(s->session, &pubkey);
+#else
+    r =3D ssh_get_publickey(s->session, &pubkey);
+#endif
+    if (r !=3D SSH_OK) {
         session_error_setg(errp, s, "failed to read remote host key");
         return -EINVAL;
     }
=20
-    if(compare_fingerprint((unsigned char *) fingerprint, fingerprint_le=
n,
-                           hash) !=3D 0) {
+    r =3D ssh_get_publickey_hash(pubkey, type, &server_hash, &server_has=
h_len);
+    ssh_key_free(pubkey);
+    if (r !=3D 0) {
+        session_error_setg(errp, s,
+                           "failed reading the hash of the server SSH ke=
y");
+        return -EINVAL;
+    }
+
+    r =3D compare_fingerprint(server_hash, server_hash_len, hash);
+    ssh_clean_pubkey_hash(&server_hash);
+    if (r !=3D 0) {
         error_setg(errp, "remote host key does not match host_key_check =
'%s'",
                    hash);
         return -EPERM;
@@ -421,8 +432,7 @@ check_host_key_hash(BDRVSSHState *s, const char *hash=
,
     return 0;
 }
=20
-static int check_host_key(BDRVSSHState *s, const char *host, int port,
-                          SshHostKeyCheck *hkc, Error **errp)
+static int check_host_key(BDRVSSHState *s, SshHostKeyCheck *hkc, Error *=
*errp)
 {
     SshHostKeyCheckMode mode;
=20
@@ -438,15 +448,15 @@ static int check_host_key(BDRVSSHState *s, const ch=
ar *host, int port,
     case SSH_HOST_KEY_CHECK_MODE_HASH:
         if (hkc->u.hash.type =3D=3D SSH_HOST_KEY_CHECK_HASH_TYPE_MD5) {
             return check_host_key_hash(s, hkc->u.hash.hash,
-                                       LIBSSH2_HOSTKEY_HASH_MD5, 16, err=
p);
+                                       SSH_PUBLICKEY_HASH_MD5, errp);
         } else if (hkc->u.hash.type =3D=3D SSH_HOST_KEY_CHECK_HASH_TYPE_=
SHA1) {
             return check_host_key_hash(s, hkc->u.hash.hash,
-                                       LIBSSH2_HOSTKEY_HASH_SHA1, 20, er=
rp);
+                                       SSH_PUBLICKEY_HASH_SHA1, errp);
         }
         g_assert_not_reached();
         break;
     case SSH_HOST_KEY_CHECK_MODE_KNOWN_HOSTS:
-        return check_host_key_knownhosts(s, host, port, errp);
+        return check_host_key_knownhosts(s, errp);
     default:
         g_assert_not_reached();
     }
@@ -454,60 +464,43 @@ static int check_host_key(BDRVSSHState *s, const ch=
ar *host, int port,
     return -EINVAL;
 }
=20
-static int authenticate(BDRVSSHState *s, const char *user, Error **errp)
+static int authenticate(BDRVSSHState *s, Error **errp)
 {
     int r, ret;
-    const char *userauthlist;
-    LIBSSH2_AGENT *agent =3D NULL;
-    struct libssh2_agent_publickey *identity;
-    struct libssh2_agent_publickey *prev_identity =3D NULL;
+    int method;
=20
-    userauthlist =3D libssh2_userauth_list(s->session, user, strlen(user=
));
-    if (strstr(userauthlist, "publickey") =3D=3D NULL) {
+    /* Try to authenticate with the "none" method. */
+    r =3D ssh_userauth_none(s->session, NULL);
+    if (r =3D=3D SSH_AUTH_ERROR) {
         ret =3D -EPERM;
-        error_setg(errp,
-                "remote server does not support \"publickey\" authentica=
tion");
+        session_error_setg(errp, s, "failed to authenticate using none "
+                                    "authentication");
         goto out;
-    }
-
-    /* Connect to ssh-agent and try each identity in turn. */
-    agent =3D libssh2_agent_init(s->session);
-    if (!agent) {
-        ret =3D -EINVAL;
-        session_error_setg(errp, s, "failed to initialize ssh-agent supp=
ort");
-        goto out;
-    }
-    if (libssh2_agent_connect(agent)) {
-        ret =3D -ECONNREFUSED;
-        session_error_setg(errp, s, "failed to connect to ssh-agent");
-        goto out;
-    }
-    if (libssh2_agent_list_identities(agent)) {
-        ret =3D -EINVAL;
-        session_error_setg(errp, s,
-                           "failed requesting identities from ssh-agent"=
);
+    } else if (r =3D=3D SSH_AUTH_SUCCESS) {
+        /* Authenticated! */
+        ret =3D 0;
         goto out;
     }
=20
-    for(;;) {
-        r =3D libssh2_agent_get_identity(agent, &identity, prev_identity=
);
-        if (r =3D=3D 1) {           /* end of list */
-            break;
-        }
-        if (r < 0) {
+    method =3D ssh_userauth_list(s->session, NULL);
+    trace_ssh_auth_methods(method);
+
+    /*
+     * Try to authenticate with publickey, using the ssh-agent
+     * if available.
+     */
+    if (method & SSH_AUTH_METHOD_PUBLICKEY) {
+        r =3D ssh_userauth_publickey_auto(s->session, NULL, NULL);
+        if (r =3D=3D SSH_AUTH_ERROR) {
             ret =3D -EINVAL;
-            session_error_setg(errp, s,
-                               "failed to obtain identity from ssh-agent=
");
+            session_error_setg(errp, s, "failed to authenticate using "
+                                        "publickey authentication");
             goto out;
-        }
-        r =3D libssh2_agent_userauth(agent, user, identity);
-        if (r =3D=3D 0) {
+        } else if (r =3D=3D SSH_AUTH_SUCCESS) {
             /* Authenticated! */
             ret =3D 0;
             goto out;
         }
-        /* Failed to authenticate with this identity, try the next one. =
*/
-        prev_identity =3D identity;
     }
=20
     ret =3D -EPERM;
@@ -515,13 +508,6 @@ static int authenticate(BDRVSSHState *s, const char =
*user, Error **errp)
                "and the identities held by your ssh-agent");
=20
  out:
-    if (agent !=3D NULL) {
-        /* Note: libssh2 implementation implicitly calls
-         * libssh2_agent_disconnect if necessary.
-         */
-        libssh2_agent_free(agent);
-    }
-
     return ret;
 }
=20
@@ -640,7 +626,8 @@ static int connect_to_ssh(BDRVSSHState *s, BlockdevOp=
tionsSsh *opts,
                           int ssh_flags, int creat_mode, Error **errp)
 {
     int r, ret;
-    long port =3D 0;
+    unsigned int port =3D 0;
+    int new_sock =3D -1;
=20
     if (opts->has_user) {
         s->user =3D g_strdup(opts->user);
@@ -657,71 +644,147 @@ static int connect_to_ssh(BDRVSSHState *s, Blockde=
vOptionsSsh *opts,
     s->inet =3D opts->server;
     opts->server =3D NULL;
=20
-    if (qemu_strtol(s->inet->port, NULL, 10, &port) < 0) {
+    if (qemu_strtoui(s->inet->port, NULL, 10, &port) < 0) {
         error_setg(errp, "Use only numeric port value");
         ret =3D -EINVAL;
         goto err;
     }
=20
     /* Open the socket and connect. */
-    s->sock =3D inet_connect_saddr(s->inet, errp);
-    if (s->sock < 0) {
+    new_sock =3D inet_connect_saddr(s->inet, errp);
+    if (new_sock < 0) {
         ret =3D -EIO;
         goto err;
     }
=20
+    /*
+     * Try to disable the Nagle algorithm on TCP sockets to reduce laten=
cy,
+     * but do not fail if it cannot be disabled.
+     */
+    r =3D socket_set_nodelay(new_sock);
+    if (r < 0) {
+        warn_report("setting NODELAY for the ssh server %s failed: %m",
+                    s->inet->host);
+    }
+
     /* Create SSH session. */
-    s->session =3D libssh2_session_init();
+    s->session =3D ssh_new();
     if (!s->session) {
         ret =3D -EINVAL;
-        session_error_setg(errp, s, "failed to initialize libssh2 sessio=
n");
+        session_error_setg(errp, s, "failed to initialize libssh session=
");
         goto err;
     }
=20
-#if TRACE_LIBSSH2 !=3D 0
-    libssh2_trace(s->session, TRACE_LIBSSH2);
-#endif
+    /*
+     * Make sure we are in blocking mode during the connection and
+     * authentication phases.
+     */
+    ssh_set_blocking(s->session, 1);
=20
-    r =3D libssh2_session_handshake(s->session, s->sock);
-    if (r !=3D 0) {
+    r =3D ssh_options_set(s->session, SSH_OPTIONS_USER, s->user);
+    if (r < 0) {
+        ret =3D -EINVAL;
+        session_error_setg(errp, s,
+                           "failed to set the user in the libssh session=
");
+        goto err;
+    }
+
+    r =3D ssh_options_set(s->session, SSH_OPTIONS_HOST, s->inet->host);
+    if (r < 0) {
+        ret =3D -EINVAL;
+        session_error_setg(errp, s,
+                           "failed to set the host in the libssh session=
");
+        goto err;
+    }
+
+    if (port > 0) {
+        r =3D ssh_options_set(s->session, SSH_OPTIONS_PORT, &port);
+        if (r < 0) {
+            ret =3D -EINVAL;
+            session_error_setg(errp, s,
+                               "failed to set the port in the libssh ses=
sion");
+            goto err;
+        }
+    }
+
+    r =3D ssh_options_set(s->session, SSH_OPTIONS_COMPRESSION, "none");
+    if (r < 0) {
+        ret =3D -EINVAL;
+        session_error_setg(errp, s,
+                           "failed to disable the compression in the lib=
ssh "
+                           "session");
+        goto err;
+    }
+
+    /* Read ~/.ssh/config. */
+    r =3D ssh_options_parse_config(s->session, NULL);
+    if (r < 0) {
+        ret =3D -EINVAL;
+        session_error_setg(errp, s, "failed to parse ~/.ssh/config");
+        goto err;
+    }
+
+    r =3D ssh_options_set(s->session, SSH_OPTIONS_FD, &new_sock);
+    if (r < 0) {
+        ret =3D -EINVAL;
+        session_error_setg(errp, s,
+                           "failed to set the socket in the libssh sessi=
on");
+        goto err;
+    }
+    /* libssh took ownership of the socket. */
+    s->sock =3D new_sock;
+    new_sock =3D -1;
+
+    /* Connect. */
+    r =3D ssh_connect(s->session);
+    if (r !=3D SSH_OK) {
         ret =3D -EINVAL;
         session_error_setg(errp, s, "failed to establish SSH session");
         goto err;
     }
=20
     /* Check the remote host's key against known_hosts. */
-    ret =3D check_host_key(s, s->inet->host, port, opts->host_key_check,=
 errp);
+    ret =3D check_host_key(s, opts->host_key_check, errp);
     if (ret < 0) {
         goto err;
     }
=20
     /* Authenticate. */
-    ret =3D authenticate(s, s->user, errp);
+    ret =3D authenticate(s, errp);
     if (ret < 0) {
         goto err;
     }
=20
     /* Start SFTP. */
-    s->sftp =3D libssh2_sftp_init(s->session);
+    s->sftp =3D sftp_new(s->session);
     if (!s->sftp) {
-        session_error_setg(errp, s, "failed to initialize sftp handle");
+        session_error_setg(errp, s, "failed to create sftp handle");
+        ret =3D -EINVAL;
+        goto err;
+    }
+
+    r =3D sftp_init(s->sftp);
+    if (r < 0) {
+        sftp_error_setg(errp, s, "failed to initialize sftp handle");
         ret =3D -EINVAL;
         goto err;
     }
=20
     /* Open the remote file. */
     trace_ssh_connect_to_ssh(opts->path, ssh_flags, creat_mode);
-    s->sftp_handle =3D libssh2_sftp_open(s->sftp, opts->path, ssh_flags,
-                                       creat_mode);
+    s->sftp_handle =3D sftp_open(s->sftp, opts->path, ssh_flags, creat_m=
ode);
     if (!s->sftp_handle) {
-        session_error_setg(errp, s, "failed to open remote file '%s'",
-                           opts->path);
+        sftp_error_setg(errp, s, "failed to open remote file '%s'",
+                        opts->path);
         ret =3D -EINVAL;
         goto err;
     }
=20
-    r =3D libssh2_sftp_fstat(s->sftp_handle, &s->attrs);
-    if (r < 0) {
+    /* Make sure the SFTP file is handled in blocking mode. */
+    sftp_file_set_blocking(s->sftp_handle);
+
+    s->attrs =3D sftp_fstat(s->sftp_handle);
+    if (!s->attrs) {
         sftp_error_setg(errp, s, "failed to read file attributes");
         return -EINVAL;
     }
@@ -729,21 +792,26 @@ static int connect_to_ssh(BDRVSSHState *s, Blockdev=
OptionsSsh *opts,
     return 0;
=20
  err:
+    if (s->attrs) {
+        sftp_attributes_free(s->attrs);
+    }
+    s->attrs =3D NULL;
     if (s->sftp_handle) {
-        libssh2_sftp_close(s->sftp_handle);
+        sftp_close(s->sftp_handle);
     }
     s->sftp_handle =3D NULL;
     if (s->sftp) {
-        libssh2_sftp_shutdown(s->sftp);
+        sftp_free(s->sftp);
     }
     s->sftp =3D NULL;
     if (s->session) {
-        libssh2_session_disconnect(s->session,
-                                   "from qemu ssh client: "
-                                   "error opening connection");
-        libssh2_session_free(s->session);
+        ssh_disconnect(s->session);
+        ssh_free(s->session);
     }
     s->session =3D NULL;
+    if (new_sock >=3D 0) {
+        close(new_sock);
+    }
=20
     return ret;
 }
@@ -758,9 +826,11 @@ static int ssh_file_open(BlockDriverState *bs, QDict=
 *options, int bdrv_flags,
=20
     ssh_state_init(s);
=20
-    ssh_flags =3D LIBSSH2_FXF_READ;
+    ssh_flags =3D 0;
     if (bdrv_flags & BDRV_O_RDWR) {
-        ssh_flags |=3D LIBSSH2_FXF_WRITE;
+        ssh_flags |=3D O_RDWR;
+    } else {
+        ssh_flags |=3D O_RDONLY;
     }
=20
     opts =3D ssh_parse_options(options, errp);
@@ -775,16 +845,13 @@ static int ssh_file_open(BlockDriverState *bs, QDic=
t *options, int bdrv_flags,
     }
=20
     /* Go non-blocking. */
-    libssh2_session_set_blocking(s->session, 0);
+    ssh_set_blocking(s->session, 0);
=20
     qapi_free_BlockdevOptionsSsh(opts);
=20
     return 0;
=20
  err:
-    if (s->sock >=3D 0) {
-        close(s->sock);
-    }
     s->sock =3D -1;
=20
     qapi_free_BlockdevOptionsSsh(opts);
@@ -797,25 +864,25 @@ static int ssh_grow_file(BDRVSSHState *s, int64_t o=
ffset, Error **errp)
 {
     ssize_t ret;
     char c[1] =3D { '\0' };
-    int was_blocking =3D libssh2_session_get_blocking(s->session);
+    int was_blocking =3D ssh_is_blocking(s->session);
=20
     /* offset must be strictly greater than the current size so we do
      * not overwrite anything */
-    assert(offset > 0 && offset > s->attrs.filesize);
+    assert(offset > 0 && offset > s->attrs->size);
=20
-    libssh2_session_set_blocking(s->session, 1);
+    ssh_set_blocking(s->session, 1);
=20
-    libssh2_sftp_seek64(s->sftp_handle, offset - 1);
-    ret =3D libssh2_sftp_write(s->sftp_handle, c, 1);
+    sftp_seek64(s->sftp_handle, offset - 1);
+    ret =3D sftp_write(s->sftp_handle, c, 1);
=20
-    libssh2_session_set_blocking(s->session, was_blocking);
+    ssh_set_blocking(s->session, was_blocking);
=20
     if (ret < 0) {
         sftp_error_setg(errp, s, "Failed to grow file");
         return -EIO;
     }
=20
-    s->attrs.filesize =3D offset;
+    s->attrs->size =3D offset;
     return 0;
 }
=20
@@ -843,8 +910,7 @@ static int ssh_co_create(BlockdevCreateOptions *optio=
ns, Error **errp)
     ssh_state_init(&s);
=20
     ret =3D connect_to_ssh(&s, opts->location,
-                         LIBSSH2_FXF_READ|LIBSSH2_FXF_WRITE|
-                         LIBSSH2_FXF_CREAT|LIBSSH2_FXF_TRUNC,
+                         O_RDWR | O_CREAT | O_TRUNC,
                          0644, errp);
     if (ret < 0) {
         goto fail;
@@ -913,10 +979,8 @@ static int ssh_has_zero_init(BlockDriverState *bs)
     /* Assume false, unless we can positively prove it's true. */
     int has_zero_init =3D 0;
=20
-    if (s->attrs.flags & LIBSSH2_SFTP_ATTR_PERMISSIONS) {
-        if (s->attrs.permissions & LIBSSH2_SFTP_S_IFREG) {
-            has_zero_init =3D 1;
-        }
+    if (s->attrs->type =3D=3D SSH_FILEXFER_TYPE_REGULAR) {
+        has_zero_init =3D 1;
     }
=20
     return has_zero_init;
@@ -953,12 +1017,12 @@ static coroutine_fn void co_yield(BDRVSSHState *s,=
 BlockDriverState *bs)
         .co =3D qemu_coroutine_self()
     };
=20
-    r =3D libssh2_session_block_directions(s->session);
+    r =3D ssh_get_poll_flags(s->session);
=20
-    if (r & LIBSSH2_SESSION_BLOCK_INBOUND) {
+    if (r & SSH_READ_PENDING) {
         rd_handler =3D restart_coroutine;
     }
-    if (r & LIBSSH2_SESSION_BLOCK_OUTBOUND) {
+    if (r & SSH_WRITE_PENDING) {
         wr_handler =3D restart_coroutine;
     }
=20
@@ -970,33 +1034,6 @@ static coroutine_fn void co_yield(BDRVSSHState *s, =
BlockDriverState *bs)
     trace_ssh_co_yield_back(s->sock);
 }
=20
-/* SFTP has a function `libssh2_sftp_seek64' which seeks to a position
- * in the remote file.  Notice that it just updates a field in the
- * sftp_handle structure, so there is no network traffic and it cannot
- * fail.
- *
- * However, `libssh2_sftp_seek64' does have a catastrophic effect on
- * performance since it causes the handle to throw away all in-flight
- * reads and buffered readahead data.  Therefore this function tries
- * to be intelligent about when to call the underlying libssh2 function.
- */
-#define SSH_SEEK_WRITE 0
-#define SSH_SEEK_READ  1
-#define SSH_SEEK_FORCE 2
-
-static void ssh_seek(BDRVSSHState *s, int64_t offset, int flags)
-{
-    bool op_read =3D (flags & SSH_SEEK_READ) !=3D 0;
-    bool force =3D (flags & SSH_SEEK_FORCE) !=3D 0;
-
-    if (force || op_read !=3D s->offset_op_read || offset !=3D s->offset=
) {
-        trace_ssh_seek(offset);
-        libssh2_sftp_seek64(s->sftp_handle, offset);
-        s->offset =3D offset;
-        s->offset_op_read =3D op_read;
-    }
-}
-
 static coroutine_fn int ssh_read(BDRVSSHState *s, BlockDriverState *bs,
                                  int64_t offset, size_t size,
                                  QEMUIOVector *qiov)
@@ -1008,7 +1045,8 @@ static coroutine_fn int ssh_read(BDRVSSHState *s, B=
lockDriverState *bs,
=20
     trace_ssh_read(offset, size);
=20
-    ssh_seek(s, offset, SSH_SEEK_READ);
+    trace_ssh_seek(offset);
+    sftp_seek64(s->sftp_handle, offset);
=20
     /* This keeps track of the current iovec element ('i'), where we
      * will write to next ('buf'), and the end of the current iovec
@@ -1018,35 +1056,35 @@ static coroutine_fn int ssh_read(BDRVSSHState *s,=
 BlockDriverState *bs,
     buf =3D i->iov_base;
     end_of_vec =3D i->iov_base + i->iov_len;
=20
-    /* libssh2 has a hard-coded limit of 2000 bytes per request,
-     * although it will also do readahead behind our backs.  Therefore
-     * we may have to do repeated reads here until we have read 'size'
-     * bytes.
-     */
     for (got =3D 0; got < size; ) {
+        size_t request_read_size;
     again:
-        trace_ssh_read_buf(buf, end_of_vec - buf);
-        r =3D libssh2_sftp_read(s->sftp_handle, buf, end_of_vec - buf);
-        trace_ssh_read_return(r);
+        /*
+         * The size of SFTP packets is limited to 32K bytes, so limit
+         * the amount of data requested to 16K, as libssh currently
+         * does not handle multiple requests on its own.
+         */
+        request_read_size =3D MIN(end_of_vec - buf, 16384);
+        trace_ssh_read_buf(buf, end_of_vec - buf, request_read_size);
+        r =3D sftp_read(s->sftp_handle, buf, request_read_size);
+        trace_ssh_read_return(r, sftp_get_error(s->sftp));
=20
-        if (r =3D=3D LIBSSH2_ERROR_EAGAIN || r =3D=3D LIBSSH2_ERROR_TIME=
OUT) {
+        if (r =3D=3D SSH_AGAIN) {
             co_yield(s, bs);
             goto again;
         }
-        if (r < 0) {
-            sftp_error_trace(s, "read");
-            s->offset =3D -1;
-            return -EIO;
-        }
-        if (r =3D=3D 0) {
+        if (r =3D=3D SSH_EOF || (r =3D=3D 0 && sftp_get_error(s->sftp) =3D=
=3D SSH_FX_EOF)) {
             /* EOF: Short read so pad the buffer with zeroes and return =
it. */
             qemu_iovec_memset(qiov, got, 0, size - got);
             return 0;
         }
+        if (r <=3D 0) {
+            sftp_error_trace(s, "read");
+            return -EIO;
+        }
=20
         got +=3D r;
         buf +=3D r;
-        s->offset +=3D r;
         if (buf >=3D end_of_vec && got < size) {
             i++;
             buf =3D i->iov_base;
@@ -1083,7 +1121,8 @@ static int ssh_write(BDRVSSHState *s, BlockDriverSt=
ate *bs,
=20
     trace_ssh_write(offset, size);
=20
-    ssh_seek(s, offset, SSH_SEEK_WRITE);
+    trace_ssh_seek(offset);
+    sftp_seek64(s->sftp_handle, offset);
=20
     /* This keeps track of the current iovec element ('i'), where we
      * will read from next ('buf'), and the end of the current iovec
@@ -1094,46 +1133,37 @@ static int ssh_write(BDRVSSHState *s, BlockDriver=
State *bs,
     end_of_vec =3D i->iov_base + i->iov_len;
=20
     for (written =3D 0; written < size; ) {
+        size_t request_write_size;
     again:
-        trace_ssh_write_buf(buf, end_of_vec - buf);
-        r =3D libssh2_sftp_write(s->sftp_handle, buf, end_of_vec - buf);
-        trace_ssh_write_return(r);
+        /*
+         * Avoid too large data packets, as libssh currently does not
+         * handle multiple requests on its own.
+         */
+        request_write_size =3D MIN(end_of_vec - buf, 131072);
+        trace_ssh_write_buf(buf, end_of_vec - buf, request_write_size);
+        r =3D sftp_write(s->sftp_handle, buf, request_write_size);
+        trace_ssh_write_return(r, sftp_get_error(s->sftp));
=20
-        if (r =3D=3D LIBSSH2_ERROR_EAGAIN || r =3D=3D LIBSSH2_ERROR_TIME=
OUT) {
+        if (r =3D=3D SSH_AGAIN) {
             co_yield(s, bs);
             goto again;
         }
         if (r < 0) {
             sftp_error_trace(s, "write");
-            s->offset =3D -1;
             return -EIO;
         }
-        /* The libssh2 API is very unclear about this.  A comment in
-         * the code says "nothing was acked, and no EAGAIN was
-         * received!" which apparently means that no data got sent
-         * out, and the underlying channel didn't return any EAGAIN
-         * indication.  I think this is a bug in either libssh2 or
-         * OpenSSH (server-side).  In any case, forcing a seek (to
-         * discard libssh2 internal buffers), and then trying again
-         * works for me.
-         */
-        if (r =3D=3D 0) {
-            ssh_seek(s, offset + written, SSH_SEEK_WRITE|SSH_SEEK_FORCE)=
;
-            co_yield(s, bs);
-            goto again;
-        }
=20
         written +=3D r;
         buf +=3D r;
-        s->offset +=3D r;
         if (buf >=3D end_of_vec && written < size) {
             i++;
             buf =3D i->iov_base;
             end_of_vec =3D i->iov_base + i->iov_len;
         }
=20
-        if (offset + written > s->attrs.filesize)
-            s->attrs.filesize =3D offset + written;
+        if (offset + written > s->attrs->size) {
+            s->attrs->size =3D offset + written;
+        }
     }
=20
     return 0;
@@ -1168,24 +1198,24 @@ static void unsafe_flush_warning(BDRVSSHState *s,=
 const char *what)
     }
 }
=20
-#ifdef HAS_LIBSSH2_SFTP_FSYNC
+#ifdef HAVE_LIBSSH_0_8
=20
 static coroutine_fn int ssh_flush(BDRVSSHState *s, BlockDriverState *bs)
 {
     int r;
=20
     trace_ssh_flush();
+
+    if (!sftp_extension_supported(s->sftp, "fsync@openssh.com", "1")) {
+        unsafe_flush_warning(s, "OpenSSH >=3D 6.3");
+        return 0;
+    }
  again:
-    r =3D libssh2_sftp_fsync(s->sftp_handle);
-    if (r =3D=3D LIBSSH2_ERROR_EAGAIN || r =3D=3D LIBSSH2_ERROR_TIMEOUT)=
 {
+    r =3D sftp_fsync(s->sftp_handle);
+    if (r =3D=3D SSH_AGAIN) {
         co_yield(s, bs);
         goto again;
     }
-    if (r =3D=3D LIBSSH2_ERROR_SFTP_PROTOCOL &&
-        libssh2_sftp_last_error(s->sftp) =3D=3D LIBSSH2_FX_OP_UNSUPPORTE=
D) {
-        unsafe_flush_warning(s, "OpenSSH >=3D 6.3");
-        return 0;
-    }
     if (r < 0) {
         sftp_error_trace(s, "fsync");
         return -EIO;
@@ -1206,25 +1236,25 @@ static coroutine_fn int ssh_co_flush(BlockDriverS=
tate *bs)
     return ret;
 }
=20
-#else /* !HAS_LIBSSH2_SFTP_FSYNC */
+#else /* !HAVE_LIBSSH_0_8 */
=20
 static coroutine_fn int ssh_co_flush(BlockDriverState *bs)
 {
     BDRVSSHState *s =3D bs->opaque;
=20
-    unsafe_flush_warning(s, "libssh2 >=3D 1.4.4");
+    unsafe_flush_warning(s, "libssh >=3D 0.8.0");
     return 0;
 }
=20
-#endif /* !HAS_LIBSSH2_SFTP_FSYNC */
+#endif /* !HAVE_LIBSSH_0_8 */
=20
 static int64_t ssh_getlength(BlockDriverState *bs)
 {
     BDRVSSHState *s =3D bs->opaque;
     int64_t length;
=20
-    /* Note we cannot make a libssh2 call here. */
-    length =3D (int64_t) s->attrs.filesize;
+    /* Note we cannot make a libssh call here. */
+    length =3D (int64_t) s->attrs->size;
     trace_ssh_getlength(length);
=20
     return length;
@@ -1241,12 +1271,12 @@ static int coroutine_fn ssh_co_truncate(BlockDriv=
erState *bs, int64_t offset,
         return -ENOTSUP;
     }
=20
-    if (offset < s->attrs.filesize) {
+    if (offset < s->attrs->size) {
         error_setg(errp, "ssh driver does not support shrinking files");
         return -ENOTSUP;
     }
=20
-    if (offset =3D=3D s->attrs.filesize) {
+    if (offset =3D=3D s->attrs->size) {
         return 0;
     }
=20
@@ -1341,12 +1371,16 @@ static void bdrv_ssh_init(void)
 {
     int r;
=20
-    r =3D libssh2_init(0);
+    r =3D ssh_init();
     if (r !=3D 0) {
-        fprintf(stderr, "libssh2 initialization failed, %d\n", r);
+        fprintf(stderr, "libssh initialization failed, %d\n", r);
         exit(EXIT_FAILURE);
     }
=20
+#if TRACE_LIBSSH !=3D 0
+    ssh_set_log_level(TRACE_LIBSSH);
+#endif
+
     bdrv_register(&bdrv_ssh);
 }
=20
diff --git a/block/trace-events b/block/trace-events
index eab51497fc..6a36562e08 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -169,19 +169,21 @@ nbd_co_request_fail(uint64_t from, uint32_t len, ui=
nt64_t handle, uint16_t flags
 # ssh.c
 ssh_restart_coroutine(void *co) "co=3D%p"
 ssh_flush(void) "fsync"
-ssh_check_host_key_knownhosts(const char *key) "host key OK: %s"
+ssh_check_host_key_knownhosts(void) "host key OK"
 ssh_connect_to_ssh(char *path, int flags, int mode) "opening file %s fla=
gs=3D0x%x creat_mode=3D0%o"
 ssh_co_yield(int sock, void *rd_handler, void *wr_handler) "s->sock=3D%d=
 rd_handler=3D%p wr_handler=3D%p"
 ssh_co_yield_back(int sock) "s->sock=3D%d - back"
 ssh_getlength(int64_t length) "length=3D%" PRIi64
 ssh_co_create_opts(uint64_t size) "total_size=3D%" PRIu64
 ssh_read(int64_t offset, size_t size) "offset=3D%" PRIi64 " size=3D%zu"
-ssh_read_buf(void *buf, size_t size) "sftp_read buf=3D%p size=3D%zu"
-ssh_read_return(ssize_t ret) "sftp_read returned %zd"
+ssh_read_buf(void *buf, size_t size, size_t actual_size) "sftp_read buf=3D=
%p size=3D%zu (actual size=3D%zu)"
+ssh_read_return(ssize_t ret, int sftp_err) "sftp_read returned %zd (sftp=
 error=3D%d)"
 ssh_write(int64_t offset, size_t size) "offset=3D%" PRIi64 " size=3D%zu"
-ssh_write_buf(void *buf, size_t size) "sftp_write buf=3D%p size=3D%zu"
-ssh_write_return(ssize_t ret) "sftp_write returned %zd"
+ssh_write_buf(void *buf, size_t size, size_t actual_size) "sftp_write bu=
f=3D%p size=3D%zu (actual size=3D%zu)"
+ssh_write_return(ssize_t ret, int sftp_err) "sftp_write returned %zd (sf=
tp error=3D%d)"
 ssh_seek(int64_t offset) "seeking to offset=3D%" PRIi64
+ssh_auth_methods(int methods) "auth methods=3D0x%x"
+ssh_server_status(int status) "server status=3D%d"
=20
 # curl.c
 curl_timer_cb(long timeout_ms) "timer callback timeout_ms %ld"
@@ -214,4 +216,4 @@ sheepdog_snapshot_create(const char *sn_name, const c=
har *id) "%s %s"
 sheepdog_snapshot_create_inode(const char *name, uint32_t snap, uint32_t=
 vdi) "s->inode: name %s snap_id 0x%" PRIx32 " vdi 0x%" PRIx32
=20
 # ssh.c
-sftp_error(const char *op, const char *ssh_err, int ssh_err_code, unsign=
ed long sftp_err_code) "%s failed: %s (libssh2 error code: %d, sftp error=
 code: %lu)"
+sftp_error(const char *op, const char *ssh_err, int ssh_err_code, int sf=
tp_err_code) "%s failed: %s (libssh error code: %d, sftp error code: %d)"
diff --git a/configure b/configure
index b091b82cb3..5c7914570e 100755
--- a/configure
+++ b/configure
@@ -472,7 +472,7 @@ auth_pam=3D""
 vte=3D""
 virglrenderer=3D""
 tpm=3D""
-libssh2=3D""
+libssh=3D""
 live_block_migration=3D"yes"
 numa=3D""
 tcmalloc=3D"no"
@@ -1439,9 +1439,9 @@ for opt do
   ;;
   --enable-tpm) tpm=3D"yes"
   ;;
-  --disable-libssh2) libssh2=3D"no"
+  --disable-libssh) libssh=3D"no"
   ;;
-  --enable-libssh2) libssh2=3D"yes"
+  --enable-libssh) libssh=3D"yes"
   ;;
   --disable-live-block-migration) live_block_migration=3D"no"
   ;;
@@ -1810,7 +1810,7 @@ disabled with --disable-FEATURE, default is enabled=
 if available:
   coroutine-pool  coroutine freelist (better performance)
   glusterfs       GlusterFS backend
   tpm             TPM support
-  libssh2         ssh block device support
+  libssh          ssh block device support
   numa            libnuma support
   libxml2         for Parallels image format
   tcmalloc        tcmalloc support
@@ -3914,43 +3914,34 @@ EOF
 fi
=20
 ##########################################
-# libssh2 probe
-min_libssh2_version=3D1.2.8
-if test "$libssh2" !=3D "no" ; then
-  if $pkg_config --atleast-version=3D$min_libssh2_version libssh2; then
-    libssh2_cflags=3D$($pkg_config libssh2 --cflags)
-    libssh2_libs=3D$($pkg_config libssh2 --libs)
-    libssh2=3Dyes
+# libssh probe
+if test "$libssh" !=3D "no" ; then
+  if $pkg_config --exists libssh; then
+    libssh_cflags=3D$($pkg_config libssh --cflags)
+    libssh_libs=3D$($pkg_config libssh --libs)
+    libssh=3Dyes
   else
-    if test "$libssh2" =3D "yes" ; then
-      error_exit "libssh2 >=3D $min_libssh2_version required for --enabl=
e-libssh2"
+    if test "$libssh" =3D "yes" ; then
+      error_exit "libssh required for --enable-libssh"
     fi
-    libssh2=3Dno
+    libssh=3Dno
   fi
 fi
=20
 ##########################################
-# libssh2_sftp_fsync probe
+# Check for libssh 0.8
+# This is done like this instead of using the LIBSSH_VERSION_* and
+# SSH_VERSION_* macros because some distributions in the past shipped
+# snapshots of the future 0.8 from Git, and those snapshots did not
+# have updated version numbers (still referring to 0.7.0).
=20
-if test "$libssh2" =3D "yes"; then
+if test "$libssh" =3D "yes"; then
   cat > $TMPC <<EOF
-#include <stdio.h>
-#include <libssh2.h>
-#include <libssh2_sftp.h>
-int main(void) {
-    LIBSSH2_SESSION *session;
-    LIBSSH2_SFTP *sftp;
-    LIBSSH2_SFTP_HANDLE *sftp_handle;
-    session =3D libssh2_session_init ();
-    sftp =3D libssh2_sftp_init (session);
-    sftp_handle =3D libssh2_sftp_open (sftp, "/", 0, 0);
-    libssh2_sftp_fsync (sftp_handle);
-    return 0;
-}
+#include <libssh/libssh.h>
+int main(void) { return ssh_get_server_publickey(NULL, NULL); }
 EOF
-  # libssh2_cflags/libssh2_libs defined in previous test.
-  if compile_prog "$libssh2_cflags" "$libssh2_libs" ; then
-    QEMU_CFLAGS=3D"-DHAS_LIBSSH2_SFTP_FSYNC $QEMU_CFLAGS"
+  if compile_prog "$libssh_cflags" "$libssh_libs"; then
+    libssh_cflags=3D"-DHAVE_LIBSSH_0_8 $libssh_cflags"
   fi
 fi
=20
@@ -6451,7 +6442,7 @@ echo "GlusterFS support $glusterfs"
 echo "gcov              $gcov_tool"
 echo "gcov enabled      $gcov"
 echo "TPM support       $tpm"
-echo "libssh2 support   $libssh2"
+echo "libssh support    $libssh"
 echo "QOM debugging     $qom_cast_debug"
 echo "Live block migration $live_block_migration"
 echo "lzo support       $lzo"
@@ -7144,10 +7135,10 @@ if test "$glusterfs_iocb_has_stat" =3D "yes" ; th=
en
   echo "CONFIG_GLUSTERFS_IOCB_HAS_STAT=3Dy" >> $config_host_mak
 fi
=20
-if test "$libssh2" =3D "yes" ; then
-  echo "CONFIG_LIBSSH2=3Dm" >> $config_host_mak
-  echo "LIBSSH2_CFLAGS=3D$libssh2_cflags" >> $config_host_mak
-  echo "LIBSSH2_LIBS=3D$libssh2_libs" >> $config_host_mak
+if test "$libssh" =3D "yes" ; then
+  echo "CONFIG_LIBSSH=3Dm" >> $config_host_mak
+  echo "LIBSSH_CFLAGS=3D$libssh_cflags" >> $config_host_mak
+  echo "LIBSSH_LIBS=3D$libssh_libs" >> $config_host_mak
 fi
=20
 if test "$live_block_migration" =3D "yes" ; then
diff --git a/docs/qemu-block-drivers.texi b/docs/qemu-block-drivers.texi
index da06a9bc83..91ab0eceae 100644
--- a/docs/qemu-block-drivers.texi
+++ b/docs/qemu-block-drivers.texi
@@ -782,7 +782,7 @@ print a warning when @code{fsync} is not supported:
=20
 warning: ssh server @code{ssh.example.com:22} does not support fsync
=20
-With sufficiently new versions of libssh2 and OpenSSH, @code{fsync} is
+With sufficiently new versions of libssh and OpenSSH, @code{fsync} is
 supported.
=20
 @node disk_images_nvme
diff --git a/tests/docker/dockerfiles/debian-win32-cross.docker b/tests/d=
ocker/dockerfiles/debian-win32-cross.docker
index dd021f2df0..0a4970c068 100644
--- a/tests/docker/dockerfiles/debian-win32-cross.docker
+++ b/tests/docker/dockerfiles/debian-win32-cross.docker
@@ -15,7 +15,6 @@ RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
         mxe-$TARGET-w64-mingw32.shared-curl \
         mxe-$TARGET-w64-mingw32.shared-glib \
         mxe-$TARGET-w64-mingw32.shared-libgcrypt \
-        mxe-$TARGET-w64-mingw32.shared-libssh2 \
         mxe-$TARGET-w64-mingw32.shared-libusb1 \
         mxe-$TARGET-w64-mingw32.shared-lzo \
         mxe-$TARGET-w64-mingw32.shared-nettle \
diff --git a/tests/docker/dockerfiles/debian-win64-cross.docker b/tests/d=
ocker/dockerfiles/debian-win64-cross.docker
index 4542bcc821..b27985b1b1 100644
--- a/tests/docker/dockerfiles/debian-win64-cross.docker
+++ b/tests/docker/dockerfiles/debian-win64-cross.docker
@@ -15,7 +15,6 @@ RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
         mxe-$TARGET-w64-mingw32.shared-curl \
         mxe-$TARGET-w64-mingw32.shared-glib \
         mxe-$TARGET-w64-mingw32.shared-libgcrypt \
-        mxe-$TARGET-w64-mingw32.shared-libssh2 \
         mxe-$TARGET-w64-mingw32.shared-libusb1 \
         mxe-$TARGET-w64-mingw32.shared-lzo \
         mxe-$TARGET-w64-mingw32.shared-nettle \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/docker=
files/fedora.docker
index afbba29ada..8893c1b957 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -35,7 +35,7 @@ ENV PACKAGES \
     libpng-devel \
     librbd-devel \
     libseccomp-devel \
-    libssh2-devel \
+    libssh-devel \
     libubsan \
     libusbx-devel \
     libxml2-devel \
@@ -50,7 +50,6 @@ ENV PACKAGES \
     mingw32-gtk3 \
     mingw32-libjpeg-turbo \
     mingw32-libpng \
-    mingw32-libssh2 \
     mingw32-libtasn1 \
     mingw32-nettle \
     mingw32-pixman \
@@ -64,7 +63,6 @@ ENV PACKAGES \
     mingw64-gtk3 \
     mingw64-libjpeg-turbo \
     mingw64-libpng \
-    mingw64-libssh2 \
     mingw64-libtasn1 \
     mingw64-nettle \
     mingw64-pixman \
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/docker=
files/ubuntu.docker
index 36e2b17de5..1bbb7f9598 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -44,7 +44,7 @@ ENV PACKAGES flex bison \
     libsnappy-dev \
     libspice-protocol-dev \
     libspice-server-dev \
-    libssh2-1-dev \
+    libssh-dev \
     libusb-1.0-0-dev \
     libusbredirhost-dev \
     libvdeplug-dev \
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/do=
ckerfiles/ubuntu1804.docker
index 2e2900150b..9d80b11500 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -40,7 +40,7 @@ ENV PACKAGES flex bison \
     libsnappy-dev \
     libspice-protocol-dev \
     libspice-server-dev \
-    libssh2-1-dev \
+    libssh-dev \
     libusb-1.0-0-dev \
     libusbredirhost-dev \
     libvdeplug-dev \
diff --git a/tests/qemu-iotests/207.out b/tests/qemu-iotests/207.out
index ec9823793a..1239d9d648 100644
--- a/tests/qemu-iotests/207.out
+++ b/tests/qemu-iotests/207.out
@@ -68,7 +68,7 @@ virtual size: 4 MiB (4194304 bytes)
=20
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options"=
: {"driver": "ssh", "location": {"host-key-check": {"mode": "none"}, "pat=
h": "/this/is/not/an/existing/path", "server": {"host": "127.0.0.1", "por=
t": "22"}}, "size": 4194304}}}
 {"return": {}}
-Job failed: failed to open remote file '/this/is/not/an/existing/path': =
Failed opening remote file (libssh2 error code: -31)
+Job failed: failed to open remote file '/this/is/not/an/existing/path': =
SFTP server: No such file (libssh error code: 1, sftp error code: 2)
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
=20
--=20
2.21.0


