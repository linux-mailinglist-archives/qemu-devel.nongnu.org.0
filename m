Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69FB261161
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 14:32:24 +0200 (CEST)
Received: from localhost ([::1]:43684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFcnP-0000t1-Os
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 08:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kFclF-0006Uh-TD; Tue, 08 Sep 2020 08:30:10 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:53375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kFclE-0007tJ-Cj; Tue, 08 Sep 2020 08:30:09 -0400
Received: by mail-pj1-x1044.google.com with SMTP id t7so5058319pjd.3;
 Tue, 08 Sep 2020 05:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NnBwIumxkiQ9pXVAp8TmFXF/H8dsT5OnHNvh40zg8GM=;
 b=nlgXJuvajsV6EVofGcBVubi3XES9iM32XvguvblyE2/x++QfbNfXIHmRQp7HCbeRSm
 uy1efTq3xiG6MGXqG2WWqvzINvCyj6mqNjLjp+/IcI0NBZp04RhnaHj6/mWjVZfO3l9y
 5ABVaYqvMBNJaH5T0CrRzYSchrhKKp8XHahso5Xe1L1KGEFU7cwIC5C6rtZa+cVd1PuK
 i4UAqlXj87Qencq0rTVBrp7aduqko5x0wv2Q84GUT2DtFH6alFX3UCEkZI5jc6eoGJw1
 dikiS6uxzzdniCdb4CZXYP5xG4mFuVx8Jj5Qq86Gnstbar48YlnAywdqZEeMlDsccajP
 bSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NnBwIumxkiQ9pXVAp8TmFXF/H8dsT5OnHNvh40zg8GM=;
 b=cLM5YW//rhFRAVQB/C/zHPEvJI3ZTErP2FC2Me+/0oF4q4+QyvqRhKnIwgDKRjzEH9
 RfBDgpNvHhUpJJIo6GsnzOLU+qEp7jTmZFrgECWVaEyhCk/VDlhqm2pGEUkMZYaNO51j
 BXzNARHP6lQ9UXFvcmj+jLwcqaZVAmKAJebxOLpvJgibPuNeogjAMIz9Hfk/s5V1RhpI
 mJHPawoNDmpA6vrlPHLkaTOaWIY4ReC4t4FnNqYFHmojnZ4hhV+rOxixNs10nw2mTDeU
 fnQ88mxAVWV3ojZChWax84ai6/QhkcPl76tzRnGYSs0m99c+LAkSyCO1cktm/IrRDL18
 JP0Q==
X-Gm-Message-State: AOAM531PgM4lsEhcDziKVs9W5lq+xCScE5XyOJbEPySTYSApsaDXYbU9
 sljJKyZ1ynTirJUWfINajkVqjizm11CHxU9T
X-Google-Smtp-Source: ABdhPJzSPvDBDDK3W570h3XZ/pdTKeYfKd39ugakGAzb8O4Adx2X3XlCJ8/lctxp1YAX5uqTuTR+/A==
X-Received: by 2002:a17:90a:e984:: with SMTP id
 v4mr3744387pjy.202.1599568204843; 
 Tue, 08 Sep 2020 05:30:04 -0700 (PDT)
Received: from localhost.localdomain ([222.95.248.6])
 by smtp.googlemail.com with ESMTPSA id d8sm14833887pgt.19.2020.09.08.05.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 05:30:04 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] logging: Fixes memory leak in test-logging.c
Date: Tue,  8 Sep 2020 20:29:43 +0800
Message-Id: <20200908122944.414-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200908122944.414-1-luoyonggang@gmail.com>
References: <20200908122944.414-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Daniel Brodsky <dnbrdsky@gmail.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

g_dir_make_tmp Returns the actual name used. This string should be
freed with g_free() when not needed any longer and is is in the GLib
file name encoding. In case of errors, NULL is returned and error will
be set. Use g_autofree to free it properly

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/test-logging.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/test-logging.c b/tests/test-logging.c
index 8a1161de1d..957f6c08cd 100644
--- a/tests/test-logging.c
+++ b/tests/test-logging.c
@@ -196,7 +196,7 @@ static void rmdir_full(gchar const *root)
 
 int main(int argc, char **argv)
 {
-    gchar *tmp_path = g_dir_make_tmp("qemu-test-logging.XXXXXX", NULL);
+    g_autofree gchar *tmp_path = g_dir_make_tmp("qemu-test-logging.XXXXXX", NULL);
     int rc;
 
     g_test_init(&argc, &argv, NULL);
-- 
2.28.0.windows.1


