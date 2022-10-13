Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB5A5FD989
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 14:49:48 +0200 (CEST)
Received: from localhost ([::1]:35972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oixel-0004Zn-Uv
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 08:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixSs-0001UK-Lo
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixSp-000429-Ch
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XIg/1tSQpwCe51NMjGVlpyysqmXNOpMa52QyA5cBDRk=;
 b=UCwK4bnZHmTdCSDHvqf55gaLafj80w0kC4PG68JgaVnQ6Q42QeT1o/2QnDu4UaHoYV117N
 sJPI1vCgL9+Ppj4oSck6tOgpCAya7UmijqOaK3Dm4oWle9l98KZ+BcI14qmAUogD8hAjLK
 IfeRpX/JvOQw400zeiHbQEoFP9YYl+I=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-KeebTsV9NUinT0AQSUkDnQ-1; Thu, 13 Oct 2022 08:37:25 -0400
X-MC-Unique: KeebTsV9NUinT0AQSUkDnQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 xc12-20020a170907074c00b007416699ea14so824247ejb.19
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XIg/1tSQpwCe51NMjGVlpyysqmXNOpMa52QyA5cBDRk=;
 b=hitoKGbJk4tUS1XPIgXeExTf4Up/gDyce96BZYf0xYuXA2QiMFjrUg1aGTsY0aRHIE
 PK5/c3hg4tRUTdfdf9QRp3ZyrklfajlGUA+d6lW5DK3uYMK8EZwCkaXSN8PTw/ekPBwR
 Otm3SbpTcyyh/rJUY8QNP/dn7G0Pe5oozGL6kFre9muZNkdGvlRUP+1Afyu/JXqXGS2v
 kufDcHndMPUMEVzWDGLmKGbZKdFyVIrOlLWkoL5R07q8I7yU3lotre3ixomKabCeJzdC
 j1WDMT9IgsRkwHC54tg68nwmZthdc6ehtk1lrrwijnQqkKMQoPjLF+vVEC7sWTm+vML0
 XiFA==
X-Gm-Message-State: ACrzQf1RFKWr3hT6lKQs9ECZ1RXG5S/xriXnIN8SeOMyTf40ct/1yE4v
 e+FO4MWWs7HB98HD5wsyGhqroZNR5uEEB8RW/t2TTYJMXB+Y05IKprX8184yqayZIuxlziaAL0L
 bPq5mDkXX9UQCBDgGmwAQf/JRJgFyZ6goosWlFmMAkNEx90RccMfpKb2juaMR48nepvI=
X-Received: by 2002:a17:907:1b0e:b0:72f:9b43:b98c with SMTP id
 mp14-20020a1709071b0e00b0072f9b43b98cmr26762249ejc.710.1665664643328; 
 Thu, 13 Oct 2022 05:37:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6cFgAfC0gVqLcs5sg0KfwAmHWmYP7xTL1BgKn2Tl6vsijS7fyhiPSnNV+baVkkn1SPpw9QVg==
X-Received: by 2002:a17:907:1b0e:b0:72f:9b43:b98c with SMTP id
 mp14-20020a1709071b0e00b0072f9b43b98cmr26762234ejc.710.1665664643032; 
 Thu, 13 Oct 2022 05:37:23 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a170906078a00b0077205dd15basm2959251ejc.66.2022.10.13.05.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:37:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 03/24] monitor: add missing coroutine_fn annotation
Date: Thu, 13 Oct 2022 14:36:50 +0200
Message-Id: <20221013123711.620631-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013123711.620631-1-pbonzini@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Alberto Faria <afaria@redhat.com>

hmp_block_resize and hmp_screendump are defined as a ".coroutine = true" command,
so they must be coroutine_fn.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/monitor/block-hmp-cmds.c | 2 +-
 include/block/block-hmp-cmds.h | 2 +-
 include/monitor/hmp.h          | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 939a520d17..b6135e9bfe 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -489,7 +489,7 @@ void hmp_nbd_server_stop(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
-void hmp_block_resize(Monitor *mon, const QDict *qdict)
+void coroutine_fn hmp_block_resize(Monitor *mon, const QDict *qdict)
 {
     const char *device = qdict_get_str(qdict, "device");
     int64_t size = qdict_get_int(qdict, "size");
diff --git a/include/block/block-hmp-cmds.h b/include/block/block-hmp-cmds.h
index 50ce0247c3..ba0593c440 100644
--- a/include/block/block-hmp-cmds.h
+++ b/include/block/block-hmp-cmds.h
@@ -38,7 +38,7 @@ void hmp_nbd_server_add(Monitor *mon, const QDict *qdict);
 void hmp_nbd_server_remove(Monitor *mon, const QDict *qdict);
 void hmp_nbd_server_stop(Monitor *mon, const QDict *qdict);
 
-void hmp_block_resize(Monitor *mon, const QDict *qdict);
+void coroutine_fn hmp_block_resize(Monitor *mon, const QDict *qdict);
 void hmp_block_stream(Monitor *mon, const QDict *qdict);
 void hmp_block_passwd(Monitor *mon, const QDict *qdict);
 void hmp_block_set_io_throttle(Monitor *mon, const QDict *qdict);
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index a9cf064ee8..dfbc0c9a2f 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -15,6 +15,7 @@
 #define HMP_H
 
 #include "qemu/readline.h"
+#include "qemu/coroutine.h"
 #include "qapi/qapi-types-common.h"
 
 bool hmp_handle_error(Monitor *mon, Error *err);
@@ -81,7 +82,7 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict);
 void hmp_getfd(Monitor *mon, const QDict *qdict);
 void hmp_closefd(Monitor *mon, const QDict *qdict);
 void hmp_sendkey(Monitor *mon, const QDict *qdict);
-void hmp_screendump(Monitor *mon, const QDict *qdict);
+void coroutine_fn hmp_screendump(Monitor *mon, const QDict *qdict);
 void hmp_chardev_add(Monitor *mon, const QDict *qdict);
 void hmp_chardev_change(Monitor *mon, const QDict *qdict);
 void hmp_chardev_remove(Monitor *mon, const QDict *qdict);
-- 
2.37.3


