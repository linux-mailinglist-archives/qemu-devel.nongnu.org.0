Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1841650B76
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:27:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7F7S-0008JW-V6; Mon, 19 Dec 2022 07:19:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F75-0008CB-QG
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:25 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F74-0006Vf-3s
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:23 -0500
Received: by mail-wr1-x42a.google.com with SMTP id o5so8445381wrm.1
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 04:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aLyqqhIZYW4yhihdi5NiMvE4NoaW5wUVLpfihmS5Iec=;
 b=kJoDci31Uqr8D14BL9MbMbD2x1L46qkYgrGDExk6n4Iap0MYR+0FkaxRuBabGyJ0+O
 2F/mOvlYvhkHYrTxWzFxz8I1W4SUCstPz/0l5AiUd5gWosU7CDISL1h9KW9pI0pPVap1
 Y9x2bFqHkqmgBxe+sOmcZNTdOWr+k08jbjpNEWf2x9f26HBtJUdte++r3/ng8Vd14Ajs
 7vUcCPWFi/bhcyKZe4UsjRkoUprRUosf/qjoNdDjXYz+ThcTho0fXsEYb1ypMpoqF+nc
 x2lsvAnUtDKQK1utZNRl0yFda7u77plIvjAlPC5LJENQYnSQBzuEhE+u8HFC34OOQNy2
 Wvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aLyqqhIZYW4yhihdi5NiMvE4NoaW5wUVLpfihmS5Iec=;
 b=VfU2SU1EbXacO2fXPadhzm0lgVa0d0PdN6WWoOHUcyZrYB0SgdJ7QUeLbTQR2dExsB
 1dpDKI82u68uG0reSC17K7UjqNcQvxA1uBCiirOli2i3azQHi6i2uYQaoIRAGmva8EDV
 LA+z0SEJVdkyuf+K4sQ42/JaJtfLPPv1j7/Y9wKz6FMEraqs7C0wGVc7lnBTSuFH92+x
 dpJtYoCAmjb7l6b5QRQuOEWizpvFSIUmjba0D1S/lU3hG4u93BslyezdXbP7Ejburj9k
 E3IWovhGlViNsGPUJqD+WAdoWKtXWvzcPZeUvGBkZJ8/g8XONmhHF0FNYUJycBwE/x/C
 p7XA==
X-Gm-Message-State: ANoB5pnC62tf7qPAmj7J+qgtzG4OhmRp6V31DC9xlyOQNd+998OS5y4G
 KEBCzV60mtIC1uLJcxU985RP+g==
X-Google-Smtp-Source: AA0mqf5kisipN0bQuZtnQ0sbJkBzv6js1r5VkAtk718f4YJq+u9xgKXV9AY/16Fk5xC0vz65EzEYng==
X-Received: by 2002:a05:6000:10cf:b0:242:5ba8:d025 with SMTP id
 b15-20020a05600010cf00b002425ba8d025mr26799804wrx.39.1671452360675; 
 Mon, 19 Dec 2022 04:19:20 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bx25-20020a5d5b19000000b00225307f43fbsm9919009wrb.44.2022.12.19.04.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 04:19:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A64DC1FFC2;
 Mon, 19 Dec 2022 12:19:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 11/11] contrib/gitdm: Add SYRMIA to the domain map
Date: Mon, 19 Dec 2022 12:19:14 +0000
Message-Id: <20221219121914.851488-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219121914.851488-1-alex.bennee@linaro.org>
References: <20221219121914.851488-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

The company website lists QEMU amongst the things they work on so I
assume these are corporate contributions.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 22d7f953e1..db6f574324 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -41,6 +41,7 @@ siemens.com     Siemens
 sifive.com      SiFive
 suse.com        SUSE
 suse.de         SUSE
+syrmia.com      SYRMIA
 ventanamicro.com Ventana Micro Systems
 virtuozzo.com   Virtuozzo
 vrull.eu        VRULL
-- 
2.34.1


