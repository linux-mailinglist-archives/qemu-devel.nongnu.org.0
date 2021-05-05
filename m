Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAFF374358
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:12:59 +0200 (CEST)
Received: from localhost ([::1]:34328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leL50-0000tC-OL
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leKts-0006Aj-Oh
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:01:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leKth-0002QN-BL
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:01:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620234075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v6dDjUUr1jX0kd69bV9ZwwKe4Jn9sJZazvtpBwyg5KA=;
 b=HuHPjlRmvOXoIAX9OjGApArBBrEAjpV5zWBeIxMyZMV0MYi8Kktd/+DxkBPU76FJX1Aprf
 2NX2QcFfUoi4pjCctKKRH4qNu7FyTkMT/zqhaUhGNIurIGDjRndIh1TzwteHF+gZFcGzyv
 wbqOb3ILmSxf9bPMa9kRIc27eD1SgPc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-pIVsGVS3P7Cvu4XR43clhA-1; Wed, 05 May 2021 13:01:13 -0400
X-MC-Unique: pIVsGVS3P7Cvu4XR43clhA-1
Received: by mail-wr1-f70.google.com with SMTP id
 l2-20020adf9f020000b029010d6bb7f1cbso948418wrf.7
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 10:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v6dDjUUr1jX0kd69bV9ZwwKe4Jn9sJZazvtpBwyg5KA=;
 b=n1xBmvuXtYyQDO9Qhvzb3SxVcDhZ5McKOAXSy38MnML7qS+t/k6MhFktK9Tp0HgmgX
 c1F/gsZ3iKaPim/La2SrnpnuhUdLoJNiCeL334SlkO4A8mzdk9IrodlBh3Zohk8GhTIg
 Dm2gA6QBIGdovAwO+mFMWnX75SCfBkow7JG/QM6FpsUbOxxZvlSKPnOB7LjusvkVUyRM
 raPGttmmlBWjWUodOZ/VruZanNKcTnkneGITj11MXj4pJQnw6v6vUHU8sa+IN1eG546h
 xwb2UInaOBhfgntZZisMFBN51ELcN5GbXxboWzgraQYXRR2wbPHtY7YIFmDJsX/tA8dU
 OPjA==
X-Gm-Message-State: AOAM530btwd49UTcoCpZO6fppwjYsb8Sx5jGdOPyt0/aLuuJ9AtoLnK/
 Yhzom0DpgcKnRWqcJD8OfbNeWIWlvAOJyzttQP0iGi+hwJMlTI4nmfevnmR4sCvNETHklpVhMFE
 kJfY32KvldK2/FScJHy0op5ct9SlPysTKoTxEk/Fb0FPN+4Li+l7tcSvKIQ8Se/KW
X-Received: by 2002:a5d:4cce:: with SMTP id c14mr12205wrt.29.1620234071948;
 Wed, 05 May 2021 10:01:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUVOp3pO1Wn/Eg12ZEK46NsmpT3zPU6R7yIqJ0Q6XmSE4diSFvuXPe8REXrt2tEMJBnmTrMA==
X-Received: by 2002:a5d:4cce:: with SMTP id c14mr12167wrt.29.1620234071681;
 Wed, 05 May 2021 10:01:11 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id n5sm16047652wrx.31.2021.05.05.10.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 10:01:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] gdbstub: Use fixed-size array in GdbCmdParseEntry instead
 of pointer
Date: Wed,  5 May 2021 19:00:53 +0200
Message-Id: <20210505170055.1415360-4-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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

GdbCmdParseEntry should have enough room with 20 chars for the command
string, and 8 for the schema. Add the GDB_CMD_PARSE_ENTRY_CMD_SIZE and
GDB_CMD_PARSE_ENTRY_SCHEMA_SIZE definitions.

Do not use pointer to string of unknown length, but array of fixed
size. Having constant size will help use to remove the alloca() call
in process_string_cmd() in the next commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 gdbstub.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 6f663cbd8dd..0d5569ee539 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1457,11 +1457,13 @@ typedef void (*GdbCmdHandler)(GdbCmdContext *gdb_ctx, void *user_ctx);
  * '.' -> Skip 1 char unless reached "\0"
  * Any other value is treated as the delimiter value itself
  */
+#define GDB_CMD_PARSE_ENTRY_CMD_SIZE    20
+#define GDB_CMD_PARSE_ENTRY_SCHEMA_SIZE 8
 typedef struct GdbCmdParseEntry {
     GdbCmdHandler handler;
-    const char *cmd;
+    const char cmd[GDB_CMD_PARSE_ENTRY_CMD_SIZE];
     bool cmd_startswith;
-    const char *schema;
+    const char schema[GDB_CMD_PARSE_ENTRY_SCHEMA_SIZE];
 } GdbCmdParseEntry;
 
 static inline int startswith(const char *string, const char *pattern)
@@ -1481,14 +1483,14 @@ static int process_string_cmd(void *user_ctx, const char *data,
 
     for (i = 0; i < num_cmds; i++) {
         const GdbCmdParseEntry *cmd = &cmds[i];
-        g_assert(cmd->handler && cmd->cmd);
+        g_assert(cmd->handler && *cmd->cmd);
 
         if ((cmd->cmd_startswith && !startswith(data, cmd->cmd)) ||
             (!cmd->cmd_startswith && strcmp(cmd->cmd, data))) {
             continue;
         }
 
-        if (cmd->schema) {
+        if (*cmd->schema) {
             schema_len = strlen(cmd->schema);
             if (schema_len % 2) {
                 return -2;
-- 
2.26.3


