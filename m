Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644DF39215C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:19:35 +0200 (CEST)
Received: from localhost ([::1]:40832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm002-0003dQ-UT
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1llzma-0003fg-Pf
 for qemu-devel@nongnu.org; Wed, 26 May 2021 16:05:36 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:46734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1llzmT-0001lj-Lp
 for qemu-devel@nongnu.org; Wed, 26 May 2021 16:05:36 -0400
Received: by mail-qk1-x72d.google.com with SMTP id 76so2332834qkn.13
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 13:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uEVF6V5qswU7gZORk/2Z3j7ffsQzHw0h8zxPYYvkTjk=;
 b=FBMtoiLFwv3B/698SuEjqM86uluMNmMc/95zcihCWR3iiqMguv7sPBS4bOfP9X2B9H
 dCMJE93vvXh9CVBy1QV6rKXlriEmU3bsGzVfrWhtPwtLZWHBxaB328ZzSVMnQ7mXvcYJ
 n9GiKGrFFcLLQMjcVAG6zHEJnZr3nFNeteYrqUh1dFDO9TFA4au4VirOynmYUrBavyuN
 0OeGu0uYX6lvrPlYUsTDA92Nxn17TB2/7A+OoOLJqRXQ4m56sQCVD5m8tpdceJYWTrTa
 uvvs8EiHqGHlMVucrTcoTmfk5hBl/fDrOgXyQOk3xrfEGUtaANqgQAjNI8h460cqB0ap
 OByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uEVF6V5qswU7gZORk/2Z3j7ffsQzHw0h8zxPYYvkTjk=;
 b=DqIcXzGQas8PnfTHYHuSKvwZEIr7LUS3AWiyXJTEkX1SMOqbL+gKraJfmn9ADQ1Kk6
 MosjTr/ckJUNZPxDTSgt1TnJmhrpOO7/2VJHBo5w3lL2PMDcoSGIG7tEk5BLzowtL9v1
 GBR0jED+wUgwRHYgRuUg5hDk65gm7xWMzlDXoLYuEzsVzAR3Fol4gUrFRe7KJhyH1CZL
 ogRT06IhvN66RNZvMpdpBTP8r85/H4BBRtI+Q1mTR0BGN3MkeTCv6viFTwODAZJFEUMf
 zveS4g30NL/yqarrbauAJFz2inbJ9nN2BzRTbMBlfsWd+dYprmlJ9gnkZ0iZGFBw5Ywm
 7W5Q==
X-Gm-Message-State: AOAM532b68sTUYMNw2SwV+9Eq4AxJlih2/ii+YnMkGiYJ6vdr/S104KZ
 LCJgQQaxAKOTfuieR/h5GsU=
X-Google-Smtp-Source: ABdhPJzUie3odpVtco5obcKfqHTWa1u/0Qey4gy4CUsP/g6Fz0+5IBw+FnB1t4C/s5QmLUbXESumzQ==
X-Received: by 2002:a37:83c5:: with SMTP id
 f188mr42118089qkd.271.1622059526725; 
 Wed, 26 May 2021 13:05:26 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:14c:482:7b04:dff0:eb42:c6da:8218])
 by smtp.gmail.com with ESMTPSA id a24sm18132qtp.39.2021.05.26.13.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 13:05:26 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH 1/1] yank: Unregister function when using TLS migration
Date: Wed, 26 May 2021 17:05:40 -0300
Message-Id: <20210526200540.1088333-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=leobras.c@gmail.com; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras.c@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After yank feature was introduced, whenever migration is started using TLS,
the following error happens in both source and destination hosts:

(qemu) qemu-kvm: ../util/yank.c:107: yank_unregister_instance:
Assertion `QLIST_EMPTY(&entry->yankfns)' failed.

This happens because of a missing yank_unregister_function() when using
qio-channel-tls.

Fix this by also allowing TYPE_QIO_CHANNEL_TLS object type to perform
yank_unregister_function() in channel_close() and multifd_load_cleanup().

Fixes: 50186051f ("Introduce yank feature")
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1964326
Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 migration/multifd.c           | 5 +++--
 migration/qemu-file-channel.c | 7 +++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 0a4803cfcc..be8656f4c0 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -987,8 +987,9 @@ int multifd_load_cleanup(Error **errp)
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
 
-        if (object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_SOCKET)
-            && OBJECT(p->c)->ref == 1) {
+        if ((object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_SOCKET) ||
+            (object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_TLS)))  &&
+            OBJECT(p->c)->ref == 1) {
             yank_unregister_function(MIGRATION_YANK_INSTANCE,
                                      migration_yank_iochannel,
                                      QIO_CHANNEL(p->c));
diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index 876d05a540..4f79090f3f 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -26,6 +26,7 @@
 #include "qemu-file-channel.h"
 #include "qemu-file.h"
 #include "io/channel-socket.h"
+#include "io/channel-tls.h"
 #include "qemu/iov.h"
 #include "qemu/yank.h"
 #include "yank_functions.h"
@@ -111,6 +112,12 @@ static int channel_close(void *opaque, Error **errp)
         yank_unregister_function(MIGRATION_YANK_INSTANCE,
                                  migration_yank_iochannel,
                                  QIO_CHANNEL(ioc));
+    } else if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS)
+               && OBJECT(ioc)->ref == 1) {
+        QIOChannelTLS *tioc = opaque;
+        yank_unregister_function(MIGRATION_YANK_INSTANCE,
+                                 migration_yank_iochannel,
+                                 QIO_CHANNEL(tioc->master));
     }
     object_unref(OBJECT(ioc));
     return ret;
-- 
2.31.1


