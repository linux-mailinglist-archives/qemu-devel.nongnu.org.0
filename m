Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2794E2B6B02
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:04:34 +0100 (CET)
Received: from localhost ([::1]:54898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4PA-0001m7-Rj
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Ea-0002T0-LR
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:36 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:45346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EY-00078G-At
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:36 -0500
Received: by mail-ed1-x542.google.com with SMTP id q3so23169565edr.12
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JiBKF0E6FiMup6R9bsft7VN6TIyWEK2T0aPfO/9H7dc=;
 b=AEq2FxPnv2bcUfRQvBWqZ2KTkcBw+oJa9qVCxPwsuSWKmVJ6DmAuyoW/TpxMy8OaKH
 8J6cU7mFpqsWEkulmRuZA1kkZfskbhQB+XaajT/zal6QAd2nkgIq8fULmAEaEUq0tr3u
 15FR6fgnRk4rJnAPohT8UK5ZQO/JoLuMi+T7cMCjImwAmac2xIWk52yK35wHQUeHRqrC
 ykLL3zc1shsAg2XEOxb0uQRYIhtXMhGkBkX959wPPWjyPL5fhHICikvH+Wg5K/f4HkbF
 1U5WittHvvIvXn4/441xjtu33tz/8soqRQ81PPj+0H28deh7lyh0nz6PyfZUZroGxXKs
 Zutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JiBKF0E6FiMup6R9bsft7VN6TIyWEK2T0aPfO/9H7dc=;
 b=GKbSiT/O3bBpPRIjjic9Q1gTBQOmKMo6KMstcYnPTi9ucMa96b+oOZiuPwZYT2kSMY
 YDhxpgCOdMxBgy5IYj4PztPfxR+ejkU07PPiic3XCvzS8nWurj8RJ3LQAlUjwzDv+4NG
 6WXKcPMECWUH9cUHljFcFFuMr5XRZ4AtxpMzQiECYC/SKkMNAsV2+tv3lW09odkiNE2/
 eJQrRWpLdF6heiWG1qH5Ai/uKxWVjRDsTgoOXqZXHAY35QSMf1mTTIziu4f4QM1uswkF
 v2jBbZztDvJW1HG3tAkENFjpuEHrFyzFLuJActhDPa5BiUnPznzGybNW5PT9Jnr0K+ge
 viMQ==
X-Gm-Message-State: AOAM533fPWNfWCJvs6cFgEksL5utYaBwNFivKfAKxzJResDHNH9oEeyY
 wRdBVJf6br+JxU81wMoK2Yz5WGg4lCM=
X-Google-Smtp-Source: ABdhPJzCpipD621MrbM/Gth/tPQILSTiQUZo3dJzDgOMxVzD13T/P4mJc0rxF7g4zJ4e8CUpaWiLhA==
X-Received: by 2002:a50:9f61:: with SMTP id b88mr22685885edf.282.1605632012495; 
 Tue, 17 Nov 2020 08:53:32 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/29] scripts: kernel-doc: make it more compatible with
 Sphinx 3.x
Date: Tue, 17 Nov 2020 17:52:59 +0100
Message-Id: <20201117165312.118257-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x542.google.com
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

With Sphinx 3.x, the ".. c:type:" tag was changed to accept either:

	.. c:type:: typedef-like declaration
	.. c:type:: name

Using it for other types (including functions) don't work anymore.

So, there are newer tags for macro, enum, struct, union, and others,
which doesn't exist on older versions.

Add a check for the Sphinx version and change the produced tags
accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 71 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 65 insertions(+), 6 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 60f75cd176..771367a6ab 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -271,6 +271,8 @@ if ($#ARGV == -1) {
 }
 
 my $kernelversion;
+my $sphinx_major;
+
 my $dohighlight = "";
 
 my $verbose = 0;
