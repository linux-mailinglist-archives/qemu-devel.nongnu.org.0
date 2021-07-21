Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF343D17BF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:15:11 +0200 (CEST)
Received: from localhost ([::1]:33758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6IcY-0005Hg-Ry
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOP-00031Z-7E
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:37 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:43844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOF-0005pw-ON
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:31 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 x13-20020a17090a46cdb0290175cf22899cso1948644pjg.2
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M1PZQ2MSvFDbXrpGppYIv2PQlYkQHkfO64Ue3b3IUQo=;
 b=p3BSvv9xlmaKy9mMqgf7c3I4fhv9lcpaokkFfOGnLWZPQoiKCB1hGcZpa9/AB1ieEd
 53Mq+oNDy6NKaDm+cnqnQLyK4/7ASgK774fVXBALJAblogPxuWF/xC/eEr/12x41eJZ9
 K2bmNNGAqcRBn53kpDglWmy//SxMqAPBVT7+nl22we1v0QXJ4cI6a1Ylf1WMCWcEeV61
 SEu7AqukTKAoPrulK0VZPmxqdBuL6vovf//UMWqT7UTdDdZIs95VaeAsnrBqPi0Bw6gW
 QMqiMUINL1azw02BPBB73EP3MpDKRqyKs6vvuib26l0wY7SW9vo97zi3N935wElB0qtT
 qB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M1PZQ2MSvFDbXrpGppYIv2PQlYkQHkfO64Ue3b3IUQo=;
 b=R8slD4E3aEN2rArsd/Jk8vBtCiZ0dWuo5WSOZ0mXa0NsMZuTiW7d6OfKjbWZIpMdsZ
 RI7UKsdl9OMveVnUCkcIksnpknBX6bf1hny6loL5LtZRATN6cMLtEEiaKZ7zhBmQIMas
 qRCSSnaAmMRDb2NYACSahXwaAXglgRmv5w+OHHk7V6DomckcAauyYAbRuz6zctNLYQe2
 kdUG69ULvHUq4Si2f/0JvflcxAdWTSt97okLf47jGQ+jYZCDyeZ13otB5lpZ1UzKlLMu
 l1awHT3kEFEQN72VVKhl4+UJ+X7RqBPQGYeFof/kojiDv4jab64gcX2Q9I2xr1G6FQdG
 pOrw==
X-Gm-Message-State: AOAM532pKIeYjSgg9hGskF167xB+UQqdELr+2HxVJcESx9jyZ6ZduG9K
 OaYR4CZjRDVMW2JQhl+mY2JHkTExdcvOgQ==
X-Google-Smtp-Source: ABdhPJyCY0/NPNDuL0IY7jZpHidnuQpijwmlbDVeGJfNPf6w6sIETMgL+I9vZxsFU5gDuiO8zdnqFg==
X-Received: by 2002:a05:6a00:1582:b029:332:67bf:c196 with SMTP id
 u2-20020a056a001582b029033267bfc196mr38765876pfk.52.1626897621765; 
 Wed, 21 Jul 2021 13:00:21 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.13.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:00:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/27] hw/core: Introduce TCGCPUOps.debug_check_breakpoint
Date: Wed, 21 Jul 2021 09:59:45 -1000
Message-Id: <20210721195954.879535-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New hook to return true when an architectural breakpoint is
to be recognized and false when it should be suppressed.

First use must wait until other pieces are in place.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 72d791438c..eab27d0c03 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -88,6 +88,12 @@ struct TCGCPUOps {
      */
     bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
 
+    /**
+     * @debug_check_breakpoint: return true if the architectural
+     * breakpoint whose PC has matched should really fire.
+     */
+    bool (*debug_check_breakpoint)(CPUState *cpu);
+
     /**
      * @io_recompile_replay_branch: Callback for cpu_io_recompile.
      *
-- 
2.25.1


