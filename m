Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6905D383994
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:23:52 +0200 (CEST)
Received: from localhost ([::1]:36100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lig23-00054r-CD
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyj-0001jn-5l
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyX-00025F-76
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:24 -0400
Received: by mail-wm1-x329.google.com with SMTP id b7so3319118wmh.5
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=50j4O5HpF3lWjOwIwMIUVpGBggucg+cBxQSDFU6ktaY=;
 b=KzOcjwKRx8HvVdwe+nX2EAot4dNihCmshqBCRhupJOhjH4Zk23y7H3X8t0SS6PJYoz
 Zi1G1DSkzm7UrTVMZ+qY1g2A1oD0KCao+e1DXTKKPCY+6UZY43zoXXo9kdKrQ5XWj9Rf
 mNcJ9NFFgP1nGUVCmYFgYymWQSst6E14jYp+PsByT/RMYwp4MjkEV749k45o67STO9+9
 C1zXAFfahGkVCVnVESzu95lEk4fSC2b5LsgdLDG6R9ka20Zq7sf+46R5VyNz47BImg2O
 1pJ96Ufiycn8DamMdy5+CqmW3pk0cZ3lzz09Cu/315nAm8YFx1DCg51lmQ8RZcnh5Txc
 nu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=50j4O5HpF3lWjOwIwMIUVpGBggucg+cBxQSDFU6ktaY=;
 b=S5VbzEATVRqDluPcgHfuXO9wUd4L7liSFdd24jbBJ/u4kOvuadumdb0XY7RDZq10Dt
 FAQnaHShrRYGMfk9u+R9xzbFXqmLDKkA/18+LUvZNntI6B2Oy0A+regUoembrmlM+Vpv
 k+9y4radeJ3LydUXkhAegsc4xqydKrbHCt0HSMT3c8SVrgj4AIMqg0M+FmcUWEW7vFC2
 hc+OQylGoNrxVcu8fo4r3QTQbKmyY3UruczO6RNO2HCroWha9CRzW+YPekkIWjnLdurm
 YPQ2MeWYFU/ejG7KExCskeIFqAcJgSdp9WaeSKHJ8k+qWQkSFBzhCm2DtM6fm2+Zifhe
 BUcQ==
X-Gm-Message-State: AOAM532RWJk1A+qaheIXZwxPbEzZQIAvRh57VZ6LXscA9egesxDlj2pH
 t0p/Cqlx0dJJW2ugo3mXXuyDyQ==
X-Google-Smtp-Source: ABdhPJyoHV2IrHHqW58IgUSbQqvDuSwdTTCDCKJIcrtB5ftlQZCwWML4+MXcHKQd8nfruYqsFb+3KQ==
X-Received: by 2002:a7b:c182:: with SMTP id y2mr424951wmi.125.1621268411830;
 Mon, 17 May 2021 09:20:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r11sm12061267wrp.46.2021.05.17.09.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:20:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D3A4A1FFB3;
 Mon, 17 May 2021 17:10:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 28/29] plugins/hotblocks: Properly freed the hash table values
Date: Mon, 17 May 2021 17:10:21 +0100
Message-Id: <20210517161022.13984-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Freed the values stored in the hash table ``hotblocks``
returned by ``g_hash_table_get_values()`` by freeing the sorted
list and destroyed the hash table afterward.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210422005043.3569-2-ma.mandourr@gmail.com>
Message-Id: <20210505092259.8202-4-alex.bennee@linaro.org>

diff --git a/contrib/plugins/hotblocks.c b/contrib/plugins/hotblocks.c
index 4b08340143..64692c0670 100644
--- a/contrib/plugins/hotblocks.c
+++ b/contrib/plugins/hotblocks.c
@@ -68,10 +68,11 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
                                    rec->insns, rec->exec_count);
         }
 
-        g_list_free(it);
+        g_list_free_full(it, g_free);
         g_mutex_unlock(&lock);
     }
 
+    g_hash_table_destroy(hotblocks);
     qemu_plugin_outs(report->str);
 }
 
-- 
2.20.1


