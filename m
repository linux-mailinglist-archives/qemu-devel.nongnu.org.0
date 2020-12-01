Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75832CA040
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:49:32 +0100 (CET)
Received: from localhost ([::1]:59960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3Dv-0003aY-UT
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:49:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk30O-0002W3-Is
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk309-0003rg-8l
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606818916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iUR8QomuX/Blkx1DYOhTiUT7FwKK7aUab2JpYXJFiRg=;
 b=EcGFfThh57p2BJ1Fb6ZdsVbSk2YcKfwJFrcrVSsCztBF5nOq1+lw/EOPkdguS+vplL4Z4S
 /eg6/KVl6l2BciP7MQhlpcVgn9Qzhre0g6RrB39Pddqic1fIBXGvxtG4zmLJx1qym2LAOE
 JOyi6tSVznj9dg5auJoPZwe9zq1hIGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-_yxM6Qs8OJiTnM1FuQ02Lw-1; Tue, 01 Dec 2020 05:35:14 -0500
X-MC-Unique: _yxM6Qs8OJiTnM1FuQ02Lw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89D0C190A7A6;
 Tue,  1 Dec 2020 10:35:13 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44A3410013C1;
 Tue,  1 Dec 2020 10:35:13 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/32] scripts: kernel-doc: fix line number handling
Date: Tue,  1 Dec 2020 05:34:54 -0500
Message-Id: <20201201103502.4024573-25-pbonzini@redhat.com>
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

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Address several issues related to pointing to the wrong line
number:

1) ensure that line numbers will always be initialized

   When section is the default (Description), the line number
   is not initializing, producing this:

	$ ./scripts/kernel-doc --enable-lineno ./drivers/media/v4l2-core/v4l2-mem2mem.c|less

	**Description**

	#define LINENO 0
	In case of streamoff or release called on any context,
	1] If the context is currently running, then abort job will be called
	2] If the context is queued, then the context will be removed from
	   the job_queue

  Which is not right. Ensure that the line number will always
  be there. After applied, the result now points to the right location:

	**Description**

	#define LINENO 410
	In case of streamoff or release called on any context,
	1] If the context is currently running, then abort job will be called
	2] If the context is queued, then the context will be removed from
	   the job_queue

2) The line numbers for function prototypes are always + 1,
   because it is taken at the line after handling the prototype.
   Change the logic to point to the next line after the /** */
   block;

3) The "DOC:" line number should point to the same line as this
   markup is found, and not to the next one.

Probably part of the issues were due to a but that was causing
the line number offset to be incremented by one, if --export
were used.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201117165312.118257-24-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 667ad3169c..98752164eb 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1705,7 +1705,7 @@ sub dump_function($$) {
     my $file = shift;
     my $noret = 0;
 
-    print_lineno($.);
+    print_lineno($new_start_line);
 
     $prototype =~ s/^static +//;
     $prototype =~ s/^extern +//;
@@ -2033,7 +2033,7 @@ sub process_name($$) {
     if (/$doc_block/o) {
 	$state = STATE_DOCBLOCK;
 	$contents = "";
-	$new_start_line = $. + 1;
+	$new_start_line = $.;
 
 	if ( $1 eq "" ) {
 	    $section = $section_intro;
@@ -2116,6 +2116,7 @@ sub process_body($$) {
     if ($state == STATE_BODY_WITH_BLANK_LINE && /^\s*\*\s?\S/) {
 	dump_section($file, $section, $contents);
 	$section = $section_default;
+	$new_start_line = $.;
 	$contents = "";
     }
 
@@ -2171,6 +2172,7 @@ sub process_body($$) {
 	$prototype = "";
 	$state = STATE_PROTO;
 	$brcount = 0;
+        $new_start_line = $. + 1;
     } elsif (/$doc_content/) {
 	if ($1 eq "") {
 	    if ($section eq $section_context) {
-- 
2.26.2



