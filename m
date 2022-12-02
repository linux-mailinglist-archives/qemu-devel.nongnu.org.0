Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5179D63FFDF
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:41:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymN-0002Vy-2o; Fri, 02 Dec 2022 00:40:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymK-0002VY-UP
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:04 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymJ-00037o-BY
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:04 -0500
Received: by mail-pj1-x1032.google.com with SMTP id cm20so3950459pjb.1
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XrAcJOBk+J7ncpafW4DtFOdJmJwyugWoi7s9Lvhf8lE=;
 b=aLpVQ46WTZi10dcSa4j3+FFFJFpUC2lm9Rx3tjjKKXRn3glFKHuXSnDVoX23slb+oe
 MWY6DkYVLqNzeEaiwP+GGRnjZzyOM+pOTJ1sHKkuTY1PLqEMeu7xevTqnXCbvAWD3Gk0
 1pIaY9tJ4CrBbLdAHMeZ4Afe7DqZWthXoozSs8uUcMQJi7MvpNAg3F6W/R/0atF9ZmLW
 9uyoYd6NNP7ky1gt6iX9qSy3CrKI4o9g873sKDFOraLj1Ro8alRAB79LVfbZRw3RaKkV
 ARGou9/XWLrYUkTcidSvO81HVuglpx1YaMS1Mr+Gt4L7sjBgQy7bFKJsezrQw4I0mzyD
 dn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XrAcJOBk+J7ncpafW4DtFOdJmJwyugWoi7s9Lvhf8lE=;
 b=8F2QYz6LuYVDFTfRzvvk2SrNyAd0y+lLhzMxrVRPEtbvxtpUrkYhHz114m8/xjL6Jw
 Z2ODP3DuOBau8HcDaOwoUuiMd3EH65TnnNlEndWugsWy+izAVEt06syjof1O9b16uCl6
 thUUYa0NrJTVBrjMXmtVhTBWZw8VueB/Dus2EySWxahC0PVxStW+C7xWxSPOVehz+AL4
 A64xEa/Mrx5enDkrOpiTy1Cey2Xxj6FqKBXg0oOcCT+bSAlte7fJW1QQfuoCll+1Dl3r
 INeJjlwVo1F1Kqwe/eHh1d0LP4mUqxMHnGNzxNPYLZc44PxkSyC+RNriobm1ESNY43WS
 TwhQ==
X-Gm-Message-State: ANoB5plwOZN2mpEutz/jKiM2oI6FwYrPBknEQ/VoY26ZeqBF2vj1tleF
 io9Dk+CMskS9o/oXrd7IKc/FYg4XiDEbIHy5
X-Google-Smtp-Source: AA0mqf7HUTnIE5tPGm7n/gADPFrGa/SmC47rypwrY2kz2UY1D3ZQsRb3mRtcm1ziy8rEsV9Tq527LQ==
X-Received: by 2002:a17:90b:793:b0:218:9c4f:e97 with SMTP id
 l19-20020a17090b079300b002189c4f0e97mr64746392pjz.2.1669959602075; 
 Thu, 01 Dec 2022 21:40:02 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 02/34] meson: Move CONFIG_TCG_INTERPRETER to config_host
Date: Thu,  1 Dec 2022 21:39:26 -0800
Message-Id: <20221202053958.223890-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 5c6b5a1c75..23a3625abc 100644
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


