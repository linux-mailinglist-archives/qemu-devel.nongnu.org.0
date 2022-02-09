Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90024AFFAB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 22:59:22 +0100 (CET)
Received: from localhost ([::1]:46332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHuzh-0007gp-6Q
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 16:59:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuvx-00056l-QI
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:55:29 -0500
Received: from [2607:f8b0:4864:20::102c] (port=40765
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuvv-000830-3J
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:55:29 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 c8-20020a17090a674800b001b91184b732so4112374pjm.5
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 13:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n7SLvsWpErPdMQbUAOas05L15pXrbLb9tubT6I056DA=;
 b=LbqsuA7SCzG+eEBvA0NUBCwqCr5Fc1NxEGhXL2xtUWmS/OO3+XpXJ0B2Ia8Jd8KEkJ
 z0/KNXmTbi3YRjSDpty/MIQ0zZIQ251HaD6bawTIru3GbbMvWPgObZavEqUH3hvmXqPQ
 v09958qK/DlKMYCv5k8Wsl7K9DGRWDkuHD+1E3IsgZBwr9CAsGz50ofkBuuuSDp+m3qc
 S2ZUO/1+w4bCcVe2z+1zMEdsBSeNry+dqhxwWNfJEiGN/mSDxk41VR7qYmnREE+9CUpD
 qGLC3ACeqj6zWmYpz94cuvD2kj4gTL7rY2EibJxqu47AVQdBi/vvG0s79/Mzmm2agcXB
 kaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n7SLvsWpErPdMQbUAOas05L15pXrbLb9tubT6I056DA=;
 b=uew6hyovKQnIOvuhn/nnZBGeIFcMyLPAfeZHBTSwWIHSJwEy5qcyzm8EDh8zwu9e2O
 vDIeVlEZdR7bKGnbGmvaV4WDubscSpSQW0vt/koA2tsaVPpptCDjbJ54jEIvretMGSHK
 8VFLja0z6qFML2mUejNUPMnSLCUFFctFFveTSSeH1jF+Fal06tJK7jdL6Y9M5FBA9KJs
 gNj9BUYuK4bZ/bw26K1rMMfdiJubgOoq9WK2dVwu3K3vyAxpzAf4NlWKa457iUJAT6CS
 dGSkWOqBagH+YNn1kEJsFaKAjyPRMyR2nW+/jwU+fK48HDVidlF6daxZYajbu+tf4aj8
 o/kw==
X-Gm-Message-State: AOAM530UwlnRwNrD0DT75o/PJk/adhVkwI+TJts9rcBhST5nJ2WYb5yB
 89tMhZW6ILlwGN3gD/FbQSfCq77Fe4A=
X-Google-Smtp-Source: ABdhPJzZem07CUqmKnPiddmKepDhjORESHXOgmHqwayMvnhue1xalQB5SiAZLUJ+cPhibtx7Y94MdA==
X-Received: by 2002:a17:90b:2248:: with SMTP id
 hk8mr5776575pjb.242.1644443724939; 
 Wed, 09 Feb 2022 13:55:24 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id b13sm20346611pfm.27.2022.02.09.13.55.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 13:55:24 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 04/15] exec/cpu_ldst: Include 'cpu.h' to get target_ulong
 definition
Date: Wed,  9 Feb 2022 22:54:35 +0100
Message-Id: <20220209215446.58402-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209215446.58402-1-f4bug@amsat.org>
References: <20220209215446.58402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/cpu_ldst.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index a878fd0105..5c999966de 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -64,6 +64,7 @@
 
 #include "exec/memopidx.h"
 #include "qemu/int128.h"
+#include "cpu.h"
 
 #if defined(CONFIG_USER_ONLY)
 /* sparc32plus has 64bit long but 32bit space address
-- 
2.34.1


