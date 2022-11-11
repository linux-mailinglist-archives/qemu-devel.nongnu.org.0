Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF2F626169
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:37:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYrr-0007oh-1Q; Fri, 11 Nov 2022 13:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYrg-0007mM-51
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:34:56 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYre-0007Nw-Cu
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:34:55 -0500
Received: by mail-wr1-x433.google.com with SMTP id d9so2844686wrm.13
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T5GxhIBJkuvbmVVgv/ZhPxdB81IZkw7m4xwm91bp38w=;
 b=eT2QlKzdi4toF8AOBAkVtc6YWGJbQuVbS6vXKTBjtWa3UlAl4B8QeTAIXuN5JXqR77
 DNtgCgUNYEjm1IHZ5qKI97CBSSXpbZ2m+ozJEknTpPJ0IBFvEIAXTYdklSzxIACuAWhc
 dAlpaGvpV89uvNfQ7Abw51hEanLS/87/yr06XBzYmnlrwLAg1vAaj4GyrrMcKG9dLYE2
 63n3AhcphGbEbZDUgYCcGzAa9zOVQA16jG/0dteGvvmDokDJ/nHFG1bdT7rtuTO6Y5PA
 yCjR6kzv8oW2XpFp8JnfHbux7pipGYB3e4wvrI398KQNqG60volsKCAMkYb7YOAzF9zX
 5dIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T5GxhIBJkuvbmVVgv/ZhPxdB81IZkw7m4xwm91bp38w=;
 b=qiX/8H5e4YxWNdCuA2/zkUisTNOK1umUI8JM+90AF1C6MEBgUo4rQYkoy7AYdpvIjW
 D9nI6wsfhj6UX0B2y7HzhfUYqp0JqqBvBmbduox6Pv8atzL0vtT8ZizmZaJc7j4lSiIV
 QN5lPueZRwEAeh9M2flFwQ81tLPVt7glMouZQ1SPcyahhRWN/3QN67KqmHl0HlMFUPkn
 NvaPtZrSBxClPNNYoD7PJjxF3T1UvxFVEk/I9I++4pVObp66VlTre0X6anABv/O01WjS
 e+DS5YsbsYsiPcuytblczDEHRx4aK6KI94d9SwEvgcUBT3ThVDQdsCDH6UIgFURJSG0H
 QLIw==
X-Gm-Message-State: ANoB5pl3OhWFW8QsipwUbbvS+GRym1aUY7/pWLmzPsDR3AbXWI+EyAn/
 v850jHAeJqqD2bG5g/quZiPzKA==
X-Google-Smtp-Source: AA0mqf4ZUzMqTb+GkqNZrp0Wgpec88nlGhWhFxT8Rsc0TBi8yG390JPv9AZsKWXjXzGfT1kDHLTAwQ==
X-Received: by 2002:adf:f90e:0:b0:236:d2ad:8bc4 with SMTP id
 b14-20020adff90e000000b00236d2ad8bc4mr2046707wrr.329.1668191692210; 
 Fri, 11 Nov 2022 10:34:52 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bg1-20020a05600c3c8100b003cfaae07f68sm10012459wmb.17.2022.11.11.10.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:34:51 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C55B11FFCA;
 Fri, 11 Nov 2022 18:25:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH  v5 20/20] include/hw: add commentary to current_cpu export
Date: Fri, 11 Nov 2022 18:25:35 +0000
Message-Id: <20221111182535.64844-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Document the intended use of current_cpu and discourage its use in new
HW emulation code. Once we have fully converted the tree we should
probably move this extern to another header.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/core/cpu.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8830546121..209b88e559 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -454,6 +454,20 @@ extern CPUTailQ cpus;
 #define CPU_FOREACH_SAFE(cpu, next_cpu) \
     QTAILQ_FOREACH_SAFE_RCU(cpu, &cpus, node, next_cpu)
 
+/**
+ * current_cpu - TLS pointing to the current executing CPU
+ *
+ * current_cpu is a thread local convenience variable containing that
+ * threads executing CPUState. It is intended to be used deep in
+ * accelerator related operations where passing down CPUState is too
+ * fiddly.
+ *
+ * Its use in HW emulation is heavily discouraged in new code as not
+ * all memory accesses will necessarily be from an executing CPU (e.g.
+ * from a debugger). HW emulation should be using MemTxAttrs to derive
+ * the exact source of a memory access. If the access is from a CPU it
+ * can be derived from qemu_get_cpu(cpu_index).
+ */
 extern __thread CPUState *current_cpu;
 
 /**
-- 
2.34.1


