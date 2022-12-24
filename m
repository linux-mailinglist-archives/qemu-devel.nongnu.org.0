Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E57655BD4
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 00:59:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EOR-0002Gs-2W; Sat, 24 Dec 2022 18:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOQ-0002GU-6F
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:30 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOO-0006GT-AF
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:29 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 u15-20020a17090a3fcf00b002191825cf02so8000814pjm.2
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZuFGBK7oJk/EujTjAqZpKzYL125RUa7EsoUz7ySoMMg=;
 b=BXOqRF6aEBsZL00HSqHRmp9l/KdsSsH+utTsPW0wZUI1V2emSXBaAAwHvgmOKdIytN
 HGMQrfMpBdeL3LfIVepzotfCeBKGlRItLZHo9U0+97DUn5SlqzhRT0ac2k14nNa5kxlI
 /S2jUTKM+btTgR+Ob81pXakvpm1kQrbLAJmGvAtNI8CfLD2YhDByGvBnPCpaZGrQ5+F4
 JKRVArZoboaF3dQOSY16n+eRRaNEzY9RXqw4vtX6gwiZPlCHdihpDQoW31SHQcaPLol4
 ENy0RRjt99gN64tRZKh1Te6lmv68/u+T57gBHXEPPuf+5zUEjC8vziJH79xBCnqW+USm
 a9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZuFGBK7oJk/EujTjAqZpKzYL125RUa7EsoUz7ySoMMg=;
 b=7ChAQFubudseWdPMeDqnKRtVTBbE5hO7oPNjo6Q8iI2RPjIs7Jtxo6ZXWUNHQSaFgl
 HWBOxq5hAm5Rw28uUbUSylo5h5ud06eMSxv31qoPoyL3sb5wWrYLn9kAK/LEDzP4aZbS
 w+6u2VlD7yqZNFPjrlIc4xjihYDScG228yTRkAYhstjrKvmFY4lQ03w54/2IFweT2Tmc
 PDPIwH4l8egEK7SD3D30ZXJp3kH4PUkowkwag/wPlRJMzo6cd81y7V/EDNSY4Rr9MT+T
 NtcYmh2nVCpP6JzoGg5lHs2fr8KiTCmwXk2uonxcAjE/qrP+YZiAoZ45WNapaEYbVqSL
 Jv4Q==
X-Gm-Message-State: AFqh2kpN2OvycqD9bM6XZK7r9B2ZiYztj9DmK0wK82uYyXTAwdYM3k5D
 IZiDRphlSZK2Lw6q8ebkfl+9ckKPv4aBu65a
X-Google-Smtp-Source: AMrXdXu1+Okl8UlWlFuo6lC/XjjyQ4IzLbkLqlLSKJIZiDDKzoe/vzkgIERPB2t5FKyGWxXzA3CwSA==
X-Received: by 2002:a17:902:e74c:b0:189:dd98:b96b with SMTP id
 p12-20020a170902e74c00b00189dd98b96bmr21435918plf.22.1671926244076; 
 Sat, 24 Dec 2022 15:57:24 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v5 02/43] meson: Move CONFIG_TCG_INTERPRETER to config_host
Date: Sat, 24 Dec 2022 15:56:39 -0800
Message-Id: <20221224235720.842093-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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


