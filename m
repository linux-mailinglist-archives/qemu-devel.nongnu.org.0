Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78307652339
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:56:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7e2r-0006Z0-SK; Tue, 20 Dec 2022 09:56:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7e2j-0006V4-Em
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:56:34 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7e2g-0004gJ-Lm
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:56:33 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so9007041wms.2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wf8HRl18z/U6tnequU9rYY0MM08TMRaEui/fBdzQhTY=;
 b=q3Tb9oDQ/VstDiK4qqgVnS8EHXg5V0nS7lEmJbuyXDZHMqzGG+3YXhntwH1cmDTU0M
 WoMaF80dx2MTdYZX9IjtefvTikRQw2sS9fbFI8K+2E5i9MPfnaUwgsyAjEgr0A6unJep
 hZK4oyvBeotEMclQBGW34r4vhADyx6/xdyy2D1+35+tW+8HhiBEsKHnffQIhYVwbQSE2
 TMwCKK74U02PZlxE017uoz9vGrAmWiEuUcJuOCIUjdYJUpnQzvtX009Cq1AsImARY61A
 vXxfjpRjqVztiFvIobZ1VlKwh/3rlSM8nsLy3WzuhJUbA4en3W6WPm7qOeaB9nGOsL6g
 ovgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wf8HRl18z/U6tnequU9rYY0MM08TMRaEui/fBdzQhTY=;
 b=FY8uQokQhTfz4wRisTgfD4Yq4hW9BjfZ5HFaXLo1H/cB0uvnQTbhEsht2gS6+OHTT+
 Z3dhF7U00aLPJnnL3ZmgKkTwfutMU5js4SdwpfCw/UBP08xuuBJimAMpQNcygvZT5oZT
 CPaVaHSNVZL6FweVbBbCAEyvrGKeWnRRNfHmPFa1seRt0ma+W6TjKaaaGHviwm4pySRQ
 3y4TAkJ1D9oSfIvtJCYYVEAFhVC8d0XO9ZhejFBynjSrUiSNnrXZuSVjwIp/ljTJna9N
 sz6/9kZltJWPKy9Ud1HXuThTlME0f1R3PDYicaQifyeLaUn5Xm4UwCSx2WwUgNeuBylN
 Dc7Q==
X-Gm-Message-State: ANoB5pm2TZRKGuzgHTCRh3/4/BCCWn/FNXwZ/Uu63RwC74OhJJNIS9x+
 qWnDdGNreVZ5wxTi6M0yUTEhAP1fsa4ZC9fy/+k=
X-Google-Smtp-Source: AA0mqf7mU88oAAKG/0jWs4rtvt1ilZItosP6RN+a3SPuCKo2U+aVW63UcOuLd2c/oFOy4WoN70TPag==
X-Received: by 2002:a7b:c84f:0:b0:3d2:389a:50aa with SMTP id
 c15-20020a7bc84f000000b003d2389a50aamr18723491wml.36.1671548188870; 
 Tue, 20 Dec 2022 06:56:28 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c3b0400b003c6b7f5567csm3683369wms.0.2022.12.20.06.56.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:56:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-s390x@nongnu.org,
 Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/5] cpus: Remove system reset() API from user emulation
Date: Tue, 20 Dec 2022 15:56:20 +0100
Message-Id: <20221220145625.26392-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

In user emulation, threads -- implemented as CPU -- are
created/destroyed, but never reset. There is no point in
allowing the user emulation access the sysemu/reset API.

Philippe Mathieu-Daudé (5):
  target/i386: Restrict qapi/qapi-events-run-state.h to system emulation
  target/i386: Restrict sysemu/reset.h to system emulation
  target/loongarch: Restrict sysemu/reset.h to system emulation
  target/s390x: Restrict sysemu/reset.h to system emulation
  hw/core: Only build CPU reset handlers with system emulation

 hw/core/meson.build    | 2 +-
 target/i386/cpu.c      | 2 +-
 target/i386/helper.c   | 2 +-
 target/loongarch/cpu.c | 2 ++
 target/s390x/cpu.c     | 4 +++-
 5 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.38.1


