Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19039544EE4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:26:13 +0200 (CEST)
Received: from localhost ([::1]:47120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJ6y-0001EY-4Q
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nzHHW-0007tL-Ug
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:28:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nzHHV-0007wn-Av
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:28:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654777736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=geC5ZAecZFwYiiZvx7868w+R3EOzX3iDo1taIzR2oNs=;
 b=Bq4H2fBNZaWMEIqiNJFy1/6uWR5iCM0rLeCpeyJRmCGmacS4iHVYkcuczGHz9UCb4nj1+b
 aOLyMYVXGWMjj4rG3NNi9u4zyd6SZSazVkA2BF/gItDtmYH3nFrQKJ0INaSlg9qurdwW7h
 e9Vt2wtuj7NCYpGrQoAhOVSQKhRHo4Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-8IRAgOPYPUyGaHL1JA4Rfg-1; Thu, 09 Jun 2022 08:28:53 -0400
X-MC-Unique: 8IRAgOPYPUyGaHL1JA4Rfg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80FAC18A6508;
 Thu,  9 Jun 2022 12:28:53 +0000 (UTC)
Received: from localhost (unknown [10.39.193.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EA8C2166B26;
 Thu,  9 Jun 2022 12:28:53 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH] qsd: Do not use error_report() before monitor_init
Date: Thu,  9 Jun 2022 14:28:52 +0200
Message-Id: <20220609122852.21140-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

error_report() only works once monitor_init_globals_core() has been
called, which is not the case when parsing the --daemonize option.  Use
fprintf(stderr, ...) instead.

Fixes: 2525edd85fec53e23fda98974a15e3b3c8957596 ("qsd: Add --daemonize")
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index c104817cdd..0890495c40 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -286,7 +286,11 @@ static void process_options(int argc, char *argv[], bool pre_init_pass)
             }
         case OPTION_DAEMONIZE:
             if (os_set_daemonize(true) < 0) {
-                error_report("--daemonize not supported in this build");
+                /*
+                 * --daemonize is parsed before monitor_init_globals_core(), so
+                 * error_report() does not work yet
+                 */
+                fprintf(stderr, "--daemonize not supported in this build\n");
                 exit(EXIT_FAILURE);
             }
             break;
-- 
2.35.3


