Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270363CFA0A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:02:49 +0200 (CEST)
Received: from localhost ([::1]:36774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pOa-0002SZ-5C
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGQ-0004kh-36
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGN-0008Hi-3y
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626785658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z4fOhUHD38CgOY3nRti/WJ+aN3U6LSY5qEu72LmphDI=;
 b=SnMos88HMDrMWEbjIzfiMNr3orO0EiUeyChDgOkDUAy2OPlv+Lmjno0uEQ6z6iQ4xLexrq
 mLhBM8g/vObItWsv8ggED62IF9PXmYRo+P8XZ8/rHSyT4eEF+8OrOfp+yRkxrmCOOOp6hl
 7tgAqptm0KV3Q6d3v4s+caZLI+Z0QG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-9jUP1urLOnmoVhpjPDlJlA-1; Tue, 20 Jul 2021 08:54:17 -0400
X-MC-Unique: 9jUP1urLOnmoVhpjPDlJlA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39D5119251A3
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCD295C1CF
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1F3A0112D853; Tue, 20 Jul 2021 14:54:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/16] Remove superfluous ERRP_GUARD()
Date: Tue, 20 Jul 2021 14:54:06 +0200
Message-Id: <20210720125408.387910-15-armbru@redhat.com>
In-Reply-To: <20210720125408.387910-1-armbru@redhat.com>
References: <20210720125408.387910-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Macro ERRP_GUARD() is only needed when we want to dereference @errp or
pass it to error_prepend() or error_append_hint().  Delete superfluous
ones.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/remote/mpqemu-link.c  |  3 ---
 qga/commands-posix-ssh.c | 17 -----------------
 qga/commands-win32.c     |  1 -
 softmmu/vl.c             |  1 -
 ui/console.c             |  1 -
 5 files changed, 23 deletions(-)

diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index e67a5de72c..7e841820e5 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -34,7 +34,6 @@
  */
 bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
 {
-    ERRP_GUARD();
     bool iolock = qemu_mutex_iothread_locked();
     bool iothread = qemu_in_iothread();
     struct iovec send[2] = {};
@@ -97,7 +96,6 @@ bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
 static ssize_t mpqemu_read(QIOChannel *ioc, void *buf, size_t len, int **fds,
                            size_t *nfds, Error **errp)
 {
-    ERRP_GUARD();
     struct iovec iov = { .iov_base = buf, .iov_len = len };
     bool iolock = qemu_mutex_iothread_locked();
     bool iothread = qemu_in_iothread();
@@ -192,7 +190,6 @@ fail:
 uint64_t mpqemu_msg_send_and_await_reply(MPQemuMsg *msg, PCIProxyDev *pdev,
                                          Error **errp)
 {
-    ERRP_GUARD();
     MPQemuMsg msg_reply = {0};
     uint64_t ret = UINT64_MAX;
 
diff --git a/qga/commands-posix-ssh.c b/qga/commands-posix-ssh.c
index 2dda136d64..f3a580b8cc 100644
--- a/qga/commands-posix-ssh.c
+++ b/qga/commands-posix-ssh.c
@@ -45,8 +45,6 @@ get_passwd_entry(const char *username, Error **errp)
     g_autoptr(GError) err = NULL;
     struct passwd *p;
 
-    ERRP_GUARD();
-
     p = g_unix_get_passwd_entry_qemu(username, &err);
     if (p == NULL) {
         error_setg(errp, "failed to lookup user '%s': %s",
@@ -61,8 +59,6 @@ static bool
 mkdir_for_user(const char *path, const struct passwd *p,
                mode_t mode, Error **errp)
 {
-    ERRP_GUARD();
-
     if (g_mkdir(path, mode) == -1) {
         error_setg(errp, "failed to create directory '%s': %s",
                    path, g_strerror(errno));
@@ -87,8 +83,6 @@ mkdir_for_user(const char *path, const struct passwd *p,
 static bool
 check_openssh_pub_key(const char *key, Error **errp)
 {
-    ERRP_GUARD();
-
     /* simple sanity-check, we may want more? */
     if (!key || key[0] == '#' || strchr(key, '\n')) {
         error_setg(errp, "invalid OpenSSH public key: '%s'", key);
@@ -104,8 +98,6 @@ check_openssh_pub_keys(strList *keys, size_t *nkeys, Error **errp)
     size_t n = 0;
     strList *k;
 
-    ERRP_GUARD();
-
     for (k = keys; k != NULL; k = k->next) {
         if (!check_openssh_pub_key(k->value, errp)) {
             return false;
@@ -126,8 +118,6 @@ write_authkeys(const char *path, const GStrv keys,
     g_autofree char *contents = NULL;
     g_autoptr(GError) err = NULL;
 
-    ERRP_GUARD();
-
     contents = g_strjoinv("\n", keys);
     if (!g_file_set_contents(path, contents, -1, &err)) {
         error_setg(errp, "failed to write to '%s': %s", path, err->message);
@@ -155,8 +145,6 @@ read_authkeys(const char *path, Error **errp)
     g_autoptr(GError) err = NULL;
     g_autofree char *contents = NULL;
 
-    ERRP_GUARD();
-
     if (!g_file_get_contents(path, &contents, NULL, &err)) {
         error_setg(errp, "failed to read '%s': %s", path, err->message);
         return NULL;
@@ -178,7 +166,6 @@ qmp_guest_ssh_add_authorized_keys(const char *username, strList *keys,
     strList *k;
     size_t nkeys, nauthkeys;
 
-    ERRP_GUARD();
     reset = has_reset && reset;
 
     if (!check_openssh_pub_keys(keys, &nkeys, errp)) {
@@ -228,8 +215,6 @@ qmp_guest_ssh_remove_authorized_keys(const char *username, strList *keys,
     GStrv a;
     size_t nkeys = 0;
 
-    ERRP_GUARD();
-
     if (!check_openssh_pub_keys(keys, NULL, errp)) {
         return;
     }
@@ -277,8 +262,6 @@ qmp_guest_ssh_get_authorized_keys(const char *username, Error **errp)
     g_autoptr(GuestAuthorizedKeys) ret = NULL;
     int i;
 
-    ERRP_GUARD();
-
     p = get_passwd_entry(username, errp);
     if (p == NULL) {
         return NULL;
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index a099acb34d..a6d2c0d88e 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -976,7 +976,6 @@ out:
 
 GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
 {
-    ERRP_GUARD();
     GuestDiskInfoList *ret = NULL;
     HDEVINFO dev_info;
     SP_DEVICE_INTERFACE_DATA dev_iface_data;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 0d2db1abc3..f9ffeb8d4d 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1539,7 +1539,6 @@ machine_parse_property_opt(QemuOptsList *opts_list, const char *propname,
 {
     QDict *opts, *prop;
     bool help = false;
-    ERRP_GUARD();
 
     prop = keyval_parse(arg, opts_list->implied_opt_name, &help, errp);
     if (help) {
diff --git a/ui/console.c b/ui/console.c
index 5d2e6178ff..eabbbc951c 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1481,7 +1481,6 @@ static bool displaychangelistener_has_dmabuf(DisplayChangeListener *dcl)
 static bool dpy_compatible_with(QemuConsole *con,
                                 DisplayChangeListener *dcl, Error **errp)
 {
-    ERRP_GUARD();
     int flags;
 
     flags = con->hw_ops->get_flags ? con->hw_ops->get_flags(con->hw) : 0;
-- 
2.31.1


