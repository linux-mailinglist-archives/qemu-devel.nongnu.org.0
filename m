Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FEC587A51
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:08:03 +0200 (CEST)
Received: from localhost ([::1]:51026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIook-0002GJ-QW
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXs-0001ZX-2A
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:36 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXq-0002WK-Hd
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:35 -0400
Received: by mail-wr1-x42a.google.com with SMTP id j1so8785220wrw.1
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=z6HPjsVGZtO92xLq+sdxQwAMWt569NUcAMZ4ONfdk+E=;
 b=ORaO7+qhdJM/C9XoyX3QrS23RSo91AzkIybJbXO+6wnkzVdIDCtIuHNRaeeRlUKuC1
 5baYida1gS4I3LM7EEI6l5zhub6RiinR4gGS0sHTkKsSgt2snVK1hnj59tXqygy4smGW
 YGDyZuqitXFG5W0TtnUixUAeGMtY6/uCyeu9zAafnLVgaD4pDlH3WrqDk9kgqJI/1QLU
 2TCdK58kIXPvSyRV39vkfe3yPUQw2X76JvI62C2AVGXvri/j6ZGngyPXSno/ugLYcuSG
 4txBXZfBZPp0LMlBqKTR5qaOXZh5nf9ymyIh6hTjJ0XG6HBVTbwea4C9vueSJH2U4rG2
 Yy3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=z6HPjsVGZtO92xLq+sdxQwAMWt569NUcAMZ4ONfdk+E=;
 b=cs+TIXbbXdar+mEHTVMNWBRO15Jx+HvV58T9qLyRuTjWoLZJp0Ooxp5hUUO/e/a5jU
 8oOoCfkfOzE7IbgjiHH7zs7Y1eFPqeepe6LRauXSH9NJN5cYPZsRFB//kRBUogN256H1
 K74O6dplkaSLPR8ZD5EMI0od2WQLipcQQ7AsmIWlZ+VnANivus4xRcJL1uDBNadGGC2i
 6q2PunCf1xow8N4GQZunV6/qAb4Unnl9gAfIX6QPz0tAx1WPO38TTXGWuYrDMIY/nCjS
 J30URRCL4uiiEDrirC/IF4QXte8xAzBpTmdGb6dVJxQ0I1un8rQjqD2tkuwd2YXJ3D0M
 gRSQ==
X-Gm-Message-State: ACgBeo2b1UuoOteObJqS4pz+ddsTKO1BtWVCxv03gLN9iO704YAXwtDH
 1CpRus+7CyXqBXIL3QkV0gN0xQ==
X-Google-Smtp-Source: AA6agR59TSY+YT8CR+tmLQmdrj/BJ+r5qqaACsJ61ly/CS57LspK4/Lr2cX3DtNN0FCLBLOxujTkJA==
X-Received: by 2002:a5d:684e:0:b0:220:63df:3760 with SMTP id
 o14-20020a5d684e000000b0022063df3760mr4593291wrw.508.1659433833224; 
 Tue, 02 Aug 2022 02:50:33 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i5-20020adff305000000b002206203ed3dsm6805777wro.29.2022.08.02.02.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 02:50:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F2B681FFC6;
 Tue,  2 Aug 2022 10:50:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v4 14/22] tests/qtest: pass stdout/stderr down to subtests
Date: Tue,  2 Aug 2022 10:50:02 +0100
Message-Id: <20220802095010.3330793-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802095010.3330793-1-alex.bennee@linaro.org>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

When trying to work out what the virtio-net-tests where doing it was
hard because the g_test_trap_subprocess redirects all output to
/dev/null. Lift this restriction by using the appropriate flags so you
can see something similar to what the vhost-user-blk tests show when
running.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220407150042.2338562-1-alex.bennee@linaro.org>

---
v2
  - keep dumping of CLI behind the g_test_verbose flag
v4
  - fix overly long line
---
 tests/qtest/qos-test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index f97d0a08fd..01a9393399 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -185,7 +185,9 @@ static void run_one_test(const void *arg)
 static void subprocess_run_one_test(const void *arg)
 {
     const gchar *path = arg;
-    g_test_trap_subprocess(path, 0, 0);
+    g_test_trap_subprocess(path, 0,
+                           G_TEST_SUBPROCESS_INHERIT_STDOUT |
+                           G_TEST_SUBPROCESS_INHERIT_STDERR);
     g_test_trap_assert_passed();
 }
 
-- 
2.30.2


