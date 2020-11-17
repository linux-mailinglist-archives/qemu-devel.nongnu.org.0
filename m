Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E572B6AC1
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:56:41 +0100 (CET)
Received: from localhost ([::1]:55116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4HY-00071E-1g
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:56:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EM-0001wx-R1
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:22 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:38817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EK-00072p-Mp
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:22 -0500
Received: by mail-ej1-x642.google.com with SMTP id a16so2627912ejj.5
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nAr7FMMY1Aekrxeh4MeSfYXr651AgfiypgckE+9CcNk=;
 b=UKXuRsb0ue0nf1raLR4Pd6olHOOT22WzzDo3P25IHe4ufm6Y7ZZCk5PK8XCEF+4bIm
 E15Rm7HxOQIzGi2yRK1Hx24z0AqesjaJlo86smuVDNnh582ADqDHV+2IEqHPz2yf+EFP
 LC/5DFhRI8OJafjHqIJzEELLLjKP34htqKwa9BahzdslNQYROPU5p/e30F5j+bU1ZOUK
 RfJMDBUIIPpQi5fPx34T5wj30pvBtm5bTc9QsCD0uRRQ+aCGLl0o0gGdgH/fYtixUomd
 mF7VZkGUIXcy5pYU6OTSJDlcUsxdlzinS6z5KneGSZXdAdqOJ1DNBy/feSjiX/xwfk1b
 JANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nAr7FMMY1Aekrxeh4MeSfYXr651AgfiypgckE+9CcNk=;
 b=tjZQD8M5zNiff7Ttxa7kmvCn5X1WzsbJ9PczB+CSjXvhHgZoNCDBCokQHoQhEvr/Nr
 08q046NUn01+DQiWib/c+OXZ4NNoOVjX3R6rC8B5Y6Rgd7QYbdkhZg4g8Kyq/pNyVL+L
 lheMYLJ26HyPQw4wYb0HjK5o+8dY+vMQm7ffelKdKs/cwEkLb1zPp4uLTOD2O4Raq/OY
 Jp8ltDMKwsXv4qmRt5WnSHpQMTbYCWdkjCBLNaTBxdKzZB4qsOzuwONn7RUJDqnfCxGI
 Kx9ahHOaaQU9vbA6J7/ujfyjRKHyYB2JVKS2gQ9wsl30vcuet+vhFo2HzvjV3Nhyl85V
 JbZw==
X-Gm-Message-State: AOAM530E0Mr9D0CLRea69H96nvqcsdA/VveuD4ojJsXcPg+aqX1b49b+
 PtY9TnWPfi5YBFydnoS9U1oqXVwwMPU=
X-Google-Smtp-Source: ABdhPJzGQ+++xv5cVoLsw39rGUUwgGyxj9M3iCgCOhSJOeo1Wrp+rohxH1Raknoc8SOJUiJKH8S32A==
X-Received: by 2002:a17:906:6d99:: with SMTP id
 h25mr20581507ejt.281.1605631998425; 
 Tue, 17 Nov 2020 08:53:18 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/29] scripts/kernel-doc: Add support for named variable
 macro arguments
Date: Tue, 17 Nov 2020 17:52:46 +0100
Message-Id: <20201117165312.118257-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x642.google.com
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

From: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Currently, when kernel-doc encounters a macro with a named variable
argument[1], such as this:

   #define hlist_for_each_entry_rcu(pos, head, member, cond...)

... it expects the variable argument to be documented as `cond...`,
rather than `cond`. This is semantically wrong, because the name (as
used in the macro body) is actually `cond`.

With this patch, kernel-doc will accept the name without dots (`cond`
in the example above) in doc comments, and warn if the name with dots
(`cond...`) is used and verbose mode[2] is enabled.

The support for the `cond...` syntax can be removed later, when the
documentation of all such macros has been switched to the new syntax.

Testing this patch on top of v5.4-rc6, `make htmldocs` shows a few
changes in log output and HTML output:

 1) The following warnings[3] are eliminated:

   ./include/linux/rculist.h:374: warning:
        Excess function parameter 'cond' description in 'list_for_each_entry_rcu'
   ./include/linux/rculist.h:651: warning:
        Excess function parameter 'cond' description in 'hlist_for_each_entry_rcu'

 2) For list_for_each_entry_rcu and hlist_for_each_entry_rcu, the
    correct description is shown

 3) Named variable arguments are shown without dots

[1]: https://gcc.gnu.org/onlinedocs/cpp/Variadic-Macros.html
[2]: scripts/kernel-doc -v
[3]: See also https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?h=dev&id=5bc4bc0d6153617eabde275285b7b5a8137fdf3c

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Tested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 2f421b7313..0f67664165 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1480,6 +1480,10 @@ sub push_parameter($$$$) {
 	      # handles unnamed variable parameters
 	      $param = "...";
 	    }
+	    elsif ($param =~ /\w\.\.\.$/) {
+	      # for named variable parameters of the form `x...`, remove the dots
+	      $param =~ s/\.\.\.$//;
+	    }
 	    if (!defined $parameterdescs{$param} || $parameterdescs{$param} eq "") {
 		$parameterdescs{$param} = "variable arguments";
 	    }
@@ -1967,6 +1971,18 @@ sub process_name($$) {
 sub process_body($$) {
     my $file = shift;
 
+    # Until all named variable macro parameters are
+    # documented using the bare name (`x`) rather than with
+    # dots (`x...`), strip the dots:
+    if ($section =~ /\w\.\.\.$/) {
+	$section =~ s/\.\.\.$//;
+
+	if ($verbose) {
+	    print STDERR "${file}:$.: warning: Variable macro arguments should be documented without dots\n";
+	    ++$warnings;
+	}
+    }
+
     if (/$doc_sect/i) { # case insensitive for supported section names
 	$newsection = $1;
 	$newcontents = $2;
-- 
2.28.0



