Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8997241FEF9
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 02:49:17 +0200 (CEST)
Received: from localhost ([::1]:47540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWpgq-000290-4I
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 20:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWpfY-00011U-TH
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 20:47:56 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:42975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWpfW-00068e-Gc
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 20:47:56 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 s198-20020a1ca9cf000000b0030d6986ea9fso194612wme.1
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 17:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PYwTkdwi9uruSw6WWjeNt+cV+scw9CC/fFSZHMdhO0c=;
 b=donwaHu8tccjKf09y6KS+1TQUfM/Xt9gPlnYboIGe445uoNHA4MUoSaT3yGuPthVub
 ZxZdyiKmqJzpRiDNsQIBIDnxBf9JG+Wic/lz/GA4ISMRovYvfofqol1iY+kfMKF/lHWf
 IMjI9MZo0tO2w1hidstPSgLSL63nKoyp/c+aLm1HDzNwPWL/1duJ6DfWhNy46wYH0sYA
 FXCzEmdYdHUuMg4hXbrld0hY8Hwsr4QzToVJStnXLx7SaJJ5PCA/4B8IUW9xp+6lOxaA
 jfGurN7YuuY5sehrvwjx7cnGSOxF9xvQ5adJRJRJZqR2qUk4rmrl20NrGXrPU6egHlEe
 lR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PYwTkdwi9uruSw6WWjeNt+cV+scw9CC/fFSZHMdhO0c=;
 b=AWFQ95ISgm1wFen6u2w24uR79CJLQvatP3vLOUHsOqGSXhVZAJtMEf7akYLa/MngEk
 QhzZfIRMm7ed0jqAzD5tOd3423s/k4fe0RZu9HHyjKVhIYCwqrWznR2oyo9W6VWuK0EP
 yjI2IC4OJXXrayiSPuc/b8jdEdi201H8zgI0faPrFcDMwRCSvfNW1CBfNbuZ1eba+Nb7
 4fEwi2G6brMhFKPsggYQJPpLiOcy7NX74B0Sy5Ur8ckPUO5jxT0a9P8FwYaHlB8nWcLV
 Kd9vxQbTWAwuPXYGWaCGp/Pdb1H1/vijjdHN6dwtjTkrDQ9gXaoWvpLaKwXs2vmzYi5F
 zneQ==
X-Gm-Message-State: AOAM532IKFtSaZ+6U6Pw5fFvXl2dAjwg2XEq6xjT60HAUdPSWSy9I4oT
 vyMuE2EEBRsrtKF+75uHC+Uxwq/y+z8=
X-Google-Smtp-Source: ABdhPJy7xw8HuYFq17cDL9GoohhMvB5vtSm/zwLEJhWzs047nUm+WibC8uXCuWbYVWx4dZZCrsWp7A==
X-Received: by 2002:a1c:22d7:: with SMTP id i206mr1832634wmi.122.1633222072254; 
 Sat, 02 Oct 2021 17:47:52 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 t16sm13191070wmi.33.2021.10.02.17.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 17:47:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/hexagon: Use tcg_constant_*
Date: Sun,  3 Oct 2021 02:47:48 +0200
Message-Id: <20211003004750.3608983-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace temporary TCG registers by tcg_constant_*() when possible.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  target/hexagon: Remove unused TCG temporary from predicated loads=0D
  target/hexagon: Use tcg_constant_*=0D
=0D
 target/hexagon/gen_tcg.h        |  6 ++---=0D
 target/hexagon/macros.h         |  5 +----=0D
 target/hexagon/genptr.c         | 39 +++++++++++----------------------=0D
 target/hexagon/translate.c      | 26 +++++++---------------=0D
 target/hexagon/gen_tcg_funcs.py |  4 +---=0D
 5 files changed, 25 insertions(+), 55 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

