Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9140E37437C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:28:12 +0200 (CEST)
Received: from localhost ([::1]:34540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leLJj-0005Kq-8h
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leKtw-0006F6-Kb
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:01:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leKtk-0002S6-Oy
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:01:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620234080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HTcbf9xflzHTyoKg03h2p2pH+wnGCXbbU65n0yQBFMc=;
 b=hQfNJcpvtkrwFNuJF0k/xR7N3eRJRDGGSVjHz94rtahbKrPr9JaGj/8f6rTBftz4mzLgUk
 NBylQw7fCwgpxDAdrhhnAPpIvDzvFzwMEmSzDv2L7pxGudkZ7XXaa1HoqR7FszLnKWaSvr
 o6LT6unDyFtWWU7I3HZT8QqpCQ024nM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-tpI-Gy0rO7uG3eZBlPZKIA-1; Wed, 05 May 2021 13:01:18 -0400
X-MC-Unique: tpI-Gy0rO7uG3eZBlPZKIA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l185-20020a1c25c20000b029014b0624775eso1800803wml.6
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 10:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HTcbf9xflzHTyoKg03h2p2pH+wnGCXbbU65n0yQBFMc=;
 b=CRJ1rnK1oxxCuC1iIYjON6koShRlhAwYIWRM39SKDpKbIjQUqLG9FJWQQQYFIsG7/H
 UsW59wBQ3D3aojZpvpo9TyLUg4GReW1YdVNQEMvr8VFEgmBJQFL8Ji+fs5ufRk3oV0PQ
 vZ5pBncgITas2g1NI+7iFVFaQZBsORi1Rt7B5EQYKgsdkNsgdOfQC5+mOiMtK4iXztiw
 Guh4T9+5xcD1zRqfyMk1x5O9xGCAJPknieii4oYJ3t1o0Py4JdfbJ7KCGsLgUExTozCc
 O8w5ZgPQBdnaYXSr2fjaJcBfl/Oeqg1jJyciYgSEyeEVizyYmuV+B2FrnCAwcOyyUj9K
 7I2g==
X-Gm-Message-State: AOAM5339KuQAco3kVKT/1UVWuqOqtEpzSwtQQqIkAj4IHlhgFb9nX2X/
 6pCV3kXeKoX8S+7Slzb1wJZEf4cTqPPKzxhvewkhXZWQUmsIGiPrxS1mNagELC0E5qF4noLmVS3
 5COUeNstYlfblOw1NOGEpGW17atNqNDFdSreZcgB5Xwxd97/7VI7PAZOIZcqIY+8G
X-Received: by 2002:a05:6000:1789:: with SMTP id
 e9mr46358wrg.110.1620234076890; 
 Wed, 05 May 2021 10:01:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVNOl9XyhslOnr9Z5qwwLZOpH94LvB1BxuuJ5+7dkBrOMXzT4/nk0o52wVuxUxBRv/bIV84Q==
X-Received: by 2002:a05:6000:1789:: with SMTP id
 e9mr46326wrg.110.1620234076675; 
 Wed, 05 May 2021 10:01:16 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id v18sm24213571wro.18.2021.05.05.10.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 10:01:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] gdbstub: Replace alloca() by g_new()
Date: Wed,  5 May 2021 19:00:54 +0200
Message-Id: <20210505170055.1415360-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505170055.1415360-1-philmd@redhat.com>
References: <20210505170055.1415360-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kyle Evans <kevans@freebsd.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".

Replace it by a g_new() call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 gdbstub.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 0d5569ee539..72b4be89c7b 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1475,7 +1475,9 @@ static int process_string_cmd(void *user_ctx, const char *data,
                               const GdbCmdParseEntry *cmds, int num_cmds)
 {
     int i, schema_len, max_num_params = 0;
-    GdbCmdContext gdb_ctx;
+    g_autofree GdbCmdVariant *params = g_new(GdbCmdVariant,
+                                        GDB_CMD_PARSE_ENTRY_SCHEMA_SIZE / 2);
+    GdbCmdContext gdb_ctx = { .params = params };
 
     if (!cmds) {
         return -1;
@@ -1499,8 +1501,6 @@ static int process_string_cmd(void *user_ctx, const char *data,
             max_num_params = schema_len / 2;
         }
 
-        gdb_ctx.params =
-            (GdbCmdVariant *)alloca(sizeof(*gdb_ctx.params) * max_num_params);
         memset(gdb_ctx.params, 0, sizeof(*gdb_ctx.params) * max_num_params);
 
         if (cmd_parse_params(&data[strlen(cmd->cmd)], cmd->schema,
-- 
2.26.3


