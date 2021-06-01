Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899F0397607
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:04:08 +0200 (CEST)
Received: from localhost ([::1]:41284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo5w7-0005JE-IB
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tP-0002HP-Lz
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:19 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:37466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tN-0002WL-Qr
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:19 -0400
Received: by mail-il1-x12b.google.com with SMTP id x9so8119686ilp.4
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WTAuQeHvP+DitVjZ51FBHL5ba/U3wc92oJ6UKQCTQ5E=;
 b=AzI81VjCXqp3peHioLSrNerjRPSYyqK9QlEjbjP8V97jNwjiizPFl78IAObYWJyTBV
 60VMd9PiJITDGJLAdDmxeQPO3byMJM0BUU2v27vul5jfADKnqeL4IqxLPxj/ecxbtexl
 WNxQPJoi1+Pq/4WRE6HZviF3py06Il6xU32w+TNvTckD3HB3Idg1Mqdhr1atgQSMlPZx
 xREjkbcQbLwaUklgyOFWy8qEn6AVsnot2nGYLn6zSy8niLY59sTmgA7L+6O/Ww2zFhcd
 IkGANrXVyPBP9AyOJ6D5o0eCmQe5cMPwu4iV8I2FOMVBpIIT6sg3fUuLQ9mbV8105Rk1
 iwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WTAuQeHvP+DitVjZ51FBHL5ba/U3wc92oJ6UKQCTQ5E=;
 b=Ls/OSEJxHhVsmTufGZRUoh+dkbqJzSmyUeP3I0kKisY8ElLzNjA3w3y7HI4JL5PkZI
 iRy6wpyntYmKQI8a1ir56UrWJReMWfXGXMEigthQsGhhpp59eSbMpvO3URNrFtzFCX5Q
 KWNXOw1YRVwBtExNHR7o1h8SKklnpSdwNeqay6GTFaoSqtl2AYmoYKY4ATFNwWMnZ+wy
 V5HEXwyJ8QR5CxwOZwOfsUZxOW89aAVFq33lxPhlcgq5MQH7dZAE6Xwyr80i5SH99lhq
 Re81C/f90cit648Bjdv5PMi+E2LpkVE/t0MPcz/fKJzRNjikIu7WzmBQjJ7v0EG9hCAp
 F+Ig==
X-Gm-Message-State: AOAM5329ZByVewbQtmLTqHlqUpk+B81Rmzply2cvnKAa71s5R9bsyLNO
 wVOzL7zKVoMjwg4+FRrxZzqPa3p/3bCqFoaV
X-Google-Smtp-Source: ABdhPJxDjdZ31xieZWG5INiMPvixzzMae8Sz6HeKrDo84M4+L99Iw4Yv6TsUVoq5ny6l2NcxpZeiyQ==
X-Received: by 2002:a92:c003:: with SMTP id q3mr715530ild.128.1622559676899;
 Tue, 01 Jun 2021 08:01:16 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 05/27] accel/tcg: Add tcg call flags to plugins helpers
Date: Tue,  1 Jun 2021 08:00:44 -0700
Message-Id: <20210601150106.12761-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12b.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As noted by qemu-plugins.h, plugins can neither read nor write
guest registers.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-helpers.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/plugin-helpers.h b/accel/tcg/plugin-helpers.h
index 853bd21677..9829abe4a9 100644
--- a/accel/tcg/plugin-helpers.h
+++ b/accel/tcg/plugin-helpers.h
@@ -1,4 +1,4 @@
 #ifdef CONFIG_PLUGIN
-DEF_HELPER_2(plugin_vcpu_udata_cb, void, i32, ptr)
-DEF_HELPER_4(plugin_vcpu_mem_cb, void, i32, i32, i64, ptr)
+DEF_HELPER_FLAGS_2(plugin_vcpu_udata_cb, TCG_CALL_NO_RWG, void, i32, ptr)
+DEF_HELPER_FLAGS_4(plugin_vcpu_mem_cb, TCG_CALL_NO_RWG, void, i32, i32, i64, ptr)
 #endif
-- 
2.25.1


