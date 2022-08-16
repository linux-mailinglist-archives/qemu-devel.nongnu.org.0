Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B67595BC5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 14:29:43 +0200 (CEST)
Received: from localhost ([::1]:44894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNvhW-0000Sb-65
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 08:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oNveN-0004dL-TT
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:26:27 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:50764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oNveM-0001jO-0v
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:26:27 -0400
Received: by mail-wm1-x32c.google.com with SMTP id j26so2921314wms.0
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 05:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=lcoW7Lzpi1sLzNSIYAaJ/EO/qi9Z5QpCbFBSmRllJwE=;
 b=YzxllfUqpgE6pDtlwGbkji85vJjbK3adYD81KbyQq8vDyHjj2ZCvR7VE/59qHOUpVz
 FYlzBLGZfs9/Dpox1a89gjjOsoGHXcp96yogZRuM4Wx4BpapRWV10rLum6T9OoWrBBgA
 5U4xazV++38jrNuixxQhwRRyLm/hz+JXCmvkjzIkGRI4ANosOVysn0xEERuvPPmuGkhp
 dd6GvnDZEWFHibC7ubps3k2ewAHWm5ZluZSNdwZjXVPKQaNuEDaUDfDM+olRuKAluwBn
 h0FKW7Y5vbkwDpxcNS39/cg/jrA/1BomQogxyMiPcpLEGPWHQcEgYkQSVL6gqMp0wcmy
 37GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=lcoW7Lzpi1sLzNSIYAaJ/EO/qi9Z5QpCbFBSmRllJwE=;
 b=sJ9mfpyYJ5hqzM/zz+sYiZxPrXZsZa74d6KRJX4xbUW5FF4tMLqdKC1bVzBxjMV2Lc
 2fuBIe+EgAtRakqJOl1fP1wcuPoK+le0iNmf638KGEiPTaOkaZFBbO2snn9Tg9xzTi4h
 aVHKAji+HNEtOxcONxr0sXSV38G3glpbHy4HMz+Nu+tr9sM7+7lk9Q3Wq5j5ZGZDy49h
 R+9zza3dgDOpdAJCom0U6xE68PlArrJO90zpqlI6zFf1oxHeeCmw8ClWEeUjvJVD7bYk
 15tC2YDtDg0F7kgK6feUGo+BNU/g4ew0NFQG7GZyu3+u5bm1zXQsR63/e3UXk7PUjq3Y
 zKdg==
X-Gm-Message-State: ACgBeo3BrFz0JfEdeOsa4QCu7YtoZxf2HEQPCi821pnugnBeFdYHk/58
 +MmZdP4cnry6Yhs6TOsDAVb6Vg==
X-Google-Smtp-Source: AA6agR6WeeYp3s8dZTumzCkb7IfjhhK/G7NvEP8BkbAbr5fOoFwaeO3sWBHYFHmyjYXE1jXO9yTA3A==
X-Received: by 2002:a05:600c:1551:b0:3a5:e40b:1477 with SMTP id
 f17-20020a05600c155100b003a5e40b1477mr8332317wmg.16.1660652784523; 
 Tue, 16 Aug 2022 05:26:24 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b003a603f96db7sm3640742wmq.36.2022.08.16.05.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 05:26:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 00E531FFBA;
 Tue, 16 Aug 2022 13:26:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 2/3] tests/avocado: add timeout to the aspeed tests
Date: Tue, 16 Aug 2022 13:26:20 +0100
Message-Id: <20220816122621.2066292-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220816122621.2066292-1-alex.bennee@linaro.org>
References: <20220816122621.2066292-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On some systems the test can hang. At least defining a timeout stops
it from hanging forever.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220811151413.3350684-7-alex.bennee@linaro.org>

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index b4e35a3d07..c54da0fd8f 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -40,6 +40,8 @@ def test_ast1030_zephyros(self):
 
 class AST2x00Machine(QemuSystemTest):
 
+    timeout = 90
+
     def wait_for_console_pattern(self, success_message, vm=None):
         wait_for_console_pattern(self, success_message,
                                  failure_message='Kernel panic - not syncing',
-- 
2.30.2


