Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C11B6D9403
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 12:28:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkMqu-00061N-BL; Thu, 06 Apr 2023 06:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkMqt-000619-5O
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:28:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkMqr-00016y-Im
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680776901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DNkvfx+kGEh89wIXPzxwukB9fxTI4/0RedqvfKhPobU=;
 b=ezCksBasWFx1mY30WNtoai/1+xyWJBEjDl59Ds58ZNB8QmyYLKz7gua8vxvciEuvR/zlPD
 rtES6rV6bzIkbomGM4UWkQpqSWZYW38voQ5ZBb4qr10s8vUiR865d9wUnFA6/T+s49FMGK
 ZK8+/GU7IYFPZNfdMRKrwgP1b9e4Nf4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-3LWSSKxpOQOgaj3-azLAow-1; Thu, 06 Apr 2023 06:28:17 -0400
X-MC-Unique: 3LWSSKxpOQOgaj3-azLAow-1
Received: by mail-ed1-f72.google.com with SMTP id
 m17-20020a509991000000b0050463defdabso776229edb.6
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 03:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680776896; x=1683368896;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DNkvfx+kGEh89wIXPzxwukB9fxTI4/0RedqvfKhPobU=;
 b=s4PJU8haQ57xDqf1vNS580hExvEiRc+OYjFYjLFRjt/I4ySsloxcvtYITuBcVXdobI
 tJRRiveokn82dkgUwjb3QAtFSPhzzevfqTf7St7bbupSY7EaF1smTEznBxKZEWk/X15X
 7raL4hobFZUkgpH0ZcTK6WsuV3KBPIeJos0Zsb1j8KJS5waBzLtUh2i7i+wIZqIuLvYp
 bA2AZzGlUgw9RSMOgwq78H6mW5sYZLEVs9gOBDGQghh+UT6DwaHdDjWfesOjDPGzB6N2
 /z1AQU+JdxiDDQctSzcgFMKm1kAhLjKeufg0YFabkvvsIOBikL+dWaN+e1hQ4b5wjDCr
 VXvw==
X-Gm-Message-State: AAQBX9eAT9ipJZjGSTxEA1Qf/nddcFD+eL7uH14oowz6DQVuuEgqfv1G
 rKaNoOAYFGvsWxjQIg89rxp9D9FaI0MfmeNhbuWQMMIsvDwIXyhURyzv7xtP5fMLSlmK/OfdDGW
 7b4KVuCejTHdPD7+MrDkHCeUQDpva3LWPFEZjvvRbYPzX/tM5VXJ9DohcYtgiM1w8/1eJtvnk+w
 k=
X-Received: by 2002:a17:907:1dd1:b0:933:44ef:e5b5 with SMTP id
 og17-20020a1709071dd100b0093344efe5b5mr6622351ejc.30.1680776896094; 
 Thu, 06 Apr 2023 03:28:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350YPCBR0q7ZDJpllmdl++OSzKnEWjJaKoDpIiMJlSMgZHkGVvIFN7reddUN8jo1lTa+/IIyVAA==
X-Received: by 2002:a17:907:1dd1:b0:933:44ef:e5b5 with SMTP id
 og17-20020a1709071dd100b0093344efe5b5mr6622338ejc.30.1680776895811; 
 Thu, 06 Apr 2023 03:28:15 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 kg13-20020a17090776ed00b008bc8ad41646sm621247ejc.157.2023.04.06.03.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 03:28:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com
Subject: [PATCH] monitor: mark mixed functions that can suspend
Date: Thu,  6 Apr 2023 12:28:14 +0200
Message-Id: <20230406102814.243516-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
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
2.39.2


