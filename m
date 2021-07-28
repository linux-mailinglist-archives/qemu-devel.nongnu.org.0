Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DE13D9556
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 20:35:34 +0200 (CEST)
Received: from localhost ([::1]:38036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8oOz-0002KO-9D
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 14:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8oLk-00062u-MJ
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:32:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8oLi-00078m-Vp
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627497130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SXpNOomr22RdeatA9jpHJ9wvEFvZE1pzhOgYIChMKV8=;
 b=S8aqyUjAYKWO1qlqCcgCGJidXLhcltWg2ER7qQnjPdK0i/IKJDmfQJjIYtioh31Zuw0aFx
 3S3mmRESdO26o6FKeR6HbcqudL2ejCQCOvA7+NPkRjNbj4Vf/CI9qQSxhrhhJVN+uDhK+6
 aXWAz3fZlmB6mDUzTe3KTSkv0ZKfyj8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-A6AyVB4kMwGAb0U-bNRyhg-1; Wed, 28 Jul 2021 14:32:06 -0400
X-MC-Unique: A6AyVB4kMwGAb0U-bNRyhg-1
Received: by mail-qk1-f197.google.com with SMTP id
 w2-20020a3794020000b02903b54f40b442so2225869qkd.0
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 11:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SXpNOomr22RdeatA9jpHJ9wvEFvZE1pzhOgYIChMKV8=;
 b=GlnllzDXJSFJBm9BYDJvfiPQWxvUKWifJ6QEdxO4RpinkWKLVUF6pSdTgvv0JIEVDY
 85AdBygORA7tzk+XH+HLGlmu/N+SjDKQkIAVxDjnXc6PNPNxssg1TrM9UIA8To6CQuUa
 JYSTn/GLx845GanyxYB1Qo+wZcBWdQ7E05KVPS0qGPFG0XhcqLqhsy+Tx9u9psMA6wOM
 4yRkEEa0Imn7bgHnXhGKmOBuE4SFdGkBxsjEUpkf+iQTuCc3ky8GQR0756rp6iKjRKg+
 TZOYKQ9K932RIkIDAiJDoe46kUfEaeGFMc1vuR4sogj0oET/Ji/2eUfqQvV/kt6Xlupq
 q9HQ==
X-Gm-Message-State: AOAM5337/JUILaDue4smXAoagOAxA8KVZHoFjPV7SEXpx4jvLGeLqboh
 YA2qpkAiMTpV6MH75x+jloR4ti++GbANVoxOf+zkfRNVsH8wLuu3o8UK9IxLRqf9v6dCn9u9xRQ
 eE5I9BN03NmP/H4cFpOfiUxbZ7q0HFD+aMyukVLhiFl5b7e1pOWbCeY/LRJTPPa4Q
X-Received: by 2002:a37:8407:: with SMTP id g7mr1074779qkd.123.1627497125411; 
 Wed, 28 Jul 2021 11:32:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7PbICOhDrVu2c50VCaRsQAl8z33SOyrpmQs4cR3MndNYXNPwLYRp6NEWmIzhM7ZgXkQga8g==
X-Received: by 2002:a37:8407:: with SMTP id g7mr1074747qkd.123.1627497125159; 
 Wed, 28 Jul 2021 11:32:05 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id n5sm417528qkp.116.2021.07.28.11.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 11:32:04 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/8] cpus: Remove the mutex parameter from do_run_on_cpu()
Date: Wed, 28 Jul 2021 14:31:49 -0400
Message-Id: <20210728183151.195139-7-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728183151.195139-1-peterx@redhat.com>
References: <20210728183151.195139-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 peterx@redhat.com, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We must use the BQL for do_run_on_cpu() without much choice, it means the
parameter is useless.  Remove it.  Meanwhile use the newly introduced
qemu_cond_wait_iothread() in do_run_on_cpu().

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/cpus.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index e714dfbf2b..9154cd7e78 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -383,8 +383,7 @@ void qemu_init_cpu_loop(void)
 }
 
 static void
-do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
-              QemuMutex *mutex)
+do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
 {
     struct qemu_work_item wi = {
         .func = func,
@@ -400,14 +399,14 @@ do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
     while (!qatomic_mb_read(&wi.done)) {
         CPUState *self_cpu = current_cpu;
 
-        qemu_cond_wait(&qemu_work_cond, mutex);
+        qemu_cond_wait_iothread(&qemu_work_cond);
         current_cpu = self_cpu;
     }
 }
 
 void run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data)
 {
-    do_run_on_cpu(cpu, func, data, &qemu_global_mutex);
+    do_run_on_cpu(cpu, func, data);
 }
 
 static void qemu_cpu_stop(CPUState *cpu, bool exit)
-- 
2.31.1


