Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531355EC212
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:06:58 +0200 (CEST)
Received: from localhost ([::1]:55550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9MV-00007P-Rk
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RJ-0002oZ-1V
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:49 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:37756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RH-0004zA-CP
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:48 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 u59-20020a17090a51c100b00205d3c44162so2052580pjh.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=N7WNzpDqLE7H3OMBl2IZFeUkBGLBP/FjFmhaXv6SnaY=;
 b=VgZb5BMs6QduI7bfgVrlZaf+OHqFgrhen5cE35VU5nJTMvj2FkPY13iL7CbsrA31xN
 PI4ePsyIxJKEgYlycVy1EziJXeZH9lMXPeXk3bPYG+gj8DHNFUVY+7DmSSRTwEZphJaw
 zO8wikCfiv0kxFzP+k+G9wOhOwm+A2SwyNLbc66m1ea7v7l/f3BF9acXqjJP4qfnFiWB
 Knz3m2FDxq2h4VngLPVJo6WdICZMeo/WuGgo2UZjd2K00mytN9tGFSVwFsbuta2SeHn8
 3t2ZP3MyzV0Xun1Mv7geXA9/lX6DTXyXM8SS8Z31C6rxdL6nRYw28bh8A3oqQrlmpbXv
 J39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=N7WNzpDqLE7H3OMBl2IZFeUkBGLBP/FjFmhaXv6SnaY=;
 b=Tmbj9Ws4pTMp7oQDhN1xFSNAKoHg5VSwZm2J1g8ywx7Tl2sON3ezeff3R+uv4nNobp
 tE8GjHxPyfL5cqe6m358UV0u58D7L1d+KKar+45K/TQiARx0Ic5iUFylUtwTcXzQlmr0
 GHbzQWzs3vALrRTSWsWc4U6JDrYgmkL6ngK7KHxP8fOZ86wka1oxEksJFySh3jROtJDU
 shiQ+GH07Dkep7C/oDqDdLWinrd9rZnmDCi4TfyYctlcPrA0UQJ68Ci4ngMpzefbgkoA
 HhCTB1Keye9IONSq+kbZ/fdIcssY6eZ6A51msLCi9S2RhsQoui6xaEPX6HY881MKDb1p
 K2LA==
X-Gm-Message-State: ACrzQf1VunWXsropjgPsOMc6zAnlqTEiaknID/L86C62oaNAIiYgkd3U
 n3bpz8Fm+Jvgsk8nE8h5Qih4Hdl7uig=
X-Google-Smtp-Source: AMsMyM7XRV8B85U/b9uNB6LhOi0ea59HbAcUNzk5rI4bgWtr8fU8XpBn8AKsBQ0g8o+62iF4HiOJqA==
X-Received: by 2002:a17:902:e841:b0:177:82b6:e6f7 with SMTP id
 t1-20020a170902e84100b0017782b6e6f7mr27183281plg.66.1664276865857; 
 Tue, 27 Sep 2022 04:07:45 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:45 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 24/54] tests: vhost-user-bridge: Avoid using hardcoded /tmp
Date: Tue, 27 Sep 2022 19:06:02 +0800
Message-Id: <20220927110632.1973965-25-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_file_open_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v3)

Changes in v3:
- Split to a separate patch

 tests/vhost-user-bridge.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
index 9b1dab2f28..fecdf915e7 100644
--- a/tests/vhost-user-bridge.c
+++ b/tests/vhost-user-bridge.c
@@ -631,7 +631,6 @@ static void *notifier_thread(void *arg)
 static void
 vubr_host_notifier_setup(VubrDev *dev)
 {
-    char template[] = "/tmp/vubr-XXXXXX";
     pthread_t thread;
     size_t length;
     void *addr;
@@ -639,7 +638,7 @@ vubr_host_notifier_setup(VubrDev *dev)
 
     length = qemu_real_host_page_size() * VHOST_USER_BRIDGE_MAX_QUEUES;
 
-    fd = mkstemp(template);
+    fd = g_file_open_tmp("vubr-XXXXXX", NULL, NULL);
     if (fd < 0) {
         vubr_die("mkstemp()");
     }
-- 
2.34.1


