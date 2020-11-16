Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A10EA2B43AE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:27:20 +0100 (CET)
Received: from localhost ([::1]:57330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedbL-0003z2-M0
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:27:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYY-0001UV-Lg
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:26 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYW-00037t-AF
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:26 -0500
Received: by mail-wr1-x42c.google.com with SMTP id p1so18439349wrf.12
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zd36bEnryeQaHWHJSjvHzqGrH8fim6jYM/QnIrK9Ve4=;
 b=lxXzheFIEfvO5COIsQ4JTCW6OMHJlZ0ihB8+YzY4xHU6fRQXDMk4EwX1tmiwwZG0RK
 qGTCdjUyGDUPu3ou1QPtsFo6MmA3j2VETNW1TX4xI7gPsUfXymIubQc64y+ixtwD59Ei
 IG4M9VX+3QIbu+vAGlr7KuhEcfYV54qOXuD634yxC9n/HdvQhLPSFDByVgYIneqG3j0X
 GZ7pq8tr4U7UZue4SKht+LrM3zSvX5xHSopqoOr+B1j9UXdcxyCV+7u+SJlSM/2vL1mH
 kLYUd7msDlVlLNmm7XNbV095l7pm68ZQQMWMPFIRZ16+GJJ8+GRhsjMRyxal+Vv+WfXv
 BqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zd36bEnryeQaHWHJSjvHzqGrH8fim6jYM/QnIrK9Ve4=;
 b=ugc1pjV4HPdcpFe0i/ignADL75TWBDgbdNeymFV0ghcIc4pK6XToFFxczR5SXvd4la
 BFptrkEmpAvz50KQMBmmM1TwH/7yESjGoxpVugpbn/GBgjxbMhzWUsCd/KkEIqOJAJGj
 KZF14BBdoLY7aiwUVMWkg+4bK3JhE585lmBjnYdT2WXqTwymsvRBn2C5iWWD03fM4AKo
 r7Wx0/QndDjj0cAm30vcob/c8RhzMxR7DJ8fuwaoeJp03y91NS+e9g5Zb0hwpzdgyQHV
 8guk2b0u54hvlnSaMLoCdFcV13JAmq2GEdyOKJU/1XHYKpo0vjDeza5W2DC0j82rMnKb
 MRrQ==
X-Gm-Message-State: AOAM531eMZIVJKtlSO2ZzAG5TtihXLwrzJUZ6veL2jBeEfkCTi8RKAHe
 On3HZ2ruDss/seXbVvZEGUyH0A==
X-Google-Smtp-Source: ABdhPJz4ZglpDKLLsYXA8f9PIdny4WK+1yZd2OG+M8QRXE9zLQhokRx1lpT76IoQPCNWkfC+0wXccA==
X-Received: by 2002:adf:f852:: with SMTP id d18mr18270630wrq.232.1605529462406; 
 Mon, 16 Nov 2020 04:24:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q17sm26118448wro.36.2020.11.16.04.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 04:24:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 013761FF8C;
 Mon, 16 Nov 2020 12:24:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 2/9] plugins: Fix two resource leaks in setup_socket()
Date: Mon, 16 Nov 2020 12:24:10 +0000
Message-Id: <20201116122417.28346-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116122417.28346-1-alex.bennee@linaro.org>
References: <20201116122417.28346-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Alex Chen <alex.chen@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Chen <alex.chen@huawei.com>

Either accept() fails or exits normally, we need to close the fd.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201109082829.87496-3-alex.chen@huawei.com>
Message-Id: <20201110192316.26397-3-alex.bennee@linaro.org>

diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index 319bd44b83..5aad50869d 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -268,11 +268,13 @@ static bool setup_socket(const char *path)
     socket_fd = accept(fd, NULL, NULL);
     if (socket_fd < 0 && errno != EINTR) {
         perror("accept socket");
+        close(fd);
         return false;
     }
 
     qemu_plugin_outs("setup_socket::ready\n");
 
+    close(fd);
     return true;
 }
 
-- 
2.20.1


