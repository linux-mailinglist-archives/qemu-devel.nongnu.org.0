Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7087253E518
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:38:46 +0200 (CEST)
Received: from localhost ([::1]:52034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyDsS-0001TU-Rw
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nyDoN-0000Qy-L5
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:34:31 -0400
Received: from [187.72.171.209] (port=41042 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>) id 1nyDoK-0008Jj-PK
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:34:30 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 6 Jun 2022 11:34:21 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 8E6F38000CB;
 Mon,  6 Jun 2022 11:34:21 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org
Cc: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Gan Qixin <ganqixin@huawei.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [RFC PATCH RESEND] scripts/checkpatch.pl: Change line limit warning
Date: Mon,  6 Jun 2022 11:34:18 -0300
Message-Id: <20220606143419.656598-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 Jun 2022 14:34:21.0825 (UTC)
 FILETIME=[831C7710:01D879B2]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The QEMU documentation mentions that lines should be up to 80
characters and that the script checkpatch will warn at 100 characters,
but the script warns at 80 characters and throw and error at 90, so
this commit changes to warn at 100.

As to why extend, the argument that resulted in the change of the
docs was that trying to always wrap to 80 columns could result in less
readable code, so sometimes not wrapping was the better choice and in
those circumstances checkpatch could nudge people into creating less
readable code.

A 132 error limit is put to catch overly big lines.

Based-on: 20201105154208.12442-1-ganqixin@huawei.com
Signed-off-by: Lucas Mateus Castro(alqotel) <lucas.araujo@eldorado.org.br>
---
Currently there's a disagreement between the checkpatch code and the
documentation, this RFC just changes the checkpatch to match the
documentation.
But there was a discussion in 2020 as the best way to deal with this,
some alternatives mentioned are: change the warning to remind people to
not blindly wrap just because of the warning, change to warn at 90 columns
(which would mean changing the column limit for the error as well). If any
of those are preferred I'll send a next version updating the documentation
as well as changing checkpatch.pl to the preferred behavior.
---
 scripts/checkpatch.pl | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index d900d18048..2c2d7b31ab 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1639,12 +1639,12 @@ sub process {
 		if ($line =~ /^\+/ &&
 		    !($line =~ /^\+\s*"[^"]*"\s*(?:\s*|,|\)\s*;)\s*$/) &&
 		    !($rawline =~ /^[^[:alnum:]]*https?:\S*$/) &&
-		    $length > 80)
+		    $length > 100)
 		{
-			if ($length > 90) {
-				ERROR("line over 90 characters\n" . $herecurr);
+			if ($length > 132) {
+				ERROR("line over 132 characters\n" . $herecurr);
 			} else {
-				WARN("line over 80 characters\n" . $herecurr);
+				WARN("line over 100 characters\n" . $herecurr);
 			}
 		}
 
@@ -1838,13 +1838,8 @@ sub process {
 			#print "realcnt<$realcnt> ctx_cnt<$ctx_cnt>\n";
 			#print "pre<$pre_ctx>\nline<$line>\nctx<$ctx>\nnext<$lines[$ctx_ln - 1]>\n";
 
-			# The length of the "previous line" is checked against 80 because it
-			# includes the + at the beginning of the line (if the actual line has
-			# 79 or 80 characters, it is no longer possible to add a space and an
-			# opening brace there)
 			if ($#ctx == 0 && $ctx !~ /{\s*/ &&
-			    defined($lines[$ctx_ln - 1]) && $lines[$ctx_ln - 1] =~ /^\+\s*\{/ &&
-			    defined($lines[$ctx_ln - 2]) && length($lines[$ctx_ln - 2]) < 80) {
+			    defined($lines[$ctx_ln - 1]) && $lines[$ctx_ln - 1] =~ /^\+\s*\{/) {
 				ERROR("that open brace { should be on the previous line\n" .
 					"$here\n$ctx\n$rawlines[$ctx_ln - 1]\n");
 			}
-- 
2.25.1


