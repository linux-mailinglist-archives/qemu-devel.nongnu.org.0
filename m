Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D0F67A0EC
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:09:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNhf-0005cT-RT; Tue, 24 Jan 2023 13:07:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhL-00057i-90
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:09 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhH-00074t-1D
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:07 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso13413590wmc.4
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KCv4GZIK6k8jIwysULPrpggmGg7wtqEW43qJ6E7mFEA=;
 b=MnYY6H5edYg10qXbLwVMm/0qs99bf7I8cEPBz9gDAYjmZV2F+RpQZsinb92NxXZ+rB
 B3kWOtfsSiM/wp73MWRuonJse0PMOnSli0SqRqaHOjXzH8HdjStUJEQtFMWzEMpJLHp8
 DNyP/lAv4iW+AJr7PLAnkWgIbM+/OT6wlE9Ps6s8eG7G4hXv03lSkCyDj0ywXJXtbfqS
 CDhCtcbAk5wxE8OMLNNh9WJJNrabyy9MClNkWm2lxvPfzommzfNuUnC3BhRZkLQ/8xon
 AcfoEJ3um4aCIrUj2iKIMOhwSILqkhLEfc8I+4ZJlooqEDNQdm2H9UsYrWV7gIVHw8BP
 E1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KCv4GZIK6k8jIwysULPrpggmGg7wtqEW43qJ6E7mFEA=;
 b=BaOBu0qkYgOpgzcLF4wVo+hGOIT0tsR2D8U2pw6dAoEQ96uX67d6Va1hvREciYbAgk
 zsO9FpvF2++SXI/hZCRgssf72QkVopmQQ60+Dhi8IzKGkQTcbIAhbfhW4cngOqpbr/eZ
 FJ0stYL4RS/pDUGoL1LK4yBYBWPugwfy6xNK2UzC2srxzJIvwWrF+eFeQRQZF784PAfv
 5odpp3PZKtZAiupf0zyrukv5MJU5jXh84iqCN2aVjlYGAXPk2m4Z9E14Ef65pThC+nsm
 9CWutihFxKEi64YdGPKBu7603czjAjlq5Hi0u5z/HvxmXY9KL1YzDD3bG3unBOMxc4PN
 F2LA==
X-Gm-Message-State: AFqh2kpQ7+6a/HduCEygFwU/o1RH4qBCq6oyQKIRLGY3HhNEzHVBYq9D
 5qPCeyMP9ZdrO1S3VHxOgKc6Iw==
X-Google-Smtp-Source: AMrXdXsxWLDYfkWn2Ll/7wQLyh6AzK4i41hxTrtEzuszVd6PWegqifoqiWKg7ljOJyg0AhxX0yqn0Q==
X-Received: by 2002:a05:600c:3489:b0:3db:693:3fc9 with SMTP id
 a9-20020a05600c348900b003db06933fc9mr27692535wmq.27.1674583620890; 
 Tue, 24 Jan 2023 10:07:00 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a05600c2cad00b003cfa622a18asm15401351wmc.3.2023.01.24.10.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:06:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BDE071FFD9;
 Tue, 24 Jan 2023 18:01:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 35/35] plugins: Iterate on cb_lists in qemu_plugin_user_exit
Date: Tue, 24 Jan 2023 18:01:27 +0000
Message-Id: <20230124180127.1881110-36-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Rather than iterate over all plugins for all events,
iterate over plugins that have registered a given event.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230117035701.168514-4-richard.henderson@linaro.org>
---
 plugins/core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/plugins/core.c b/plugins/core.c
index 728bacef95..e04ffa1ba4 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -514,9 +514,10 @@ void qemu_plugin_user_exit(void)
     /* un-register all callbacks except the final AT_EXIT one */
     for (ev = 0; ev < QEMU_PLUGIN_EV_MAX; ev++) {
         if (ev != QEMU_PLUGIN_EV_ATEXIT) {
-            struct qemu_plugin_ctx *ctx;
-            QTAILQ_FOREACH(ctx, &plugin.ctxs, entry) {
-                plugin_unregister_cb__locked(ctx, ev);
+            struct qemu_plugin_cb *cb, *next;
+
+            QLIST_FOREACH_SAFE_RCU(cb, &plugin.cb_lists[ev], entry, next) {
+                plugin_unregister_cb__locked(cb->ctx, ev);
             }
         }
     }
-- 
2.34.1


