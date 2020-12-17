Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D1D2DCEAE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:46:04 +0100 (CET)
Received: from localhost ([::1]:59236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpprH-0001WG-P4
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:46:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmH-0004ga-Ba
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:40:55 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:41297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmE-0007iD-Nj
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:40:52 -0500
Received: by mail-ed1-x533.google.com with SMTP id i24so27890389edj.8
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BGSrQZxoaxOkU9kafkVAP7t2jTM7OoA0anXI1A0IxZI=;
 b=h2u+x8H17w5dgB7Zy+vi1CKi47rkGkRpQxkhiFWFm70WtEJC0J5soTEipiQASVBz1N
 OOpTrADHtqTod2nhkOVvTmTVQyIKTsGiFypw/gD6tQZwMp94FNj8DbvZ15KGV0Es+AKp
 X3JMjwLpj8aBN3zO5Cflgd7Opto2lrJQwmd6eoHzSfl/2R6aNj/+7hCL8I9GewQ9+tZR
 /G7Rin2+YZUTDzO58SIMmfddBL2zuGSljDpKbD77wg1bKsgKCNzSAl9Vci5F0RNadOol
 he3lZ5MSAQeF+jRYHVH1WAUjDdR+iVblokMnIVjgF1A/BbmKTVrR7ormQaq+T0i20KVC
 cDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BGSrQZxoaxOkU9kafkVAP7t2jTM7OoA0anXI1A0IxZI=;
 b=nWtNijCEpyGypE+UaOGROAAYKiAMOQLKtaBbTcRU5EFz2VXvd0QVNNx6BMhQqe1EwF
 7dl020RiBr3bZiG4jsyq0amKiv+dRwU21WnExpSNx3I8GeZGKQW0xBjAWaqqkLxH0YnA
 2/fmHBhkyvSHkUhV2efPzJdoIBXaakcSHhGfYI9tS8riOuarbJw/9dZgPV5BxO2R1PYI
 n/R9PxvLl59Os4GHFPGB0JfqEkAME9y0VPbvjJRhSXkUIf0/bowmQPIV+6WnCTFrRKk3
 lstZEvdzv8L98CCe1vOvjYXmJI/CwezEt5pvFsSgy+K2284B+UihtQ5pBI+sgJyrx+tr
 2gOw==
X-Gm-Message-State: AOAM530td0bMDOk0HkarPCdVE5eqwnsPo+dD7EDnbKgE8MjbP5xwA4FS
 X7C5VJc58Jkt8PJr3TQ85DnKLh0ppfo=
X-Google-Smtp-Source: ABdhPJzpSKWc8piETXr/V8+EnJ9MXqV8Aqu2XNSW1gV35EyF0FyiZG3VatL3a9qJkCoed+U+yY213Q==
X-Received: by 2002:a05:6402:139a:: with SMTP id
 b26mr37855178edv.47.1608198049086; 
 Thu, 17 Dec 2020 01:40:49 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rs27sm3463677ejb.21.2020.12.17.01.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:40:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/18] curl: remove compatibility code, require 7.29.0
Date: Thu, 17 Dec 2020 10:40:28 +0100
Message-Id: <20201217094044.46462-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094044.46462-1-pbonzini@redhat.com>
References: <20201217094044.46462-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=83=C2=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cURL 7.16.0 was released in October 2006.  Just remove code that is
in all likelihood not being used anywhere, and require the oldest version
found in currently supported distros, which is 7.29.0 from CentOS 7.

pkg-config is enough for QEMU, since it does not need extra information
such as the path for certicate authorities.  All supported platforms
today will all have pkg-config for curl, so we can drop curl-config.

Suggested-by: Daniel Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/curl.c | 28 ----------------------------
 configure    |  9 ++-------
 2 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index d24a4c5897..4ff895df8f 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -37,26 +37,6 @@
 
 // #define DEBUG_VERBOSE
 
