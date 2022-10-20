Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20739606376
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:46:53 +0200 (CEST)
Received: from localhost ([::1]:52362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWot-0004vt-Rm
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:46:51 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWgN-0001jU-0O
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7L-0004Wa-7U
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:43 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7B-0000xt-OL
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:42 -0400
Received: by mail-pg1-x529.google.com with SMTP id l6so18990113pgu.7
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IOaxiECMeAtcEEimlb1VbYj3g1IJJKw/XxWwWkisLhM=;
 b=ZSv1w3SBmOhX8Pbn6YFIQrs1Odl9xn5ZnBhaX4vNS6yzhjIp0btGxJ8TffyskFur7f
 CN1pZ5v9GDSY6UfndqW/GQ8sV9ELxKG/oRNA2HZb4R6LJpFB2mbNQrjXBZe/QHekTiIr
 fAgEedbBs8adSK4wCmM0mhGljIGKPHvi5TaM1cB/K+yApUyJsmL6dWE4d37ABkgUpW35
 5rM6eeaYd6t8sWDLRfl+bFM/oHaBYfYgFgUQf9VZLDZZlaxnKF+0g6FAwU3LMUv3ijp/
 VbuurrMrl6TYNLwZQU5YiBAuqoS2XIgP4OBQzK+GxqU4NsyA7gaCiBkjxJ5a6mkc08/r
 XflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IOaxiECMeAtcEEimlb1VbYj3g1IJJKw/XxWwWkisLhM=;
 b=J9bqz5IKGxg6xLjDcFgo+HaOFwXoUWY6fCDRaySFXiM/JghE5fhonAwxttHp8EVCfq
 kkbXp6c7E7OfMm4+OInjS5FWBTuSGQGEENSZz/m+hAFCorhr/aRnTmldWtwqCf5EOMPJ
 CJXL1WMOSa43US84RXR8W+jhtbCNMgjJzyv+n098WC3zC6GuJImMJuRx8IclnF2yMBjR
 GYSRwyvDpukY7lLKjR91mw83nVrUScrf2UqgcKaNEwxBpdRCLaxGxPlbaU691MyQRapL
 cv2pKj1tAhSs2DXEhMpIDrqgTxhUHJOJ4G9dChYCaAfrrhh77cg6AbhAGmVPdZtPKP9S
 RYSA==
X-Gm-Message-State: ACrzQf33obznNc19dGpn9PTJCrrxLG2l/ywRdVwQkJ/J1eE8fODASo19
 f0XDGRWGBSI8mgpAVQCbIFxv3M+6ODQDxrkm
X-Google-Smtp-Source: AMsMyM6iOJFA8P4SJgMs/f8G3SOezM4LW7A1x9/uzH1FDhNux47Y7nAbUGuQ1InN0qcdY3ErRGBiUg==
X-Received: by 2002:a62:3206:0:b0:562:524a:ed55 with SMTP id
 y6-20020a623206000000b00562524aed55mr13942569pfy.0.1666266812249; 
 Thu, 20 Oct 2022 04:53:32 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.53.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:53:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/31] meson: Move CONFIG_TCG_INTERPRETER to config_host
Date: Thu, 20 Oct 2022 21:52:16 +1000
Message-Id: <20221020115242.2301066-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Like CONFIG_TCG, the enabled method of execution is a host property
not a guest property.  This exposes the define to compile-once files.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 1ec3f72edc..64c87d45a5 100644
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
@@ -2507,9 +2508,6 @@ foreach target : target_dirs
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


