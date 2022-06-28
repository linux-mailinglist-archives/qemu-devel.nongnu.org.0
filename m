Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396B055C0C7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:47:19 +0200 (CEST)
Received: from localhost ([::1]:51818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69gc-0002Dv-4M
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69ch-000802-9X
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:43:15 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:46748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69cf-0007jL-Qv
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:43:14 -0400
Received: by mail-pg1-x52e.google.com with SMTP id x8so7338766pgj.13
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OVz8AzN99Ih793EPSTlR4hgKZhNAt2YLFaU0v4k1+fI=;
 b=e34vB1Xh+O7t0YEcewwl9HMDMTAwjhaWZiSQehFgx29H935gS7Vaeg1y6QAObxwpKj
 phG1lXb/1I5nbhs3pZmGHn92Pl7I53yvqbmp2tr/v2XUCZ5myQQAqTAJ6Oo2rU2bPUgI
 j57luHAxThcrqJIxam46ntjrSJIZCF0+f/yQmrV1WNsgFivf6iNZC7ocPEHoy0E/OX4Y
 /WGei3pksfMg8bDZLCe+2VZxQLdvtm9bqbTJOmdMopXAvwM5tXfiRbrYxRy+RWe/92GO
 UUiSID1l05QVf7SXGLm4OAMYYjK7twN5VZRI4yosRzLA3+r7ON+0XJiizi1q0nOLC2R2
 5rTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OVz8AzN99Ih793EPSTlR4hgKZhNAt2YLFaU0v4k1+fI=;
 b=zhtkq7Yt75UmzXeEsXKmArb4/EjWNueMSV9uMN/t9Wb2eMjAfnbLKD7T8dlIuz4Rl4
 bE2NQ+1gobB7E3zudbqA+imk4w423xAP/5Kcisc6+dbi0N/0mS0nMJKOeO7v0MWEGqYa
 m966JBoox+jvI1Lv47Qb5UC23s0Wm5+vBIWgWd/jFSs9Wio3bjGH/fA/36whp/Lbr+8D
 88NRjamh4YdFFaEjuH83KXIuh94svyigd8bg2EO8A1Sk9Bzdoj17APtI2pZfvHzny/EO
 FbzVw42bjr/zuZdIrBqUQRdJ/0p5R37rtRyiq8OLvB7sBJXAm+46JQek1X9Gk9zpg4Du
 wNTQ==
X-Gm-Message-State: AJIora/Bt9UkiRJHaZLpK98vAOcKmbdLLaZrTEeIjEyIaTofY0wrczGs
 OJUJy3+bLssgcpjzEHu5mHJ1I+cp7kxxYg==
X-Google-Smtp-Source: AGRyM1twUTscC/0lCN/ATACk1H2gPW4OTavzHzVyQ7mRwKcB0lcNHbF57+8UoG8vhDQoiz584WD41g==
X-Received: by 2002:a63:f14a:0:b0:3fd:d2aa:6b30 with SMTP id
 o10-20020a63f14a000000b003fdd2aa6b30mr16821252pgk.348.1656416592389; 
 Tue, 28 Jun 2022 04:43:12 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 bf3-20020a170902b90300b0015f2b3bc97asm9106026plb.13.2022.06.28.04.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:43:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: jcmvbkbc@gmail.com
Subject: [PATCH v5 0/2] target/xtensa: semihosting cleanup
Date: Tue, 28 Jun 2022 17:13:05 +0530
Message-Id: <20220628114307.697943-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v5:
  * Rebase on master.

r~


Richard Henderson (2):
  target/xtensa: Use an exception for semihosting
  target/xtensa: Use semihosting/syscalls.h

 target/xtensa/cpu.h         |   3 +-
 target/xtensa/helper.h      |   3 -
 hw/xtensa/sim.c             |   3 -
 target/xtensa/exc_helper.c  |   4 +
 target/xtensa/translate.c   |   3 +-
 target/xtensa/xtensa-semi.c | 229 ++++++++----------------------------
 6 files changed, 59 insertions(+), 186 deletions(-)

-- 
2.34.1


