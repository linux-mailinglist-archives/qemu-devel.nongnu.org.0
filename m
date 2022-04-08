Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3784F9B27
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 18:57:36 +0200 (CEST)
Received: from localhost ([::1]:42386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncrvT-0001In-5y
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 12:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrmK-00077b-IU
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:48:08 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrmH-000324-IP
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:48:08 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d3so13789265wrb.7
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 09:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4NTszvMqpo5kXDPKuOt5Qa+p4D0vEgJ4d0rxv9/sMM8=;
 b=cXR0BLDLld+OnrAYrhZHtjyNrW/BTXHYGGNvP0E5P00A2FxOt7tb8GHf0T7MEEz6PG
 8csc4FAFRc22mR2dF289dfdCZ01NP66ws1FUz/TQzTfFMmKPxEz3kYEyNpIcTzpnfxcO
 Njw1Z6JDCBxtmlhJrN1fvi2AUeVCNGTFuXgHPkcZjNuRrSulzUrJ7d9oehYIPmTtiWvr
 8AXcwFQ5KX1yvGiAfltyMXH/P04GX6ADvLKO/HTb7T+grf9uQ7cpqYW9Cs1VQHUlxiFk
 lXQsZE1kY5bQicjY0QM7QnENaZznP8QUFbaI4+841ArPh9jIhQde6ZTw83XoGw495VGo
 68XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4NTszvMqpo5kXDPKuOt5Qa+p4D0vEgJ4d0rxv9/sMM8=;
 b=z4YOEwL6jtP9V0NoGD9RI3tPzJZlZVMeFpHmdiNNxyvXQZ0D6vFsgvTobHC0b3rRhZ
 T+gZM66ik/Ae6TmNGEoZN8TfmvXw/i6kdaYU3fqY9QoPZbaAXbZFJZXfYWU8OAdgMrem
 Rt89qkZ5c26xvdnf42oRHvAezLzPxA0ABuU/c2bL2VceGwgvKBHHKWO38/80Dmhf+82o
 wr0oNFGLYUwQVX3FbE7VtYPD5CdyJ1mdvISztNbGieV52/wHUKhqj8TTLmusijAY7A/c
 u2f2x4ZSPku4wXVniyakTVVHj7jcU+2h7P/N/pIFubBTcHGcxHs244V8iuJYLkf8Qv87
 30qQ==
X-Gm-Message-State: AOAM530QGD/yw7uenGLHhr99/eZkC/7QWJMPaFGPsmUjIlli20wreUcU
 pkRc2SVztaegOoG8ZpF7XG/Lww==
X-Google-Smtp-Source: ABdhPJwn5rM+HEzmFT575xjEXxTaQO+iHeJVqIVCSVd5q92al05IWlD4qCpPK75eGt8T6Si1qvYjVw==
X-Received: by 2002:a05:6000:178d:b0:206:134e:49c6 with SMTP id
 e13-20020a056000178d00b00206134e49c6mr15200621wrg.225.1649436473922; 
 Fri, 08 Apr 2022 09:47:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 p5-20020adff205000000b0020614a499fbsm17049106wro.90.2022.04.08.09.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:47:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D7031FFBE;
 Fri,  8 Apr 2022 17:47:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 06/15] monitor: expose monitor_puts to rest of code
Date: Fri,  8 Apr 2022 17:47:33 +0100
Message-Id: <20220408164742.2844631-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408164742.2844631-1-alex.bennee@linaro.org>
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com,
 Markus Armbruster <armbru@redhat.com>, crosa@redhat.com,
 aaron@os.amperecomputing.com, robhenry@microsoft.com, f4bug@amsat.org,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Luke.Craig@ll.mit.edu,
 pbonzini@redhat.com, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This helps us construct strings elsewhere before echoing to the
monitor. It avoids having to jump through hoops like:

  monitor_printf(mon, "%s", s->str);

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/monitor/monitor.h  | 1 +
 monitor/monitor-internal.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index cc4cc6c6ad..8e291a2588 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -31,6 +31,7 @@ void monitor_resume(Monitor *mon);
 int monitor_get_fd(Monitor *mon, const char *fdname, Error **errp);
 int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp);
 
+int monitor_puts(Monitor *mon, const char *str);
 int monitor_vprintf(Monitor *mon, const char *fmt, va_list ap)
     G_GNUC_PRINTF(2, 0);
 int monitor_printf(Monitor *mon, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index caa2e90ef2..a2cdbbf646 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -174,7 +174,6 @@ extern int mon_refcount;
 
 extern HMPCommand hmp_cmds[];
 
-int monitor_puts(Monitor *mon, const char *str);
 void monitor_data_init(Monitor *mon, bool is_qmp, bool skip_flush,
                        bool use_io_thread);
 void monitor_data_destroy(Monitor *mon);
-- 
2.30.2


