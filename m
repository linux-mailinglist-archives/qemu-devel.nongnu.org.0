Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B324E2CA8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:44:58 +0100 (CET)
Received: from localhost ([::1]:54252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKDJ-0001cc-LV
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:44:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzk-0005GT-W6
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:31:01 -0400
Received: from [2a00:1450:4864:20::629] (port=33530
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzj-0004wh-F3
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:30:56 -0400
Received: by mail-ej1-x629.google.com with SMTP id pv16so30690030ejb.0
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 08:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=948AQ9lrmyvD+2c2nr+9RlA46f0hdo10UMuataFfsRU=;
 b=Xelr0pTxmYIiVRbJMSe2a/MoboK6+/HNCCAERBi1Ps/Fxo9RaDrZ5E10byv9UIeLph
 fo8TO7tAleC7+LlbyinmLJeouUCMa/tqRFtNOij6n9y94KlC8vF9ubFX9CUKmQqavWxe
 VU1/zjwVoKio7j/opXdOhoD/5v8VvcTzkXAH51Zn1gLZyhYeyNZgptwf7shS6dNOYkBD
 lLprot8G5fvKVVxUsL4Sxzyb79VKWBQVJK2GYjXBKfSsxfho/2bJjqQU+m8g6Auu9QEY
 rSzvBEwiH8qBftcNglkQ2VVoVy36t5PMH2ZVy75UjZfZvav3Pjmm5cxsfh2CrIUOKDB5
 L7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=948AQ9lrmyvD+2c2nr+9RlA46f0hdo10UMuataFfsRU=;
 b=c8UOD5v9MZ/5unLGxaP6wLVHKlWmW6BWID2FehuQ2vRpdGtWYb/Cgp9RTfsWN0ueYe
 lSLfMDoAk59LZDpYvilsDEIegp1R9RKFTaNqkjSttlbYrScfuPkpTLslWQP4u2wrpmvD
 h50pKqp0J8znWFqp/dCwikgia9cbji+w+eEGzN6ItTB4J34W5EiCj33Xvm57rkB6IX4J
 lbTYhZH+88lAIM5tPL5B3/ZwUKwMreIoKTWGRXZR3XAXz6bMnaEyEhJqCeV6d1Q33z7U
 8L7721ZL1aucNilpS1eueiyVvDPPr5y3qr/TcrmU2fCKyM/DrYR9O6vpQoqGHdTlAzQz
 aN4g==
X-Gm-Message-State: AOAM531MRxo1+AGoXyotW6SceL9w0lhtOTW69KrEop0dWuiXaQvDt7VT
 tU5uZN5S9XVhbZqg7UrDvIyPzg==
X-Google-Smtp-Source: ABdhPJwAS/H43LYPrKMt088PKE6wZjxs1HJNVEHllUSFgUrnTENtktRok1fP9Y6FQmAa2hDKv3imUQ==
X-Received: by 2002:a17:906:9b93:b0:6da:6388:dc57 with SMTP id
 dd19-20020a1709069b9300b006da6388dc57mr20998595ejc.338.1647876652031; 
 Mon, 21 Mar 2022 08:30:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 bd12-20020a056402206c00b00418c9bf71cbsm7887171edb.68.2022.03.21.08.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 08:30:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 66C071FFC0;
 Mon, 21 Mar 2022 15:30:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 08/13] libvhost-user: expose vu_request_to_string
Date: Mon, 21 Mar 2022 15:30:32 +0000
Message-Id: <20220321153037.3622127-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220321153037.3622127-1-alex.bennee@linaro.org>
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is useful for more human readable debug messages in vhost-user
programs.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 subprojects/libvhost-user/libvhost-user.h | 9 +++++++++
 subprojects/libvhost-user/libvhost-user.c | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index cde9f07bb3..aea7ec5061 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -473,6 +473,15 @@ bool vu_init(VuDev *dev,
  */
 void vu_deinit(VuDev *dev);
 
+
+/**
+ * vu_request_to_string: return string for vhost message request
+ * @req: VhostUserMsg request
+ *
+ * Returns a const string, do not free.
+ */
+const char *vu_request_to_string(unsigned int req);
+
 /**
  * vu_dispatch:
  * @dev: a VuDev context
diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 47d2efc60f..c218f911e7 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -99,7 +99,7 @@ static inline bool vu_has_protocol_feature(VuDev *dev, unsigned int fbit)
     return has_feature(dev->protocol_features, fbit);
 }
 
-static const char *
+const char *
 vu_request_to_string(unsigned int req)
 {
 #define REQ(req) [req] = #req
-- 
2.30.2


