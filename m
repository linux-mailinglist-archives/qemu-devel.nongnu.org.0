Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C525EA8ED
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:48:45 +0200 (CEST)
Received: from localhost ([::1]:56124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocpPX-000878-Ii
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoR8-0004te-69
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:46:18 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:42705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoR6-00071H-IL
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:46:17 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so3761316wmq.1
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=q21t2nFDX/f5AWrAkAHJwsus3NL9GSjm9kUhuszVaMo=;
 b=oDBDxeEqIXIQ30ttpJUT5zqt+lMstAjxdTIOhsRHDRY2HfTB9Bk9ZEawjCK8Hrwp00
 H5Ri6pBNN3Eq1xscaEEZ1BzZbFt+bWQp5mn6LuItYOovAYVCFkEoodbWeimSsDXjj0MO
 KOawBMVcz8b+dV0q2DCa/XGFHcJ9ZPNKJpV9BygILw/IcneMsna+qprPERS+PXFe/FKr
 tnBicSxrdM+KM0ehqB/kYy5GuEc2rOU7BoVtTd59HZJvPEIVti/nYy3v4Zs1ybITS33I
 xJYY7ZGJUhPYA0P00NZ69/IGTnxb1hCfC1zZ0t+rQNDjgU1AjN3BYAKhhHnqgnx2U+NY
 Onhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=q21t2nFDX/f5AWrAkAHJwsus3NL9GSjm9kUhuszVaMo=;
 b=Ujsw+dyN8OV4mfVCzQulHCdcSo+Mh7aLoD5q+gll7xtcbJrT1GXdlr6vKBukxNfZi/
 QGJ91OcjrHWTd7Gzj0tEJvihSLoES7BqBvLJgV5hR0rmxEOrTHrlI3gFfLdpM+hvRNNj
 PNOb9JOOMdWf1w1oJLwClX4OfS6vi0DkLaui/U8y56E9AYf4Y11+BmaMbI0FBH+IavM9
 pDZDwBgLasUIyRkDT+gMAzqTj14r9dQYJZQpdLZKtyU1f0YYMc6NtsAgSPblruQ9vcGJ
 KQdpUCsdjbZB6FY2Kmh/n+qIsQvI2AEif6SSJZN5PVSYWWLsb+vhBJDD4pjycOoMR41P
 o0Dg==
X-Gm-Message-State: ACrzQf3tncWk7fFTGsuxEHk0QGW3zr4sKVsMCcKo8LWAPL5IHDGmAtz8
 sCPXkZsl2aoV5u+8oOifwDIC7qzn33J0Og==
X-Google-Smtp-Source: AMsMyM6EFuGOf83a2dIM+kDPXJUQ/JBF9hE4p0DWsZ9ZbKcFpNdqzxlMT40i2Czv0cJn5RugaiR5Iw==
X-Received: by 2002:a05:600c:1906:b0:3b4:c979:e639 with SMTP id
 j6-20020a05600c190600b003b4c979e639mr21625513wmq.10.1664199974984; 
 Mon, 26 Sep 2022 06:46:14 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a5d6405000000b0022af9555669sm16804799wru.99.2022.09.26.06.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:46:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 714271FFBC;
 Mon, 26 Sep 2022 14:46:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 WANG Xuerui <git@xen0n.name>
Subject: [PATCH v1 4/7] contrib/gitdm: add WANG Xuerui to individual
 contributers
Date: Mon, 26 Sep 2022 14:46:06 +0100
Message-Id: <20220926134609.3301945-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926134609.3301945-1-alex.bennee@linaro.org>
References: <20220926134609.3301945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

His blog confirms he is not affiliated with Longsoon.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: WANG Xuerui <git@xen0n.name>
---
 contrib/gitdm/group-map-individuals | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index 0ec003048c..6a3b593df0 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -36,3 +36,4 @@ chetan4windows@gmail.com
 akihiko.odaki@gmail.com
 simon@simonsafar.com
 paul@nowt.org
+git@xen0n.name
-- 
2.34.1


