Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF4D6A65EC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:58:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCeL-0007uT-QM; Tue, 28 Feb 2023 21:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeI-0007u0-PX
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:56:58 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeH-00031u-38
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:56:58 -0500
Received: by mail-pj1-x102d.google.com with SMTP id y2so11897706pjg.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7N54q35zNU94utqNcR36M2J+OBregYPQN6g1oQbxKlM=;
 b=b5CkMQZznrE5zZDpHpHecRqAclOEs7Makz9eOgEeD1Nv/aQFHFBykYxjMG6407H352
 AbDe1DprixYki1ffUCsmcs3X/UxCtfUGuoRLGBA8/JsoxEBga1laW1XzVrFeDw9sG4i3
 ueJew5IOGxMzLbhqjYknQ3qeu9W+FCdkGGaDqP7J4Nt7+ZSYoQsR8JJueHqTmjBb3euj
 xJqy5kS7RW42Q/LPM+nB860kLVoU9iBGdVgudCX2q+GRQnxZQcyXJLbDjzVtM+5rfsLs
 0hDnyFb4IP7jki3KdezNBATA8txQc7nqstmcrGkFBvreSUhzDH8qJMnDccpjvNhZYB5/
 V5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7N54q35zNU94utqNcR36M2J+OBregYPQN6g1oQbxKlM=;
 b=yNAWOH7buI+z6x/IlfYOTEbqsURD1MlJ7n7X3Cr3dDIbTT+hngdLX1YdjDJ4Un/RZt
 6ez96IGfymb8EoFPidz4mY7RnR7IlSbXPsjnQuj5tVbGakk5DZhCpzDd6emgI3DdCVEf
 iQVTQit7oFtJlkmE6iVM5AEWfU6qqQps2KVBLUW+qqvN/lG+XHhO+oxdtOcic2I2g77j
 Brel9T0jnKY5nOADkgfTgrRPCg80ZwRA6H6KGbGHfLE3riEwrcQAJYRO+6I5Sq8EoQXH
 svsiqY6Pz2BWDhfkKF+7MJFJWYSPRe7jg9YfRs3MFR+SDjXJxNW+/R841uWkqFH2tz+t
 THkw==
X-Gm-Message-State: AO0yUKUzXKzDMmdArFcwKNwjdkZFE4jGPcoCHqLnNNj6U4rbC8axMp/K
 2PReb8JbOlzVfWBCBifgi/XNVxj2vxJR1qd6MaE=
X-Google-Smtp-Source: AK7set/53mqx5U22xQYYSM12XbR3r1G1arqeiBzX0fnoM2KSNPCZYppKcTqw908jFYL4EKEQgXRnOg==
X-Received: by 2002:a17:903:1ce:b0:19d:1f42:b018 with SMTP id
 e14-20020a17090301ce00b0019d1f42b018mr9281390plh.27.1677639416289; 
 Tue, 28 Feb 2023 18:56:56 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:56:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 06/62] target/i386: set `CF_PCREL` in `x86_cpu_realizefn`
Date: Tue, 28 Feb 2023 16:55:47 -1000
Message-Id: <20230301025643.1227244-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-3-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 4bad3d41d3..62755bf511 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6534,6 +6534,11 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     static bool ht_warned;
     unsigned requested_lbr_fmt;
 
+    /* Use pc-relative instructions in system-mode */
+#ifndef CONFIG_USER_ONLY
+    cs->tcg_cflags |= CF_PCREL;
+#endif
+
     if (cpu->apic_id == UNASSIGNED_APIC_ID) {
         error_setg(errp, "apic-id property was not initialized properly");
         return;
-- 
2.34.1


