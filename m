Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699122B6AD8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:01:32 +0100 (CET)
Received: from localhost ([::1]:44404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4MF-0005mP-FU
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:01:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Eq-00030b-8Z
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:52 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:40281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Eo-0007FA-HA
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:51 -0500
Received: by mail-ej1-x644.google.com with SMTP id oq3so30380289ejb.7
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l8OWihoDLGOUB+IKO0uLTru1BYpQyrVbsBOdCF81cxk=;
 b=PIIM6+VKREMAfKDyQXJyn4jNTiGV8sVl2T1wfMBPkZuGUsW4MU6SVcT/mACmUsGCLb
 iTnzTJ5/sCm6CZLBLf+Ttyhm3Yj+XR9d9KglOFSwQheUC0nGQ7CnsskU9bJtPx76HnNq
 flQZXLaBAwzAEC13xGpNgU9hgPCeUN/0n1vCYYLqJy7A2q4wWCBmEiB5sXmkBTaJhV5/
 bOc+FqXnoTy4+sFhKglBZrR94PgrNCMJBAISh3+5Aeqa5zSHV6AAOsn1J9qiehZxyr/Y
 v1b4/z/fIl7fxJ6r9n13IyiuTr4miSJZSCQDSUkEKEEj17qdlzhlCQk59H2hS0omo83F
 cyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=l8OWihoDLGOUB+IKO0uLTru1BYpQyrVbsBOdCF81cxk=;
 b=uf5DmNZx6nb6Hb9HM4axyO7/t1P3xteFpbOuCjT0WNOZTfGGZYSkPSA+2+KF+rElql
 IeebVrgxos7jS7K6UdAt3G7vh+H8bjcHo+pGLzGlqeOUiBO+ikMrSoF1bCmcSQeZFsY6
 ahkkQCLRKDCst1aL1S+e5eACKTX36Gsdzx3QY+gtdRFynRKBrlbXqHxp3MoTyOX7ossW
 A+Hf6B9x+Mg1WsLUk8eMUCRnC3UHtlujUG15PPvOzG0rTn4HHMPP23lrAkCpx2wQoL3J
 aGXeZSvk2L0OyQQTjBwDBPZxMrTA2sBGw+NWNop3KXnIj4y1bO7uVbC28XKKScOwJ3mU
 7ZEQ==
X-Gm-Message-State: AOAM5300EjVycNz8zr84xIKX1rkYIchHnWAmiPD65i2uH1Id8JjPimxk
 KBuceROx6+gY4No7W66OQ6xoAucakW0=
X-Google-Smtp-Source: ABdhPJxsbijP2ir7//8TSnM+NbEWsv3bgGGVTlfZHJ53K+hyztJTOmlITC9ShhFSz6jku3bMqeFHzw==
X-Received: by 2002:a17:906:36d9:: with SMTP id
 b25mr2568850ejc.155.1605632028951; 
 Tue, 17 Nov 2020 08:53:48 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/29] scripts: kernel-doc: fix line number handling
Date: Tue, 17 Nov 2020 17:53:06 +0100
Message-Id: <20201117165312.118257-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x644.google.com
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
2.28.0



