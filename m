Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BD32B6AD1
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:58:46 +0100 (CET)
Received: from localhost ([::1]:35958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4JZ-0002Mf-6a
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4En-0002wl-A4
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:49 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:32801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Ek-0007Di-IQ
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:48 -0500
Received: by mail-ed1-x543.google.com with SMTP id k4so6473354edl.0
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dr8gMwgBg3UV8aY4p4ptlc+t94D+s2hF4B9N6GvwKs8=;
 b=svtgP5Dj9JZNWhyzirN9MdvqaUeF3/+W/Gbms7sj3VR1RmEMSOglp4J/+IHznfafW7
 T3h4PmADmbacwx3/PA2BrA7TM94dM0ciMVpvWMuZ+EHDEI5XY3ZajAFpwlhtZkdSeGda
 VuMqJthvh3llh6OiXIs5mLocEkhPIur24xv6SGR9iaq7kxshKsxLgB3tQPJ9U+nfAHao
 4dL43pkcXfkZgmZpsClKM43rLQc36B+H+Spa9MVZuPE5L46yWnr/4LWWL/Sk09GZo069
 LuSvOuYZGi6z8WDIEY33bNY7vh7TNgnKaN+Nxmj5prIUJPa4OaZqda725pzOGVxXBx11
 5WPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Dr8gMwgBg3UV8aY4p4ptlc+t94D+s2hF4B9N6GvwKs8=;
 b=OCpgLoDJIA0ccE+XeUpHaPR3GNGKTH270h0uJy+BzupkCGzppRjYqqgAnwJEdWMGUm
 yIqVQdeC/VXWJGZbEfAwifea79Q8n55oJOObDF9V5vg6SOgZomicpjxPcScUcOc+6P/D
 eTmp5gnMOfIZDe+Tr3gotw2+fT1GfKbkpdmrQ7C0N0/S0waPyUAfF5b/oddkRushz1Q/
 hijGgQOlh3RZI++twFn8PflhlCjsGhsf3eVswqmfltdc1J3wSpDu0McQgtpO3sglVFnP
 /W5fZ0UYP3+n1rxnPRW9IkQZuem6Oy9AmX5BoE8RbWXxFmbY7d5NgI/mn6/Hxzyct9cE
 tLWA==
X-Gm-Message-State: AOAM532/QtMCOSlX+iTymfMRIdHpqu+kU3jKzLvSTv/6o9pnkPsTmYbh
 4inxXtwPIWsuQy63FfGMH1F5ovCreic=
X-Google-Smtp-Source: ABdhPJwZ5pvVuVCxwDe0tfeOPxxpvRVrCh9APPVkw05dGIl1GTOQfyz0n5JS9roDn764qeT0pvOZnA==
X-Received: by 2002:aa7:da44:: with SMTP id w4mr21824259eds.131.1605632024869; 
 Tue, 17 Nov 2020 08:53:44 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/29] scripts: kernel-doc: reimplement -nofunction argument
Date: Tue, 17 Nov 2020 17:53:02 +0100
Message-Id: <20201117165312.118257-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x543.google.com
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
2.28.0



