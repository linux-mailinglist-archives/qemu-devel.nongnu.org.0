Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D586BE2FF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 09:21:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd5JG-0006zR-K0; Fri, 17 Mar 2023 04:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pd5JD-0006yd-UY
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:19:31 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pd5J9-0006RA-4I
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:19:31 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 om3-20020a17090b3a8300b0023efab0e3bfso8178924pjb.3
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 01:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1679041165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=me/gqRlFyHbSVeRcW2F2ZB6r0FGs3WMizMuVDN3fKSU=;
 b=jNH4dxEvj9341HvVljpM9YDzaGuv3id0GVsq3Zkz/6ngojk1jE4EZk+0PaJIfO57/E
 lURZg6K50KdPndIMTBLYar5R5pB2cILvgDkr1cjeN432YY923TuSWIDmO73gwH5z5vEf
 iN6mHE67qp1hvNbQ9XvxFMQVqAS3H+vPrNw11E7Eu703kKG/bpF1OOAF+w7KvyIHeXmE
 ltQjRtSoi9ImEiAvqNB1cXeV9QrGrhw5Y+Ef4bCovMCuJ5cu+dL4VitYrgkWuJAqpYEi
 UpyIg6e+M3WqIzvfoqvgcnIpjY2yVNWa4qom4D/7hcpqRezw9jbfw9BhJPdEyZm1u0tt
 +bAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679041165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=me/gqRlFyHbSVeRcW2F2ZB6r0FGs3WMizMuVDN3fKSU=;
 b=29uuF37C9sLr4EVCfxPKuN8HZvsi30UkQ6m5eg8JLlqYjXNOYt38gZtZ1tLY1tjm33
 RqR2ei3RLaqVOd+HDebvEvcz3NmDTUNv8SCL1FrymrXns/jt8JC5qacTYt32KoKk0HAI
 AQkHlVmHiY7Hqpm+FDhPtbwWx+PVJ9ZLn3y3cxtf2yFVrmDm92h0MM5425LieKsQlqoN
 wCnFwYteLFbhRRqog+7TEnLhGXFNrWUGPoYfrCD/ACCRutT4l+tidakvwU1JCKOYEepV
 53B8syabX0I3w2eK3zB4wmKyLGx4rsjqoW9+HMKpxhx0hc9NVyZ+wBPcFjiAo0d7BECQ
 LMjg==
X-Gm-Message-State: AO0yUKUmDUR0xMVSOVAStP8o6KfZ/OKfX2CNxmCW0a8rXni/gjCvDrTO
 zsmyDQb1gWZ4z5IeSZicbjrEG8f+7Y6KtLQJBNQ=
X-Google-Smtp-Source: AK7set/Ri4Rx8VcCxKM+dpgY+DWAsX6vfawxWI06NDzs3aJOpKIQfwE3AwCHHBYguNqzxrvkRv5Eng==
X-Received: by 2002:a17:90b:4f90:b0:23a:5f51:6ee5 with SMTP id
 qe16-20020a17090b4f9000b0023a5f516ee5mr7327867pjb.12.1679041165119; 
 Fri, 17 Mar 2023 01:19:25 -0700 (PDT)
Received: from MacBook-Pro.local.bytedance.net ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 p36-20020a631e64000000b0050be8e0b94csm873304pgm.90.2023.03.17.01.19.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Mar 2023 01:19:24 -0700 (PDT)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [PATCH v8 2/6] rcu: Introduce rcu_read_is_locked()
Date: Fri, 17 Mar 2023 16:19:00 +0800
Message-Id: <20230317081904.24389-3-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230317081904.24389-1-xuchuangxclwt@bytedance.com>
References: <20230317081904.24389-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FROM_LOCAL_NOVOWEL=0.5,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Add rcu_read_is_locked() to detect holding of rcu lock.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
---
 include/qemu/rcu.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
index 313fc414bc..7bf45602e1 100644
--- a/include/qemu/rcu.h
+++ b/include/qemu/rcu.h
@@ -115,6 +115,13 @@ static inline void rcu_read_unlock(void)
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


