Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5E6315242
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:00:57 +0100 (CET)
Received: from localhost ([::1]:52500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9UVc-0004ox-FD
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:00:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9USu-00037w-8E
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:58:08 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9USs-0007yJ-6T
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:58:07 -0500
Received: by mail-wr1-x434.google.com with SMTP id g10so22302360wrx.1
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 06:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MH27OyCQo/6Jpmsa4pgP9501bwOgK8gpSJo4ftUeY/w=;
 b=qVrzCmwv1T5Hi0ZKN4Wk/XEcc2GRs1Ig1UVw/dEbv4tGFD86H+nADGf02zJTSl3EfX
 y1AsxdPfEJUP9wJRwv8ExQlGUtYRDMeHLu0NLWUey4jJci4VurtO0kTjUZer0y2AOPEw
 GtGPzbzdZTPUmTW0KVTDzbwOd9SzKXFrGpjr8ZWBW9idic7Aaj4KaWh+VUSliFgE05ww
 E8CtsrTVIDXMqkXQGtLK+HqHAjygkhQa4Y/PdJrMVGQtpSmpWljEnnNxyGM3G0QyzEcc
 Jzk5UFYZwLJFliXHENM1oXcYkNyUjdHURtzZq3wmdkFGL68PT8fYx0aK7p04QeFn1hog
 D5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MH27OyCQo/6Jpmsa4pgP9501bwOgK8gpSJo4ftUeY/w=;
 b=Zoau5AiTgPDYzQ/K9Yj1cDcfMQuT+FQ1YQEQDDkYyJYosSpmq4Kry5IMib9NXY2k1L
 YDp4CJnlQtqBrgjBsh6IDKnAaPvzflSCfCFyYdxpv2fpQPBxYYRqHDQjbQW6MQ6hk8cT
 +xEfSpIjxVE8nUNC8xmTkWipFWq9QPL/Xse+m229/gW+VW4fuqDabzobBg/6VQ2Yhu0w
 AMYqKhgluqxpKBgTIHLvDCeRWipys14UzBJ34VqXDcQNlZC4vskPhq/GO8hQkYFMqeLI
 NiRs4rXseCNjBkWmEpkfneP1umkfVjMGtF3pH+HHqX5MXN5doww8IBMtJJOUqZ3QjcjM
 NL+w==
X-Gm-Message-State: AOAM531P7wEpJ1UepKwLlsPkNiUc9SaIijPI1wVop25SfcnT9RDFMmsl
 OVf2HSNfjL/Iu8UIV8ImqwVZQJtlT9k5PA==
X-Google-Smtp-Source: ABdhPJwCd3ThTJNWyPF8b+RssKB9LDJ0VCC+4BoOde69EHU+0Qa56N/QHTmL3lwjCKsraQGyubUJ3w==
X-Received: by 2002:adf:a59a:: with SMTP id g26mr18719687wrc.271.1612882684207; 
 Tue, 09 Feb 2021 06:58:04 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h207sm5304061wme.18.2021.02.09.06.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 06:58:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] trace: skip qemu_set_log_filename if no "-D" option was
 passed
Date: Tue,  9 Feb 2021 15:57:59 +0100
Message-Id: <20210209145759.141231-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210209145759.141231-1-pbonzini@redhat.com>
References: <20210209145759.141231-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: armbru@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the "simple" backend is not active but the "log" backend is,
both "-trace file=" and "-D" will result in a call to
qemu_set_log_filename.  Unfortunately, QEMU was also calling
qemu_set_log_filename if "-D" was not passed, so the "-trace
file=" option had no effect and the tracepoints went back to
stderr.

Fortunately we can just skip qemu_set_log_filename in that case,
because the log backend will initialize itself just fine as soon
as qemu_set_log is called, also in qemu_process_early_options.

Cc: stefanha@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index b219ce1f35..e67f91dd37 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2367,7 +2367,9 @@ static void qemu_process_early_options(void)
     trace_init_file();
 
     /* Open the logfile at this point and set the log mask if necessary.  */
-    qemu_set_log_filename(log_file, &error_fatal);
+    if (log_file) {
+        qemu_set_log_filename(log_file, &error_fatal);
+    }
     if (log_mask) {
         int mask;
         mask = qemu_str_to_log_mask(log_mask);
-- 
2.29.2


