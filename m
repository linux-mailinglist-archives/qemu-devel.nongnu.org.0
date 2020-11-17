Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EB92B6B34
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:10:23 +0100 (CET)
Received: from localhost ([::1]:51636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4Uo-0003RM-RP
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Ep-00030Q-NN
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:52 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:39452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4En-0007F1-Nw
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:51 -0500
Received: by mail-ej1-x641.google.com with SMTP id s25so30385081ejy.6
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uAgpvqohpBXsyMVNyA8GR5izit02yQRNmZMUYiepav8=;
 b=X9BPg9UapgtZph3d6U1aNS7OiBlNZRBUnDJyS7GMrqg7AVViSnWENLEjt1JB2ZLGVb
 OV6spRdfrQNMjhntqZnQVW9SEN/hDk05TQMvuPsCnJpUoImqwUdZwdgcuCePHmqkhOTA
 vHmW5BRfBgIyH3bO5Y9AMdmo5Vcsl9Hcu+XRLQgUz7SdcTqpxu1pach53HdDfMGszE6g
 sUOrrxWR91ZfWJ269DkOFAzVAfTvI2VWFXZuhAoPedjaa95EHFGDWgT+sERr42ZxGadE
 NbdFmAm19MJT70hDr9CzAODn8AoNSWkJMwclt30jX9HzqN+qD0WVB+K7TqIKsG0bxpsU
 BUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uAgpvqohpBXsyMVNyA8GR5izit02yQRNmZMUYiepav8=;
 b=hWjBfP58IgGDS30hKL7f5EybsLNpD0QaM9spL3MBE8lDqQ+7b9/xf/aBmEq0aQH5ZE
 g8lz3fP3ZGBFeJOwr7C1UBxC8hrCwLroD+HH//bw+0wYwkSgwN/MKhHpn3QQ62fEW2PF
 hPzdiGPO5wQw/Ym1R9WU5LjQ2PtqdeNz7iv9rlk1Z03/5Mlv3P4EL4wOWILU4tL4MD+q
 iZ83vVgRcysgeJSaO/VvVI9CMmNiVKz0RNPER62elqqs09Flbq8DjdnoHIzGDakC/ylp
 UMx8+vrkpnUwhCpsprKk8S/om0NxWIDLScva+fENQHshpYS1FjMEv2pwR57V2Whkv9xI
 0Tbg==
X-Gm-Message-State: AOAM532t/mOh/KE79ky1n6a7tjiHLhnPh4yAq6pxCR7E9j5phxTiv5dP
 iVRBP0n/nR1yXlouP5Rlj3fkf/fPTt8=
X-Google-Smtp-Source: ABdhPJzwjrftEpDwCSkGeYtZnsb80uf8lmLT4OWpMtZciony9fj18ZO4B3OADvQYXweQahycvhLb/Q==
X-Received: by 2002:a17:906:2756:: with SMTP id
 a22mr7902925ejd.81.1605632027978; 
 Tue, 17 Nov 2020 08:53:47 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/29] scripts: kernel-doc: allow passing desired Sphinx C
 domain dialect
Date: Tue, 17 Nov 2020 17:53:05 +0100
Message-Id: <20201117165312.118257-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x641.google.com
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

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

When kernel-doc is called via kerneldoc.py, there's no need to
auto-detect the Sphinx version, as the Sphinx module already
knows it. So, add an optional parameter to allow changing the
Sphinx dialect.

As kernel-doc can also be manually called, keep the auto-detection
logic if the parameter was not specified. On such case, emit
a warning if sphinx-build can't be found at PATH.

I ended using a suggestion from Joe for using a more readable
regex, instead of using a complex one with a hidden group like:

	m/^(\d+)\.(\d+)(?:\.?(\d+)?)/

in order to get the optional <patch> argument.

Thanks-to: Joe Perches <joe@perches.com>
Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 51 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 478037f736..667ad3169c 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -56,6 +56,13 @@ Output format selection (mutually exclusive):
   -rst			Output reStructuredText format.
   -none			Do not output documentation, only warnings.
 
+Output format selection modifier (affects only ReST output):
+
+  -sphinx-version	Use the ReST C domain dialect compatible with an
+			specific Sphinx Version.
+			If not specified, kernel-doc will auto-detect using
+			the sphinx-build version found on PATH.
+
 Output selection (mutually exclusive):
   -export		Only output documentation for symbols that have been
 			exported using EXPORT_SYMBOL() or EXPORT_SYMBOL_GPL()
@@ -270,7 +277,7 @@ if ($#ARGV == -1) {
 }
 
 my $kernelversion;
-my $sphinx_major;
+my ($sphinx_major, $sphinx_minor, $sphinx_patch);
 
 my $dohighlight = "";
 
@@ -457,6 +464,23 @@ while ($ARGV[0] =~ m/^--?(.*)/) {
 	    $enable_lineno = 1;
     } elsif ($cmd eq 'show-not-found') {
 	$show_not_found = 1;  # A no-op but don't fail
+    } elsif ($cmd eq "sphinx-version") {
+	my $ver_string = shift @ARGV;
+	if ($ver_string =~ m/^(\d+)(\.\d+)?(\.\d+)?/) {
+	    $sphinx_major = $1;
+	    if (defined($2)) {
+		$sphinx_minor = substr($2,1);
+	    } else {
+		$sphinx_minor = 0;
+	    }
+	    if (defined($3)) {
+		$sphinx_patch = substr($3,1)
+	    } else {
+		$sphinx_patch = 0;
+	    }
+	} else {
+	    die "Sphinx version should either major.minor or major.minor.patch format\n";
+	}
     } else {
 	# Unknown argument
         usage();
@@ -477,29 +501,37 @@ sub findprog($)
 sub get_sphinx_version()
 {
 	my $ver;
-	my $major = 1;
 
 	my $cmd = "sphinx-build";
 	if (!findprog($cmd)) {
 		my $cmd = "sphinx-build3";
-		return $major if (!findprog($cmd));
+		if (!findprog($cmd)) {
+			$sphinx_major = 1;
+			$sphinx_minor = 2;
+			$sphinx_patch = 0;
+			printf STDERR "Warning: Sphinx version not found. Using default (Sphinx version %d.%d.%d)\n",
+			       $sphinx_major, $sphinx_minor, $sphinx_patch;
+			return;
+		}
 	}
 
 	open IN, "$cmd --version 2>&1 |";
 	while (<IN>) {
 		if (m/^\s*sphinx-build\s+([\d]+)\.([\d\.]+)(\+\/[\da-f]+)?$/) {
-			$major=$1;
+			$sphinx_major = $1;
+			$sphinx_minor = $2;
+			$sphinx_patch = $3;
 			last;
 		}
 		# Sphinx 1.2.x uses a different format
 		if (m/^\s*Sphinx.*\s+([\d]+)\.([\d\.]+)$/) {
-			$major=$1;
+			$sphinx_major = $1;
+			$sphinx_minor = $2;
+			$sphinx_patch = $3;
 			last;
 		}
 	}
 	close IN;
-
-	return $major;
 }
 
 # get kernel version from env
@@ -2333,7 +2365,10 @@ sub process_file($) {
 }
 
 
-$sphinx_major = get_sphinx_version();
+if ($output_mode eq "rst") {
+	get_sphinx_version() if (!$sphinx_major);
+}
+
 $kernelversion = get_kernel_version();
 
 # generate a sequence of code that will splice in highlighting information
-- 
2.28.0



