Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0999B2AD484
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:14:26 +0100 (CET)
Received: from localhost ([::1]:56014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRbU-0001P3-T6
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:14:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZ0-0006tT-7d
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:11:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRYy-0004Y6-HM
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:11:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605006707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZDNT6kbCgy+taXenVG5GSEVQT+XCAhoivocth9wfm6A=;
 b=Hp7egbo0d0ML1SxmsBt+V6MUEMxgld8Xc9oQi9a/LDBy3/OcFMzcLw/ZBqqAScOAsBxkoO
 JFJPvFJ4qZCdeJ5Uf+BXOwQBosEOPW254AilndbIzTAzif2Dztc9CJYl+7sTEufJFhVa5V
 X7okesR9NrdefIG3i3z5UVzW+c2Rd+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-6LkkW5mwOciRWmRYdlAmRQ-1; Tue, 10 Nov 2020 06:11:44 -0500
X-MC-Unique: 6LkkW5mwOciRWmRYdlAmRQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEDF256FDB;
 Tue, 10 Nov 2020 11:11:42 +0000 (UTC)
Received: from thuth.com (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A276B1002C11;
 Tue, 10 Nov 2020 11:11:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/19] device-crash-test: Check if path is actually an
 executable file
Date: Tue, 10 Nov 2020 12:11:16 +0100
Message-Id: <20201110111132.559399-4-thuth@redhat.com>
In-Reply-To: <20201110111132.559399-1-thuth@redhat.com>
References: <20201110111132.559399-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

After the transition to Meson, the build directory now have
subdirectories named "qemu-system-*.p", and device-crash-test
will try to execute them as if they were binaries.  This results
in errors like:

  PermissionError: [Errno 13] Permission denied: './qemu-system-or1k.p'

When generating the default list of binaries to test, check if
the path is actually a file and if it's executable.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20201026125238.2752882-1-ehabkost@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/device-crash-test | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 866baf7058..04118669ba 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -383,7 +383,9 @@ def binariesToTest(args, testcase):
     if args.qemu:
         r = args.qemu
     else:
-        r = glob.glob('./qemu-system-*')
+        r = [f.path for f in os.scandir('.')
+             if f.name.startswith('qemu-system-') and
+                f.is_file() and os.access(f, os.X_OK)]
     return r
 
 
-- 
2.18.4


