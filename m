Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4639A2B6B14
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:07:58 +0100 (CET)
Received: from localhost ([::1]:40742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4ST-0007Vi-A7
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Em-0002to-3h
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:48 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:45347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Ek-0007Dc-2I
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:47 -0500
Received: by mail-ed1-x542.google.com with SMTP id q3so23170180edr.12
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=75gEYtq9Ky2PPCOSrVNxJPp6/3R4c+TBPdu4iuXk1tk=;
 b=fPL/I+yTSWynl6WBugtzQPmHrML5/q2cJBedQM5qeiXLp1TzPtjYTjgxXc1JotjZzu
 Pem/In7TfEUysK1c/AdQOSKllbHH/RbXviGXpgPPJ8847zIDCLu772Ghj4ckBDZ1N11+
 Mbl4LeV6DMIbjskKNUqf9uL42YfRjdU3mYrnQiGREklxdIJ/DFiwJ75We8W4N0vSmwWh
 5W54mmoFoyMLF4WSH1zPm+g7xCRF2Gxrkp2zY3vPlbBoIG3NJepT3D6Tl4DgOfCIAVG9
 RajhpC4OCcslXSiUAcq8DhTle1CgWibo61eos0Z4dclmJhLn+raspHquYf4v8ZIftlj4
 dPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=75gEYtq9Ky2PPCOSrVNxJPp6/3R4c+TBPdu4iuXk1tk=;
 b=SV1MhkR7yAfQ1GoYwoge761XPxqQ44kL7OkQox6FtTomOPYjL0zupSI6dJaMO5g/Ov
 jqAgXjABB075jB2oI1/xPySNPR5QsRHcclFbeSH52Jeu64QGdd25osty6NM2SNtCXGrj
 0Po+9xOWmMPGNQRALfsqix8cgazE07QwMBILcloeuwulgrNBX7u8KeSblQE+lLMxCuaO
 I4nytgd/a4xI0Y9QETwuF69mvb7kdaXnu6oCXJ1hQxekliENVkzJ6bqsGnbYk9UO2oY3
 pbd37S5VFLTvL7kcjaXL58R8Mhry99Gep/fwrPpL6Rhxi5lQ78/A5kAZ/0tt3/+yNfMa
 PP1g==
X-Gm-Message-State: AOAM5310R7r+gzzAMmK/nXyhB1+z9sEpcLnZ1Vo7LrMywLBvf7LuE8Tb
 MtsozTj/XD5UybM9e8fx+20ANGeThEw=
X-Google-Smtp-Source: ABdhPJy1fV/oZRBtEZzLayvrYrsDD6nHz2gwntfdMGrZwykOIc+wOORSr4IwBY7cviPxElCcpEGLSQ==
X-Received: by 2002:a05:6402:16d5:: with SMTP id
 r21mr21503282edx.149.1605632015757; 
 Tue, 17 Nov 2020 08:53:35 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/29] scripts: kernel-doc: use a less pedantic markup for
 funcs on Sphinx 3.x
Date: Tue, 17 Nov 2020 17:53:00 +0100
Message-Id: <20201117165312.118257-18-pbonzini@redhat.com>
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

Unfortunately, Sphinx 3.x parser for c functions is too pedantic:

	https://github.com/sphinx-doc/sphinx/issues/8241

While it could be relaxed with some configurations, there are
several corner cases that it would make it hard to maintain,
and will require teaching conf.py about several macros.

So, let's instead use the :c:macro notation. This will
produce an output that it is not as nice as currently, but it
should still be acceptable, and will provide cross-references,
removing thousands of warnings when building with newer
versions of Sphinx.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 771367a6ab..75ddd3b5e6 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -886,19 +886,29 @@ sub output_function_rst(%) {
     my $oldprefix = $lineprefix;
     my $start = "";
 
-    if ($args{'typedef'}) {
-	if ($sphinx_major < 3) {
+    if ($sphinx_major < 3) {
+	if ($args{'typedef'}) {
 	    print ".. c:type:: ". $args{'function'} . "\n\n";
+	    print_lineno($declaration_start_line);
+	    print "   **Typedef**: ";
+	    $lineprefix = "";
+	    output_highlight_rst($args{'purpose'});
+	    $start = "\n\n**Syntax**\n\n  ``";
 	} else {
-	    print ".. c:function:: ". $args{'function'} . "\n\n";
+	    print ".. c:function:: ";
 	}
-	print_lineno($declaration_start_line);
-	print "   **Typedef**: ";
-	$lineprefix = "";
-	output_highlight_rst($args{'purpose'});
-	$start = "\n\n**Syntax**\n\n  ``";
     } else {
-	print ".. c:function:: ";
+	print ".. c:macro:: ". $args{'function'} . "\n\n";
+
+	if ($args{'typedef'}) {
+	    print_lineno($declaration_start_line);
+	    print "   **Typedef**: ";
+	    $lineprefix = "";
+	    output_highlight_rst($args{'purpose'});
+	    $start = "\n\n**Syntax**\n\n  ``";
+	} else {
+	    print "``";
+	}
     }
     if ($args{'functiontype'} ne "") {
 	$start .= $args{'functiontype'} . " " . $args{'function'} . " (";
@@ -925,7 +935,11 @@ sub output_function_rst(%) {
     if ($args{'typedef'}) {
 	print ");``\n\n";
     } else {
-	print ")\n\n";
+	if ($sphinx_major < 3) {
+	    print ")\n\n";
+	} else {
+	    print ")``\n";
+	}
 	print_lineno($declaration_start_line);
 	$lineprefix = "   ";
 	output_highlight_rst($args{'purpose'});
-- 
2.28.0



