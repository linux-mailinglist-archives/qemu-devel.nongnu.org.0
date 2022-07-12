Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EA557240D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:55:51 +0200 (CEST)
Received: from localhost ([::1]:49384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBL30-0001hg-Gf
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKI5-0003rN-LJ
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKI0-0006jp-OV
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/N6j72U7nXKyxzZNykd86ZsqlwsnlXt+mx/8DZj4E7c=;
 b=AHpZrczLOUfOKUIp6ogPco0n7J/zg8T9+S4CDL4VbId3zTmfbJ5D2H2DCxAX12qtWL1FNn
 AqM1oW7Uq6t97QKCtNJnRzY5yU3WSFTZLc1z0/p0flH1amzp1xgfhfwKKpi+fcyxJXMcRi
 2Ajoo/xYi9yY1foH4BSKvvBsAVs17ak=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-FaTORunLPoC_QDxyXXzEGg-1; Tue, 12 Jul 2022 14:07:12 -0400
X-MC-Unique: FaTORunLPoC_QDxyXXzEGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DBBA185A7BA;
 Tue, 12 Jul 2022 18:07:12 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 490BA414A7E9;
 Tue, 12 Jul 2022 18:07:12 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 31/35] qsd: Do not use error_report() before monitor_init
Date: Tue, 12 Jul 2022 20:06:13 +0200
Message-Id: <20220712180617.1362407-32-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Message-Id: <20220609122852.21140-1-hreitz@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 storage-daemon/qemu-storage-daemon.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index b8e910f220..448c318e23 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -296,7 +296,11 @@ static void process_options(int argc, char *argv[], bool pre_init_pass)
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


