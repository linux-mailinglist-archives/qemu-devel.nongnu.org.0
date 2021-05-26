Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3041A392298
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 00:17:12 +0200 (CEST)
Received: from localhost ([::1]:39716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1pu-00035W-Qp
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 18:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1lm1p5-0002PZ-SL
 for qemu-devel@nongnu.org; Wed, 26 May 2021 18:16:19 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:45754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1lm1p3-0007R4-Uc
 for qemu-devel@nongnu.org; Wed, 26 May 2021 18:16:19 -0400
Received: by mail-qt1-x82f.google.com with SMTP id h24so2099951qtm.12
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 15:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+ovqHFqkdidPii4KKMNG98Mh4QBz+vYRrSLL/YzjKuA=;
 b=bR2eg/w/HcDZ+XsLt1ZjWuGybTJEhY3WLFACG+poPowVmjG7ihnR3WwMvbaDMBbNtJ
 +KkT+vjGgK39Wj2aMs6LgTxnvDJe+KeRYM59D8UvEJsLjshgEXBNH1gWRX9r9ELFgz5z
 28+410Ib00bg/VhiqdRB7PXxcHOEclAaFBLcqHxtrTPUeRw74bizfwqHr67eDEGa8xGf
 +i+840MS0zStsBRUBOjBwJwMenq/dRJzbNXIj3B+W2nmM0citPOTA1yqqaF14pOTOUeO
 jwxGmHC/gYbC4aa+DiiwPjsyIJAtPl922IPpNjgWmsYC9RAe9eckTcz1JtI+7dOkh3GC
 1RJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+ovqHFqkdidPii4KKMNG98Mh4QBz+vYRrSLL/YzjKuA=;
 b=kF5d3FXEBZOy+YKMa3xlF1qst7+m4nffxYDVzFvMxMURzVY7SRa87XNMlnwdOepKZx
 JzePysoHB78cct0odghRTg0BPZk059TxKYxtrhJWjgM1i+2lF5n2jGRheR85BrbU5ajl
 Gk+g5Uvt9/SIP+px1dGfEIHWrNWggsMBeQwREHIyhlgUgl+rh4q6qwBX8CdEHO9is+a4
 7x12uPWJzNHPPOYTxXtO7wl2ShAmBo4MsWKYPptKT4QS1MNV4dCuRbcSKunxQwus0OSr
 cdcsPWTH0Pvs/vfrVZvoOcV98vc52dwMZOc8OCXQl8+1kQLVKxSMC6CaTdZUEoz9I6Me
 WYng==
X-Gm-Message-State: AOAM530GIKuIr8Z5RweuX4FPxp8s5B5IKepgv/ku3pDQ+7pGwiIwCi9M
 CAiYcib8e3kjUE7tGBVS9L0=
X-Google-Smtp-Source: ABdhPJwryQKLdgsoOvrz18eBjqF8j0rCYAf3RBTtYagwsulSrHEFlvwJgM7yaV5PuB1arSOJHUWqYw==
X-Received: by 2002:a05:622a:1356:: with SMTP id
 w22mr340508qtk.253.1622067376970; 
 Wed, 26 May 2021 15:16:16 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:14c:482:7b04:dff0:eb42:c6da:8218])
 by smtp.gmail.com with ESMTPSA id m10sm156555qkk.113.2021.05.26.15.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 15:16:16 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v2 1/1] yank: Unregister function when using TLS migration
Date: Wed, 26 May 2021 19:16:16 -0300
Message-Id: <20210526221615.1093506-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=leobras.c@gmail.com; helo=mail-qt1-x82f.google.com
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

--
Changes since v1:
- Cast p->c to QIOChannelTLS into multifd_load_cleanup()
---
 migration/multifd.c           | 6 ++++++
 migration/qemu-file-channel.c | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/migration/multifd.c b/migration/multifd.c
index 0a4803cfcc..81de11c6fc 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -992,6 +992,12 @@ int multifd_load_cleanup(Error **errp)
             yank_unregister_function(MIGRATION_YANK_INSTANCE,
                                      migration_yank_iochannel,
                                      QIO_CHANNEL(p->c));
+        } else if (object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_TLS)
+                   && OBJECT(p->c)->ref == 1) {
+            QIOChannelTLS *tioc = QIO_CHANNEL_TLS(p->c);
+            yank_unregister_function(MIGRATION_YANK_INSTANCE,
+                                     migration_yank_iochannel,
+                                     QIO_CHANNEL(tioc->master));
         }
 
         object_unref(OBJECT(p->c));
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


