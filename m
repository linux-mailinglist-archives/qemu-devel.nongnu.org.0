Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D575E4A6766
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 22:57:13 +0100 (CET)
Received: from localhost ([::1]:37180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF19E-0000sa-LF
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 16:57:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExnX-0008Cu-5X
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:22:36 -0500
Received: from [2a00:1450:4864:20::62a] (port=34574
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExmZ-0000cn-IF
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:39 -0500
Received: by mail-ej1-x62a.google.com with SMTP id h7so56924032ejf.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NPKrcI0/I2FVrU5Z0FCwjKvMS6pS7fJ3mwu4LQOQL2E=;
 b=yBhLlkGY7mQxKYFu9RlznNjJpN6fW+qJrM/01qahI78K4kMYXd/VsfQZmGIGFSbAGz
 wgSTZ77GrSZVC9n+rQZJkL+G486f6FwJv50gor3oTuG9tSuXspYZ18EP/Xkzl6SQYkRd
 l9dix+OUxU5iqQbuVLzg+EslR2Z/jpCUUYAx0ZQ7a7rfASstQVdIgWpsh8Vo6i8rIaXT
 jD78q00Syd/QTweZ4uNoag0ZPOC7kXMT/tbqllUdqrkgoa9aWPP3va2RZPePq7aNSxGk
 f69cuWR9KOexrAHkOg+oQAoZynbNMDCywlso/VCKdh24ly8ohhIomN2sA2h2sIrUIHvn
 Cw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NPKrcI0/I2FVrU5Z0FCwjKvMS6pS7fJ3mwu4LQOQL2E=;
 b=j77f77ABd4koHhPgzzUbaqcd4uVV978EnUZ5s5y663lFYijl7PXT+6jdv+ghtLrFD2
 Fmf+7L94aqqncI0sXfYLp5/FMmUbHN5ORvg4U+fcy5UdGLbvld+JjUIEYTqMh1tDejXj
 coKhSPk3cIxI1k/fVDI4KGRNwgwUBhw5hLW+t21OrJSzGMAUkYDAU+AXtnpLr5FIAtDt
 Nf/09gWeeMKUbLSnRJdLa0KoZmGoMcUzTHeQjOu85AgLJGzRvKMBvTe03V556CB91pRi
 npOqanr2u7PLqKNqWsX85TLxc1hN1gCEhIhI2PUiKTI0RV9gaGG4HxKxJ9vp8Zb9adR/
 wNOg==
X-Gm-Message-State: AOAM532d0PqObfgnK+uYDP5PD3vnnBmqpAS4ISFd/S4jYPXjB8pmLclV
 ARDe7L3nNvHlhqZVqkoFn0jeiw==
X-Google-Smtp-Source: ABdhPJyybyd6Foru63mS+KM25rggNuPF6woSEZi38bXjm4hBtbAnPK4dqon+Tv7vokZ5sFGPVFqBFA==
X-Received: by 2002:a17:907:7241:: with SMTP id
 ds1mr22777926ejc.199.1643739662204; 
 Tue, 01 Feb 2022 10:21:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c14sm19901346edy.66.2022.02.01.10.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:20:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 204BA1FFBD;
 Tue,  1 Feb 2022 18:20:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/25] MAINTAINERS: Cover lcitool submodule with build test
 / automation
Date: Tue,  1 Feb 2022 18:20:30 +0000
Message-Id: <20220201182050.15087-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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
 stefanha@redhat.com, crosa@redhat.com, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, f4bug@amsat.org, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org, Luke.Craig@ll.mit.edu, pbonzini@redhat.com,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
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


