Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1B03C8261
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:05:11 +0200 (CEST)
Received: from localhost ([::1]:47346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3blO-0008V8-D4
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQB-000587-2W
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:15 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQ7-00008E-Vd
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:14 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l17-20020a05600c1d11b029021f84fcaf75so3493410wms.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=clqrKAvQN2EMsh/NXQ/kMnkpkQ3oL3snCpv5YEPIOdY=;
 b=N+ghkdhYDlPNoT/BjgNmD+lcmhNNSbJ1Vkldf6qypnQMO7Q68uLKZiXJm2OMtKQteh
 jAl4bnrpNbz2gNHZ+a2e3ErYEb0bdPaxjo331icotYjrHYEmdTESYenoz0LP3bB4QNjQ
 2qScZn7yvOy+s6ReID4XIGL7wXEwg0/0erbZLShIdWh+/q0unwdZo+IHS0Tn+rZLfXv3
 Xq9bIDV0++cFgkTO09/rzzpfpSCElBxKVJ3hQ56vwAjJj8K8UwlgCAZ4owXtDMR8RcfG
 4pfRKanc1UFpl0fLGDTwsr7QfYUs4rrVItTPwAwxa407ZlyO/RUzYJVPsGFU0g0zj0yp
 FJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=clqrKAvQN2EMsh/NXQ/kMnkpkQ3oL3snCpv5YEPIOdY=;
 b=WqeHqUMaA6Uj2wAp1/SE1qTM+VgGu5tFisicwLXs+FE9UyQRkovl3kCGgVS+iINAGe
 b10izFrZtNEH/c9kTyOeD5FepDf9RR4OcvvoRVNzNBt/JjDduvNMAE2TbNnRLm4O3NO3
 up9WG6KtrdbIyyMXmg9aNqvjhjo0IZ1VliaPT/e6ECM1M5KV/lOkar/0+G+UP611OYgQ
 FhwFKIx64Zv8YyArYErAj/E8f3uH53WXkDrtqAeQf3UKs9qF7vgomYfFR1de2lHx1yg3
 Dnc2xVOAAo55wXDxAaUXYXvt1ouFpfYoBXPfH8G5m6jB3MHqxts6xvfgSfCqqGlzcAFz
 qgPw==
X-Gm-Message-State: AOAM533qLiMa7zo2nte/d9rQPFYHK+Ip+VjvIYWdna9hn12UC0iReBZ0
 704HbT7R1P9/ANIZPGy+sc5OTw==
X-Google-Smtp-Source: ABdhPJzFyHz1dINhIAo2WDsxNYTIXORkScmWHdd2NI2RtjBmhPb/Q9l1EjboQwngde0RKfHin0re2w==
X-Received: by 2002:a1c:f206:: with SMTP id s6mr2987589wmc.15.1626255790290;
 Wed, 14 Jul 2021 02:43:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y16sm1989332wrw.42.2021.07.14.02.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:43:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 62EC31FF9F;
 Wed, 14 Jul 2021 10:36:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 16/21] contrib/gitdm: add domain-map for Syrmia
Date: Wed, 14 Jul 2021 10:36:33 +0100
Message-Id: <20210714093638.21077-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093638.21077-1-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Filip Bozuta <Filip.Bozuta@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have multiple engineers contributing from this domain.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Filip Bozuta <Filip.Bozuta@syrmia.com>
Cc: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index bada5384dd..0b0cd9feee 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -34,6 +34,7 @@ siemens.com     Siemens
 sifive.com      SiFive
 suse.com        SUSE
 suse.de         SUSE
+syrmia.com      Syrmia
 virtuozzo.com   Virtuozzo
 wdc.com         Western Digital
 windriver.com   Wind River
-- 
2.20.1