@@ -465,6 +467,43 @@ while ($ARGV[0] =~ m/^--?(.*)/) {
 
 # continue execution near EOF;
 
+# The C domain dialect changed on Sphinx 3. So, we need to check the
+# version in order to produce the right tags.
+sub findprog($)
+{
+	foreach(split(/:/, $ENV{PATH})) {
+		return "$_/$_[0]" if(-x "$_/$_[0]");
+	}
+}
+
+sub get_sphinx_version()
+{
+	my $ver;
+	my $major = 1;
+
+	my $cmd = "sphinx-build";
+	if (!findprog($cmd)) {
+		my $cmd = "sphinx-build3";
+		return $major if (!findprog($cmd));
+	}
+
+	open IN, "$cmd --version 2>&1 |";
+	while (<IN>) {
+		if (m/^\s*sphinx-build\s+([\d]+)\.([\d\.]+)(\+\/[\da-f]+)?$/) {
+			$major=$1;
+			last;
+		}
+		# Sphinx 1.2.x uses a different format
+		if (m/^\s*Sphinx.*\s+([\d]+)\.([\d\.]+)$/) {
+			$major=$1;
+			last;
+		}
+	}
+	close IN;
+
+	return $major;
+}
+
 # get kernel version from env
 sub get_kernel_version() {
     my $version = 'unknown kernel version';
@@ -848,7 +887,11 @@ sub output_function_rst(%) {
     my $start = "";
 
     if ($args{'typedef'}) {
-	print ".. c:type:: ". $args{'function'} . "\n\n";
+	if ($sphinx_major < 3) {
+	    print ".. c:type:: ". $args{'function'} . "\n\n";
+	} else {
+	    print ".. c:function:: ". $args{'function'} . "\n\n";
+	}
 	print_lineno($declaration_start_line);
 	print "   **Typedef**: ";
 	$lineprefix = "";
@@ -938,9 +981,14 @@ sub output_enum_rst(%) {
     my ($parameter);
     my $oldprefix = $lineprefix;
     my $count;
-    my $name = "enum " . $args{'enum'};
 
-    print "\n\n.. c:type:: " . $name . "\n\n";
+    if ($sphinx_major < 3) {
+	my $name = "enum " . $args{'enum'};
+	print "\n\n.. c:type:: " . $name . "\n\n";
+    } else {
+	my $name = $args{'enum'};
+	print "\n\n.. c:enum:: " . $name . "\n\n";
+    }
     print_lineno($declaration_start_line);
     $lineprefix = "   ";
     output_highlight_rst($args{'purpose'});
@@ -966,8 +1014,13 @@ sub output_typedef_rst(%) {
     my %args = %{$_[0]};
     my ($parameter);
     my $oldprefix = $lineprefix;
-    my $name = "typedef " . $args{'typedef'};
+    my $name;
 
+    if ($sphinx_major < 3) {
+	$name = "typedef " . $args{'typedef'};
+    } else {
+	$name = $args{'typedef'};
+    }
     print "\n\n.. c:type:: " . $name . "\n\n";
     print_lineno($declaration_start_line);
     $lineprefix = "   ";
@@ -982,9 +1035,14 @@ sub output_struct_rst(%) {
     my %args = %{$_[0]};
     my ($parameter);
     my $oldprefix = $lineprefix;
-    my $name = $args{'type'} . " " . $args{'struct'};
 
-    print "\n\n.. c:type:: " . $name . "\n\n";
+    if ($sphinx_major < 3) {
+	my $name = $args{'type'} . " " . $args{'struct'};
+	print "\n\n.. c:type:: " . $name . "\n\n";
+    } else {
+	my $name = $args{'struct'};
+	print "\n\n.. c:struct:: " . $name . "\n\n";
+    }
     print_lineno($declaration_start_line);
     $lineprefix = "   ";
     output_highlight_rst($args{'purpose'});
@@ -2242,6 +2300,7 @@ sub process_file($) {
 }
 
 
+$sphinx_major = get_sphinx_version();
 $kernelversion = get_kernel_version();
 
 # generate a sequence of code that will splice in highlighting information
-- 
2.28.0



