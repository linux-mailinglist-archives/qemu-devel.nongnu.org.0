Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA104CEB9E
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:07:03 +0100 (CET)
Received: from localhost ([::1]:45542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqbH-0000a0-1G
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:07:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqUe-00008j-PS
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:12 -0500
Received: from [2a00:1450:4864:20::42c] (port=39466
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqUd-0003mF-6f
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:12 -0500
Received: by mail-wr1-x42c.google.com with SMTP id n15so5204787wra.6
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wb7+viwSho19XAgJtTyRiyTuJeYdM+u977LfdFPHfVQ=;
 b=bBX6pq9iXxBS3TRdfa0xWO6jL8Ea+kWfanzGRRxKvYleD0cAIvOs/2KZ42j96Mlhm/
 QtPwheVUQv/54dNXnZxGCyVBletmmzzGHNfYCw7S/PjtMkP9UlNhOrj2FlGzYi/C6OQd
 a+a967rXli+RT1OrnTABuKdAjHinMj93qD3xQvVAVQYjWuQlrHhZynb2Sjjz3MYTmAzZ
 9Sh8rQSmcDPInmFT9YsBXrV8CSxgp0G2CIXN8hlXe9YqTTe5+liRv7Cl6EM5pYghU/v0
 x8QI5aYlvRQW18wbSNrmBHCvM2DBnfURemSbLi8mFig+HG47Stt/7SPC20M5E1Or09BA
 kBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wb7+viwSho19XAgJtTyRiyTuJeYdM+u977LfdFPHfVQ=;
 b=R2zeuQH63mvQ34iEeVEmpKevdsTZ+njda0WZscc4Kr0RMgUf4eZsvIgmzR7IWuoWa4
 sV1roKvjUK0mPm1GApeMOwE7ciPWr0bQF8h//KYmAhmHphS4PIDE35jlqDz3kgi+xZZU
 k2kcg0ImbRxEByJBA2MdnI9LLmo7bU77Hiph41Feg/1m968PyMhFSNEN5BB1uV6tkRAI
 aXirfzlsbogSyfxR8UChXn41b0eqD8hBfAQZiUkv0v6thPDfdCgErTvyEYd8uK6mjfdI
 2wdWeDOM2MmnWmLXOfkdJh0WIa4aJv3poTOvFCprC7GnPa4dyH+z5O7mmJTeRyls7et5
 RilQ==
X-Gm-Message-State: AOAM531ZUl8eYWL9L8fXYQVq1B6rJ7vPcvvq7CPkQ6EfRJczr3gasotX
 VKaxUC8Kb7PkALe8Z9eDKsQqMZxGNnM=
X-Google-Smtp-Source: ABdhPJzoUM3YUzwk99t7sEBa/K+FfniYd26uVvb6ygh3tEFJXjCobx1B5ohhAm+0SMA2aXmiwr0CPg==
X-Received: by 2002:adf:e401:0:b0:1ed:c254:d51f with SMTP id
 g1-20020adfe401000000b001edc254d51fmr5170781wrm.49.1646571609225; 
 Sun, 06 Mar 2022 05:00:09 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 l13-20020a05600002ad00b001ea78a5df11sm10367911wry.1.2022.03.06.05.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:00:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/33] accel: Restrict sysemu stubs to system emulation
Date: Sun,  6 Mar 2022 13:59:28 +0100
Message-Id: <20220306130000.8104-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-2-f4bug@amsat.org>
---
 accel/stubs/meson.build | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/accel/stubs/meson.build b/accel/stubs/meson.build
index 12dd1539afa..0249b9258fd 100644
--- a/accel/stubs/meson.build
+++ b/accel/stubs/meson.build
@@ -1,4 +1,7 @@
-specific_ss.add(when: 'CONFIG_HAX', if_false: files('hax-stub.c'))
-specific_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
-specific_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
-specific_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
+sysemu_stubs_ss = ss.source_set()
+sysemu_stubs_ss.add(when: 'CONFIG_HAX', if_false: files('hax-stub.c'))
+sysemu_stubs_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
+sysemu_stubs_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
+sysemu_stubs_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
+
+specific_ss.add_all(when: ['CONFIG_SOFTMMU'], if_true: sysemu_stubs_ss)
-- 
2.35.1


