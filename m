Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D154AA165
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:48:45 +0100 (CET)
Received: from localhost ([::1]:58588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5Vc-0004oR-Sm
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:48:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qr-0006hs-Bp
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:49 -0500
Received: from [2a00:1450:4864:20::42c] (port=37423
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qp-0007La-Qt
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:49 -0500
Received: by mail-wr1-x42c.google.com with SMTP id w11so13442039wra.4
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NPKrcI0/I2FVrU5Z0FCwjKvMS6pS7fJ3mwu4LQOQL2E=;
 b=qu1u2MPbt1eX+jeolxO7vSa8+3NCc8Oj9wedCjtEl4NjxFBhJrFmq73su5JO8UggzX
 +S6Wjts5p/WW6sOesc0NdLbpUCXpwoJWgEjMePZjTiIWm0psX4i/cyaP723ScQUvN8w+
 PvFUXcxrRffq87Y1dUnmwvSbqxITjM7I7Ie6+z4KGcCytxHyPCdxKdM5RbRHLIqseCQm
 xe85T4iAIMlMfgyZmIAJjk4ht32dJKHTbkD3LfK/LK6X6NyFKEPuEAkccC2VVaj3nQaM
 VhLlJ9w4F9oOY0/fcWN3NTFyK2XowOK6hawNz6dmzFSdoaCXoxeZFyW3YqKHolAUwjq7
 xoiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NPKrcI0/I2FVrU5Z0FCwjKvMS6pS7fJ3mwu4LQOQL2E=;
 b=Kdl6MLqZNNlTGnFVhyFKW00jI7bcsiN8K5EfB1oJPP3LsCSembzaLAIClzIo50BX3w
 m2CM+qoXhqAbJX4kBKug8xTYDFpk1jktYunDKPDlevGQvQdiZB+zj6ein3HUFhRgpZi0
 cPRarLt+PUf3J9zf+iTdCaGnvBXxabYjL/ugHEdsfpUQxOHal+Q0vN6/XoW27yOdUQep
 bDHrBdlQiR6CoKeC1d2DMsBnJEgoesubv/xppty0WZmfJQ3xX6IT4GiBHQlNpxhD54U5
 s8wmU5QLvP8XKhEgi3T9E5tkOCDur467SLLe9gTEKTkgGTxozqiin8BW1/QtCJHdr+PX
 8RcQ==
X-Gm-Message-State: AOAM530WNEzQnpk7VppHD4Yywh++jENJ9Wdm6QJM7/vMKz34bAYZvfAX
 zKdi7prrPAZzU+J3P/OBJdtXcA==
X-Google-Smtp-Source: ABdhPJwZ/wF+d+ne+92XiHnsW95G4ddBxAtvbUPmdHXVERtuvEMdrIb0MKqoSyqEcPa7sSPUcOkeLg==
X-Received: by 2002:a05:6000:18a4:: with SMTP id
 b4mr514240wri.641.1644007426580; 
 Fri, 04 Feb 2022 12:43:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n11sm5977885wms.3.2022.02.04.12.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:43:41 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7FAFD1FFBD;
 Fri,  4 Feb 2022 20:43:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 05/26] MAINTAINERS: Cover lcitool submodule with build test
 / automation
Date: Fri,  4 Feb 2022 20:43:14 +0000
Message-Id: <20220204204335.1689602-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

lcitool is used by build test / automation, we want maintainers
to get notified if the submodule is updated.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220121154134.315047-2-f4bug@amsat.org>
Message-Id: <20220124201608.604599-6-alex.bennee@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9814580975..b0b845f445 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3585,6 +3585,7 @@ F: .travis.yml
 F: scripts/ci/
 F: tests/docker/
 F: tests/vm/
+F: tests/lcitool/
 F: scripts/archive-source.sh
 W: https://gitlab.com/qemu-project/qemu/pipelines
 W: https://travis-ci.org/qemu/qemu
-- 
2.30.2


