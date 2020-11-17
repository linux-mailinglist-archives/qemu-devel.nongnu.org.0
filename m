Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5CE2B6AB9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:54:51 +0100 (CET)
Received: from localhost ([::1]:47478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4Fm-0003qT-7y
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:54:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EP-00021u-M6
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:25 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:46647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EN-000746-Gd
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:25 -0500
Received: by mail-ej1-x643.google.com with SMTP id w13so30378659eju.13
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o3FEmTirvN3wCU7dGXsCMf8zrDeMSpCzE0Xw7TwlYxw=;
 b=VwYa0aGOkvUHLLgA1LuRuIfmx3iu6yxso4fWhSZ0ai3fW+ePI438vRE6MLcoPRdM3d
 TIE2UBwRwqOGMAWUfL5pSHBRM2SYOt+Zs9noWfpmoKu6VyveWWQJqdGJU3VVS3nAHg5+
 jeVKFVsu8pnxV69h2SuPxgMBbuCmsdhsRpjoOKPv3jAny6uvkedNV08TLcYGhGZ8YbIS
 yKb8jtLQQlZ/bX6FKWc980T+945gpGsEJlJPDN4YnsfuU0ElMyRyNv5Llm9tAap2fpZM
 X/IRTZn6M/cJ8RzS4+47L7XsxGp8D+Jfxi8pXw8cOaNp1iakC/XNKoMwYXBfzcq44tpR
 uuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=o3FEmTirvN3wCU7dGXsCMf8zrDeMSpCzE0Xw7TwlYxw=;
 b=CDhsy/Hz8uXyPX3Pzjf3W+VGdX09jdmZRnUoNaeP1QeRZp0R8wVgBn4DgqWyZXUFq0
 yamrO6g2n5D7c84IVp6FzYjr52KPp62DM8yMUtvXcsCKazcOpyopn6NwEHm94WMmLAAO
 wOBtyUg81xhOJMYd8nLAdig7j4A7+7YzyHlWK3nvpqaQ808lXMX+JAXi/6cOC2e5toc4
 CkJ18GL88thF5z7pUpdIuuuaLdF6GOKpo84vw09xHhAwd0raCFk2H7ch1kYM15QZEwOv
 akldcgxnHGQqyj/aH6zQKtE1ouTuyjO92kbOCz5eCdl+YiNtvO5oHhP7NOGY2i2AWl78
 7IcA==
X-Gm-Message-State: AOAM5303rkiEVwDg12PIdx30mlCyOdwRXusd5dsu1tNxlWUOvKxekuXZ
 OG0Cu4jffbp1IGGyqg73jZEB0Lr73eA=
X-Google-Smtp-Source: ABdhPJzapIfwI/UpTbSWsFQlRrwb8VGki1xRVfIyy0U6LhLgw14JWm/v0yAsMBaAXWROoyskY0WjdQ==
X-Received: by 2002:a17:906:3807:: with SMTP id
 v7mr19302203ejc.441.1605632001868; 
 Tue, 17 Nov 2020 08:53:21 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/29] scripts: kernel-doc: accept blank lines on parameter
 description
Date: Tue, 17 Nov 2020 17:52:49 +0100
Message-Id: <20201117165312.118257-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=no autolearn_force=no
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

Sphinx is very pedantic with respect to blank lines. Sometimes,
in order to make it to properly handle something, we need to
add a blank line. However, currently, any blank line inside a
kernel-doc comment like:

	/*
	 * @foo: bar
         *
	 *       foobar
	 *
	 * some description

will be considered as if "foobar" was part of the description.

This patch changes kernel-doc behavior. After it, foobar will
be considered as part of the parameter text. The description
will only be considered as such if it starts with:

zero spaces after asterisk:

	*foo

one space after asterisk:
	* foo

or have a explicit Description section:

	*   Description:

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/c07d2862792d75a2691d69c9eceb7b89a0164cc0.1586881715.git.mchehab+huawei@kernel.org
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index e4b3cd486f..95f2d7adcf 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -334,13 +334,14 @@ my $lineprefix="";
 
 # Parser states
 use constant {
-    STATE_NORMAL        => 0, # normal code
-    STATE_NAME          => 1, # looking for function name
-    STATE_BODY_MAYBE    => 2, # body - or maybe more description
-    STATE_BODY          => 3, # the body of the comment
-    STATE_PROTO         => 4, # scanning prototype
-    STATE_DOCBLOCK      => 5, # documentation block
-    STATE_INLINE        => 6, # gathering documentation outside main block
+    STATE_NORMAL        => 0,        # normal code
+    STATE_NAME          => 1,        # looking for function name
+    STATE_BODY_MAYBE    => 2,        # body - or maybe more description
+    STATE_BODY          => 3,        # the body of the comment
+    STATE_BODY_WITH_BLANK_LINE => 4, # the body, which has a blank line
+    STATE_PROTO         => 5,        # scanning prototype
+    STATE_DOCBLOCK      => 6,        # documentation block
+    STATE_INLINE        => 7,        # gathering doc outside main block
 };
 my $state;
 my $in_doc_sect;
@@ -1987,6 +1988,12 @@ sub process_body($$) {
 	}
     }
 
+    if ($state == STATE_BODY_WITH_BLANK_LINE && /^\s*\*\s?\S/) {
+	dump_section($file, $section, $contents);
+	$section = $section_default;
+	$contents = "";
+    }
+
     if (/$doc_sect/i) { # case insensitive for supported section names
 	$newsection = $1;
 	$newcontents = $2;
@@ -2040,18 +2047,21 @@ sub process_body($$) {
 	$state = STATE_PROTO;
 	$brcount = 0;
     } elsif (/$doc_content/) {
-	# miguel-style comment kludge, look for blank lines after
-	# @parameter line to signify start of description
 	if ($1 eq "") {
-	    if ($section =~ m/^@/ || $section eq $section_context) {
+	    if ($section eq $section_context) {
 		dump_section($file, $section, $contents);
 		$section = $section_default;
 		$contents = "";
 		$new_start_line = $.;
+		$state = STATE_BODY;
 	    } else {
+		if ($section ne $section_default) {
+		    $state = STATE_BODY_WITH_BLANK_LINE;
+		} else {
+		    $state = STATE_BODY;
+		}
 		$contents .= "\n";
 	    }
-	    $state = STATE_BODY;
 	} elsif ($state == STATE_BODY_MAYBE) {
 	    # Continued declaration purpose
 	    chomp($declaration_purpose);
@@ -2203,7 +2213,8 @@ sub process_file($) {
 	    process_normal();
 	} elsif ($state == STATE_NAME) {
 	    process_name($file, $_);
-	} elsif ($state == STATE_BODY || $state == STATE_BODY_MAYBE) {
+	} elsif ($state == STATE_BODY || $state == STATE_BODY_MAYBE ||
+		 $state == STATE_BODY_WITH_BLANK_LINE) {
 	    process_body($file, $_);
 	} elsif ($state == STATE_INLINE) { # scanning for inline parameters
 	    process_inline($file, $_);
-- 
2.28.0



