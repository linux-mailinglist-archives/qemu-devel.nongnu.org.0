Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05838456E54
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 12:39:52 +0100 (CET)
Received: from localhost ([::1]:46060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo2FC-0005aj-IW
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 06:39:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniellalee111@gmail.com>)
 id 1mo29n-00006Y-9f; Fri, 19 Nov 2021 06:34:15 -0500
Received: from [2607:f8b0:4864:20::233] (port=33694
 helo=mail-oi1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daniellalee111@gmail.com>)
 id 1mo29l-000681-E7; Fri, 19 Nov 2021 06:34:14 -0500
Received: by mail-oi1-x233.google.com with SMTP id q25so21469277oiw.0;
 Fri, 19 Nov 2021 03:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TSCDq1EAKnVzQiZQOTJUrYn1sPNX8uFfLQz1YsVKcpA=;
 b=eMpq5NLzaI4/yaGpJvu60SHGMz4rl9JUTnBz/Z3orUpbYT/q+jY473BjuA7n0CPUtR
 quGp6ZouRjBREkGwK4s19hBoW+FYboLY9WgAlrLp1+Q96AOchvDyF2L/b2OlS/r/cJuH
 jvYtVKuLwKeyRYHKfG+/twfEBVyLLRuzMgh1HlEeQZ4ySGgB64Y9p8ivsGhCZJOy3en2
 ay/INTCqi4lvEnusEYElsm/tuE9+7DSkfr46CXKc/d9e+EF6MrGOa8Ri76tViiyFS+aZ
 qDvJwM3182GKX9pHbo/WlEnKkh4oHom645vC45tBVvQSAkvCWSo3Ur6zMlbAAyJl8/+M
 ZgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TSCDq1EAKnVzQiZQOTJUrYn1sPNX8uFfLQz1YsVKcpA=;
 b=kDGVaVGEerSQLSZW4oXgZ/VyrkPcHMX+AZ+jMidGJFqMG9chTN/hyRRH7LzMTG9BFm
 K+jBkwgl+mchiIUVfiJWHCnL/tjoVd67SUTOB9qVjZAmQFG+zGjkZT5YEJn9OZmlXCCT
 tMERITSMlh8PiP5GP898idp6IPx8EsPD7i9IFZigi21Yw1LLpjfuktV5YwMhFyqwCf7U
 5qyDNR0zi8zl4x3oDRLvfE4TUFJThVBbkYTjY4+j+lwJ9k9j1JsW8zidH6zymumkVrpm
 /LpMYfr4HU+WFxN+NonIUYHzzc2G2t/bOfPh+gllAXTv3VaU89X7wtdxFTYKKhDATQE/
 16Vg==
X-Gm-Message-State: AOAM53087uDjkT1vnxShXmSYeBKXHXk8h7jBhDrHyCs0XH+gk46Qe/h4
 gQ/bmKoA/O7nhN8XE7a5e9JSv6jX/RBt4A==
X-Google-Smtp-Source: ABdhPJybe7umx9KfT2SobFuUqhBi0/YAwqffV8MYkluN8n7MwT7xkXVyLioRuUPLfaHpxIF78TCCvQ==
X-Received: by 2002:a17:90b:3142:: with SMTP id
 ip2mr3742068pjb.207.1637321192819; 
 Fri, 19 Nov 2021 03:26:32 -0800 (PST)
Received: from localhost.localdomain ([106.52.23.176])
 by smtp.googlemail.com with ESMTPSA id l4sm2771605pfc.121.2021.11.19.03.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 03:26:32 -0800 (PST)
From: Daniella Lee <daniellalee111@gmail.com>
To: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] block vvfat.c fix leak when failure occurs
Date: Fri, 19 Nov 2021 19:25:53 +0800
Message-Id: <20211119112553.352222-1-daniellalee111@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <d02640d5-7c6c-f78b-da6a-0cad1d53d80f@redhat.com>
References: <d02640d5-7c6c-f78b-da6a-0cad1d53d80f@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::233
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=daniellalee111@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Daniella Lee <daniellalee111@gmail.com>, pai.po.sec@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based on your suggestions. I made a new patch which contians:
1.format detection
2.replace calloc with g_malloc0 in enable_write_target function
3.use g_free without null pointer detection in vvfat_open function
4.delete line "ret = 0", use return ret directly in vvfat_open function


Signed-off-by: Daniella Lee <daniellalee111@gmail.com>
---
 block/vvfat.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index 05e78e3c27..5dacc6cfac 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -1279,8 +1279,18 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
 
     qemu_co_mutex_init(&s->lock);
 
-    ret = 0;
+    qemu_opts_del(opts);
+
+    return 0;
+
 fail:
+    g_free(s->qcow_filename);
+    s->qcow_filename = NULL;
+    g_free(s->cluster_buffer);
+    s->cluster_buffer = NULL;
+    g_free(s->used_clusters);
+    s->used_clusters = NULL;
+
     qemu_opts_del(opts);
     return ret;
 }
@@ -3118,7 +3128,7 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
     int size = sector2cluster(s, s->sector_count);
     QDict *options;
 
-    s->used_clusters = calloc(size, 1);
+    s->used_clusters = g_malloc0(size);
 
     array_init(&(s->commits), sizeof(commit_t));
 
@@ -3166,8 +3176,6 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
     return 0;
 
 err:
-    g_free(s->qcow_filename);
-    s->qcow_filename = NULL;
     return ret;
 }
 
-- 
2.17.1


