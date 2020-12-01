Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4D22CA03F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:47:47 +0100 (CET)
Received: from localhost ([::1]:54914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3CE-0001Yb-Kl
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk309-0002MD-9I
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk304-0003pf-5F
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606818911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S1wx4TC4FJnM01CiYUL9Na+v5QgrCrPNyRPcarA1104=;
 b=hBInYGNMM8fKzTcHTLpgo71ZTxVsOwHGx2u8nHj9B9lFEga9fHjY8NJyPeV2OwrCjxsTzP
 iPe6abs1S7QlkLevok6hNImoZBlDDQ6hRfP1TDz3XSeq0p+2YwsdX/NQVY+2mBH1Z21E16
 /0ZxoxiioUq0V5zNRBtViX/urdbiZN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-tVhhE7gNPzO8UNcP0xdkMw-1; Tue, 01 Dec 2020 05:35:08 -0500
X-MC-Unique: tVhhE7gNPzO8UNcP0xdkMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E41E2FD0B;
 Tue,  1 Dec 2020 10:35:07 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D72A10023B1;
 Tue,  1 Dec 2020 10:35:07 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/32] scripts/kernel-doc: optionally treat warnings as
 errors
Date: Tue,  1 Dec 2020 05:34:41 -0500
Message-Id: <20201201103502.4024573-12-pbonzini@redhat.com>
In-Reply-To: <20201201103502.4024573-1-pbonzini@redhat.com>
References: <20201201103502.4024573-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The kbuild bot recently added the W=1 option, which triggered
documentation cleanups to squelch hundreds of kernel-doc warnings.

To make sure new kernel contributions don't add regressions to
kernel-doc descriptors, this patch suggests an option to treat
warnings as errors in CI/automated tests.

A -Werror command-line option is added to the kernel-doc script. When
this option is set, the script will return the number of warnings
found. The caller can then treat this positive return value as an
error and stop the build.

Using this command line option is however not straightforward when the
kernel-doc script is called from other scripts. To align with typical
kernel compilation or documentation generation, the Werror option is
also set by checking the KCFLAGS environment variable, or if
KDOC_WERROR is defined, as in the following examples:

KCFLAGS="-Wall -Werror" make W=1 sound/
KCFLAGS="-Wall -Werror" make W=1 drivers/soundwire/
KDOC_WERROR=1 make htmldocs

Note that in the last example the documentation build does not stop,
only an additional log is provided.

Credits to Randy Dunlap for suggesting the use of environment variables.

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200728162040.92467-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201117165312.118257-11-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 1cdece23fb..eb635eb94c 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -83,6 +83,7 @@ Output selection modifiers:
 Other parameters:
   -v			Verbose output, more warnings and other information.
   -h			Print this help.
+  -Werror		Treat warnings as errors.
 
 EOF
     print $message;
@@ -275,6 +276,7 @@ my $kernelversion;
 my $dohighlight = "";
 
 my $verbose = 0;
+my $Werror = 0;
 my $output_mode = "rst";
 my $output_preformatted = 0;
 my $no_doc_sections = 0;
@@ -322,6 +324,18 @@ if (defined($ENV{'KBUILD_VERBOSE'})) {
 	$verbose = "$ENV{'KBUILD_VERBOSE'}";
 }
 
+if (defined($ENV{'KDOC_WERROR'})) {
+	$Werror = "$ENV{'KDOC_WERROR'}";
+}
+
+if (defined($ENV{'KCFLAGS'})) {
+	my $kcflags = "$ENV{'KCFLAGS'}";
+
+	if ($kcflags =~ /Werror/) {
+		$Werror = 1;
+	}
+}
+
 # Generated docbook code is inserted in a template at a point where
 # docbook v3.1 requires a non-zero sequence of RefEntry's; see:
 # https://www.oasis-open.org/docbook/documentation/reference/html/refentry.html
@@ -436,6 +450,8 @@ while ($ARGV[0] =~ m/^--?(.*)/) {
 	push(@export_file_list, $file);
     } elsif ($cmd eq "v") {
 	$verbose = 1;
+    } elsif ($cmd eq "Werror") {
+	$Werror = 1;
     } elsif (($cmd eq "h") || ($cmd eq "help")) {
 	usage();
     } elsif ($cmd eq 'no-doc-sections') {
@@ -2292,4 +2308,9 @@ if ($verbose && $warnings) {
   print STDERR "$warnings warnings\n";
 }
 
-exit($output_mode eq "none" ? 0 : $errors);
+if ($Werror && $warnings) {
+    print STDERR "$warnings warnings as Errors\n";
+    exit($warnings);
+} else {
+    exit($output_mode eq "none" ? 0 : $errors)
+}
-- 
2.26.2



