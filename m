Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2416C46EA90
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:04:39 +0100 (CET)
Received: from localhost ([::1]:60030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvKyL-0005v8-NZ
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:04:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvKqi-0002b7-Hv
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:56:45 -0500
Received: from [2a00:1450:4864:20::334] (port=54105
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvKqe-0001ZB-Sz
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:56:43 -0500
Received: by mail-wm1-x334.google.com with SMTP id y196so4409696wmc.3
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 06:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=irUYZBqjdMbkZI8UB9bGVH0245A61P32W1SaY6iDPao=;
 b=OT8H9g6qLo1xH0CT23Zqeqzkg4OdPgERVYsXmy2grMQvXchNg9QaP13l6ozMaa4l7X
 1ybsRtPDMKulQmSh7tF7d2vhQGc9DOO3UQWQwEDNjLAfnjLxEqfAA2+KClMvSANMY8Pd
 icyhRzgJRX4yWuQi+Qvna4dVfi8mk6B2Pu3IxUf4yOLnYwUDs+rLXHSBc7bYk62OpBf3
 S+WCWCa1n0BWf/UfUES/fqtbL/oWFTLNF7ASaNlkhcj3cX8UJlXtihB4u1iJE2EZuONw
 w6Uv1RYzb1mhdBN8rpuYmSa54tpeeSt7reVsyZP6eA7ITIIv6diaUyF2PPDsvWVGCmaf
 zksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=irUYZBqjdMbkZI8UB9bGVH0245A61P32W1SaY6iDPao=;
 b=vlWVMQxnrpp0ilBX/XGbAclw+OqAxnz1Qtc7oeQC4Em0J/BZRtDh0xfs2TWfWIxOWz
 u8Y1pBg9yfdR8WWxidJwDnhxxrpJTsGEfIUETR39POu8y93/JjRoz64NuqhItc7JJb/j
 3Xh2THQFTGAB7C3AkmWWveigXnkxtmW746HB2V//9sL89DnVwG3yQUIzqeLSAwzIce7i
 XsJB26oKzXz6lNBzgAGtHrQ7lI6pQ0eYGSGOL8ImTCBopC7ghfI8wfkQThh3XS07fRUg
 1DRx35vy3o+BkRMwwX1gLYi/9b/vYTJVaPM76Hgh0fYGpGwKkTI3A28hTE7gyHCyL3Ky
 uXRA==
X-Gm-Message-State: AOAM532MyEwG2a7FH9KelKrLOthIeTvH0K43Rq2ckiZCQk/kysZ4p3Yh
 w7kZUScLtB3722AuocHdkUdn2w==
X-Google-Smtp-Source: ABdhPJx+f4CxBb0xfvyYUvCrEy9ZV6UDC9zV28L3Alcy8BV5gvLXvdK8rb2haf6JNdt+RcX4ZxXnhw==
X-Received: by 2002:a05:600c:1ca4:: with SMTP id
 k36mr7839448wms.169.1639061799549; 
 Thu, 09 Dec 2021 06:56:39 -0800 (PST)
Received: from xps15-9570.lan (host-92-16-105-103.as13285.net. [92.16.105.103])
 by smtp.gmail.com with ESMTPSA id y142sm30845wmc.40.2021.12.09.06.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 06:56:39 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: marcandre.lureau@redhat.com,
	mst@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH 4/8] vhost-user-video: add meson subdir build logic
Date: Thu,  9 Dec 2021 14:55:57 +0000
Message-Id: <20211209145601.331477-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209145601.331477-1-peter.griffin@linaro.org>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.griffin@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Griffin <peter.griffin@linaro.org>, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 tools/meson.build | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/meson.build b/tools/meson.build
index 3e5a0abfa2..3314b5efc5 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -24,3 +24,12 @@ endif
 if have_virtiofsd
   subdir('virtiofsd')
 endif
+
+have_virtiovideo = (have_system and
+    have_tools and
+    'CONFIG_LINUX' in config_host)
+
+if have_virtiovideo
+  subdir('vhost-user-video')
+endif
+
-- 
2.25.1


