Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED562B43AC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:26:56 +0100 (CET)
Received: from localhost ([::1]:55224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedax-00039I-6b
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:26:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYX-0001Th-Tp
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:25 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYW-00037o-8n
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:25 -0500
Received: by mail-wm1-x335.google.com with SMTP id h2so23567988wmm.0
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vHv4EHcIqVjX/nk8AgqAMkp9FkP1WHOt6fzSvyu1HXc=;
 b=cQEEMK3h469kTNKn+cv+AOMt5eP0GBBv7ROtsjqyUby9+ebseIjkMAOT19cBFMgLQ/
 p0rlk2EKbmjb61rpxVbl5Gweq8u3/m6Tzp/Ys1BPn24iiNR3ys23qPjqmHM8yGKGbWhx
 ac1GyJ+u5sHU4gHrjVSpS/1AgY8seaCgV5pjWv5txsRdRJ7esfwTzV2adHj2AJ7oAKdm
 d9w9gC2Z60TnfaDYaWUxt1yhCptvlW2c2+SFcFb+FwFjoJEo4LSteqcvemYXl7wZCPxL
 PoSlTr19wo6hMJTaMLsKKBCeApzqU8lNs2Z8jkZtsjZnbG1WaB37+6LfMbXlpu54h8LY
 K3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vHv4EHcIqVjX/nk8AgqAMkp9FkP1WHOt6fzSvyu1HXc=;
 b=N7BDPitqUqJtPSLOPCI5ExBpSKQntojKAjvOs64RSBUS6XpJJgdYxC1Vjx+BnmbFyg
 COfU+zcp+PnWsp0dG0ZYJxq7HbQL9+jQS65uQGjzntea1itHIzlK1+p1pygKI4to7bPo
 xWMlfOlpNUFRYdCdWkEZINuq2QbOKP4DCE6rNhWXbdjpDmB9lcgHIUPd5E0l9jvxy4qM
 wMPHOsThkk8FDyE8+jwFgGNcziHyRTIAv/8j33PwcqGSROm/raPdIOQ7EqGbTDfuxuZZ
 Au0CBnb7KVO5tvk8rGYCi0I5ZMmPurZAOCqLiNsoyh20dOXvSnUoNHUphbByMObors23
 ArRQ==
X-Gm-Message-State: AOAM530z3VEpreI36jxAT9lsp0STQbQPYRHQVnIxehmRFyfA44TXe+ny
 5xwIJJyETucj0P3+5mqzv1Ommw==
X-Google-Smtp-Source: ABdhPJxbwWRk6RY9E2tws1WsjJHbJOzUnonsWnD0joOlbeNDW+0cMMCNrND/mDURqN/rSkdcS+FtsA==
X-Received: by 2002:a7b:c202:: with SMTP id x2mr14950568wmi.48.1605529460860; 
 Mon, 16 Nov 2020 04:24:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t74sm20045679wmt.8.2020.11.16.04.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 04:24:18 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DF03F1FF87;
 Mon, 16 Nov 2020 12:24:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 1/9] plugins: Fix resource leak in connect_socket()
Date: Mon, 16 Nov 2020 12:24:09 +0000
Message-Id: <20201116122417.28346-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116122417.28346-1-alex.bennee@linaro.org>
References: <20201116122417.28346-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

Close the fd when the connect() fails.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201109082829.87496-2-alex.chen@huawei.com>
Message-Id: <20201110192316.26397-2-alex.bennee@linaro.org>

diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index a696673dff..319bd44b83 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -292,6 +292,7 @@ static bool connect_socket(const char *path)
 
     if (connect(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr)) < 0) {
         perror("failed to connect");
+        close(fd);
         return false;
     }
 
-- 
2.20.1


