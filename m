Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3282E87A9
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 16:15:07 +0100 (CET)
Received: from localhost ([::1]:33528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvicT-0006Sn-IM
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 10:15:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kvibh-00062h-J4
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 10:14:17 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:44082 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kvibf-0006MD-O2
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 10:14:17 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 80DDF412FD;
 Sat,  2 Jan 2021 15:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1609600452; x=
 1611414853; bh=6VC+20pFRfr229zX6ogdC9BeDocARBwVHtqonjdNkh8=; b=b
 PXELUqbKczN6mjq6wAAmH4vVF4U8aPZAPQgTw2/UT2eqUTFk0FDJGRDw4msCtbZ9
 B+16m7r+hxnwfZBAUJAuxPNHHgSCKT2vIBcqOAzDylVJCFzu+q0i+F27JonLC59y
 QvFZxUMf6nkQP3beQtuUrX4GRBrfuooqAeb+DmG2cs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t1upiqZZRh-G; Sat,  2 Jan 2021 18:14:12 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0D1B241281;
 Sat,  2 Jan 2021 18:14:11 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sat, 2 Jan
 2021 18:14:11 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2] ui/cocoa: Fix openFile: deprecation on Big Sur
Date: Sat, 2 Jan 2021 18:07:21 +0300
Message-ID: <20210102150718.47618-1-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ui/cocoa.m:1188:44: warning: 'openFile:' is deprecated: first deprecated in macOS 11.0 - Use -[NSWorkspace openURL:] instead.
      [-Wdeprecated-declarations]
        if ([[NSWorkspace sharedWorkspace] openFile: full_file_path] == YES) {
                                           ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSWorkspace.h:350:1: note:
      'openFile:' has been explicitly marked deprecated here
- (BOOL)openFile:(NSString *)fullPath API_DEPRECATED("Use -[NSWorkspace openURL:] instead.", macos(10.0, 11.0));
^

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
Changes since v1:
 - Changed URLWithString: to fileURLWithPath:isDirectory: (Peter)

 ui/cocoa.m | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index f32adc3074..ea3b845b53 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1178,6 +1178,7 @@ QemuCocoaView *cocoaView;
     /* Where to look for local files */
     NSString *path_array[] = {@"../share/doc/qemu/", @"../doc/qemu/", @"../docs/"};
     NSString *full_file_path;
+    NSURL *full_file_url;
 
     /* iterate thru the possible paths until the file is found */
     int index;
@@ -1186,7 +1187,9 @@ QemuCocoaView *cocoaView;
         full_file_path = [full_file_path stringByDeletingLastPathComponent];
         full_file_path = [NSString stringWithFormat: @"%@/%@%@", full_file_path,
                           path_array[index], filename];
-        if ([[NSWorkspace sharedWorkspace] openFile: full_file_path] == YES) {
+        full_file_url = [NSURL fileURLWithPath: full_file_path
+                                   isDirectory: false];
+        if ([[NSWorkspace sharedWorkspace] openURL: full_file_url] == YES) {
             return;
         }
     }
-- 
2.29.2


