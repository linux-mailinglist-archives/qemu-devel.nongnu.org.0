Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF928380993
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:32:39 +0200 (CEST)
Received: from localhost ([::1]:46322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWze-0000gd-Oa
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWjq-00015t-JJ
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:16:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWjb-0005A6-20
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620994562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WJZv7SxlH6CHVsVI4RrkhfkE0xypB+VndKOPWbT/v5Q=;
 b=TFTej4egHeAjGJwycFggIKhdUBpsnDI0Fl5Et09TUutaTIYN+t7pe8Kp4q5YVoEUE6Gsns
 fCKGGQqArjybHD/l/dVXg9smk7P3JLtmR8jxjKBBlRQ+eFiYzQ2SaxmDeuCc1iUmEuxPOL
 kczd1JuyznQjF94BL71eh0VEwAeQLXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-Jn44DryyO2yoV0TMMi8vjg-1; Fri, 14 May 2021 08:15:58 -0400
X-MC-Unique: Jn44DryyO2yoV0TMMi8vjg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F181106BAE3;
 Fri, 14 May 2021 12:15:57 +0000 (UTC)
Received: from thuth.com (ovpn-112-191.ams2.redhat.com [10.36.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAFC160C5D;
 Fri, 14 May 2021 12:15:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/20] util/compatfd.c: Replaced a malloc call with g_malloc.
Date: Fri, 14 May 2021 14:15:06 +0200
Message-Id: <20210514121518.832729-9-thuth@redhat.com>
In-Reply-To: <20210514121518.832729-1-thuth@redhat.com>
References: <20210514121518.832729-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Replaced a call to malloc() and its respective call to free()
with g_malloc() and g_free().

g_malloc() is preferred more than g_try_* functions, which
return NULL on error, when the size of the requested
allocation  is small. This is because allocating few
bytes should not be a problem in a healthy system.
Otherwise, the system is already in a critical state.

Subsequently, removed NULL-checking after g_malloc().

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Message-Id: <20210315105814.5188-3-ma.mandourr@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 util/compatfd.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/util/compatfd.c b/util/compatfd.c
index 174f394533..a8ec525c6c 100644
--- a/util/compatfd.c
+++ b/util/compatfd.c
@@ -72,14 +72,10 @@ static int qemu_signalfd_compat(const sigset_t *mask)
     QemuThread thread;
     int fds[2];
 
-    info = malloc(sizeof(*info));
-    if (info == NULL) {
-        errno = ENOMEM;
-        return -1;
-    }
+    info = g_malloc(sizeof(*info));
 
     if (pipe(fds) == -1) {
-        free(info);
+        g_free(info);
         return -1;
     }
 
-- 
2.27.0


