Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DAD4E1D10
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:19:37 +0100 (CET)
Received: from localhost ([::1]:37810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzDL-0008T6-N3
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:19:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5j-0008Jw-VI
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:45 -0400
Received: from [2607:f8b0:4864:20::42f] (port=33474
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5i-0003QJ-3K
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:43 -0400
Received: by mail-pf1-x42f.google.com with SMTP id s42so13739822pfg.0
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3tVjuQw+/CoLqgI+CPACWtQapf8H6hrbx2q6SrEHdT0=;
 b=v2I1qxEx1BDTBGsmT1JLooy8xjBo8HT1b9xXdVwScsORoy0NiawfCSJRgX1kliul+V
 MFS2gL9pkuvuKBHt8jZqV3PY6toKQU567K2FmgnrJ3Yu4f6ZwcS8N0fseVp9g0bOTvGR
 0dUNbELk93KpmzydSiJDVo5i7O8vHeN3VqdfvrN/OrUqYbQ3B9V8KbadkCpxVl0Jz6ns
 rsciYjcmBfQoTLXyHlNFGU9nLw4v3/EhPVw23wK9SU3LI9aoke91uF4COcDDFQMRBazJ
 8bQIcnWSjtqYkAJI4lwXFH06nRP6GvrV8i2PdJ7WIfj3vPlSVC/2nMqSx2e0ExzoiB5J
 gdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3tVjuQw+/CoLqgI+CPACWtQapf8H6hrbx2q6SrEHdT0=;
 b=4Kp+jhznXqICPDRLH6NNFP33Vnvse9LUf04Jy2fMGyabt+YBAF+46zwB86G6USV0dC
 bKat/3v2MGJVuyA0brVMVvhpsHevlMFydi3hYZX2qCkFiRXZxKdywHSaV5/mLHGbQGTP
 8R1F+DVcope6ua7MFaFZhS0Sk/1ruTG4WslJvAdwLBrK56d5Fm6bUA0kI0fCHTmApiq6
 5PXOrsREKzAEK214tQ6pqFAaBHRqKRDbxLRrGp31l0+aPZH9Cw6ykhtQjHPRnBpCFL7a
 CNmiYLXNyqi4ZzIZIxK6Zw8q4LYdZI0TF/QNFVsZ6+xQUgHpN7npddGNEGSFAmdTUDxj
 U3/w==
X-Gm-Message-State: AOAM532hT6If40DWe7VAV5P5w/bBHpS+xlpdzqX82ZzRM+Am44qaCl8g
 TA6TGyhY5l8GwcdUBMZf1nmSCUtJDtY9uw==
X-Google-Smtp-Source: ABdhPJxJQnnP8bKzzckQKQSdzEpa8R/0WoSzEzN/1FnZVT+oC7TvAcAPSQwe0fX9yBookQFRJmf4vA==
X-Received: by 2002:a05:6a00:1944:b0:4fa:952b:48cd with SMTP id
 s4-20020a056a00194400b004fa952b48cdmr3031902pfk.10.1647796300839; 
 Sun, 20 Mar 2022 10:11:40 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 04/36] os-posix: Use qemu_log_enabled
Date: Sun, 20 Mar 2022 10:11:03 -0700
Message-Id: <20220320171135.2704502-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not reference qemu_logfile directly;
use the predicate provided by qemu/log.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 os-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/os-posix.c b/os-posix.c
index 24692c8593..20d31fc518 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -292,7 +292,7 @@ void os_setup_post(void)
         dup2(fd, 0);
         dup2(fd, 1);
         /* In case -D is given do not redirect stderr to /dev/null */
-        if (!qemu_logfile) {
+        if (!qemu_log_enabled()) {
             dup2(fd, 2);
         }
 
-- 
2.25.1


