Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EE06137B1
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:18:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUZJ-00029S-1z; Mon, 31 Oct 2022 09:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYh-0007wZ-JF
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:39 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYX-0001Eo-MZ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:30 -0400
Received: by mail-wr1-x42a.google.com with SMTP id g12so15892337wrs.10
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YcBzsU4yCgksFoUatww9DUnT0Mq4wvlWi4GB1ETyCpE=;
 b=vttposVEftxRPJf5zOOXfZJ/sYMiTIwKOrXnOLxGjtbTGLfsZKcHJq5xrr0RXOfC6E
 l62pIGkSLPXcl65xoRyejo23wX0yZhpRI9/N9wqfUjd6bcT0Itzt+hrN68ak5XDBoksi
 w/bQuOQXqdNsQt8cORMytbvKmlOHNMcEsTcOdz9WvvEEE5TQNG6UQ9faLQ8MWjUM7VUs
 iAsOL9k7a/5YdQ/UFAnKgTPtvCcdiZlqYltxmnz3DoNsjlt9gSM8X9OAFxXX/x2HXxcb
 KpAiKBdhEWEOsI+f7noPGoNAZtppw61T6GOfWWbI1XDOsSD0Kig5Bd4Ci18D50ZkyrSc
 zTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YcBzsU4yCgksFoUatww9DUnT0Mq4wvlWi4GB1ETyCpE=;
 b=A8nkp+2eVI3j+gs3l7QehsD6R0nFoK+9JRGqjlpuTaQ36SjyX0IUncltUHYhqYx/9Z
 yGsoCb06ZKoyL+DS3PKkbAqG+M6M1G64Jn7Ey3BcuL8kFo3poqsO3LcITcNA07WCyQ+B
 paYWKlyjCG/wZZaHTbJcAO/1qXdWTALgKlzhdJaxlXD+XSPtWMJs0yMNY6dmcRbhk33G
 CLV44B0uF0IUDGOxpS2xjH9PcGK8rPmlMon9B1IQrzSZCXHqz/+107zdXxbVyRQLlVkq
 oh2hYtRVqcZSX3HCJJw4aozOQhAOtKMoIQGAmTALYPbf4SKkXWb7IfbTJLnRiLWH4BSO
 f6Qw==
X-Gm-Message-State: ACrzQf36wazo76DGMobl15LVlDbpzROlyJHnQ8GKxQf3ccLMncMNdVq4
 L3wgVtBTFOCZFyqKMjMwPfjU8Q==
X-Google-Smtp-Source: AMsMyM4GaOh3DYQNuh1Ju5GAzXoWdk6VGI1MhWPdBiWBtzkTReXxhlqM4SFaO4A7MggDPp9nuzzwUQ==
X-Received: by 2002:a05:6000:c3:b0:236:a261:a2a5 with SMTP id
 q3-20020a05600000c300b00236a261a2a5mr8133856wrx.137.1667221819795; 
 Mon, 31 Oct 2022 06:10:19 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a5d6a8c000000b002364c77bcacsm7099603wru.38.2022.10.31.06.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:10:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D26FE1FFC1;
 Mon, 31 Oct 2022 13:10:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Anton Johansson <anjo@rev.ng>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 09/31] tests/docker: Add flex/bison to `debian-hexagon-cross`
Date: Mon, 31 Oct 2022 13:09:48 +0000
Message-Id: <20221031131010.682984-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Anton Johansson <anjo@rev.ng>

debian-hexagon-cross contains two images, one to build the toolchain
used for building the Hexagon tests themselves, and one image to build
QEMU and run the tests.

This commit adds flex/bison to the final image that builds QEMU so that
it can also build idef-parser.

Note: This container is not built by the CI and needs to be rebuilt and
updated manually.

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20221014223642.147845-1-anjo@rev.ng>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221027183637.2772968-8-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
index 8d219bb81d..c4238e893f 100644
--- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -43,7 +43,7 @@ RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.lis
 # Install QEMU build deps for use in CI
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
-    DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy git ninja-build && \
+    DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy bison flex git ninja-build && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt build-dep -yy --arch-only qemu
 COPY --from=0 /usr/local /usr/local
-- 
2.34.1


