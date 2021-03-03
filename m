Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4084732BC45
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 22:49:48 +0100 (CET)
Received: from localhost ([::1]:56764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZNL-00067Y-6l
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 16:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZLO-0003uI-0P; Wed, 03 Mar 2021 16:47:46 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZLM-0002Ax-IO; Wed, 03 Mar 2021 16:47:45 -0500
Received: by mail-wm1-x331.google.com with SMTP id e23so6325540wmh.3;
 Wed, 03 Mar 2021 13:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iDkHmNWDJUjsisDNEA+tDXF79jqbgWv+Yeaa+F2Cdm4=;
 b=ZgbC2jy6AG+RLur1BjIecSk+qs2lJQd1qYBzQYFFcQVKLdTR2adqVQhR+BNuxjrOn0
 RovMZS38gTe2c5ML2yGa47NrUOeUfVBG0t3wHT4Yl1LTYeflXoiOlJIyeoElw/1E8rsx
 WiED4I0tprqnt2AzsUZIz0lIEVwncf+7i0er2v24jxYE9M8PxZ25o+p3M5GVrcSFFd9U
 H9qJHKUhtx+dY6DO7M6iKmiBb4bgCqJRnqkjIKsn1mAibxOlp+NPbOPeFHQzUQn9bi+Z
 Vx3OaOKBcnYKDLDoKDEvdLHr15dwbiuJra+ps/y+7KCVXeatb0ZSrV2FWBbw+ulzwR6a
 erGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iDkHmNWDJUjsisDNEA+tDXF79jqbgWv+Yeaa+F2Cdm4=;
 b=QD/J77+sOP96vj8kQMFdas6y1lAku07FiOpvQFLOigQWvpmSn/wpWW3Pz/F97pwREk
 TeDbrlvA6yWr25YWmtY/BwFMsMCalH4oUBt/b+vgTnzRpRCSMuQUd+jithrAA7Qt/TnH
 4DsZgKfSVb1qwJl+39cq3g7BWQMybgShakoqNthF3uCKQBL4PwwvuaVuUtVUez5O7+7u
 wmh3K6ukC4Qyns4tDExOQ2lB1teMX2nXN4LLSNETg+jyRUv0w2JrbRJakJQKehUPv+n0
 WPwlYq/+oJGb6gl7eXfGLL87mOnqyxKV1bARyQX1S0MOomtXH+3Gbw7zyBstrXYjjPtT
 qWJA==
X-Gm-Message-State: AOAM530PdFZ9C/WwrPKMJIywJPv0KAVzxlbF54hJYUvqAw3fj72C7Kfc
 ArbFKKDqRhpLhaj52/AK3yE3Hy6dOpw=
X-Google-Smtp-Source: ABdhPJyFd5xk9OkNc9a2uHS1GRZjG6YVKtiIkDjU8POlwni8ZQ8Ge8hXSIMDlcTDzIJM24ntPHcndA==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr812149wmj.81.1614808061943;
 Wed, 03 Mar 2021 13:47:41 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g9sm6935176wmq.25.2021.03.03.13.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:47:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/28] cpu: Directly use get_memory_mapping() fallback
 handlers in place
Date: Wed,  3 Mar 2021 22:46:46 +0100
Message-Id: <20210303214708.1727801-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No code uses CPUClass::get_memory_mapping() outside of hw/core/cpu.c:

  $ git grep -F -- '->get_memory_mapping'
  hw/core/cpu.c:87:    cc->get_memory_mapping(cpu, list, errp);
  hw/core/cpu.c:439:    k->get_memory_mapping = cpu_common_get_memory_mapping;
  target/i386/cpu.c:7422:    cc->get_memory_mapping = x86_cpu_get_memory_mapping;

Check the handler presence in place and remove the common fallback code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/cpu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 1de00bbb474..5abf8bed2e4 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -83,13 +83,11 @@ void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    cc->get_memory_mapping(cpu, list, errp);
-}
+    if (cc->get_memory_mapping) {
+        cc->get_memory_mapping(cpu, list, errp);
+        return;
+    }
 
-static void cpu_common_get_memory_mapping(CPUState *cpu,
-                                          MemoryMappingList *list,
-                                          Error **errp)
-{
     error_setg(errp, "Obtaining memory mappings is unsupported on this CPU.");
 }
 
@@ -419,7 +417,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->parse_features = cpu_common_parse_features;
     k->get_arch_id = cpu_common_get_arch_id;
     k->has_work = cpu_common_has_work;
-    k->get_memory_mapping = cpu_common_get_memory_mapping;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
-- 
2.26.2


