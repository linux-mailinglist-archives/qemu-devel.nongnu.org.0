Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E6E38B7DE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 21:55:12 +0200 (CEST)
Received: from localhost ([::1]:50824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljolC-0006X0-WA
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 15:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ljoiB-0005ik-EE
 for qemu-devel@nongnu.org; Thu, 20 May 2021 15:52:03 -0400
Received: from [201.28.113.2] (port=31188 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>) id 1ljoi9-0000mq-GL
 for qemu-devel@nongnu.org; Thu, 20 May 2021 15:52:03 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 20 May 2021 16:51:56 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 649B98013E1;
 Thu, 20 May 2021 16:51:56 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org
Subject: [PATCH] scripts/checkpatch.pl: process .c.inc and .h.inc files as C
 source
Date: Thu, 20 May 2021 16:51:42 -0300
Message-Id: <20210520195142.941261-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 May 2021 19:51:56.0587 (UTC)
 FILETIME=[96D5E7B0:01D74DB1]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Change the regex used to determine whether a file should be processed as
C source to include .c.inc and .h.inc extensions.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 scripts/checkpatch.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 3d185cceac..bbcd25ae05 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -12,7 +12,7 @@ use Term::ANSIColor qw(:constants);
 my $P = $0;
 $P =~ s@.*/@@g;
 
-our $SrcFile    = qr{\.(?:h|c|cpp|s|S|pl|py|sh)$};
+our $SrcFile    = qr{\.(?:(h|c)(\.inc)?|cpp|s|S|pl|py|sh)$};
 
 my $V = '0.31';
 
@@ -1671,7 +1671,7 @@ sub process {
 		}
 
 # check we are in a valid C source file if not then ignore this hunk
-		next if ($realfile !~ /\.(h|c|cpp)$/);
+		next if ($realfile !~ /\.((h|c)(\.inc)?|cpp)$/);
 
 # Block comment styles
 
-- 
2.25.1


