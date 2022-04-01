Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 986104EF1D5
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:42:05 +0200 (CEST)
Received: from localhost ([::1]:54674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naITU-0002hx-Fr
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:42:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naIRN-0008Rb-C1
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:39:53 -0400
Received: from [2a00:1450:4864:20::22e] (port=33757
 helo=mail-lj1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naIRL-0002FB-Bx
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:39:53 -0400
Received: by mail-lj1-x22e.google.com with SMTP id by7so4286793ljb.0
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E7gyguVyUW8uPfOGuqXXm5JX3FTQ9OUKND6fhg7LMSA=;
 b=RRk007IDcUATc55HQQplM50g75OTo6vl07PvYMDuOrJeSTsBdOf4Bc3RF+JKsfvSJ7
 DJGNDQRXJlLx5Wo/JDYTNINX2ktFXcaWAeMJeag9scSAaK6nl104UljkPBqo/XuRGK55
 +umOkSN1G7W4F75GD6hKo17D3J6AHHRknfIDKEIxg7iKLl54b4+2U6krhc7fECTQ+PrH
 +S+GZnNvy0R2BFoajTuyqgrHi0y97CNb7456K3sgzbGUebeVmirsBNbJDBjrGuFDJIso
 uZkDGVZRMzI7vsYjF7oZ773//e5oa7Z6P8AMF8qG1OEGwp3ynCXoSYu5/XC52l5ueEed
 dmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E7gyguVyUW8uPfOGuqXXm5JX3FTQ9OUKND6fhg7LMSA=;
 b=3BOA1HX1SCWIfsOYW4JVKRZve6MYzL3lQrs7txIFMoqQxKhxw3jYkRrr+XwvybQgFY
 TS+gy6lT4o3iEjO94pHi8ksRIg+tEqE29UWO/Osc/qw7ISBvLrmBFRUE9B9pm5Y2vKND
 CT2z00GXsKnMHWIDUMIjs2abfL9s7br0+UAlhCcEbSMwFcs/1mub7uCVUrgjizQVODUZ
 hULnaQ+EYe3weDqtHf9SM0DTUQEEVnCCCiv5yrQ6fYqzqXOLC9sPoy70vW/mFZ6Yhqo0
 JHwPE4QmkmmRbIFvIGPLvXI4zYnwL96lV38nl+j3wCm/05woSqcwtGs/5Y9/Ll7P72se
 tjmw==
X-Gm-Message-State: AOAM533765YBMahhTcrG/Z7LgtpN4WxtXmmpZShJPsbGqT05/HVVwzQp
 ULZRl80d4T2XwDPPM2z7ObMP6CaMxkEOHQ==
X-Google-Smtp-Source: ABdhPJwTQ3Aj/k7T1tHgra5+Gn21a/VUZlV/K9ymYY2wpnSoem52oasgB9g+QvF+P3ZZsh8oC4/VcA==
X-Received: by 2002:a05:651c:179a:b0:247:d37b:6ec5 with SMTP id
 bn26-20020a05651c179a00b00247d37b6ec5mr13230797ljb.112.1648823988984; 
 Fri, 01 Apr 2022 07:39:48 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a2eb003000000b0024afe02da7asm215554ljk.22.2022.04.01.07.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:39:48 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/3] ui/vnc: refactor arrays of addresses to
 SocketAddressList
Date: Fri,  1 Apr 2022 17:39:34 +0300
Message-Id: <20220401143936.356460-2-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401143936.356460-1-vsementsov@openvz.org>
References: <20220401143936.356460-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x22e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: v.sementsov-og@mail.ru, berrange@redhat.com, bleal@redhat.com,
 armbru@redhat.com, wainersm@redhat.com, f4bug@amsat.org, vsementsov@openvz.org,
 kraxel@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's use SocketAddressList instead of dynamic arrays.
Benefits:
 - Automatic cleanup: don't need specific freeing function and drop
   some gotos.
 - Less indirection: no triple asterix anymore!
 - Prepare for the following commit, which will reuse new interface of
   vnc_display_listen().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 ui/vnc.c | 129 ++++++++++++++++++++++---------------------------------
 1 file changed, 51 insertions(+), 78 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 310a873c21..57cbf18ce6 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3820,30 +3820,19 @@ static int vnc_display_get_address(const char *addrstr,
     return ret;
 }
 
-static void vnc_free_addresses(SocketAddress ***retsaddr,
-                               size_t *retnsaddr)
-{
-    size_t i;
-
-    for (i = 0; i < *retnsaddr; i++) {
-        qapi_free_SocketAddress((*retsaddr)[i]);
-    }
-    g_free(*retsaddr);
-
-    *retsaddr = NULL;
-    *retnsaddr = 0;
-}
-
 static int vnc_display_get_addresses(QemuOpts *opts,
                                      bool reverse,
-                                     SocketAddress ***retsaddr,
-                                     size_t *retnsaddr,
-                                     SocketAddress ***retwsaddr,
-                                     size_t *retnwsaddr,
+                                     SocketAddressList **saddr_list_ret,
+                                     SocketAddressList **wsaddr_list_ret,
                                      Error **errp)
 {
     SocketAddress *saddr = NULL;
     SocketAddress *wsaddr = NULL;
+    g_autoptr(SocketAddressList) saddr_list = NULL;
+    SocketAddressList **saddr_tail = &saddr_list;
+    SocketAddress *single_saddr = NULL;
+    g_autoptr(SocketAddressList) wsaddr_list = NULL;
+    SocketAddressList **wsaddr_tail = &wsaddr_list;
     QemuOptsIter addriter;
     const char *addr;
     int to = qemu_opt_get_number(opts, "to", 0);
@@ -3852,23 +3841,16 @@ static int vnc_display_get_addresses(QemuOpts *opts,
     bool ipv4 = qemu_opt_get_bool(opts, "ipv4", false);
     bool ipv6 = qemu_opt_get_bool(opts, "ipv6", false);
     int displaynum = -1;
-    int ret = -1;
-
-    *retsaddr = NULL;
-    *retnsaddr = 0;
-    *retwsaddr = NULL;
-    *retnwsaddr = 0;
 
     addr = qemu_opt_get(opts, "vnc");
     if (addr == NULL || g_str_equal(addr, "none")) {
-        ret = 0;
-        goto cleanup;
+        return 0;
     }
     if (qemu_opt_get(opts, "websocket") &&
         !qcrypto_hash_supports(QCRYPTO_HASH_ALG_SHA1)) {
         error_setg(errp,
                    "SHA1 hash support is required for websockets");
-        goto cleanup;
+        return -1;
     }
 
     qemu_opt_iter_init(&addriter, opts, "vnc");
@@ -3879,7 +3861,7 @@ static int vnc_display_get_addresses(QemuOpts *opts,
                                      ipv4, ipv6,
                                      &saddr, errp);
         if (rv < 0) {
-            goto cleanup;
+            return -1;
         }
         /* Historical compat - first listen address can be used
          * to set the default websocket port
@@ -3887,13 +3869,16 @@ static int vnc_display_get_addresses(QemuOpts *opts,
         if (displaynum == -1) {
             displaynum = rv;
         }
-        *retsaddr = g_renew(SocketAddress *, *retsaddr, *retnsaddr + 1);
-        (*retsaddr)[(*retnsaddr)++] = saddr;
+        QAPI_LIST_APPEND(saddr_tail, saddr);
     }
 
-    /* If we had multiple primary displays, we don't do defaults
-     * for websocket, and require explicit config instead. */
-    if (*retnsaddr > 1) {
+    if (saddr_list && !saddr_list->next) {
+        single_saddr = saddr_list->value;
+    } else {
+        /*
+         * If we had multiple primary displays, we don't do defaults
+         * for websocket, and require explicit config instead.
+         */
         displaynum = -1;
     }
 
@@ -3903,57 +3888,50 @@ static int vnc_display_get_addresses(QemuOpts *opts,
                                     has_ipv4, has_ipv6,
                                     ipv4, ipv6,
                                     &wsaddr, errp) < 0) {
-            goto cleanup;
+            return -1;
         }
 
         /* Historical compat - if only a single listen address was
          * provided, then this is used to set the default listen
          * address for websocket too
          */
-        if (*retnsaddr == 1 &&
-            (*retsaddr)[0]->type == SOCKET_ADDRESS_TYPE_INET &&
+        if (single_saddr &&
+            single_saddr->type == SOCKET_ADDRESS_TYPE_INET &&
             wsaddr->type == SOCKET_ADDRESS_TYPE_INET &&
             g_str_equal(wsaddr->u.inet.host, "") &&
-            !g_str_equal((*retsaddr)[0]->u.inet.host, "")) {
+            !g_str_equal(single_saddr->u.inet.host, "")) {
             g_free(wsaddr->u.inet.host);
-            wsaddr->u.inet.host = g_strdup((*retsaddr)[0]->u.inet.host);
+            wsaddr->u.inet.host = g_strdup(single_saddr->u.inet.host);
         }
 
-        *retwsaddr = g_renew(SocketAddress *, *retwsaddr, *retnwsaddr + 1);
-        (*retwsaddr)[(*retnwsaddr)++] = wsaddr;
+        QAPI_LIST_APPEND(wsaddr_tail, wsaddr);
     }
 
-    ret = 0;
- cleanup:
-    if (ret < 0) {
-        vnc_free_addresses(retsaddr, retnsaddr);
-        vnc_free_addresses(retwsaddr, retnwsaddr);
-    }
-    return ret;
+    *saddr_list_ret = g_steal_pointer(&saddr_list);
+    *wsaddr_list_ret = g_steal_pointer(&wsaddr_list);
+    return 0;
 }
 
 static int vnc_display_connect(VncDisplay *vd,
-                               SocketAddress **saddr,
-                               size_t nsaddr,
-                               SocketAddress **wsaddr,
-                               size_t nwsaddr,
+                               SocketAddressList *saddr_list,
+                               SocketAddressList *wsaddr_list,
                                Error **errp)
 {
     /* connect to viewer */
     QIOChannelSocket *sioc = NULL;
-    if (nwsaddr != 0) {
+    if (wsaddr_list) {
         error_setg(errp, "Cannot use websockets in reverse mode");
         return -1;
     }
-    if (nsaddr != 1) {
+    if (!saddr_list || saddr_list->next) {
         error_setg(errp, "Expected a single address in reverse mode");
         return -1;
     }
     /* TODO SOCKET_ADDRESS_TYPE_FD when fd has AF_UNIX */
-    vd->is_unix = saddr[0]->type == SOCKET_ADDRESS_TYPE_UNIX;
+    vd->is_unix = saddr_list->value->type == SOCKET_ADDRESS_TYPE_UNIX;
     sioc = qio_channel_socket_new();
     qio_channel_set_name(QIO_CHANNEL(sioc), "vnc-reverse");
-    if (qio_channel_socket_connect_sync(sioc, saddr[0], errp) < 0) {
+    if (qio_channel_socket_connect_sync(sioc, saddr_list->value, errp) < 0) {
         object_unref(OBJECT(sioc));
         return -1;
     }
@@ -3964,20 +3942,18 @@ static int vnc_display_connect(VncDisplay *vd,
 
 
 static int vnc_display_listen(VncDisplay *vd,
-                              SocketAddress **saddr,
-                              size_t nsaddr,
-                              SocketAddress **wsaddr,
-                              size_t nwsaddr,
+                              SocketAddressList *saddr_list,
+                              SocketAddressList *wsaddr_list,
                               Error **errp)
 {
-    size_t i;
+    SocketAddressList *el;
 
-    if (nsaddr) {
+    if (saddr_list) {
         vd->listener = qio_net_listener_new();
         qio_net_listener_set_name(vd->listener, "vnc-listen");
-        for (i = 0; i < nsaddr; i++) {
+        for (el = saddr_list; el; el = el->next) {
             if (qio_net_listener_open_sync(vd->listener,
-                                           saddr[i], 1,
+                                           el->value, 1,
                                            errp) < 0)  {
                 return -1;
             }
@@ -3987,12 +3963,12 @@ static int vnc_display_listen(VncDisplay *vd,
                                          vnc_listen_io, vd, NULL);
     }
 
-    if (nwsaddr) {
+    if (wsaddr_list) {
         vd->wslistener = qio_net_listener_new();
         qio_net_listener_set_name(vd->wslistener, "vnc-ws-listen");
-        for (i = 0; i < nwsaddr; i++) {
+        for (el = wsaddr_list; el; el = el->next) {
             if (qio_net_listener_open_sync(vd->wslistener,
-                                           wsaddr[i], 1,
+                                           el->value, 1,
                                            errp) < 0)  {
                 return -1;
             }
@@ -4010,8 +3986,8 @@ void vnc_display_open(const char *id, Error **errp)
 {
     VncDisplay *vd = vnc_display_find(id);
     QemuOpts *opts = qemu_opts_find(&qemu_vnc_opts, id);
-    SocketAddress **saddr = NULL, **wsaddr = NULL;
-    size_t nsaddr, nwsaddr;
+    g_autoptr(SocketAddressList) saddr_list = NULL;
+    g_autoptr(SocketAddressList) wsaddr_list = NULL;
     const char *share, *device_id;
     QemuConsole *con;
     bool password = false;
@@ -4036,8 +4012,8 @@ void vnc_display_open(const char *id, Error **errp)
     }
 
     reverse = qemu_opt_get_bool(opts, "reverse", false);
-    if (vnc_display_get_addresses(opts, reverse, &saddr, &nsaddr,
-                                  &wsaddr, &nwsaddr, errp) < 0) {
+    if (vnc_display_get_addresses(opts, reverse, &saddr_list, &wsaddr_list,
+                                  errp) < 0) {
         goto fail;
     }
 
@@ -4219,16 +4195,16 @@ void vnc_display_open(const char *id, Error **errp)
     }
     qkbd_state_set_delay(vd->kbd, key_delay_ms);
 
-    if (saddr == NULL) {
-        goto cleanup;
+    if (saddr_list == NULL) {
+        return;
     }
 
     if (reverse) {
-        if (vnc_display_connect(vd, saddr, nsaddr, wsaddr, nwsaddr, errp) < 0) {
+        if (vnc_display_connect(vd, saddr_list, wsaddr_list, errp) < 0) {
             goto fail;
         }
     } else {
-        if (vnc_display_listen(vd, saddr, nsaddr, wsaddr, nwsaddr, errp) < 0) {
+        if (vnc_display_listen(vd, saddr_list, wsaddr_list, errp) < 0) {
             goto fail;
         }
     }
@@ -4237,14 +4213,11 @@ void vnc_display_open(const char *id, Error **errp)
         vnc_display_print_local_addr(vd);
     }
 
- cleanup:
-    vnc_free_addresses(&saddr, &nsaddr);
-    vnc_free_addresses(&wsaddr, &nwsaddr);
+    /* Success */
     return;
 
 fail:
     vnc_display_close(vd);
-    goto cleanup;
 }
 
 void vnc_display_add_client(const char *id, int csock, bool skipauth)
-- 
2.35.1


