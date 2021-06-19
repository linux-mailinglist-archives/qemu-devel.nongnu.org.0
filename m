Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66CB3ADB40
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:19:58 +0200 (CEST)
Received: from localhost ([::1]:42014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufZV-0000tb-OX
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUh-0000dB-2m
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:14:59 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:45632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUf-0002Dn-Cg
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:14:58 -0400
Received: by mail-pf1-x434.google.com with SMTP id k6so10327933pfk.12
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WTAuQeHvP+DitVjZ51FBHL5ba/U3wc92oJ6UKQCTQ5E=;
 b=bwgvALuQkylJ8ueGvgSsUhQPueoNtDOOJ57wgX4ga6V191AUJTRKatqnCgpaWmkfp6
 CIMbOeth55Ng26C0FogrT0I8mgH+ETfhtUQG9EA1781sgWzbM8pNH3dmCg/O+Xtsma6i
 MDAyocTYhyeEWgbxlEpz8yf3NYbQ6o3y4leaS8Xb22ldW3ML0ips1RHk4S2x8Re49JcO
 ETJgsPK4UnKWQYWoG2ACLXbHoNDaFwLoE+N6E2VlvmdxQ6vIHUMNX83ZMX6nhsEs8SUq
 736MCi5GAzdp6yD/ZNbGaO+QsjCLTHmJ/timI29o8OLpEZoogAUOcUteyZP4FHN+ye95
 Ua7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WTAuQeHvP+DitVjZ51FBHL5ba/U3wc92oJ6UKQCTQ5E=;
 b=djnDdD0Pt8en8GQ5V9YanfWMCeEZuDD+3HExfIUCupREYx0t2qyKwdSf809T4joBNR
 LktG6HwUIkZjgL8MbCDAJS+lnWCuTEvZEA2bZ+v2pzkOk1YxQl515+gRdqeT+E4Zy73m
 yXWgtKtltaZeM2KpZf9zKxa0n4NUonZfScPOpmegBhwbUENx6eHPShq2B/gy5/cOj0PU
 5Ac39yIvzhKskzbCPYYnEfIDoIDUWd12nmK10TSPJrith2yOTvf+95gJ4IdOrJMnxGLh
 z3Rue4+o5VcXj38KVU/uu+/eegw8auREiVWFHFkX453ASiypE2+k+Hj/xnC/oNxbh8xY
 vxhQ==
X-Gm-Message-State: AOAM5301n9Fiv6hACoqk9VY1bkMLoHjG3cL2RPndXeMg53y90YQZmJsG
 jzcTh+qW0aB7GQU2IMVuOT1oEIlBmuViCw==
X-Google-Smtp-Source: ABdhPJwYqVGqhvNbN6B5jilJODD2zwJfDQADJ2deEfmkG2VWaHalyRO1kr3uZeJghDto6/J2IkSEgg==
X-Received: by 2002:a63:e253:: with SMTP id y19mr15995016pgj.137.1624126496246; 
 Sat, 19 Jun 2021 11:14:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:14:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/33] accel/tcg: Add tcg call flags to plugins helpers
Date: Sat, 19 Jun 2021 11:14:24 -0700
Message-Id: <20210619181452.877683-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


