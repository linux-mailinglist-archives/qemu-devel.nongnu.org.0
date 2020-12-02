Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F8F2CB8C1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:26:48 +0100 (CET)
Received: from localhost ([::1]:35660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOPP-00069k-B0
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNDP-0003zo-Ei
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCe-0003ra-AQ
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wdy6f88n2LIny//0BmS54CtVFj89l1KsmAMFogQ24V4=;
 b=BrfHtpdsajJwIzyeYIF2jMECb++TYcNaQr+AmdFoqvvz+OVi+aTaDrYwMCYmvV9bQoj+8T
 QE1kEmPIyOAgX/8rz6tbwS3mNw5L46u6FUJB5cp9cWfTkxOnagpa6oQSoMjIthu2TlJqgo
 CvBLoo8dlax1L9IH+aROsSG47eJ+Ehg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-iRlmIzzLMS-xGRh_C5hzyA-1; Wed, 02 Dec 2020 03:09:28 -0500
X-MC-Unique: iRlmIzzLMS-xGRh_C5hzyA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 020481006C85
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:28 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B952160854
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:27 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 101/113] scripts: kernel-doc: reimplement -nofunction argument
Date: Wed,  2 Dec 2020 03:08:37 -0500
Message-Id: <20201202080849.4125477-102-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Right now, the build system doesn't use -nofunction, as
it is pretty much useless, because it doesn't consider
the other output modes (extern, internal), working only
with all.

Also, it is limited to exclude functions.

Re-implement it in order to allow excluding any symbols from
the document output, no matter what mode is used.

The parameter was also renamed to "-nosymbol", as it express
better its meaning.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201117165312.118257-20-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 44 +++++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index f33a4b1cc7..35d60af834 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -66,9 +66,8 @@ Output selection (mutually exclusive):
   -function NAME	Only output documentation for the given function(s)
 			or DOC: section title(s). All other functions and DOC:
 			sections are ignored. May be specified multiple times.
-  -nofunction NAME	Do NOT output documentation for the given function(s);
-			only output documentation for the other functions and
-			DOC: sections. May be specified multiple times.
+  -nosymbol NAME	Exclude the specified symbols from the output
+		        documentation. May be specified multiple times.
 
 Output selection modifiers:
   -no-doc-sections	Do not output DOC: sections.
@@ -288,9 +287,8 @@ my $modulename = "Kernel API";
 use constant {
     OUTPUT_ALL          => 0, # output all symbols and doc sections
     OUTPUT_INCLUDE      => 1, # output only specified symbols
-    OUTPUT_EXCLUDE      => 2, # output everything except specified symbols
-    OUTPUT_EXPORTED     => 3, # output exported symbols
-    OUTPUT_INTERNAL     => 4, # output non-exported symbols
+    OUTPUT_EXPORTED     => 2, # output exported symbols
+    OUTPUT_INTERNAL     => 3, # output non-exported symbols
 };
 my $output_selection = OUTPUT_ALL;
 my $show_not_found = 0;	# No longer used
@@ -315,6 +313,7 @@ my $man_date = ('January', 'February', 'March', 'April', 'May', 'June',
 # CAVEAT EMPTOR!  Some of the others I localised may not want to be, which
 # could cause "use of undefined value" or other bugs.
 my ($function, %function_table, %parametertypes, $declaration_purpose);
+my %nosymbol_table = ();
 my $declaration_start_line;
 my ($type, $declaration_name, $return_type);
 my ($newsection, $newcontents, $prototype, $brcount, %source_map);
@@ -434,10 +433,9 @@ while ($ARGV[0] =~ m/^--?(.*)/) {
 	$output_selection = OUTPUT_INCLUDE;
 	$function = shift @ARGV;
 	$function_table{$function} = 1;
-    } elsif ($cmd eq "nofunction") { # output all except specific functions
-	$output_selection = OUTPUT_EXCLUDE;
-	$function = shift @ARGV;
-	$function_table{$function} = 1;
+    } elsif ($cmd eq "nosymbol") { # Exclude specific symbols
+	my $symbol = shift @ARGV;
+	$nosymbol_table{$symbol} = 1;
     } elsif ($cmd eq "export") { # only exported symbols
 	$output_selection = OUTPUT_EXPORTED;
 	%function_table = ();
@@ -570,11 +568,11 @@ sub dump_doc_section {
         return;
     }
 
+    return if (defined($nosymbol_table{$name}));
+
     if (($output_selection == OUTPUT_ALL) ||
-	($output_selection == OUTPUT_INCLUDE &&
-	 defined($function_table{$name})) ||
-	($output_selection == OUTPUT_EXCLUDE &&
-	 !defined($function_table{$name})))
+	(($output_selection == OUTPUT_INCLUDE) &&
+	 defined($function_table{$name})))
     {
 	dump_section($file, $name, $contents);
 	output_blockhead({'sectionlist' => \@sectionlist,
@@ -800,6 +798,8 @@ sub output_blockhead_rst(%) {
     my ($parameter, $section);
 
     foreach $section (@{$args{'sectionlist'}}) {
+	next if (defined($nosymbol_table{$section}));
+
 	if ($output_selection != OUTPUT_INCLUDE) {
 	    print "**$section**\n\n";
 	}
@@ -1115,12 +1115,14 @@ sub output_declaration {
     my $name = shift;
     my $functype = shift;
     my $func = "output_${functype}_$output_mode";
+
+    return if (defined($nosymbol_table{$name}));
+
     if (($output_selection == OUTPUT_ALL) ||
 	(($output_selection == OUTPUT_INCLUDE ||
 	  $output_selection == OUTPUT_EXPORTED) &&
 	 defined($function_table{$name})) ||
-	(($output_selection == OUTPUT_EXCLUDE ||
-	  $output_selection == OUTPUT_INTERNAL) &&
+	($output_selection == OUTPUT_INTERNAL &&
 	 !($functype eq "function" && defined($function_table{$name}))))
     {
 	&$func(@_);
@@ -1301,6 +1303,8 @@ sub show_warnings($$) {
 	my $functype = shift;
 	my $name = shift;
 
+	return 0 if (defined($nosymbol_table{$name}));
+
 	return 1 if ($output_selection == OUTPUT_ALL);
 
 	if ($output_selection == OUTPUT_EXPORTED) {
@@ -1324,13 +1328,6 @@ sub show_warnings($$) {
 			return 0;
 		}
 	}
-	if ($output_selection == OUTPUT_EXCLUDE) {
-		if (!defined($function_table{$name})) {
-			return 1;
-		} else {
-			return 0;
-		}
-	}
 	die("Please add the new output type at show_warnings()");
 }
 
@@ -1952,6 +1949,7 @@ sub process_export_file($) {
 
     while (<IN>) {
 	if (/$export_symbol/) {
+	    next if (defined($nosymbol_table{$2}));
 	    $function_table{$2} = 1;
 	}
     }
-- 
2.26.2



