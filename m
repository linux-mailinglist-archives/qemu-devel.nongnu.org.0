Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0340C2B6B0B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:06:15 +0100 (CET)
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4Qo-00041z-2e
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Er-00032C-Vo
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:54 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:41163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Ep-0007GA-I5
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:53 -0500
Received: by mail-ej1-x643.google.com with SMTP id gj5so2911885ejb.8
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ryf6omjdRP3QKleQxuXUTo2JT7FTp9P5wBUuqReBuz8=;
 b=gvYl4B09s9rdssuKsWHn3EgBKNQztmmbriK+/Wa87Zu4SECdI+cQSnbtbAN3vaN90U
 3huXnUejKoCGBPn+AzbL0NVw++q1SnrCjBN/QTWrG2WG9V87kJNXiYDLaeKObQqbUFLp
 XGZWLRXICgdqiuBlRx0R7odaV8tunXlUl7UlI5qEMjBtrGYC9YYYQyVEdylNfRl3DiHD
 KF37EljQPTD9lF6GhJ4EnPt4kpIVPU/T6M6wiqHExeZcRKpHzd1IxM63e8x+LpHx/j+M
 0s7I1kXnFHAvRH4nkwgHxg0UY93z3uJdn4C9JWCyQB7rx02QeHdCbnHk0h+K2BfNawIs
 DDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ryf6omjdRP3QKleQxuXUTo2JT7FTp9P5wBUuqReBuz8=;
 b=Q4SKFZXq4hcNGTh6o19IroGzNFlJXQtqMCZiKkW3iSS8egLual4Z3uV8QcOr0mr96r
 MRUZKTd1qrl55ZpSj6+ukXLyOErav8JNd1Jk3Gwn5WSRW7pm0AyCcTw9inhoQFu8nQRn
 Q0FZu8mDN2XPUd/Izjw1IEnXca8dayP0LV/2JoRv+5feh9SoFCzMDnleI/ex2KM0HSwG
 kqF6HUxztB3te8mFgpaPZMD4ryF/RdzRbfT0RFir6FL1QXRLapcNKP1hGtzAbzIt2MYy
 e3oCceOShP0XL6Goa4wpTqTftweu/ylWRDgrJ82jxnJxGBRlT4y8z1pmH4k4kK5MEFPR
 BzJg==
X-Gm-Message-State: AOAM533CvYRH8mzN0ZkIeeZ3trZ/wHdHehoLT98PmGIIIfWtVL7L70DK
 Cq3V0htO1uWhSWY+WG79j/0ZDsWyLCQ=
X-Google-Smtp-Source: ABdhPJyrjU4GOHFYFgmnpu3VZO23R6r5+pMAmJPaLoHphEGoBIzPbZP0HOifm4fEfV1b/5Ow92HNSQ==
X-Received: by 2002:a17:906:892:: with SMTP id
 n18mr19578559eje.1.1605632030002; 
 Tue, 17 Nov 2020 08:53:50 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:49 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/29] scripts: kernel-doc: try to use c:function if possible
Date: Tue, 17 Nov 2020 17:53:07 +0100
Message-Id: <20201117165312.118257-25-pbonzini@redhat.com>
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

There are a few namespace clashes by using c:macro everywhere:

basically, when using it, we can't have something like:

	.. c:struct:: pwm_capture

	.. c:macro:: pwm_capture

So, we need to use, instead:

	.. c:function:: int pwm_capture (struct pwm_device * pwm, struct pwm_capture * result, unsigned long timeout)

for the function declaration.

The kernel-doc change was proposed by Jakob Lykke Andersen here:

	https://github.com/jakobandersen/linux_docs/commit/6fd2076ec001cca7466857493cd678df4dfe4a65

Although I did a different implementation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 98752164eb..2d56c46933 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -917,6 +917,7 @@ sub output_function_rst(%) {
     my ($parameter, $section);
     my $oldprefix = $lineprefix;
     my $start = "";
+    my $is_macro = 0;
 
     if ($sphinx_major < 3) {
 	if ($args{'typedef'}) {
@@ -926,11 +927,17 @@ sub output_function_rst(%) {
 	    $lineprefix = "";
 	    output_highlight_rst($args{'purpose'});
 	    $start = "\n\n**Syntax**\n\n  ``";
+	    $is_macro = 1;
 	} else {
 	    print ".. c:function:: ";
 	}
     } else {
-	print ".. c:macro:: ". $args{'function'} . "\n\n";
+	if ($args{'typedef'} || $args{'functiontype'} eq "") {
+	    $is_macro = 1;
+	    print ".. c:macro:: ". $args{'function'} . "\n\n";
+	} else {
+	    print ".. c:function:: ";
+	}
 
 	if ($args{'typedef'}) {
 	    print_lineno($declaration_start_line);
@@ -939,7 +946,7 @@ sub output_function_rst(%) {
 	    output_highlight_rst($args{'purpose'});
 	    $start = "\n\n**Syntax**\n\n  ``";
 	} else {
-	    print "``";
+	    print "``" if ($is_macro);
 	}
     }
     if ($args{'functiontype'} ne "") {
@@ -964,14 +971,12 @@ sub output_function_rst(%) {
 	    print $type;
 	}
     }
-    if ($args{'typedef'}) {
-	print ");``\n\n";
+    if ($is_macro) {
+	print ")``\n\n";
     } else {
-	if ($sphinx_major < 3) {
-	    print ")\n\n";
-	} else {
-	    print ")``\n";
-	}
+	print ")\n\n";
+    }
+    if (!$args{'typedef'}) {
 	print_lineno($declaration_start_line);
 	$lineprefix = "   ";
 	output_highlight_rst($args{'purpose'});
-- 
2.28.0



