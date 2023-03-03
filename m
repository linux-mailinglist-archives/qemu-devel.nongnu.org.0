Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F486A95B2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:58:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY36G-0006rM-SG; Fri, 03 Mar 2023 05:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY36B-0006qp-Tp
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:57:15 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pY367-00042a-GK
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:57:12 -0500
Received: by mail-pj1-x1031.google.com with SMTP id bo22so2080346pjb.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1677841030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oybiXPgSNhTbwAYyTDdPbCgWTqNqgxckr+HdWHzShIw=;
 b=TuiDmPECvvzsufgR2b12xOg5iblTfTLs7/7HfTzqxVsdOWeKbcrk3usCdqXbJCkedB
 N7sl3TS8KbfjcG7bXXo5fPf3gt4B7yki5IYc3dGWwdeqcNoP0N1qxHuDS4dx061JQMhT
 EtTgBLJRK3tZi+y1p0BKszcceVwRGOoVPcyIgsplFaBfwUCP6qiO9gadhHzHCD/W7SBz
 D3QnkoDLqJNHlkvRKHVDptpXIUPhSvj17jSFhihOeLYszrelcjyk4j3sYt3nDCMy4aEb
 YttkQxfP2lWjPXCeg+LKfGUWlwXoybjyf8DUhXtzTrr6R4ZOs8gJo/0l7ds0+urDwm7k
 fcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677841030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oybiXPgSNhTbwAYyTDdPbCgWTqNqgxckr+HdWHzShIw=;
 b=wGNUiTRTpUTyNuDM4yhvSJeqo0gma/TnMAukhyqA2iMr9kUJ1LCTnooEOIgYXnK/M/
 H420uLfDDSsH5v8zywZZ2V8eWOq6LuILQYXz3O+mDr7uiF8+RAXFmUOw17eQKrQgYAr6
 FlXApgjnMZdzpXI5ctBdhofct1nH78wmPWdRU0/UqOi8CXr4GEUmMx4bPXZ6YtBf8Ycb
 5YO2dG1z6sM6d/dUeO5UEBWrbngKUEZdqcdiq4pKEkELlANZFMWKrb7aJVGvdZgwdJPk
 Blt716CXf0zpQQk6TRgH9xm5zQoQaj8zEHhp7sYSbgFC2aQsgbuELdUEE8Nj5ejCPYiZ
 61Hg==
X-Gm-Message-State: AO0yUKXQ6GWADNbznWr4+GZRRF1bATeewqvTRyfjMB9/Psh4chM6RoAr
 n4GeG+4SyQtWaQXxAm/uMlr9PjYgCtNpdAW0
X-Google-Smtp-Source: AK7set+vIcjtaGVwkrZotsKW9QFWKa14+/Q22pQG3UIku7JdCN/vSb40vaMzp7CbqJXdcDSCBz4ehQ==
X-Received: by 2002:a05:6a20:6d2a:b0:cc:395f:e1ed with SMTP id
 fv42-20020a056a206d2a00b000cc395fe1edmr1665385pzb.22.1677841030070; 
 Fri, 03 Mar 2023 02:57:10 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.12])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a63a54f000000b004fadb547d0csm1248000pgu.61.2023.03.03.02.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 02:57:09 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [PATCH RESEND v6 2/5] rcu: Introduce rcu_read_is_locked()
Date: Fri,  3 Mar 2023 18:56:52 +0800
Message-Id: <20230303105655.396446-3-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230303105655.396446-1-xuchuangxclwt@bytedance.com>
References: <20230303105655.396446-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
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

Add rcu_read_is_locked() to detect holding of rcu lock.

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


