Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC7138B58B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:52:33 +0200 (CEST)
Received: from localhost ([::1]:36400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmqW-0001KG-5Q
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljmhX-0003Nh-HG
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:43:15 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljmhV-00018i-Rt
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:43:15 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 f6-20020a1c1f060000b0290175ca89f698so5911444wmf.5
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 10:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZV3N7vnnmqaJzn/30LSs3DhmDhZm3N/TXQLXuUEcexg=;
 b=Osr6nupvyy/ebvMvYoSScVh79l1sIpaxKT9F8xPAMCMkXGNDt0DVfaJsFEL23hOglY
 NDWpITF+Rt7zLotTXyzkZMI1idrirX0+gMhjJDA57O3RDCTCu95Mi8NOgTS1r9mBaCPu
 CIX9uG1TxKDcqkSTIT61apDylkLWXgzSPcSZzzUuOfP/LyD9rEWAo2HVDK8MBIZU/13v
 HLRYVTiK+uGpyVxtT0LK/UbXj7RZr8lY743rcLCuw3R5m5LZxNuPSaugXLesoJNpB+CF
 YpgyWcHdR8yyp+Pse+gAU6FSpivYY7UsrSZsfLnorFi6xRcth9oEnQeODYjBPnzkuK+b
 NGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZV3N7vnnmqaJzn/30LSs3DhmDhZm3N/TXQLXuUEcexg=;
 b=ZyGYuAxgaEPce+N5f+Gik0HK8xUOrnBGmt0Zeo0qeLGpJiJ4JX9q5efjB7W60m8MW9
 cYakgYK7yr3BFRgbyLq5bUC8UdFxAKowXFg9WBhO1ZDYibU1H9wF/z9FJXZczPjHK1lz
 rhyRyM2B5WsTg1gNCaMkPMNq7QmyUhCv/xnSMnXSFfnopGnhtfwDpeX2qwYeeiUrS1jI
 Kd6pb/BYyCCcVYl+irNygXz17sMNqWzl0xM6Fcbspq0c3tFtqUQtcShUnYSbR5CPoVmg
 WUb1FtyYRYTYo74CRREJ1OnCWw+Jlo1Psha86B1OzfMoUmw/u6W5gzbcK+PcMZoouSmH
 2Ctg==
X-Gm-Message-State: AOAM531nY0w/JHmCPuFx6p28dB/akQ8Ztuq9PZta2Ofm8rnsCA8xlz/1
 vKlFlte+sVjYtp+n21P6P0cbMg==
X-Google-Smtp-Source: ABdhPJw+k95TIrpAH6kHUtvwq2lilBiA3CJNCCDuc9fS6oySEOcpe1RFhjkTg/MuKGVYDwvbo1QWdA==
X-Received: by 2002:a1c:f618:: with SMTP id w24mr4763803wmc.93.1621532592510; 
 Thu, 20 May 2021 10:43:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y2sm11339624wmq.45.2021.05.20.10.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 10:43:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 649721FF92;
 Thu, 20 May 2021 18:43:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 6/8] hmp-commands: expand type of icount to "l" in replay
 commands
Date: Thu, 20 May 2021 18:43:01 +0100
Message-Id: <20210520174303.12310-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520174303.12310-1-alex.bennee@linaro.org>
References: <20210520174303.12310-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is not a 32 bit number, it can (and most likely will) be quite a
big one.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 hmp-commands.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 435c591a1c..5ee9cfd520 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1667,7 +1667,7 @@ ERST
 
     {
         .name       = "replay_break",
-        .args_type  = "icount:i",
+        .args_type  = "icount:l",
         .params     = "icount",
         .help       = "set breakpoint at the specified instruction count",
         .cmd        = hmp_replay_break,
@@ -1699,7 +1699,7 @@ ERST
 
     {
         .name       = "replay_seek",
-        .args_type  = "icount:i",
+        .args_type  = "icount:l",
         .params     = "icount",
         .help       = "replay execution to the specified instruction count",
         .cmd        = hmp_replay_seek,
-- 
2.20.1


