Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17064317325
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:18:07 +0100 (CET)
Received: from localhost ([::1]:60938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xoE-0002wD-3H
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:18:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhc-0006E2-LX
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:17 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xha-0003J0-Ms
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:16 -0500
Received: by mail-wm1-x32f.google.com with SMTP id j11so3188553wmi.3
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UHNi1hWLbrIySFeJtKPpCbGfvhbQp8V4grjS5oASwHk=;
 b=deFZY/34/EwGU8nSwmvwxsSDeSKC6R+Yq60AoViWbNYHV/a2k6O7vicy1+NkW51Rr3
 JntNnIbJDqAK5JeB+E/nxNQ1Ph7LULEyL7IFWEAx/te6sU9UY2VHJ712+306tZMjLGpu
 RRsOILPdnGmtFkX434qmgCw+65qaXxB8ETDRWIoev+ydIQodboShIfOIaQfDbTtYZkZH
 lEFmb2kJm0NSXZQ/IpakJcN1CfdzM12knkV5JEmfMq6sIKCgCBYqkqxso/bQYwXTa+jC
 qkTo9Gnl4HUtWMNuCJxbh7pFyDz6uAgfW5DyoeKWPb2kiwC7nsbGoIs1uoP6sX97xQJ7
 BynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UHNi1hWLbrIySFeJtKPpCbGfvhbQp8V4grjS5oASwHk=;
 b=q7jEezoTbsXIXtVLh30BOKw99V2sYGXbTrwaeg5WGD84cOushWcONQWARbcR0XX+w8
 G1PnGikuMdEScEIKjRihnkhd2NAJ0t5JJF1XOaXv1IXKwEkxkRtfuziNiZG5mwJPLlPf
 P2dibTWT9HSh/FprOlFNXX+1SKNC3sXvyddqGYQq4da6Xag+HI+hWpxEf6eYmPFNSwcp
 BqcvSJM5kvxEnHG4ClFSts6nQG83WgOGsWacrvTkWtQv5autVFOe3VLgKQuIKC4lWlMC
 dbepp4DxvMuM/ecHUz/d/9AwGAWQWEEZ/b2uxzPzn7tNa9ABMlM0upkg0DKBA4wM1q5c
 EJmg==
X-Gm-Message-State: AOAM530R/80+RCXRpCsVXh6krd94Ep4Tv7cikGpAwLnCB5VHpwDdZHvO
 W7N+z+w8YcpPawBClHuA/VMRqA==
X-Google-Smtp-Source: ABdhPJzFffQgc6t5zMmfLYyEX4zQHTOafX2jOk2kpBokHESQpbut0b5fSczEkPp/0Azf0BHXdmfxRg==
X-Received: by 2002:a7b:c215:: with SMTP id x21mr1243016wmi.61.1612995073174; 
 Wed, 10 Feb 2021 14:11:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t126sm4989453wmf.3.2021.02.10.14.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:10:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F4161FF92;
 Wed, 10 Feb 2021 22:10:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 06/21] contrib: Add spaces around operator
Date: Wed, 10 Feb 2021 22:10:38 +0000
Message-Id: <20210210221053.18050-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210221053.18050-1-alex.bennee@linaro.org>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: zhouyang <zhouyang789@huawei.com>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhouyang <zhouyang789@huawei.com>

I am reading contrib related code and found some style problems while
check the code using checkpatch.pl. This commit fixs the issue below:
ERROR: spaces required around that '*'

Signed-off-by: zhouyang <zhouyang789@huawei.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210118031004.1662363-4-zhouyang789@huawei.com>
---
 contrib/ivshmem-server/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/ivshmem-server/main.c b/contrib/ivshmem-server/main.c
index ee08c4ced0..224dbeb547 100644
--- a/contrib/ivshmem-server/main.c
+++ b/contrib/ivshmem-server/main.c
@@ -17,7 +17,7 @@
 #define IVSHMEM_SERVER_DEFAULT_PID_FILE       "/var/run/ivshmem-server.pid"
 #define IVSHMEM_SERVER_DEFAULT_UNIX_SOCK_PATH "/tmp/ivshmem_socket"
 #define IVSHMEM_SERVER_DEFAULT_SHM_PATH       "ivshmem"
-#define IVSHMEM_SERVER_DEFAULT_SHM_SIZE       (4*1024*1024)
+#define IVSHMEM_SERVER_DEFAULT_SHM_SIZE       (4 * 1024 * 1024)
 #define IVSHMEM_SERVER_DEFAULT_N_VECTORS      1
 
 /* used to quit on signal SIGTERM */
-- 
2.20.1


