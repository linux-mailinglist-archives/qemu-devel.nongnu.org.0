Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75684AB78F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:38:18 +0100 (CET)
Received: from localhost ([::1]:33964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0TR-0004Vl-0X
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:38:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzNo-0006K3-TB
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:25 -0500
Received: from [2a00:1450:4864:20::42c] (port=37425
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzNm-0007C4-H4
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:24 -0500
Received: by mail-wr1-x42c.google.com with SMTP id w11so23290375wra.4
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 00:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cOqfk9IZQw1y8ZVrMUlg+07oZzemQNJnEMix2Q34ruc=;
 b=ecsxDsGkDxpg/CwVemYifApxfjM+j3g1NjrUk2N+eF7rdjVGSERgtHgAazVYPb5rP2
 egpR3pr65zRY6mhxhxuabB4nfMuWTlrIdyuamQSRXeYebbcvHNsr7SKeDD8UjPT9NSDY
 4bHkROAxEFpWo2WP2+z8sAYDA/S9T8vIhPFM79iE8Do1qLb6EEpYab15ad7eDmVfXvzf
 SD8uKd1xVX3Rjkpg/ANk0A0zZjH0/z6D+rqy+wn4YGVasvNCn2nx/bLkNMc6rbK5mjMo
 6D/PqBqnPf+ovFjXFz/9hYL3jdh15w1hWF8py6JPArOWRMJWva6FgPRY+IlCeU/E0n8x
 IfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cOqfk9IZQw1y8ZVrMUlg+07oZzemQNJnEMix2Q34ruc=;
 b=ffCBY42NndMFwhGVcIj+LWbkHAEsWcUW34zATfh0dwxa2Yobb8XVw13XcAdK18A4Mg
 8o/aTgudW6udNfj7H8fMgYuuidLVTEIXN+wmaGROs4K/RfpQc85OhSPnpbwK1iSkCyIk
 mFVgdLc2K/YrO9PDgr2kugOvRcaddQvqqzzsCcH/tFPzj2HsTjh99aopNz8w+J59gKwb
 Xyw8eqOSydgODFKQWDwCTKE7yaHC8kgrh9QIdGfZnagcbciB6rdQvH/Jqifv5YpUgu+P
 811oglJicqyGXbghQMmfWoTKp3uMNYYtLFrEUvdQyo78JMBBxTLG+RQ4a/sA5S5m4us7
 Gehw==
X-Gm-Message-State: AOAM532VB69irhMY+RFQ0gwuR3SU71aCTJuks5TCGTrf258AdEiRNlSk
 jTQjMRy632ACkXS3kEjSSzkguRJ1ytU=
X-Google-Smtp-Source: ABdhPJzxdWIcWTwksco7peSbudg+lvE68aOewPUKtNGXjPyUN6FfYr7hQ+o/IOYyHx6iEhdiFpcZfQ==
X-Received: by 2002:a5d:4247:: with SMTP id s7mr7191442wrr.704.1644222501223; 
 Mon, 07 Feb 2022 00:28:21 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id o12sm10358349wry.115.2022.02.07.00.28.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Feb 2022 00:28:20 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 5/9] exec/ramblock: Add missing includes
Date: Mon,  7 Feb 2022 09:27:52 +0100
Message-Id: <20220207082756.82600-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207082756.82600-1-f4bug@amsat.org>
References: <20220207082756.82600-1-f4bug@amsat.org>
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
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

"exec/ramblock.h" requires "qemu/rcu.h" for the definition of
rcu_head, and "exec/ramlist.h" for the definition of RAMBlockNotifier.
Add them to avoid when when refactoring include/:

  include/exec/ramblock.h:26:21: error: field has incomplete type 'struct rcu_head'
    struct rcu_head rcu;
                    ^

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/ramblock.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
index 664701b759..6cbedf9e0c 100644
--- a/include/exec/ramblock.h
+++ b/include/exec/ramblock.h
@@ -21,6 +21,8 @@
 
 #ifndef CONFIG_USER_ONLY
 #include "cpu-common.h"
+#include "qemu/rcu.h"
+#include "exec/ramlist.h"
 
 struct RAMBlock {
     struct rcu_head rcu;
-- 
2.34.1


