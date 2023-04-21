Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B428A6EA706
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:34:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn9O-0008MH-Ai; Fri, 21 Apr 2023 05:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9D-0008Fl-NJ
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9C-00033l-AD
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WQid9SROIKamNzQkR2bAn4ObWBtAmtuNk7Y/JwduSh0=;
 b=BI+aq3dE//s0N87c4CX2E22kFnCCvJvOJCeAX2dF07go4QP9fcvO3cGETaX2hUxkBGxZNE
 VhTyW9sS0lg6L+iUmRxVqeXujg9zru2vTE3qZCkZWrV7NcIKBJVJLTEYoHJX5EFvLUPY3Z
 0vrFhHeVc839bLWz25t+KLFkod8jHkQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-7mlE5-qoM2-OOJASZL5oqQ-1; Fri, 21 Apr 2023 05:33:40 -0400
X-MC-Unique: 7mlE5-qoM2-OOJASZL5oqQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9537db54c94so127358066b.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069618; x=1684661618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WQid9SROIKamNzQkR2bAn4ObWBtAmtuNk7Y/JwduSh0=;
 b=ZEUosCOJbtcmVyD5PXrVHGsCY9daUyFCbfXMMW36LBlEhnYV/jWZ270AHTcUUayy/K
 xJG3wYQ9BS+C5QqSvPpyCdrYV4G5pMtH/XLQBQUDV9K73wX2Lxli9vO/6hfNtp+K1R8f
 m+5wj70Uv/VHBStIdgDi1pHVDuRBXNO9L1aZev3ZB4KhcsK+49F1SOWpptdqAmD9bSBh
 25iW9Z7Rkkayh12G3MsBv5x0hHTE7yfJgOtn7ZqZpjr0aaCRLr8M9qUGqvu3ZZ/tOr2a
 RIHG7cBjPTiVDKCLbNs/drQEACUMXgPkRMl5pUAquZHfl1/LdRRF45X9uPZwO0GEItGR
 JA7w==
X-Gm-Message-State: AAQBX9c8jf5BlwaU/asWRZy/etRxUyjc40QvtqWKKmomHaUQKJhUWoKi
 I8/O2bpNRrA7Erz7iWIzBWz2Nd6ohDmOdL8j6cz5ynjm8LPCryidELGCy0Sb6mNjt8efZNqHayT
 Zpm9VWmG1lWiNE1tcs7anQ7hTyqUhrV6TrH/ieAPLOvCM6qq5/gigSA39NJCfZ4pzg8hjOZgFIx
 MkRA==
X-Received: by 2002:a17:906:b046:b0:92f:33ca:c9a3 with SMTP id
 bj6-20020a170906b04600b0092f33cac9a3mr1761443ejb.71.1682069618667; 
 Fri, 21 Apr 2023 02:33:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350bvwSLn2gaCQqs+SSortlmNsBc5IJhEkqrFF0dYzT1u7OwssHUwiNdmt2rdiBcHP+ZfrDkykw==
X-Received: by 2002:a17:906:b046:b0:92f:33ca:c9a3 with SMTP id
 bj6-20020a170906b04600b0092f33cac9a3mr1761427ejb.71.1682069618290; 
 Fri, 21 Apr 2023 02:33:38 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a1709063d6200b00949691d3183sm1829954ejf.36.2023.04.21.02.33.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/25] monitor: mark mixed functions that can suspend
Date: Fri, 21 Apr 2023 11:33:06 +0200
Message-Id: <20230421093316.17941-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There should be no paths from a coroutine_fn to aio_poll, however in
practice coroutine_mixed_fn will call aio_poll in the !qemu_in_coroutine()
path.  By marking mixed functions, we can track accurately the call paths
that execute entirely in coroutine context, and find more missing
coroutine_fn markers.  This results in more accurate checks that
coroutine code does not end up blocking.

If the marking were extended transitively to all functions that call
these ones, static analysis could be done much more efficiently.
However, this is a start and makes it possible to use vrc's path-based
searches to find potential bugs where coroutine_fns call blocking functions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qapi/qmp/dispatch.h | 4 ++--
 qapi/qmp-dispatch.c         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
index 1e4240fd0dbc..f2e956813a14 100644
--- a/include/qapi/qmp/dispatch.h
+++ b/include/qapi/qmp/dispatch.h
@@ -55,8 +55,8 @@ bool qmp_command_available(const QmpCommand *cmd, Error **errp);
 const char *qmp_command_name(const QmpCommand *cmd);
 bool qmp_has_success_response(const QmpCommand *cmd);
 QDict *qmp_error_response(Error *err);
-QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
-                    bool allow_oob, Monitor *cur_mon);
+QDict *coroutine_mixed_fn qmp_dispatch(const QmpCommandList *cmds, QObject *request,
+                                       bool allow_oob, Monitor *cur_mon);
 bool qmp_is_oob(const QDict *dict);
 
 typedef void (*qmp_cmd_callback_fn)(const QmpCommand *cmd, void *opaque);
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 0990873ec8ec..555528b6bbd3 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -134,8 +134,8 @@ static void do_qmp_dispatch_bh(void *opaque)
  * Runs outside of coroutine context for OOB commands, but in coroutine
  * context for everything else.
  */
-QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
-                    bool allow_oob, Monitor *cur_mon)
+QDict *coroutine_mixed_fn qmp_dispatch(const QmpCommandList *cmds, QObject *request,
+                                       bool allow_oob, Monitor *cur_mon)
 {
     Error *err = NULL;
     bool oob;
-- 
2.40.0


