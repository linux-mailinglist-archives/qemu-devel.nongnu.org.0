Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E887532EEE
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:29:08 +0200 (CEST)
Received: from localhost ([::1]:40668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntXP8-0004wg-Rq
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWeo-0004G0-O9
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:14 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWem-0005OV-VH
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:41:14 -0400
Received: by mail-wr1-x435.google.com with SMTP id t13so7097652wrg.9
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lIw/XzESBQ2ZIkAn8maFDXE0YZAEzzp1ypsC723X+go=;
 b=gdpZI4BUKvCAhqLp2M0ofCADf0PazqBD6SQ7MfY0plJUJZ3cbvVyI3htPrrM2RFjTS
 Sb3H9xEzsISa+OsSwzqYAkEMd+Ok/hfNYqCEaMB41FEWZwAzqk3HlZAVpDmMzManaRQy
 j6FAuFj86gP3NhlvR+kZENLLEUnodkpRS6H5Em/uVbmWgQBTd87H549gVtRcXTDOtX6B
 TLKJWBRVJ7US4cZ9yxrkiH00XurZXoS7Qa5KVDP8PoCxNuvCfWgPZhrRWFHokGjigOcm
 22ITGYqTdi03hl0PlADAPf8KReIoPXBjNZXv59KLHWu60zouqzB4Aaohm12yXEV1uWNV
 Xq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lIw/XzESBQ2ZIkAn8maFDXE0YZAEzzp1ypsC723X+go=;
 b=wjxV7SU4Ym6tA7iingfiFkXKSgbUX1fjrngf50CIZJD/lviULtTFXVyGbA9zmv42iH
 85/Cgtzb9PSEyGoem10DVLU5qgsp/2BsArwxcBK/BNIlMIXboN8WoyiiOqN/88wxVDx2
 kzGdfj5DJbhYMZotjFW/hf+vWFOUi/3HBHiMy6LEV6W/gtD+1949zKDKCuCPXYekICoK
 hau2Ii6QP3OH3KEhbG4FxNOHML53M241bRo1njBLkdW2L0rJvqKpds1uU3VK6hugCiH6
 tkddQ7RlN0QgRd9iiAK2rTB31AqDGkQL+BFJ3DR7s4ggW8cFFns0jmPQ+XnLxB+FcE8N
 rCvw==
X-Gm-Message-State: AOAM532Lf7pjGZsM+IAEXKgCzzYJwUqrjcSByOkd1IcQlLYuu85gfkOg
 D6gCl2+KKV9lTr1IijD9RpGbZA==
X-Google-Smtp-Source: ABdhPJzwLLjhJGOnTyvdUNf2/gw2XFx3/Daj/QYtBtHIpX9lbJoQRmzfK/UZuC5wUYGwSUsvMygOXg==
X-Received: by 2002:a05:6000:186c:b0:20f:e176:df0b with SMTP id
 d12-20020a056000186c00b0020fe176df0bmr8004355wri.608.1653406871606; 
 Tue, 24 May 2022 08:41:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 u25-20020adfae59000000b0020d106c0386sm13283414wrd.89.2022.05.24.08.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:41:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5DAA41FFC3;
 Tue, 24 May 2022 16:40:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 11/15] tests/qtest: use g_autofree for
 test_server_create_chr
Date: Tue, 24 May 2022 16:40:52 +0100
Message-Id: <20220524154056.2896913-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220524154056.2896913-1-alex.bennee@linaro.org>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/vhost-user-test.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 11da6ff07a..d0fa034601 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -565,14 +565,13 @@ static void chr_event(void *opaque, QEMUChrEvent event)
 
 static void test_server_create_chr(TestServer *server, const gchar *opt)
 {
-    gchar *chr_path;
+    g_autofree gchar *chr_path = g_strdup_printf("unix:%s%s",
+                                                 server->socket_path, opt);
     Chardev *chr;
 
-    chr_path = g_strdup_printf("unix:%s%s", server->socket_path, opt);
     chr = qemu_chr_new(server->chr_name, chr_path, server->context);
-    g_free(chr_path);
+    g_assert(chr);
 
-    g_assert_nonnull(chr);
     qemu_chr_fe_init(&server->chr, chr, &error_abort);
     qemu_chr_fe_set_handlers(&server->chr, chr_can_read, chr_read,
                              chr_event, NULL, server, server->context, true);
-- 
2.30.2


