Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049796F1530
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:19:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLAj-0002jg-5Z; Fri, 28 Apr 2023 06:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psLAd-0002jC-HN
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:17:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psLAb-0005KQ-QD
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682677060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GEcIm3ncOAoTM5gXAT+mpmQYieCKspPnGHdQEd9rYu4=;
 b=QOSYwXhMwb404rKKvIBKDpKdgASxsvWI0/6gjcpU8AIrO3XuKYNiF8Mvt3FXBFyJtWObuO
 fQmEtD/Z/W3WPYJQZHcSGN/lzuQS2UK9eH0WWv36ZYKss09DAqssCXMrHFtCGahONq6IKR
 jXfAi2+51dPwjqwjFWMUiS5uMiGT47k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-AIH5wYhyO464SUx_QnQcLA-1; Fri, 28 Apr 2023 06:17:39 -0400
X-MC-Unique: AIH5wYhyO464SUx_QnQcLA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f315735edeso36422465e9.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 03:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682677057; x=1685269057;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GEcIm3ncOAoTM5gXAT+mpmQYieCKspPnGHdQEd9rYu4=;
 b=gJhxkC/BG3ZDWvdpMR59wZkU+3wAStOgRMFW1+5WfMGSa3lVE+m8M9QG857/qTFJq7
 MoDZQXVHv7yh4k++bMWclgwBpXFOqOBnM16kNCcr1PfpCb3dYXx/dCnEQoezHivkZCOi
 2quPb4LjaA5nfYo91DaU3P8pifK0GM2oD4zD06zQdB3sfDUbS8YvEpCXAYOhYYZAOcl3
 HoUHCEbYfrtReq+Dm55y0czgrqf2Yph/iLszjOZrshpPf7uwN2R+Cn1TzPOidZ81gGap
 8lxH3tkv1vnoDPz3NSIiHZIR0zs2PSMi62xlU89JkFFjykYTM6k1XpsZHRGCRFS7VFWm
 iyBg==
X-Gm-Message-State: AC+VfDzqjopvugEfQeFkGHfz3dVARIDCIO0ZA7bjLQrxONqRIcPhhMbJ
 /UQ6ONpQbe/wPcSrTXriIdph2ezsthmsl+WwPcVwvnaMKxJRVUt8tRL+IzMkfyFlYxDe82Mi0Jv
 holvdoJ4kDfvpcAwG9oE0qoHWlHIF+NjY4eZZxEu4Kui4BYTsTB1RB36wfss5BpPYTEEKxVlm3F
 M=
X-Received: by 2002:a05:600c:2281:b0:3f1:72db:454c with SMTP id
 1-20020a05600c228100b003f172db454cmr3732826wmf.19.1682677057412; 
 Fri, 28 Apr 2023 03:17:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6FktJaAGE40caFUd8g4qI52GCYnLpji+iN7DVzduBKljo2WSveb2KJU30mvG2c6xX9jHNUVw==
X-Received: by 2002:a05:600c:2281:b0:3f1:72db:454c with SMTP id
 1-20020a05600c228100b003f172db454cmr3732806wmf.19.1682677057000; 
 Fri, 28 Apr 2023 03:17:37 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a1c6a16000000b003f17e79d74asm24233480wmc.7.2023.04.28.03.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 03:17:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PATCH] cpus-common: stop using mb_set/mb_read
Date: Fri, 28 Apr 2023 12:17:35 +0200
Message-Id: <20230428101735.130779-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use a store-release at the end of the work item, and a load-acquire when
waiting for the item to be completed.  This is the standard message passing
pattern and is both enough and clearer than mb_read/mb_set.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 cpus-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/cpus-common.c b/cpus-common.c
index b0047e456f93..a53716deb437 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -157,7 +157,7 @@ void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
     wi.exclusive = false;
 
     queue_work_on_cpu(cpu, &wi);
-    while (!qatomic_mb_read(&wi.done)) {
+    while (!qatomic_load_acquire(&wi.done)) {
         CPUState *self_cpu = current_cpu;
 
         qemu_cond_wait(&qemu_work_cond, mutex);
@@ -363,7 +363,7 @@ void process_queued_cpu_work(CPUState *cpu)
         if (wi->free) {
             g_free(wi);
         } else {
-            qatomic_mb_set(&wi->done, true);
+            qatomic_store_release(&wi->done, true);
         }
     }
     qemu_mutex_unlock(&cpu->work_mutex);
-- 
2.40.0


