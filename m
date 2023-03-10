Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1036B3439
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 03:26:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paSR2-0005cZ-A4; Thu, 09 Mar 2023 21:24:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1paSQy-0005bz-RT
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 21:24:40 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1paSQx-0001vc-DA
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 21:24:40 -0500
Received: by mail-pf1-x434.google.com with SMTP id cp12so2773372pfb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 18:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1678415078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=me/gqRlFyHbSVeRcW2F2ZB6r0FGs3WMizMuVDN3fKSU=;
 b=FXtdwo4OWKftpuNQlnSmtUIdmUmDRZRUKXJGn9bUxdjGZ7bFdh/uniNaIQByOcgl0A
 7hgUDBVIwmVKSN1hi8sAP8lWSlaEr3nJgzu7RDE9r0N7f3RgFlxVJ3JzhfGgzW8ME16g
 ZQ80BukSC0GZfmI6pMweoltO2rcI9ATHjpZXO3vj6Vcg1KasofOKImkDnscgafy3vr1U
 b1UffddVpXQqx9Pn01HwAvKWSqZv+h27q0P8mX2Vla4CCSrY6M1k0nrKGhG0L405GYfD
 e9UOe1gwdvjNx7n+cr/gbZtjbLa8nndME8g8V9C2zzYWp7nwUqBT0ajUqZsOa36z4cEs
 s6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678415078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=me/gqRlFyHbSVeRcW2F2ZB6r0FGs3WMizMuVDN3fKSU=;
 b=zP2UIaU5uwKN65pefS3F9s/l/JAO2oxvGnNiyEKq90q+Re9bYamdRFzQq18/DNaHZ2
 bDDt+WhlHtBT2dyVBkSUs6f+RsGcqvOhUphSSwq+CnyBXNYv4la7n9RLGpg4pks1CvKG
 uCXqza/liVZe+VK1TBwTVNSHrMPCaBYUG8yfbWLHNqhDTYSRXZExtZ/3mPmYtkcBhSRq
 bER7MfmV741jX0ZaSGC4vyJRN+6eiIJAiqOuYnJUhbTB83zm9T1O33/hWpgF3FdaOge7
 pTHG/atNM2bSsu/LImiAlM/MZvESenY2PylKiEBlXZR2G/LBPvhWTI9l8YZemXfLF0V8
 Is0g==
X-Gm-Message-State: AO0yUKVF4EJlU/npUZZ23ne3Q2Imemte+bY47pymy2lI41+dJX2J1JHQ
 uVqSo/PWT2YwYccvKWeyr2/hhV0ImUYTpZ0W9Yg=
X-Google-Smtp-Source: AK7set9AYRRdBV0S9Ifvl1GRW57HgbMK2KBQDCQdd5Swugo7ftzZw9gvHaCSgf1YLCme8R3BuAzUCQ==
X-Received: by 2002:a62:1bd2:0:b0:5a9:b6f4:778a with SMTP id
 b201-20020a621bd2000000b005a9b6f4778amr21547284pfb.24.1678415077969; 
 Thu, 09 Mar 2023 18:24:37 -0800 (PST)
Received: from n250-032-048.byted.org ([221.194.189.28])
 by smtp.gmail.com with ESMTPSA id
 g7-20020aa78187000000b00571f66721aesm246081pfi.42.2023.03.09.18.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 18:24:37 -0800 (PST)
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com, Chuang Xu <xuchuangxclwt@bytedance.com>
Subject: [PATCH v7 2/6] rcu: Introduce rcu_read_is_locked()
Date: Fri, 10 Mar 2023 10:24:21 +0800
Message-Id: <20230310022425.2992472-3-xuchuangxclwt@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
References: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pf1-x434.google.com
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


