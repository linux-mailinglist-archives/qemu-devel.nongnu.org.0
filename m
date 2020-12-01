Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3933F2CA028
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:45:47 +0100 (CET)
Received: from localhost ([::1]:46330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3AI-0006N6-69
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:45:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk303-0002In-DI
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk300-0003oV-SD
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606818908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lTbNvUmcxZxw5oB2uz5Cuhkq6SClsJLpylk8edw4H+k=;
 b=Whf+kr2mgIDrOKliJgeKgef3XffAlMaTwgPVB8ZUbT0GZs0pjFCtjr43Wk7WvHoDNxgP0o
 1egpqJIbLHd5PvVW7yC73fZ/0Qsi0AgTXG/O0rMev/Xh+jKnWSKUvqJQF10TT1sWKKi41j
 t5p6Q3rahYT/cmJxnk4jr1OlsBR69sA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-0zsXgIfKOzyox2dgK1xjWA-1; Tue, 01 Dec 2020 05:35:05 -0500
X-MC-Unique: 0zsXgIfKOzyox2dgK1xjWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50A8A100C61A;
 Tue,  1 Dec 2020 10:35:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C89E10013C1;
 Tue,  1 Dec 2020 10:35:03 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/32] scripts/kernel-doc: Add support for named variable
 macro arguments
Date: Tue,  1 Dec 2020 05:34:34 -0500
Message-Id: <20201201103502.4024573-5-pbonzini@redhat.com>
In-Reply-To: <20201201103502.4024573-1-pbonzini@redhat.com>
References: <20201201103502.4024573-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Message-Id: <20201117165312.118257-4-pbonzini@redhat.com>
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
2.26.2



