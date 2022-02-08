Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6634ADFD5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:44:47 +0100 (CET)
Received: from localhost ([::1]:60346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUXl-0005MF-UZ
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:44:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSM0-0001YP-Cz
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:24:29 -0500
Received: from [2607:f8b0:4864:20::629] (port=44629
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSLy-0000SD-JB
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:24:28 -0500
Received: by mail-pl1-x629.google.com with SMTP id y18so4472279plb.11
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lzb9vh8nFU10wNe9E6b+5YxWozx92LwuARa5FvCR48U=;
 b=Do88ks0GAN0Atd6jgy6DB7Cfii1DI0sw3Mfngvwrn9lqolVCoSBW/I317s7omph+cv
 1csGaRyWVipZvgw5om21Uly3kqcg89HdCNOWt5NB/4x87vL89P5c1SbaQ1eiPjHqgSco
 k6VqntIEN1GlrMz1nfuceGryxD5/nJmpvLzvzpRZx2DYAw3rwbd2FeJynZQWZR6QkwfM
 gBzSqBPC05E08gDwoZIn2C+BLPc0AqxaJg3NehUDTV1XzAYtDzXCy0H1IRlhAs06VbtC
 qoYJAjkb5DhddAwAIKuBRE+bKxvH500wQXi4lS404gx20hdV7uKLIcaL3PQqrsXcIYaL
 CtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Lzb9vh8nFU10wNe9E6b+5YxWozx92LwuARa5FvCR48U=;
 b=4og1aoXMwQUEegvwXvWgGWiAdc2ZrlNp9ySaoNd8EQI4Xqqso7xdh9Qm6Z8swnRpsN
 Otfp4UBC8VMOvlJtNPsiJ946zPryuAsPqOQn2lnLjxKpoYMLfV72e3zEijZKdIr/r0PQ
 IIhtxpu2rXx/TVHa+kcdYaMB7ZMvNLl3ovQkIfKBvsLGUvB1yUbF30JbnCYV4Zp30pWB
 ymLW3qtS74allIAHs3I7A8ywaTfoeFqaMTw+AiW2EACWlbJYt3VOnTTLAUgvIEjlGwEK
 evClqnZ5YBTi7uJSqWOOiIZQn1PvHkCFq8BgXip44lY9ETaVeDMZfRTHKCMzvsgynIy0
 ZUKA==
X-Gm-Message-State: AOAM530TRGnIyK/oXTufbAXn03jo70/aVUHyEcNTt6yHdYAFbcGiVtfl
 NWrjSrcgTMUYqMXPUekfRTfP6Ht5b18=
X-Google-Smtp-Source: ABdhPJzoEP4LODic+dibLIn+cKGZw/+2CqrMC3Yy/xy1PS6X+tftgNOoNNvvVxTpnCN4WDrli2oP+w==
X-Received: by 2002:a17:902:cec5:: with SMTP id
 d5mr4814354plg.115.1644333865129; 
 Tue, 08 Feb 2022 07:24:25 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id a12sm12428776pfv.18.2022.02.08.07.24.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Feb 2022 07:24:24 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 12/13] exec/cpu-all: Restrict cpu_copy() to user emulation
Date: Tue,  8 Feb 2022 16:22:42 +0100
Message-Id: <20220208152243.16452-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208152243.16452-1-f4bug@amsat.org>
References: <20220208152243.16452-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x629.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/cpu-all.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index c0f0fab28a..84188febfa 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -296,10 +296,11 @@ void *page_alloc_target_data(target_ulong address, size_t size);
  * at @address, as per page_alloc_target_data.
  */
 void *page_get_target_data(target_ulong address);
-#endif
 
 CPUArchState *cpu_copy(CPUArchState *env);
 
+#endif /* CONFIG_USER_ONLY */
+
 /* Flags for use in ENV->INTERRUPT_PENDING.
 
    The numbers assigned here are non-sequential in order to preserve
-- 
2.34.1