-#if LIBCURL_VERSION_NUM >= 0x071000
-/* The multi interface timer callback was introduced in 7.16.0 */
-#define NEED_CURL_TIMER_CALLBACK
-#define HAVE_SOCKET_ACTION
-#endif
-
-#ifndef HAVE_SOCKET_ACTION
-/* If curl_multi_socket_action isn't available, define it statically here in
- * terms of curl_multi_socket. Note that ev_bitmask will be ignored, which is
- * less efficient but still safe. */
-static CURLMcode __curl_multi_socket_action(CURLM *multi_handle,
-                                            curl_socket_t sockfd,
-                                            int ev_bitmask,
-                                            int *running_handles)
-{
-    return curl_multi_socket(multi_handle, sockfd, running_handles);
-}
-#define curl_multi_socket_action __curl_multi_socket_action
-#endif
-
 #define PROTOCOLS (CURLPROTO_HTTP | CURLPROTO_HTTPS | \
                    CURLPROTO_FTP | CURLPROTO_FTPS)
 
@@ -140,7 +120,6 @@ typedef struct BDRVCURLState {
 static void curl_clean_state(CURLState *s);
 static void curl_multi_do(void *arg);
 
-#ifdef NEED_CURL_TIMER_CALLBACK
 /* Called from curl_multi_do_locked, with s->mutex held.  */
 static int curl_timer_cb(CURLM *multi, long timeout_ms, void *opaque)
 {
@@ -156,7 +135,6 @@ static int curl_timer_cb(CURLM *multi, long timeout_ms, void *opaque)
     }
     return 0;
 }
-#endif
 
 /* Called from curl_multi_do_locked, with s->mutex held.  */
 static int curl_sock_cb(CURL *curl, curl_socket_t fd, int action,
@@ -433,7 +411,6 @@ static void curl_multi_do(void *arg)
 
 static void curl_multi_timeout_do(void *arg)
 {
-#ifdef NEED_CURL_TIMER_CALLBACK
     BDRVCURLState *s = (BDRVCURLState *)arg;
     int running;
 
@@ -446,9 +423,6 @@ static void curl_multi_timeout_do(void *arg)
 
     curl_multi_check_completion(s);
     qemu_mutex_unlock(&s->mutex);
-#else
-    abort();
-#endif
 }
 
 /* Called with s->mutex held.  */
@@ -598,10 +572,8 @@ static void curl_attach_aio_context(BlockDriverState *bs,
     s->multi = curl_multi_init();
     s->aio_context = new_context;
     curl_multi_setopt(s->multi, CURLMOPT_SOCKETFUNCTION, curl_sock_cb);
-#ifdef NEED_CURL_TIMER_CALLBACK
     curl_multi_setopt(s->multi, CURLMOPT_TIMERDATA, s);
     curl_multi_setopt(s->multi, CURLMOPT_TIMERFUNCTION, curl_timer_cb);
-#endif
 }
 
 static QemuOptsList runtime_opts = {
diff --git a/configure b/configure
index 42b39544d4..c0a3e1556b 100755
--- a/configure
+++ b/configure
@@ -3428,17 +3428,12 @@ done
 ##########################################
 # curl probe
 if test "$curl" != "no" ; then
-  if $pkg_config libcurl --exists; then
-    curlconfig="$pkg_config libcurl"
-  else
-    curlconfig=curl-config
-  fi
   cat > $TMPC << EOF
 #include <curl/curl.h>
 int main(void) { curl_easy_init(); curl_multi_setopt(0, 0, 0); return 0; }
 EOF
-  curl_cflags=$($curlconfig --cflags 2>/dev/null)
-  curl_libs=$($curlconfig --libs 2>/dev/null)
+  curl_cflags=$($pkg_config libcurl --cflags 2>/dev/null)
+  curl_libs=$($pkg_config libcurl --libs 2>/dev/null)
   if compile_prog "$curl_cflags" "$curl_libs" ; then
     curl=yes
   else
-- 
2.29.2



