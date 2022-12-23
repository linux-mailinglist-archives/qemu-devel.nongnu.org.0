Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758C265515B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 15:25:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8ixg-0001h0-5o; Fri, 23 Dec 2022 09:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p8ixZ-0001g1-3l
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 09:23:41 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p8ixX-0000lU-4M
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 09:23:40 -0500
Received: by mail-pl1-x634.google.com with SMTP id w20so5072542ply.12
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 06:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UCBFuBCG3b1Fjv3ba+NdH9dU2b+uFqE2EzjnxotwM2c=;
 b=u3Le6DOYFo9+On/H7sy8w6pPgoui+/F5lP7cP6ruOWd+ioqJipg/wSMw5IXm/wcXf4
 AiERlJSlsu1tW48/dXPgwTYWipLRG75c9L7Gm/EHqZTX2Upid8nzUZ2zXGuIi/A1H01o
 iOvXmwfmO7jOaH527VFDrVn2ODyIIQZemaETOatZTipkZK0HHCyvTnLgEGxun795QW6I
 M8UcdbH7a3s3SfmobsZ7plF5Dkx4q3lOw83RszEz586wLyj3/94dL8xDmHUkYk+2mO3x
 8R1xyo92iTUS9BSSo4uRbeWhQKRGyQM8RuaJ5Legt+GtK8UqBgUOWgQQGLdSSS1tlOE7
 I80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UCBFuBCG3b1Fjv3ba+NdH9dU2b+uFqE2EzjnxotwM2c=;
 b=jcG+5lQkhQPIAogrj1VZSncDvNUAxIENskCrlC8JFVlbxxJtRzZ9tYDOB1CwrzYLFw
 3DimSd2+ingHphE9ZUQZZFKqaBgE1LT30EyVnvpCfyOrTT322S6+6oB8Pfn09Elem+WA
 xkf9AoO/zJwwT953aTFYNlZaXMYRpyq6fdMdjOq8rXVPplelh4ukqp4aZBbrBzBexakz
 9e6w0pn0MiEVcYN7mtT56YcUt86/uf42vVvSS8eit4FJTr5p6sjjKwh1QCEKZ6MQP9Yz
 0GodvwIbkSQfZOk/DP+vcX8sQUnKkr9M28moN2UlgUQskgSeRpdbtQopmaK76hmoMhvZ
 u84w==
X-Gm-Message-State: AFqh2ko5qPHX5padDz/sa7kcqpzwFXWY3Rwxo8mqL71v0HIoMqjmrxt/
 96Aa0QaJeyTU7PVuyFD6FnBmM+oGh/hs7RIo
X-Google-Smtp-Source: AMrXdXsz2DjjqkT+jqY+EVBkm/IZFq++QunWhzTW2ta9snqQtPd2Jz3TGmELQEfk+TgCzkAzpkey4w==
X-Received: by 2002:a17:90b:d98:b0:221:4cd7:3401 with SMTP id
 bg24-20020a17090b0d9800b002214cd73401mr11499234pjb.10.1671805410885; 
 Fri, 23 Dec 2022 06:23:30 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a17090a6d9000b00223fa0148b8sm4751734pjk.41.2022.12.23.06.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 06:23:30 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [RFC v4 1/3] rcu: introduce rcu_read_locked()
Date: Fri, 23 Dec 2022 22:23:05 +0800
Message-Id: <20221223142307.1614945-2-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
References: <20221223142307.1614945-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

add rcu_read_locked() to detect holding of rcu lock.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 include/qemu/rcu.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
index b063c6fde8..42cbd0080f 100644
--- a/include/qemu/rcu.h
+++ b/include/qemu/rcu.h
@@ -119,6 +119,13 @@ static inline void rcu_read_unlock(void)
     }
 }
 
+static inline bool rcu_read_locked(void)
+{
+    struct rcu_reader_data *p_rcu_reader = get_ptr_rcu_reader();
+
+    return p_rcu_reader->depth > 0;
+}
+
 extern void synchronize_rcu(void);
 
 /*
-- 
2.20.1


