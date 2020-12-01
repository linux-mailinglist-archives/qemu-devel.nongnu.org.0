Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1812CA057
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:51:56 +0100 (CET)
Received: from localhost ([::1]:40764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3GF-0007SP-GW
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:51:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk30O-0002WB-KR
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk30A-0003s4-J6
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606818917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NKqe7y+mXgOFikYR5IZB9Gho5DKqxTtHmA1FFYL0kT8=;
 b=iLN8ssxMpPwz2LDgQX2w2sgMo9odWn+/h8DcbIX3o7+ikW6OVYCODxuNmWYUds2spF7IWd
 PPitv10fqGDrNhbV3bLBFEwzYk9rlPKUwggPrsqR2P4b4q1iCLX/WsSDIjeJzlLkAPDpsZ
 FATaawRzPPUKeonvHslZFkouyvb+Myg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-Hs3d4uOWOj6SapFAE6a55g-1; Tue, 01 Dec 2020 05:35:14 -0500
X-MC-Unique: Hs3d4uOWOj6SapFAE6a55g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9C77105208F;
 Tue,  1 Dec 2020 10:35:13 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A512010013C1;
 Tue,  1 Dec 2020 10:35:13 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/32] scripts: kernel-doc: try to use c:function if
 possible
Date: Tue,  1 Dec 2020 05:34:55 -0500
Message-Id: <20201201103502.4024573-26-pbonzini@redhat.com>
In-Reply-To: <20201201103502.4024573-1-pbonzini@redhat.com>
References: <20201201103502.4024573-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
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
Cc: peter.maydell@linaro.org
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
Message-Id: <20201117165312.118257-25-pbonzini@redhat.com>
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
2.26.2



