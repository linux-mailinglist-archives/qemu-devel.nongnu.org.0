Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A4F6254C6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:58:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOfE-00064N-7i; Fri, 11 Nov 2022 02:41:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOf3-00063Q-DE
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:13 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOf1-0007Vn-CF
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:12 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 d13-20020a17090a3b0d00b00213519dfe4aso4057921pjc.2
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jblV5uBEeJkgX0vKD5/cHG+S4aK1YYTDrtxKzN8WPJQ=;
 b=z7XHkxYImqt2O4B+QXznYJVYtgbuy6yy4fsdp9RI9MGCzvCYozgdGxOm4uf8dUk9ct
 1HufzpnI2UTcfwuKHDeHV90ktzj6FzQWJQ2b1FGcufN7GQYPfpkGAg6qCLmviUq7JB4L
 9Ky1jjf9eijvezx7TG9TheNMg3A3vBaMYb5iDF48RdrW2D/DPTXqBs+FBERs9CG9zaiF
 lnUIfyGTktHbOw70oGlcbOXhIXhS/evozO8BGYMder8FJ67IGQa1Z0g97Ed01be5+wx+
 6WKeW8WZofYWVDySKM2fPHBS8M4C4Sy0eQ/7kdj0lo66aqIeSM6X6S1iEuvO/TaIBnPp
 qDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jblV5uBEeJkgX0vKD5/cHG+S4aK1YYTDrtxKzN8WPJQ=;
 b=i9+ypZY8oSy6SiR0pL0mBTKKs/13qS7E9TcW1b+zbTZD6qozTshoxHNfydaTxRhewX
 LsP2q5b/FA6dCwIYtwIlbw51DLoItmnSqZUG+Tkm5uP17qu+xwQJo7x7eOCNweVXkIAq
 7czCqsjcEIZrbifT574n5DGON3gWEJiMZ2BALC3EN1wam9Kr5DjLJiZL1DTlLB+im0uo
 /h/ATE1y2BwtXffDFkHtgDsMDtVt6Hyt1b1PPfQkEg8M72dEO138HtSRdQ263LYJwa0t
 LCMlkStjDi5GQ9zS/t+NtrDidquwRM9bfyiZM6GMzCRFiAVo3TBPpIITplA8waayOb4t
 AH3Q==
X-Gm-Message-State: ANoB5pkbLO8WHBqN8thSEtSEKbmQaKE2pQ9ja0+YKAZyvFWqteEJPyac
 eHm9yrBTZ5zrAtmjCpI+srOk0kEQUy9lKJvo
X-Google-Smtp-Source: AA0mqf455B8hObSXEzb26vG/GizFktGamJqZCVuKL8OSCIRB1M6fj7/2Qgipyc+NNe97gk6pDLK6DQ==
X-Received: by 2002:a17:902:da90:b0:187:12cc:d6f1 with SMTP id
 j16-20020a170902da9000b0018712ccd6f1mr1143272plx.63.1668152469825; 
 Thu, 10 Nov 2022 23:41:09 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 v3 01/45] meson: Move CONFIG_TCG_INTERPRETER to
 config_host
Date: Fri, 11 Nov 2022 17:40:17 +1000
Message-Id: <20221111074101.2069454-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
index cf3e517e56..4984e80e71 100644
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
@@ -2540,9 +2541,6 @@ foreach target : target_dirs
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


