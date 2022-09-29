Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149265EF761
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:21:29 +0200 (CEST)
Received: from localhost ([::1]:53004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oduPm-00089s-Vn
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsCy-0007R2-56
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:05 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsCs-0004LN-Nr
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:03 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x18so1825861wrm.7
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=gUVK+1Ut5x8fWFhpOA8OcQxpZuOHPAnAMa2bUX9DjvY=;
 b=R6emOtKN6dZY7woSV0K/VLvzvo2In0AOybDedU+g6+yG5M/W7DsHNn4ysKuvkEGo5J
 GuIIbml/io6iASidYJtA5Jfd8ZpR7+7HhbhNJOMt/Q3MJbAfigeDMAF3WROQJgOBa77o
 FicXLsVi1aQqJld1CQySG30NJt4dOTAbO1jsldN6pULnaN4vbzLBxCCPNDUUp9QXs3eN
 ctCF9FgA4VX11GuphkYrZWEYNOg7wP4K3mX4OmdGCrgkqq6C7s4zMx+nxJ8KVr3uMjT/
 ciKrvjI3OE7UYhti7ghPA4frPwQo8ChqgGx5XU/vNqcSyd0NqGBysI5rqYNyOt0Mq9fF
 7qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gUVK+1Ut5x8fWFhpOA8OcQxpZuOHPAnAMa2bUX9DjvY=;
 b=3fCk+7/oTvIzhYWRJQkGxctyBgnIeopBYFcK3OQpDFtzjxs9g+6dmZVhoNqj87VRgq
 uVwmJEyrQA1fkA5QXjNxF0uxCT5NTz+oJrjlTcWrX5mL5Dm0PcS4h5VkipHrAJA+PwVz
 2/0t3uJEFBYMxBSIytOuI1onAEHUcKIDutuDjJL4e6HkkxEpfdWstLuoN5lkFztdyubP
 BA76b7BJFKFBnnDSCewQLzOrSYX237MIaLquLPBvi5LgYRL6eFnj2oij2hV0UftV9i4p
 70sxRmeJodYdqlpV3eGAHBdhB1sRLAUj7P+tKU6tJUcqzzHK2/6vU+JLeDbacrCt31M2
 bTxw==
X-Gm-Message-State: ACrzQf1xus2dLKngkqFp+YzFuDvH9++03IunR1K+fJ9YxKsV2Fgc3r1B
 jmWxwVq5dLaiFyEfCsh4M8pevw==
X-Google-Smtp-Source: AMsMyM5Cm5yUJWA10Vgpn/fMRyQNlJ1+KPvt0St45LLZaFP4FUA+jdHtAGpPh7E7BgZsYux85mA1Vw==
X-Received: by 2002:a05:6000:887:b0:21e:24a0:f302 with SMTP id
 ca7-20020a056000088700b0021e24a0f302mr1913567wrb.466.1664452791719; 
 Thu, 29 Sep 2022 04:59:51 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a5d4ac8000000b0022a403954c3sm6422805wrs.42.2022.09.29.04.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:59:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DA5F61FFDA;
 Thu, 29 Sep 2022 12:42:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH  v1 41/51] semihosting: update link to spec
Date: Thu, 29 Sep 2022 12:42:21 +0100
Message-Id: <20220929114231.583801-42-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

The old link has moved but it seems the document is now hosted on
Arm's github along with a license update to CC-BY-SA-4.0.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220928190444.204118-1-alex.bennee@linaro.org>
---
 semihosting/arm-compat-semi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index e741674238..bfea9e9337 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -24,7 +24,7 @@
  *
  *  ARM Semihosting is documented in:
  *     Semihosting for AArch32 and AArch64 Release 2.0
- *     https://static.docs.arm.com/100863/0200/semihosting.pdf
+ *     https://github.com/ARM-software/abi-aa/blob/main/semihosting/semihosting.rst
  *
  *  RISC-V Semihosting is documented in:
  *     RISC-V Semihosting
-- 
2.34.1


