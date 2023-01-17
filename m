Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA45C66DCF5
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 12:56:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHkYt-0000i9-Am; Tue, 17 Jan 2023 06:55:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pHkYq-0000hA-Ru
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:55:28 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pHkYn-0008A9-Bm
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:55:28 -0500
Received: by mail-pf1-x429.google.com with SMTP id c26so18816374pfp.10
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 03:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vf5jNMRum0lU93ysVQ8c+v+UiH2X4F5XN02QztzkGHI=;
 b=e/cNcEgu2inC5XKVxZCYUS5uD274sfs+s1rVzaLLoIOfAO3e5rZo/gLzHmDYeQESHW
 qMAfL3xnbaox2kiTmElJCoEzgEReupxmK74ZPomhWoRgMGd2AQpJrd4QzjeoKnDYxYXl
 L8yFSD1gt1sF0E7VoWjlUtb/skpiox8FCdREiJZznO76+pfobA5nCuscSJU6AjxyT/7n
 ir6v5tJuePipA740jSYE42LNNdFy07+PlHD7j7sWf7YUmXXpEVzb4dpC1Joh/eBqDrx7
 N7p8vLvCTWOp1woMXDLX4MCaSVi6BFDvS8C0ElggKi9oKkeMdWwPjsUtrcGPfh05BawB
 xRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vf5jNMRum0lU93ysVQ8c+v+UiH2X4F5XN02QztzkGHI=;
 b=MWUx/QSqLk1nfPEtFMiEMO6MqwYg3ZecGoIRp56wBS33X8RszMAiGLZZXqa71dLSyQ
 2RXC/arCUgCM0zY7G/pdoKCmTe62XnUfcbDRvU9q9+aiBwNZAqHQ0MQ/9qYieRtoeABP
 /E3zBDHfQBFMGt02kzA+FAlAmuuPeZdqp6YNwCag16RB9JtQHdC6X06CyxOd7VGX7ClZ
 t68KU9McjSv+r+EOzMO1ozqJuP9es70yqWRbQYdH8NhcchGn5EGBkESvbgdCwvZxl/kk
 T8xN6AIIEvjTae0GCQjLQtFMlKoMHtr/eKmAPXT281JCNJJwYMoWI1v5/ZOAZIf0WO7X
 GpTQ==
X-Gm-Message-State: AFqh2koeTH3KH+aloPpcI05HA8nwVgpPnSRKscx7+kknnucoccO7pRiq
 CMZXDajKZ3VQj22NuHiTxv4HOTADXqXJ5wkU
X-Google-Smtp-Source: AMrXdXsuaWgYTwcPj+w760bTnEQz+pO/FK3MIQUjH4PnMAj6dD7Lp53a0eNvBSiEQikxo4j61mUdgQ==
X-Received: by 2002:a05:6a00:3020:b0:58d:92ff:8a2a with SMTP id
 ay32-20020a056a00302000b0058d92ff8a2amr2967816pfb.23.1673956520812; 
 Tue, 17 Jan 2023 03:55:20 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.28])
 by smtp.gmail.com with ESMTPSA id
 c196-20020a621ccd000000b0058a666aea32sm14003708pfc.147.2023.01.17.03.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 03:55:20 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [RFC v5 1/3] rcu: introduce rcu_read_is_locked()
Date: Tue, 17 Jan 2023 19:55:09 +0800
Message-Id: <20230117115511.3215273-2-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

add rcu_read_is_locked() to detect holding of rcu lock.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 include/qemu/rcu.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
index b063c6fde8..719916d9d3 100644
--- a/include/qemu/rcu.h
+++ b/include/qemu/rcu.h
@@ -119,6 +119,13 @@ static inline void rcu_read_unlock(void)
     }
 }
 
+static inline bool rcu_read_is_locked(void)
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


