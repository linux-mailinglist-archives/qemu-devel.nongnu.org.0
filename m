Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04EF2B6B16
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:09:46 +0100 (CET)
Received: from localhost ([::1]:49196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4UD-0002Tv-Tu
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Eo-0002zw-G9
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:51 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:44534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Em-0007Ep-Jl
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:50 -0500
Received: by mail-ed1-x542.google.com with SMTP id l5so23151308edq.11
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N5gZJAJK4fXqO+74lu1SvTAsbKiMd18NcoO5xUvOas8=;
 b=uOTDMUWuMsu/Tsn3qlAO8Vs6SHwPrY1xn1BzRnsyOjo0M530Pi++sTuWCeg8KC6Aef
 JltwgEkaobH+IvFpTEk+7hczPsKKwQOVimZFbCUN+B0WRlo3k7M9tsZuPkQoAk0AP4n1
 UeBUpXB68ZhoaWyKWNf+R1QqIZPal+ntvR9ktZx23vPsxh24GqvKk2Gf7NzYpKvGDEm1
 CWXENUynOkrj4dJOLk3VzrNilEsiAi26tuvfiDLAkwGmqssWCKxVhE/RRILuKKWAc5DH
 32gVZ6EnbaY2gMFqnJuPk+jRbtfFdblD9apyUZVYKjnTUWwOJrvGmInQQNZT21aNZRWV
 4Sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N5gZJAJK4fXqO+74lu1SvTAsbKiMd18NcoO5xUvOas8=;
 b=Wbllow5txJbHqpFGQ8mPY9mdyrHLil2IEFHE/FYUUFgCluzGrvliB0koJQNd2PET8w
 n3TxYv4Hse0/4s+XVLWMbn6dL83EPWjBZms9YMPnNmu4FY7n58jb3RaXhbcmORLmG4b6
 67lnf96uysG6PnteghjNbV4wuvOVacBNIz+48AAFg62Tr6W4CahB0jSq67pLnGvP7CbC
 bBrGSuwpgQddBFqE9ddW2rSmlF5Rb/jGnjF7BzAkY37mYmoqGLPWm6zOJQT43pD+NKjs
 T8v4kfB015Dvp5O6ZY9iyRnMfLVNzipSpITgie7uPBQR4UGQs9ZbDh72DNMDECNo+neB
 DT1w==
X-Gm-Message-State: AOAM531h/a6AOWk8ANETXKR+s8cdIj7hKd9ax5Yzfqzd954AElkUTXby
 De9tjRprbRflKuI+wYNBTE2RLrxeuo4=
X-Google-Smtp-Source: ABdhPJympmPmKjumJIqkPmUxM1nlrOuOFYR33msVoqxgxiX62ONQnblju0dsfEOsELoc1mbtQ5/6hg==
X-Received: by 2002:a05:6402:18:: with SMTP id
 d24mr2487022edu.382.1605632026945; 
 Tue, 17 Nov 2020 08:53:46 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:46 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/29] scripts: kernel-doc: don't mangle with parameter list
Date: Tue, 17 Nov 2020 17:53:04 +0100
Message-Id: <20201117165312.118257-22-pbonzini@redhat.com>
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

While kernel-doc needs to parse parameters in order to
identify its name, it shouldn't be touching the type,
as parsing it is very difficult, and errors happen.

One current error is when parsing this parameter:

	const u32 (*tab)[256]

Found at ./lib/crc32.c, on this function:

	u32 __pure crc32_be_generic (u32 crc, unsigned char const *p, size_t len, const u32 (*tab)[256], u32 polynomial);

