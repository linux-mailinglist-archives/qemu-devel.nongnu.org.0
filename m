Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD714C4CE4
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:53:25 +0100 (CET)
Received: from localhost ([::1]:39256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNemS-0007Mv-9m
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:53:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeML-0002rF-L7
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:26:25 -0500
Received: from [2a00:1450:4864:20::52d] (port=36596
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeMH-0004IL-KF
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:26:25 -0500
Received: by mail-ed1-x52d.google.com with SMTP id cm8so8390000edb.3
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2OwdBN+L5/lqkl/dGkG5znmi1Vo42mXqN8INjvatReI=;
 b=kagYT9usXUeWOqphlY9eygND0zVDXBZCBhOBoPJxNMlkf/zIq6VRFMC9VdYNiy/+KV
 B02ZrmXKruUWe75kmAofow4oZzAq/0+uV722GwDEYgK29d1aJmcYiPYyLK0Xj0pZlXjw
 ARYiGr5Ohw6GcQJCdeqjdo2lWWbTkF7DTyOmh3SCWV5bff4jqb0g7n1HB55IC43wOtyW
 QEv1AX1JVI4HxV6+YG4P7DYs/baX7hbpVfh/8E8gszAMmf2z3avSb6MikkzS3W/ueuLv
 xfGjFSZiqUaHbvPWRAK+FGEj7vkGGYu/kykaYkf90+aTMbBSw6vkl33udWFZjTw4hx/O
 OBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2OwdBN+L5/lqkl/dGkG5znmi1Vo42mXqN8INjvatReI=;
 b=e3RrWtWMGxspmTAhDM7IexeuCYa3Xx7ATVzBFlQIlUYZBDf4s6G/5jAYaB1Wd/d/5M
 PhWRFgyzJSOw9PAcQMY1cDd9FwF5QjSJuIVaGC7CqcEHub/nsg238UOIgDGCk0Ui/rYH
 qX6IyC3XYynJs66ULxVR5RiPe+mmNgw8vEtkV2/R/viA58t7GZJp1FAG3qMGBegjjpHO
 DSdU4PMdj/9wW6jcicjbSE8T/IFEA/hOrhmANzAJzWPZmYn273/uEeSQlQvrfUcjgkuE
 rH6eZRuHhySmMb2zHNjA58glC1QX/Yu5xWai523xlTm6fdmh4Te9XER1viBsj1VOAnki
 eUtg==
X-Gm-Message-State: AOAM5324uIrKkss4BWAD1ODY9Fq2c9oU1F8EZvFS2foijpOifs/3qt7e
 RZWX9z3FDrQK48DVl55TcHs+XGnHEcR2AA==
X-Google-Smtp-Source: ABdhPJw4Zd1CyCa784wEMSKESu5HrvGjvdIKkwMjJwCD9bMR8Av+iUtnyOES9nJcQsHWJ6SPiCBARQ==
X-Received: by 2002:aa7:d7c8:0:b0:3f9:3b65:f2b3 with SMTP id
 e8-20020aa7d7c8000000b003f93b65f2b3mr8055500eds.389.1645809980221; 
 Fri, 25 Feb 2022 09:26:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a170906771600b006cf8a37ebf5sm1224218ejm.103.2022.02.25.09.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 09:26:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8836B1FFC8;
 Fri, 25 Feb 2022 17:20:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 16/18] tests/tcg: completely disable threadcount for sh4
Date: Fri, 25 Feb 2022 17:20:19 +0000
Message-Id: <20220225172021.3493923-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, sw@weilnetz.de,
 richard.henderson@linaro.org, f4bug@amsat.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous disabling of threadcount 3bdc19af00 ("tests/tcg/sh4:
disable another unreliable test") just for plugins was being too
conservative. It's all broken so skip it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/sh4/Makefile.target | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/tcg/sh4/Makefile.target b/tests/tcg/sh4/Makefile.target
index 620ccc23c1..35ebe6b4e3 100644
--- a/tests/tcg/sh4/Makefile.target
+++ b/tests/tcg/sh4/Makefile.target
@@ -20,5 +20,7 @@ run-plugin-linux-test-with-%:
 	$(call skip-test, $<, "BROKEN")
 
 # This test is currently unreliable: https://gitlab.com/qemu-project/qemu/-/issues/856
+run-threadcount:
+	$(call skip-test, $<, "BROKEN")
 run-plugin-threadcount-with-%:
 	$(call skip-test, $<, "BROKEN")
-- 
2.30.2


