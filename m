Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E0960D842
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 01:57:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onTgW-0005Qe-0K; Tue, 25 Oct 2022 19:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onTgT-00059t-E8
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 19:50:13 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onTgQ-0002y1-DG
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 19:50:13 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so359116wmq.4
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 16:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1v4OfOhcWozZ/CgeCzudetGzG1PeA7rd0snr6NhxT5c=;
 b=BLaJEAS93rQEHJoeSyFY4yt7y1XeQVSvrLbKgGgx3S2IUItsry1gGbC0s7jyhbtGnb
 EIHIAp0juE2A1bO3g4EhWBV5LvQNICwsPmVHOhX2D3RdB82iud0wtCzxY2NZ/uj+SWlD
 gerTUraiEmPsqcu3QO38XILbeXI0zea46DafHB2jb+XML2puTflHhYbLyjfycellVg8R
 ceRm0IHlJuOECR//86+ZdGyYJv7EEi2EGAmK/5mGoGAhy79CvPdJHyeUx5dmZ97zyeIb
 4bpd9kWMXkJdn8/CeyeO85CUxhkDNbiWU6MgAD/1Tzu0ioSX5LIBdzFB1Zv3iiZ9OxDg
 pVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1v4OfOhcWozZ/CgeCzudetGzG1PeA7rd0snr6NhxT5c=;
 b=sBz9cJgEN108H6MjCEJ92fVBICDpXQCa3GyEJaqDLaPHCpMEzmsguQhxhbApVYN+wQ
 OvIJUaNOycIZfIr0nX+fc6Eq5SCwLz/szaL+0k9Pq9vP1bpcViw/r/TlVEjymP4L1LoA
 ktUrKHZeCK5hWWnW0wfaH9blFV+vM1TmgDL4/9tDSKD3QzXBKSE2s/El19ngDI8kQ9Kg
 ZNwR1BNNrkd/Qp1iratbDoaazlCHajpDSgiJjUtUgm+01WqUuQ/+aM9kATF+CXLEKOux
 Lun+oXwdiwnn4mMxJCdjhF9aFlLUX4I6MOkLtE1KFpRuxlHEVFAcwjwDduCkInYyTz1b
 fo3A==
X-Gm-Message-State: ACrzQf1Q9ra404McyYHbY/w5SneaNhdYxlotbgabt6uqSm0+HGSAdTvR
 vduxqRKCTgl2rtRj29o8yATTmW/e6LHcfPK6
X-Google-Smtp-Source: AMsMyM5Be01EAZChao5dc6p6LQcRZbzYpCplWJ/MUFX93N5cYku8HJZBCoe1GCJtPAsGpJPBNItEdQ==
X-Received: by 2002:a05:600c:6003:b0:3c6:f6e8:25fc with SMTP id
 az3-20020a05600c600300b003c6f6e825fcmr442085wmb.50.1666741808576; 
 Tue, 25 Oct 2022 16:50:08 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b003a3442f1229sm299303wmq.29.2022.10.25.16.50.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Oct 2022 16:50:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/3] target: Rename headers using .def extension to .h.inc
Date: Wed, 26 Oct 2022 01:50:03 +0200
Message-Id: <20221025235006.7215-1-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We use the .h.inc extension to include C headers. To be consistent
with the rest of the codebase, rename the C headers using the .def
extension.

IDE/tools using our .editorconfig / .gitattributes will leverage
this consistency.

Philippe Mathieu-Daudé (3):
  target/m68k: Rename qregs.def -> qregs.h.inc
  target/s390x: Rename insn-data/format.def -> insn-data/format.h.inc
  target/tricore: Rename csfr.def -> csfr.h.inc

 target/m68k/{qregs.def => qregs.h.inc}                 |  0
 target/m68k/translate.c                                |  4 ++--
 target/s390x/tcg/{insn-data.def => insn-data.h.inc}    |  2 +-
 .../s390x/tcg/{insn-format.def => insn-format.h.inc}   |  0
 target/s390x/tcg/translate.c                           | 10 +++++-----
 target/tricore/{csfr.def => csfr.h.inc}                |  0
 target/tricore/translate.c                             |  4 ++--
 7 files changed, 10 insertions(+), 10 deletions(-)
 rename target/m68k/{qregs.def => qregs.h.inc} (100%)
 rename target/s390x/tcg/{insn-data.def => insn-data.h.inc} (99%)
 rename target/s390x/tcg/{insn-format.def => insn-format.h.inc} (100%)
 rename target/tricore/{csfr.def => csfr.h.inc} (100%)

-- 
2.37.3


