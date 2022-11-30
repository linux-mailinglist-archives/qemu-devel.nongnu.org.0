Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1E863D73D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 14:53:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0NWB-00049Q-Cm; Wed, 30 Nov 2022 08:52:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0NW3-00046a-9C
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:52:47 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0NW1-0003a1-K4
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:52:46 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 i81-20020a1c3b54000000b003d070274a61so1013239wma.3
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 05:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wYz7PvwrITPFEUByoyWvlbsU7ZkJvudvZsqZCUSNhyc=;
 b=lA9UhhBs/ciOR0d1w79gPU1cYLDzln5whhdc/HQ4jNMwZvDzrnOfJaVFURzl19Vrtp
 5uX4lEz1Lcd1O9BmLQ60sGwpdVHWHef9ArBS2Qtqr5hR/zOlzQQBc7DEBXir6R2H+tBI
 qmpUy6mxhvbLr5w1GQR1D4BlMteZIJ67aSooVWYCLPQAB+Z4ecdTQTdXjz1ruhDo++6o
 9UZs+UjL7woPjBe/3wOESnpTrdG4aodmtGGHbIUzRMIwB2W5RQlCuK+8k9IjaZa+1aAz
 jIPoaBsXrcDyE/xIx8C5gYMSDQSkfSCJXqaNJ4T16mO5p9ONosFcVLrw2CYMQSLtHVrD
 I53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wYz7PvwrITPFEUByoyWvlbsU7ZkJvudvZsqZCUSNhyc=;
 b=e2UJtnCoyn9y+XGJljfFD1mza/r7bF6nBBl1RDwoDx86Vek1ZJcgjB4FoqAu7fzXO2
 /EA6W2zYG9B/JfnswNCk4GN1d933lKDOl64DcP1BHHnj640BkX4WR8GWl9qabjArFO/6
 AFgMAqKTJPc8TQRCA+0stKOj59qUJsn31kAbDqOxEaF+a/Dd/L0T4IIdmHXo5njGODMF
 3+SIccwkVja2AEHD3oXhY23VUX88gVoKFC5hNO8CpjDIXfEWowYtpwewKpXy3ubmtb3y
 g8lrkNSmCQXTjxqmlk7ieDC3twCpizcZrmS77zAK8d7+uFBXP0kx5Ss4QRXJaRV76zbf
 GmgQ==
X-Gm-Message-State: ANoB5pkBmNeoJGW+ZrnZX1uRBf3d6WPXkjPEqwWqu23OLS7Nw+zncU8g
 f5X0tbkc9Hrp68cDPRP93zdAbgliARmLd0E4
X-Google-Smtp-Source: AA0mqf5ckTXG/KObWTNxgqTwxVrO/6XZml2ud1+F1LXv0yPMnc1FvJi1YmEDoyzrulY///tPwZmLKA==
X-Received: by 2002:a05:600c:220d:b0:3cf:633f:c570 with SMTP id
 z13-20020a05600c220d00b003cf633fc570mr36402395wml.110.1669816363804; 
 Wed, 30 Nov 2022 05:52:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y16-20020adfd090000000b002364c77bcacsm1634094wrh.38.2022.11.30.05.52.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Nov 2022 05:52:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH-for-8.0 0/5] cpu: Move target-independent code to common code
Date: Wed, 30 Nov 2022 14:52:36 +0100
Message-Id: <20221130135241.85060-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Trivial housekeeping in cpu*.c.

Philippe Mathieu-Daudé (5):
  cpu: Remove capstone meson dependency
  cpu: Move cpu_class_init_props() to common code
  cpu: Move breakpoint helpers to common code
  cpu: Move cpu_abort() to common code
  cpu: Remove unused includes

 cpu.c         | 165 --------------------------------------------------
 cpus-common.c | 163 +++++++++++++++++++++++++++++++++++++++++++++++++
 meson.build   |   3 +-
 3 files changed, 165 insertions(+), 166 deletions(-)

-- 
2.38.1


