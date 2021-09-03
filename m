Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FA13FFCFF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:24:40 +0200 (CEST)
Received: from localhost ([::1]:36106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5R8-0003tU-V2
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM5F2-0003XP-A6
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:08 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM5F0-0003sg-FQ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:07 -0400
Received: by mail-wr1-x42d.google.com with SMTP id n5so7187860wro.12
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Gz/8308YhmTTLG+j1+k+Mkb0OBIL4Jjcw0DjoEOP9c=;
 b=yo5tq5YGNM5/GhAh6J9lSHN0KYvWibyWFnQI93pIIuY7rnYW2MfNo26mivKjoXlJu2
 vKMKkLvJkpfOq3gB1/h/+MbHV673SPZioAMSNQmiqnV8AwXckAIKL8nvGn+/IMJjSCda
 dG9PcGuZvbc8RlQ05y3TGOl1BcjrK94jKTw980zLjHdrYLMD9l6X4HV2KuNfpIZ12ypI
 nWc5sdLOw1LJt3ynvi7GW+ZfBGbJiT84cEk5MtZbLYOoqPTlr+CvENbvwcPOmWDlItk9
 wD19qGN27s1ynJHjnQppzqU2dAl4R06UCIyj3tRrVra6OsfcjteWq3VvDMZkz8RE5GCK
 8kKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Gz/8308YhmTTLG+j1+k+Mkb0OBIL4Jjcw0DjoEOP9c=;
 b=XAgG3fkqhtWnWTeGO2AhQZ2wWkh/Z8iGuLEd9XAVnkk5HMwSrlFov9k5RUSFjkqLq8
 LOdOlKSHpuNerH0Ivg50cX9TXYkimRVc+jEfUjBtet8fzCypP5o8ujajrLGDRFbP2kUQ
 /Hyqbx2OHNXfRIFXLI3P2eZkfiOD1RS0xqvo8D/VIDz/ySwpyGrjEU0Ean5qIh+3UQ2Q
 cYilPLeB6lBPCQngGU2G6L9z3hftmjTsY42lIu1tngKbwOQ5R64QbN/HFM/l168b2sCP
 e0cTsHrq/fJw4AHdFCZjmom/YQF7ZV33Zwvfd41ObAqERZOiTiFo6HXkpNSeKjuodMPz
 FFQw==
X-Gm-Message-State: AOAM533hcBRgLzHcq3A8l1j2H6FnOI9NsAbXtLt5/IXrSxIbJksd8q8F
 cYtcelqBDVgd7YNUwJPRRgBzdw==
X-Google-Smtp-Source: ABdhPJwqDGRkjWB4xXlM7zbgy2a3wxstHDYsCzsJ5VKbfLqfAmoM9hDVjowf04IZdbc+nFdCnTE3jw==
X-Received: by 2002:adf:d0cf:: with SMTP id z15mr2855587wrh.356.1630660324585; 
 Fri, 03 Sep 2021 02:12:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v62sm3797316wme.21.2021.09.03.02.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:12:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 992731FFB8;
 Fri,  3 Sep 2021 10:03:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 22/22] docs/devel: be consistent about example plugin names
Date: Fri,  3 Sep 2021 10:03:39 +0100
Message-Id: <20210903090339.1074887-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Some plugins were prefixed with `.c`, some were not. Since the name is
essentially the full-name of the plugin file, it's logical to include
the extension.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Message-Id: <20210830121534.656559-1-ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index fcc460bf7b..dac5101a3c 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -301,7 +301,7 @@ which will eventually report::
     previously @ 0x000000ffd08098/5 (809900593 insns)
     previously @ 0x000000ffd080c0/1 (809900588 insns)
 
-- contrib/plugins/hwprofile
+- contrib/plugins/hwprofile.c
 
 The hwprofile tool can only be used with system emulation and allows
 the user to see what hardware is accessed how often. It has a number of options:
@@ -360,7 +360,7 @@ which will output an execution trace following this structure::
   0, 0xd34, 0xf9c8f000, "bl #0x10c8"
   0, 0x10c8, 0xfff96c43, "ldr r3, [r0, #0x44]", load, 0x200000e4, RAM
 
-- contrib/plugins/cache
+- contrib/plugins/cache.c
 
 Cache modelling plugin that measures the performance of a given cache
 configuration when a given working set is run::
-- 
2.30.2