The current logic mangles it, producing this output:

	const u32 ( *tab

That's something that it is not recognizeable.

So, instead, let's push the argument as-is, and use it
when printing the function prototype and when describing
each argument.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 0c31e9ad66..478037f736 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -655,10 +655,10 @@ sub output_function_man(%) {
 	$type = $args{'parametertypes'}{$parameter};
 	if ($type =~ m/([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)/) {
 	    # pointer-to-function
-	    print ".BI \"" . $parenth . $1 . "\" " . $parameter . " \") (" . $2 . ")" . $post . "\"\n";
+	    print ".BI \"" . $parenth . $1 . "\" " . " \") (" . $2 . ")" . $post . "\"\n";
 	} else {
 	    $type =~ s/([^\*])$/$1 /;
-	    print ".BI \"" . $parenth . $type . "\" " . $parameter . " \"" . $post . "\"\n";
+	    print ".BI \"" . $parenth . $type . "\" " . " \"" . $post . "\"\n";
 	}
 	$count++;
 	$parenth = "";
@@ -929,7 +929,7 @@ sub output_function_rst(%) {
 	    # pointer-to-function
 	    print $1 . $parameter . ") (" . $2 . ")";
 	} else {
-	    print $type . " " . $parameter;
+	    print $type;
 	}
     }
     if ($args{'typedef'}) {
@@ -954,7 +954,7 @@ sub output_function_rst(%) {
 	$type = $args{'parametertypes'}{$parameter};
 
 	if ($type ne "") {
-	    print "``$type $parameter``\n";
+	    print "``$type``\n";
 	} else {
 	    print "``$parameter``\n";
 	}
@@ -1479,7 +1479,7 @@ sub create_parameterlist($$$$) {
 	    # Treat preprocessor directive as a typeless variable just to fill
 	    # corresponding data structures "correctly". Catch it later in
 	    # output_* subs.
-	    push_parameter($arg, "", $file);
+	    push_parameter($arg, "", "", $file);
 	} elsif ($arg =~ m/\(.+\)\s*\(/) {
 	    # pointer-to-function
 	    $arg =~ tr/#/,/;
@@ -1488,7 +1488,7 @@ sub create_parameterlist($$$$) {
 	    $type = $arg;
 	    $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
 	    save_struct_actual($param);
-	    push_parameter($param, $type, $file, $declaration_name);
+	    push_parameter($param, $type, $arg, $file, $declaration_name);
 	} elsif ($arg) {
 	    $arg =~ s/\s*:\s*/:/g;
 	    $arg =~ s/\s*\[/\[/g;
@@ -1513,26 +1513,28 @@ sub create_parameterlist($$$$) {
 	    foreach $param (@args) {
 		if ($param =~ m/^(\*+)\s*(.*)/) {
 		    save_struct_actual($2);
-		    push_parameter($2, "$type $1", $file, $declaration_name);
+
+		    push_parameter($2, "$type $1", $arg, $file, $declaration_name);
 		}
 		elsif ($param =~ m/(.*?):(\d+)/) {
 		    if ($type ne "") { # skip unnamed bit-fields
 			save_struct_actual($1);
-			push_parameter($1, "$type:$2", $file, $declaration_name)
+			push_parameter($1, "$type:$2", $arg, $file, $declaration_name)
 		    }
 		}
 		else {
 		    save_struct_actual($param);
-		    push_parameter($param, $type, $file, $declaration_name);
+		    push_parameter($param, $type, $arg, $file, $declaration_name);
 		}
 	    }
 	}
     }
 }
 
-sub push_parameter($$$$) {
+sub push_parameter($$$$$) {
 	my $param = shift;
 	my $type = shift;
+	my $org_arg = shift;
 	my $file = shift;
 	my $declaration_name = shift;
 
@@ -1596,8 +1598,8 @@ sub push_parameter($$$$) {
 	# "[blah" in a parameter string;
 	###$param =~ s/\s*//g;
 	push @parameterlist, $param;
-	$type =~ s/\s\s+/ /g;
-	$parametertypes{$param} = $type;
+	$org_arg =~ s/\s\s+/ /g;
+	$parametertypes{$param} = $org_arg;
 }
 
 sub check_sections($$$$$) {
-- 
2.28.0



