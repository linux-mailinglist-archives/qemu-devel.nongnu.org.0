Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3E93697D4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:00:42 +0200 (CEST)
Received: from localhost ([::1]:50508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZzAX-0005Cy-SJ
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZz4c-0008PX-Hc
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:54:34 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZz4S-0008Aw-RQ
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:54:34 -0400
Received: by mail-pl1-x633.google.com with SMTP id 20so21556079pll.7
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 09:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f5SUJTiXAOaMhxvZ35kxyh7Ou8LKONAwDzWpzhG6HME=;
 b=ZuYTiSdiXrY3Vt/sSs0KbD2lwok7bT0+swTdFjwSmw1aVsWZ4gJCLRlpjhhkZNt5FQ
 3fEGaHO20YBYjlUBiFJ/oBIVylzfiy9Vn4AIO8Hj7J1y/LjB93KX8eadnD1Ql57ezRWR
 uG0zvK5GHL5iqNv+0uUt1XmlCtKDXeM47AV5jxgRQp7audO8vmHeN+GYsHKvxC/DPbCP
 a+Sg7OKQBa0rJaPGlI3Vb2b0uXGF3UVl6JbfhypsfXLBJ/wMH5+FaZ7KHqU79wdcJ3Ny
 dDMxUhpvdys/4UdvQCPXPYEY6x1Zv6juje1r2DzmQ/JaYnC907uaHPAKZGDapIuubCTa
 bi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f5SUJTiXAOaMhxvZ35kxyh7Ou8LKONAwDzWpzhG6HME=;
 b=ix8b+XHcwFT9s/yibfIoDfk2UCmpTcYgqwefLXJQjeJRStg/8sHje63ALqDaENZ2Dd
 vuwmttfBDQeEyJ93K5UVxJ7Wvx6XExzbOyW4S9o+moH5sMA7lWG0Su7fLWWTvJhkSlFF
 prrA5a3PeSk+E6TgN/E5A89uciw258TGsGaoEx9gpZ1ZvCUf/IBD6+6HCqiaco/MwJmk
 ODwGr7RSac1xSBlqCvUB5CC7FmDvb2Ww+KScJcpSS4zbaiv2JGHJbWtVJOrj9hj3rLnY
 OztL34m43aLoZNXedSToCDcv/saUhhUYhdw/7523fbDS86HVmzLF0GPHH6LGgdwVwjTW
 N7Fg==
X-Gm-Message-State: AOAM5336l5e0riDZ5+x3t5SXg+vDsiYc6nU/Ln3bzby+6OHGDo11/kuN
 HP0S+kdWAvJf0Wq7hlBzLEApdk1jF+Db1Q==
X-Google-Smtp-Source: ABdhPJwWcbb2X8CeWAdH6LY7U8PhAgqTHxfoR0D+KRfhyh7inO7gE/5vN0CUjyu40uxowigTCvnutA==
X-Received: by 2002:a17:903:244:b029:ec:9666:9fc6 with SMTP id
 j4-20020a1709030244b02900ec96669fc6mr4625225plh.63.1619196855076; 
 Fri, 23 Apr 2021 09:54:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q5sm4918151pfu.5.2021.04.23.09.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:54:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] linux-user/arm: fpa11 fix and cleanup
Date: Fri, 23 Apr 2021 09:54:09 -0700
Message-Id: <20210423165413.338259-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The bug fix is patch 2, the rest is a bit of tidy-up.


r~

Richard Henderson (4):
  linux-user/arm: Split out emulate_arm_fpa11
  linux-user/arm: Do not emulate fpa11 in thumb mode
  linux-user/arm: Do not fill in si_code for fpa11 exceptions
  linux-user/arm: Simplify accumulating and raising fpa11 exceptions

 linux-user/arm/cpu_loop.c | 125 ++++++++++++++++++++------------------
 1 file changed, 66 insertions(+), 59 deletions(-)

-- 
2.25.1


