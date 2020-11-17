Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2042B6AD0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:58:42 +0100 (CET)
Received: from localhost ([::1]:35630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4JV-0002Ed-92
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:58:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EV-0002Fh-AX
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:31 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:41161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4ER-00075W-Rt
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:30 -0500
Received: by mail-ej1-x644.google.com with SMTP id gj5so2910101ejb.8
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CkuT4AzM0EgmmRU2e5yZiBSUORJm8C5IBRPPd2PET4E=;
 b=ekbG7hmU9H4M9HgrHNpibdRQAsl2jI1JjKJCg9QxCY3f7tpXtbWk8WMlyFHqp9ebui
 WAwRIO0/BMcMqCla+6E8pdHU/Qp7beOJ+LHPWSlmJVHZHf5j7FRVtylr3yNekhYx8rCd
 nhkNakb7jt5J3ZBfpsxNooRuUslqhXyy4ia8NVc8SUz1mSupwJpBmqgM2dIeEEiXgVOg
 uBQfVed2ZVngmmiY7b7NcYvdSVTW0dUOLJO+ZAHXrko2UHY262dMaPfmOt4FyA1/gmEk
 /5v80lrw+LJmWR6O/bTb/7ZD4rA0MpFoiNy8JNaWupz/76e3uoh7Nh/F4hQKSZcgE2uw
 s6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CkuT4AzM0EgmmRU2e5yZiBSUORJm8C5IBRPPd2PET4E=;
 b=lEhvLJSi+wFJVsVqhz5F7JPpNcZ2j70Zh+faVkHbwbI/qcA8rfj/Xsb7GX6a5Ub2wJ
 GmPEztYLW76dk5t8kIHXV5WmKIMRs34D2hbBtRMzjod4GSiiTfSPE1kf6lUQtJqsSvjj
 Au8XNklomaHBjXi/03rbZFqegM7RPY1HntE65cCVi5hsgViSVtuSgc0WBVo33fxpHacy
 FkTvSoa2FWjbaJ1F7BLgw9/G0ClxVB5GaM+/Pdsy5bMmh394h0pi2M0A9oikXFAKOErc
 yrcrxvvKiL39csMDjFESDsoMgaCwbZLNbOtaCVNeNGsNPSW276Hp+DvmuhE5et+mgWEZ
 MeyQ==
X-Gm-Message-State: AOAM531SG3QSB/5hKrkXfIsPj6P6yzxd+e60F/fYHhX+6Sa6vOlLZUa5
 0lRB1bJER2BF5Ot/oijJF2RGsDVXXOU=
X-Google-Smtp-Source: ABdhPJyfmi0wP41d1FOupXOkdaLdKGSquVK6NZCS39DrS+HFC+0Ew+4HIkNUun5LJKJIPQEZOqXoWA==
X-Received: by 2002:a17:906:4104:: with SMTP id
 j4mr20906108ejk.439.1605632006098; 
 Tue, 17 Nov 2020 08:53:26 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/29] scripts/kernel-doc: optionally treat warnings as errors
Date: Tue, 17 Nov 2020 17:52:53 +0100
Message-Id: <20201117165312.118257-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
2.28.0



