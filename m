Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE3F619EE4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 18:37:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or0cT-0008TB-Pj; Fri, 04 Nov 2022 13:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0cS-0008S7-8n
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:36:40 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0cP-0003tq-Gu
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:36:39 -0400
Received: by mail-wr1-x431.google.com with SMTP id z14so8031429wrn.7
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 10:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P2GZxyIKjubapSnF/Xd46wVN4+0ui8At0WITPipJywc=;
 b=lglADO6BRka8vXAuj+/Op3Ed2zFfGXjho/ubMdFlulAYoEEkkygYKeakR1B5AIERJ8
 aQ1cBEFKt2GL9dhvUA53pJ6/qROSuiWUCzoIkrWZ44qr7ytq4RCgESx9YsES3MsAeY8Z
 bivdakcrlOo4bXWLvqsp9c42eMLK8ZTFUdXGtjXuQMrBXs/v3FvkehRv+CY9lheI2oNs
 gR1JYU8P/1fiyvZZW7rvKM9rRmOGy47BSJwFZ394fpuhRMTVOpgTgM1uZq9bFIaDdJE5
 1ysXS537TUnhmBb1lFS3OApPIsTG6aLfr4cbgyDsRVWl2OVlUFVjq9Ivy/Jr+mH9+ZjT
 p4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P2GZxyIKjubapSnF/Xd46wVN4+0ui8At0WITPipJywc=;
 b=vIgnbgvrtBgHrm9H5yNDxxPuDjTgyyUHB0GfLGqBY+8VxleN0Ajy0geR3MS7tvxB8m
 GVZPTIztWoccnFEdma5zcVJ94kXRpGk+cEvmmuqRuqOX9XFhMCXO9xKJvIvjYnafHcTu
 VZBSFwBGx40A4gqI0e3MzJvSod+jQbpC2N0H1dl3wicnLnrJTyq6HugZC+MHN43Om/Z0
 ntqnBs843ggHw7qlgEICYmcX7vPbqs/4ouYrFWoI3svBmGK1l5OAVLM6uzullI+J/CUD
 55+jiJC8CNCIyrgB0N0qgpw1F+eXUrNh38vA3GzJzqpQCGq9R13QRcY54fT3yst8wc+I
 M4Wg==
X-Gm-Message-State: ACrzQf1lXpFWrJt43uTsxQd4S4oU/lvpqBzIEzNuvM4yXUxnEL+belb5
 H3vXc4TAKyuVoYFdk+DJtEGNt5g/DpDAlg==
X-Google-Smtp-Source: AMsMyM6NtzVoekJ3a49iVQPFR+VQQEEmNUOnOXNqJ/utopp+02xr78lsfvBjqqe5DCg2axMPNo2pbQ==
X-Received: by 2002:a05:6000:2c1:b0:236:d474:f053 with SMTP id
 o1-20020a05600002c100b00236d474f053mr16934687wry.517.1667583394823; 
 Fri, 04 Nov 2022 10:36:34 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a05600c4f4300b003b47b80cec3sm3699971wmq.42.2022.11.04.10.36.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Nov 2022 10:36:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Drew DeVault <sir@cmpwn.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 0/5] linux-user: implement execveat
Date: Fri,  4 Nov 2022 18:36:27 +0100
Message-Id: <20221104173632.1052-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As I was reviewing this patch from Drew:
https://lore.kernel.org/qemu-devel/20221104081015.706009-1-sir@cmpwn.com/
and it was too big for my review standards, I split it into smaller
steps. Since the result can help the other reviewers, post it.

Since v4:
- Constify struct flags
- Split Drew's patch in 4

Drew DeVault (4):
  linux-user/strace: Extract print_execve_argv() from print_execve()
  linux-user/strace: Add output for execveat() syscall
  linux-user/syscall: Extract do_execve() from do_syscall1()
  linux-user/syscall: Implement execveat()

Philippe Mathieu-Daudé (1):
  linux-user/strace: Constify struct flags

 linux-user/strace.c    | 134 +++++++++++++++----------
 linux-user/strace.list |   2 +-
 linux-user/syscall.c   | 216 ++++++++++++++++++++++-------------------
 3 files changed, 201 insertions(+), 151 deletions(-)

-- 
2.38.1


