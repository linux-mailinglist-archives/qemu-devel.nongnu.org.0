Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953351F6EB8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 22:27:37 +0200 (CEST)
Received: from localhost ([::1]:46620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjTnU-000059-LK
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 16:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjTAD-0001VQ-4V
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:47:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44108
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjTAB-0001N5-8u
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:47:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591904818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dvnqahXf1d5rfZTpxY9l3gz0FJxljM6WL4LK/RhTZRI=;
 b=N51qkyWAAeCe6+shJ95tQKPgs6e1BlJx7iN7D5GnUzpMmenjIN8uYaKXC0IsakWvMYLIQF
 iDsmubGd8z1TyjJcuNY3MnYBhpd4C6HwWlS0c17d1zzuA/lxZ/0ac3xJQwV9vD58AlA4m2
 DH+ks8tKjM8CBAYeTBVKW6Ctxwh2tLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-sXNSvTfgMBWdiur8bDxi7Q-1; Thu, 11 Jun 2020 15:46:53 -0400
X-MC-Unique: sXNSvTfgMBWdiur8bDxi7Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A492C8B8C64
 for <qemu-devel@nongnu.org>; Thu, 11 Jun 2020 19:46:49 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AD0460CC0;
 Thu, 11 Jun 2020 19:46:49 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 078/115] qemu/thread: Mark qemu_thread_exit() with 'noreturn'
 attribute
Date: Thu, 11 Jun 2020 15:44:12 -0400
Message-Id: <20200611194449.31468-79-pbonzini@redhat.com>
In-Reply-To: <20200611194449.31468-1-pbonzini@redhat.com>
References: <20200611194449.31468-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 08:37:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

After upgrading to Ubuntu 20.04 LTS, GCC 9.3 complains:

  util/qemu-thread-posix.c: In function ‘qemu_thread_exit’:
  util/qemu-thread-posix.c:577:6: error: function might be candidate for attribute ‘noreturn’ [-Werror=suggest-attribute=noreturn]
    577 | void qemu_thread_exit(void *retval)
        |      ^~~~~~~~~~~~~~~~

Fix by marking the qemu_thread_exit function with QEMU_NORETURN
to set the 'noreturn' attribute.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/thread.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index d22848138e..06c058fb58 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -177,7 +177,7 @@ void qemu_thread_create(QemuThread *thread, const char *name,
 void *qemu_thread_join(QemuThread *thread);
 void qemu_thread_get_self(QemuThread *thread);
 bool qemu_thread_is_self(QemuThread *thread);
-void qemu_thread_exit(void *retval);
+void qemu_thread_exit(void *retval) QEMU_NORETURN;
 void qemu_thread_naming(bool enable);
 
 struct Notifier;
-- 
2.26.2



