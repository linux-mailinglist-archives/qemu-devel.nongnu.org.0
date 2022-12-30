Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A9E659386
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:05:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2r4-0002y9-Qi; Thu, 29 Dec 2022 19:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r1-0002x9-22
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:31 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2qz-0002f8-9X
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:30 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so20259516pjj.4
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZuFGBK7oJk/EujTjAqZpKzYL125RUa7EsoUz7ySoMMg=;
 b=JUeTMVSh89J0bs6ghmWp6xkedSFwV/PnfXJWzRnWOymowYlOg6KE9u28WzKz1XWE8b
 Ha6tTeUjf4dvU7IEcbQqMG2D+dBAt/JtTvQ1v643Pzh9Mg7N475KzGCNgAJ7zWn3XtWn
 2E26m7jqiporFWeR9SSOKfoqAvUQDeEdhrGY7dtSDaAWmzzMlMvji4rWpoml9vwNb3K5
 EmYjuj78Lo9dxkbZHSGC2yn49XLK8HxEy6xz9LY+/IJtleryVTu9m6z04q6wrVPjPW4V
 oRVzgLB+j9quoFCPt0chyKKsnnikcKuC4tlX6f8/l798ngWI3b4DfgeL9OghwMzgmCMQ
 qC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZuFGBK7oJk/EujTjAqZpKzYL125RUa7EsoUz7ySoMMg=;
 b=B2cBGMUwbrgeFZqxgr/ovHWw7L6b61wwUeWGONrNUDZ3xXexifsfCofkQiUWTwoc6D
 B3Odu9V46vfGB59WrgpIcudWhDhjC5TI2ExuRaI7xpZGlaTbu+LCws2sL9QQaHiyHg9a
 7xPmq/OV4DQMtf7ltO5leZjn2GHdTFFHW+7/0wlIOMYkL3GMsdRRn8xmiAJs23S0oLpf
 CswFO7BW543f1ZYDCLtaI3fdIJETQvlnR+zxtNU1oBhxs5moc/ssmzYpcZ2GrFMpoEZY
 xPWqn7GfxR1zL6fh9/ugz0Qe2q6QO0j7FyugQab7TONGB9Zqu/664BXSScbXVAORuFs0
 PXzQ==
X-Gm-Message-State: AFqh2kpnyF1JtmCxr67JcEQ33YoYAyyhbuWcSEYvrDais2e/Z+IOZqal
 jMIzI+CCcavnwvOCU540Zmlp08iAYWVAXSsn
X-Google-Smtp-Source: AMrXdXsvs3BwlzgQwQsyrmeG7wBz8BPLEdYWm1y0P5DngaZhbIGNYbQcABAEm9nj8f+r2MHbEeRJ5Q==
X-Received: by 2002:a17:903:186:b0:188:d2b3:26c1 with SMTP id
 z6-20020a170903018600b00188d2b326c1mr41051776plg.10.1672358544947; 
 Thu, 29 Dec 2022 16:02:24 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 02/47] meson: Move CONFIG_TCG_INTERPRETER to config_host
Date: Thu, 29 Dec 2022 16:01:36 -0800
Message-Id: <20221230000221.2764875-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Like CONFIG_TCG, the enabled method of execution is a host property
not a guest property.  This exposes the define to compile-once files.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 4c6f8a674a..14e3eba227 100644
--- a/meson.build
+++ b/meson.build
@@ -469,6 +469,7 @@ if get_option('tcg').allowed()
   endif
   if get_option('tcg_interpreter')
     tcg_arch = 'tci'
+    config_host += { 'CONFIG_TCG_INTERPRETER': 'y' }
   elif host_arch == 'x86_64'
     tcg_arch = 'i386'
   elif host_arch == 'ppc64'
@@ -2545,9 +2546,6 @@ foreach target : target_dirs
     if sym == 'CONFIG_TCG' or target in accelerator_targets.get(sym, [])
       config_target += { sym: 'y' }
       config_all += { sym: 'y' }
-      if sym == 'CONFIG_TCG' and tcg_arch == 'tci'
-        config_target += { 'CONFIG_TCG_INTERPRETER': 'y' }
-      endif
       if target in modular_tcg
         config_target += { 'CONFIG_TCG_MODULAR': 'y' }
       else
-- 
2.34.1


