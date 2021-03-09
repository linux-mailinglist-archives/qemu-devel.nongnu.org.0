Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B23C332666
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:14:55 +0100 (CET)
Received: from localhost ([::1]:38778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJcCM-0007yP-Ma
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:14:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lJc3q-0008Rq-1h
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:06:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lJc3n-0001R8-9a
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:06:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615295151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LGwhidlqBn0V3Z6vmQUJleWMkiGFxZMCQn+zKVELuCc=;
 b=Uh0gi8ccsAueAKYwYQoYjlgR0zQ6Svme9FeSt+nigeMdB3hev4S0exIwsakxBO3mRGZWpZ
 tHWljI5HnKvFHl4anjMJ6ee3xpktZlrUqzZVfCLuHVd7azFIsL9bKe0EWkOtIhmz3p76sT
 hH6icoG8fUINIan/aRdsIKuAxS3UFgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-tfNZyQKfOY65YjrcuAanlQ-1; Tue, 09 Mar 2021 08:05:49 -0500
X-MC-Unique: tfNZyQKfOY65YjrcuAanlQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5434E19067E4;
 Tue,  9 Mar 2021 13:05:48 +0000 (UTC)
Received: from localhost (ovpn-112-45.ams2.redhat.com [10.36.112.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBC145C260;
 Tue,  9 Mar 2021 13:05:47 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] curl: Disconnect sockets from CURLState
Date: Tue,  9 Mar 2021 14:05:41 +0100
Message-Id: <20210309130541.37540-3-mreitz@redhat.com>
In-Reply-To: <20210309130541.37540-1-mreitz@redhat.com>
References: <20210309130541.37540-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a curl transfer is finished, that does not mean that CURL lets go
of all the sockets it used for it.  We therefore must not free a
CURLSocket object before CURL has invoked curl_sock_cb() to tell us to
remove it.  Otherwise, we may get a use-after-free, as described in this
bug report: https://bugs.launchpad.net/qemu/+bug/1916501

(Reproducer from that report:
  $ qemu-img convert -f qcow2 -O raw \
  https://download.cirros-cloud.net/0.4.0/cirros-0.4.0-x86_64-disk.img \
  out.img
)

(Alternatively, it might seem logical to force-drop all sockets that
have been used for a state when the respective transfer is done, kind of
like it is done now, but including unsetting the AIO handlers.
Unfortunately, doing so makes the driver just hang instead of crashing,
which seems to evidence that CURL still uses those sockets.)

Make the CURLSocket object independent of "its" CURLState by putting all
sockets into a hash table belonging to the BDRVCURLState instead of a
list that belongs to a CURLState.  Do not touch any sockets in
curl_clean_state().

Testing, it seems like all sockets are indeed gone by the time the curl
BDS is closed, so it seems like there really was no point in freeing any
socket just because a transfer is done.  libcurl does invoke
curl_sock_cb() with CURL_POLL_REMOVE for every socket it has.

Buglink: https://bugs.launchpad.net/qemu/+bug/1916501
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/curl.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index 43c79bcf36..50e741a0d7 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -79,7 +79,6 @@ typedef struct CURLAIOCB {
 typedef struct CURLSocket {
     int fd;
     struct BDRVCURLState *s;
-    QLIST_ENTRY(CURLSocket) next;
 } CURLSocket;
 
 typedef struct CURLState
@@ -87,7 +86,6 @@ typedef struct CURLState
     struct BDRVCURLState *s;
     CURLAIOCB *acb[CURL_NUM_ACB];
     CURL *curl;
-    QLIST_HEAD(, CURLSocket) sockets;
     char *orig_buf;
     uint64_t buf_start;
     size_t buf_off;
@@ -102,6 +100,7 @@ typedef struct BDRVCURLState {
     QEMUTimer timer;
     uint64_t len;
     CURLState states[CURL_NUM_STATES];
+    GHashTable *sockets; /* GINT_TO_POINTER(fd) -> socket */
     char *url;
     size_t readahead_size;
     bool sslverify;
@@ -120,6 +119,21 @@ typedef struct BDRVCURLState {
 static void curl_clean_state(CURLState *s);
 static void curl_multi_do(void *arg);
 
+static gboolean curl_drop_socket(void *key, void *value, void *opaque)
+{
+    CURLSocket *socket = value;
+    BDRVCURLState *s = socket->s;
+
+    aio_set_fd_handler(s->aio_context, socket->fd, false,
+                       NULL, NULL, NULL, NULL);
+    return true;
+}
+
+static void curl_drop_all_sockets(GHashTable *sockets)
+{
+    g_hash_table_foreach_remove(sockets, curl_drop_socket, NULL);
+}
+
 /* Called from curl_multi_do_locked, with s->mutex held.  */
 static int curl_timer_cb(CURLM *multi, long timeout_ms, void *opaque)
 {
@@ -147,16 +161,12 @@ static int curl_sock_cb(CURL *curl, curl_socket_t fd, int action,
     curl_easy_getinfo(curl, CURLINFO_PRIVATE, (char **)&state);
     s = state->s;
 
-    QLIST_FOREACH(socket, &state->sockets, next) {
-        if (socket->fd == fd) {
-            break;
-        }
-    }
+    socket = g_hash_table_lookup(s->sockets, GINT_TO_POINTER(fd));
     if (!socket) {
         socket = g_new0(CURLSocket, 1);
         socket->fd = fd;
         socket->s = s;
-        QLIST_INSERT_HEAD(&state->sockets, socket, next);
+        g_hash_table_insert(s->sockets, GINT_TO_POINTER(fd), socket);
     }
 
     trace_curl_sock_cb(action, (int)fd);
@@ -180,8 +190,7 @@ static int curl_sock_cb(CURL *curl, curl_socket_t fd, int action,
     }
 
     if (action == CURL_POLL_REMOVE) {
-        QLIST_REMOVE(socket, next);
-        g_free(socket);
+        g_hash_table_remove(s->sockets, GINT_TO_POINTER(fd));
     }
 
     return 0;
@@ -498,7 +507,6 @@ static int curl_init_state(BDRVCURLState *s, CURLState *state)
 #endif
     }
 
-    QLIST_INIT(&state->sockets);
     state->s = s;
 
     return 0;
@@ -515,13 +523,6 @@ static void curl_clean_state(CURLState *s)
     if (s->s->multi)
         curl_multi_remove_handle(s->s->multi, s->curl);
 
-    while (!QLIST_EMPTY(&s->sockets)) {
-        CURLSocket *socket = QLIST_FIRST(&s->sockets);
-
-        QLIST_REMOVE(socket, next);
-        g_free(socket);
-    }
-
     s->in_use = 0;
 
     qemu_co_enter_next(&s->s->free_state_waitq, &s->s->mutex);
@@ -539,6 +540,7 @@ static void curl_detach_aio_context(BlockDriverState *bs)
     int i;
 
     WITH_QEMU_LOCK_GUARD(&s->mutex) {
+        curl_drop_all_sockets(s->sockets);
         for (i = 0; i < CURL_NUM_STATES; i++) {
             if (s->states[i].in_use) {
                 curl_clean_state(&s->states[i]);
@@ -745,6 +747,7 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags,
     qemu_co_queue_init(&s->free_state_waitq);
     s->aio_context = bdrv_get_aio_context(bs);
     s->url = g_strdup(file);
+    s->sockets = g_hash_table_new_full(NULL, NULL, NULL, g_free);
     qemu_mutex_lock(&s->mutex);
     state = curl_find_state(s);
     qemu_mutex_unlock(&s->mutex);
@@ -818,6 +821,8 @@ out_noclean:
     g_free(s->username);
     g_free(s->proxyusername);
     g_free(s->proxypassword);
+    curl_drop_all_sockets(s->sockets);
+    g_hash_table_destroy(s->sockets);
     qemu_opts_del(opts);
     return -EINVAL;
 }
@@ -916,6 +921,7 @@ static void curl_close(BlockDriverState *bs)
     curl_detach_aio_context(bs);
     qemu_mutex_destroy(&s->mutex);
 
+    g_hash_table_destroy(s->sockets);
     g_free(s->cookie);
     g_free(s->url);
     g_free(s->username);
-- 
2.29.2


