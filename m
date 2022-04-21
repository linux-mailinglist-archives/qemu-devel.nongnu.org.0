Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEADB50A210
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:21:27 +0200 (CEST)
Received: from localhost ([::1]:38090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXgU-0003KB-IS
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXEC-0005m4-GU
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:52:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXEA-0006Nt-TG
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:52:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdQyA2C822oZFMPY2UeAT5HEc+HSQi+Jzp6MJ+UeXzs=;
 b=K/JA3VGReg87C9mkPDFJpWYuG5PmSUdVCbVw/eDQ7+b6VK1Y9ZPXrbJvW+CE9oZFttrnku
 KHF5noeNx7RabjgOqzdTgQF395bqimemBxdkiwAW3Iu758YFVAG2H1+sfy2oxoXR7IcEs2
 kdE1Z7SUFHFsF6Wr3dy21P/uvFaxP8I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-Nt3cVU5uN0yoDUvuGIfOyA-1; Thu, 21 Apr 2022 09:52:09 -0400
X-MC-Unique: Nt3cVU5uN0yoDUvuGIfOyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEA163804527;
 Thu, 21 Apr 2022 13:52:08 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7E4BC28110;
 Thu, 21 Apr 2022 13:52:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 26/30] util: use qemu_create() in qemu_write_pidfile()
Date: Thu, 21 Apr 2022 17:49:36 +0400
Message-Id: <20220421134940.2887768-27-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 richard.henderson@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

qemu_open_old(O_CREATE) should be replaced with qemu_create() which
handles Error reporting.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220420132624.2439741-38-marcandre.lureau@redhat.com>
---
 util/oslib-posix.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 9751bc6be9d7..bcb35c3c8246 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -138,9 +138,8 @@ bool qemu_write_pidfile(const char *path, Error **errp)
             .l_len = 0,
         };
 
-        fd = qemu_open_old(path, O_CREAT | O_WRONLY, S_IRUSR | S_IWUSR);
+        fd = qemu_create(path, O_WRONLY, S_IRUSR | S_IWUSR, errp);
         if (fd == -1) {
-            error_setg_errno(errp, errno, "Cannot open pid file");
             return false;
         }
 
-- 
2.36.0


