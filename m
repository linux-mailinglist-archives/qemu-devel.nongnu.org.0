Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC61E6A44BF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:39:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeAV-0000TZ-Lp; Mon, 27 Feb 2023 09:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeAQ-0008Ei-61
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:50 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeAO-0000J6-Ff
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:49 -0500
Received: by mail-wr1-x430.google.com with SMTP id bt28so6353152wrb.8
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3enTjFCWEZfDXiQrgweVk1M1zUaM7hjsygeC4oyGuF0=;
 b=w0V0MT9snEsleCIfJ2SSIaopnG5u/1pZPC0pamLYuLWdI9xl7mJ8Xlva+BOmvNGyex
 5gPboEoirOtL1KFEveTSgBoj9B3iMhHKsJc3gnhrW1E0q9H3AOLrEEMA03wfgBZ/yIj0
 93ItkGteuvo0XIHZD1Fo91FAlFPTuWILP076G4ctu44K1T98NjIiQ30g2AXiFIjMW1tX
 HVAgXkGr8jnmF34Jx34iZDnp8kCIQuiCCqz/2w4p5zBYUj8GAhtPl88khl2JG4crEBnc
 k0PRgq2TdY1RXY8NqiJ1Ga0HosZPCCXAdwDa04O2Ne94CB0bAmGJitgNWCPo/Y94DSN6
 XQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3enTjFCWEZfDXiQrgweVk1M1zUaM7hjsygeC4oyGuF0=;
 b=P+F0WP4uBT0o/+RHkbZjPvQegp9BvEsSGXPZQz4oefKAJvzoigTOSFMFcYVb/CppZD
 20YAEzZ2FDUnQjal1nFtyCgczSOdsME8+A4D/4sH/pWIdXk31A5KCItancGUBSJjE6Q6
 kIzLfTbKoTqylKTcg/qGH/oZDjPJQOrIvreOJfsqZCBizCH/PYiFQZU8uXoHbVg023pY
 l8yMc+eWTgk36PWWat16qxLi9tx6hXFNlFSYvt4HbigOfAvhwCp/8nsWFJAy/x7Sf8Zb
 fodRG+MCBIUi+2lug+07/pBYZgkViLqai8jaq0riKj+FKogJn0F576RYLl/O5LBesu8H
 yIaA==
X-Gm-Message-State: AO0yUKUygJ4ctpl4Gmh5wU5rJcoOSn/BjGnVziGJBMufx4Kb8kjfLhDF
 N9bEkA8dXIUznni5jVl0YrUu+F/47dC+gTTA
X-Google-Smtp-Source: AK7set8PQzf4BL+sC9e+oR5VKexFzQADKVzklWsr2V5du5WL5mbxTTWodYvzuQIDQJgqtcm8/ZcS7w==
X-Received: by 2002:adf:ef0d:0:b0:2c5:587e:75ba with SMTP id
 e13-20020adfef0d000000b002c5587e75bamr19890379wro.55.1677506866636; 
 Mon, 27 Feb 2023 06:07:46 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t23-20020a05600c2f9700b003e2232d0960sm9190227wmn.23.2023.02.27.06.07.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:07:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 070/126] hw/audio/hda-codec: Avoid forward-declaring
 HDAAudioState
Date: Mon, 27 Feb 2023 15:01:17 +0100
Message-Id: <20230227140213.35084-61-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

To avoid forward-declaring HDAAudioState, declare HDA_AUDIO QOM
definitions before its use in the HDAAudioStream structure.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230220131837.26292-2-philmd@linaro.org>
---
 hw/audio/hda-codec.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/audio/hda-codec.c b/hw/audio/hda-codec.c
index feb8f9e2bb..c51d8ba617 100644
--- a/hw/audio/hda-codec.c
+++ b/hw/audio/hda-codec.c
@@ -145,7 +145,9 @@ static const char *fmt2name[] = {
     [ AUDIO_FORMAT_S32 ] = "PCM-S32",
 };
 
-typedef struct HDAAudioState HDAAudioState;
+#define TYPE_HDA_AUDIO "hda-audio"
+OBJECT_DECLARE_SIMPLE_TYPE(HDAAudioState, HDA_AUDIO)
+
 typedef struct HDAAudioStream HDAAudioStream;
 
 struct HDAAudioStream {
@@ -171,9 +173,6 @@ struct HDAAudioStream {
     int64_t buft_start;
 };
 
-#define TYPE_HDA_AUDIO "hda-audio"
-OBJECT_DECLARE_SIMPLE_TYPE(HDAAudioState, HDA_AUDIO)
-
 struct HDAAudioState {
     HDACodecDevice hda;
     const char *name;
-- 
2.38.1


