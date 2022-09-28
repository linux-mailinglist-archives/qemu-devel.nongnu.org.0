Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ADF5EE20C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 18:42:02 +0200 (CEST)
Received: from localhost ([::1]:50252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oda8G-0006Xs-PQ
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 12:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>) id 1oda1N-0000pL-P2
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:34:54 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:50292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>) id 1oda1L-0007BT-0I
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:34:52 -0400
Received: from [192.168.16.115] (helo=iris.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <den@openvz.org>) id 1odZyI-006fkn-FU;
 Wed, 28 Sep 2022 18:34:07 +0200
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-devel@nongnu.org
Cc: "Denis V. Lunev" <den@openvz.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 1/1] scripts: check commit message length to fit 75
 characters
Date: Wed, 28 Sep 2022 18:34:17 +0200
Message-Id: <20220928163417.1839682-1-den@openvz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111; envelope-from=den@openvz.org;
 helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are a lot of commits descriptions which are rendered in the
'git log' with line wrap. Apparently, this is looking awkward. Let us
add check into checkpatch.pl for that.

I am not very good Perl developer, but there is an implementation in
Linux kernel's checkpatch.pl. Linux kernel people have faced a lot of
obstacles here thus direct port from them looks beneficial.

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: Alexey Kardashevskiy <aik@ozlabs.ru>
CC: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
CC: "Marc-André Lureau" <marcandre.lureau@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Eric Blake <eblake@redhat.com>
CC: Markus Armbruster <armbru@redhat.com>
---
Changes from v1:
- fixed formatting to match one in the checkpatch.pl file. That was not
  obvious :(

 scripts/checkpatch.pl | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index d900d18048..fe1ff6c97d 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -36,6 +36,18 @@ my $root;
 my %debug;
 my $help = 0;
 
+our $signature_tags = qr{(?xi:
+	Signed-off-by:|
+	Co-developed-by:|
+	Acked-by:|
+	Tested-by:|
+	Reviewed-by:|
+	Reported-by:|
+	Suggested-by:|
+	To:|
+	Cc:
+)};
+
 sub help {
 	my ($exitcode) = @_;
 
@@ -1303,6 +1315,7 @@ sub process {
 
 	my $in_header_lines = $file ? 0 : 1;
 	my $in_commit_log = 0;		#Scanning lines before patch
+	my $commit_log_long_line = 0;
 	my $reported_maintainer_file = 0;
 	my $non_utf8_charset = 0;
 
@@ -1585,6 +1598,19 @@ sub process {
 			WARN("8-bit UTF-8 used in possible commit log\n" . $herecurr);
 		}
 
+		if ($in_commit_log && !$commit_log_long_line && length($line) > 75 &&
+		    !($line =~ /^\s*[a-zA-Z0-9_\/\.]+\s+\|\s+\d+/ ||
+                            # file delta changes
+		      $line =~ /^\s*(?:[\w\.\-\+]*\/)++[\w\.\-\+]+:/ ||
+                            # filename then :
+		      $line =~ /^\s*(?:Fixes:|Link:|$signature_tags)/i
+                            # A Fixes: or Link: line or signature tag line
+		      )) {
+			WARN("Possible unwrapped commit description (prefer a maximum " .
+			     "75 chars per line)\n" . $herecurr);
+			$commit_log_long_line = 1;
+		}
+
 # ignore non-hunk lines and lines being removed
 		next if (!$hunk_line || $line =~ /^-/);
 
-- 
2.34.1


