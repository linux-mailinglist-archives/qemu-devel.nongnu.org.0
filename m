Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DC7508AA5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:20:14 +0200 (CEST)
Received: from localhost ([::1]:57646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBBl-0001Qk-V5
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAQ6-0002hD-Ph
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:30:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAPp-0005Mg-Mu
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/msjsjin86PpMTJVW/Yoc/+TAB6YZruzk8yBTthspPQ=;
 b=DZNsN0JBZ6Qmf+FWXpK3t6RUvHxpj3ZpXcFDjDgJQxc7SIctKqDjELwxmmC9FUG9/nEtYe
 h+aDdqsqiNPDSATMMHcdzmB/by7xnMQ5HKnDObqfdEiPGUo17l+lIQ2l4wzSoXtIUEDa4D
 zjq2JclwsZ27o7W/SEQY9m9y9Mw6K6E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-wYrO7v2KPsCbypywmuuXog-1; Wed, 20 Apr 2022 09:30:38 -0400
X-MC-Unique: wYrO7v2KPsCbypywmuuXog-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AF4D85A5BC
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 13:30:38 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F64B46A39D;
 Wed, 20 Apr 2022 13:30:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 36/41] util: use qemu_write_full() in qemu_write_pidfile()
Date: Wed, 20 Apr 2022 17:26:19 +0400
Message-Id: <20220420132624.2439741-37-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Mostly for correctness.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 util/oslib-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 63d2c6a76a77..e376f799b47e 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -184,7 +184,7 @@ bool qemu_write_pidfile(const char *path, Error **errp)
     }
 
     snprintf(pidstr, sizeof(pidstr), FMT_pid "\n", getpid());
-    if (write(fd, pidstr, strlen(pidstr)) != strlen(pidstr)) {
+    if (qemu_write_full(fd, pidstr, strlen(pidstr)) != strlen(pidstr)) {
         error_setg(errp, "Failed to write pid file");
         goto fail_unlink;
     }
-- 
2.35.1.693.g805e0a68082a


