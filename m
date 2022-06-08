Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11DD5420C5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 04:40:31 +0200 (CEST)
Received: from localhost ([::1]:46186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nylcU-0001Jv-O5
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 22:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nylaP-0007hq-TN
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 22:38:22 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:35552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nylaO-0004h5-AS
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 22:38:21 -0400
Received: by mail-pl1-x632.google.com with SMTP id o6so11349417plg.2
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 19:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1oVdWYiBLmO8xZwc/O5plm1Bega8kXDl6EjKrZwYO7c=;
 b=NZFxW9ZH1L8RnTjZP4ZqUjDCaulNVpm1uTh2R8EZ/YlRd4PpYZOPzZjSuAg61r8hB+
 GV48f59349gz6F1ZK17XWgCsIZafzJe0OFs+njIBE3NZVoKL4k6lONHFG4SiWz6xepUY
 ALvhYWk95KLPDE1CBFltutKv+Ju8qSNf4hYlSvpoXpXIida1gL0ahXC2evCw2IcpvOUF
 a7RQfBCh5B2YreFbkn/Rw129xE+AtbdJsSwcNEvBI+WfS2JGW/lQgr9GU2vx/oggv84t
 h7umY35mP0ARCcs7ipfRPPMTbyTYl311AL+tOJxcOA4F42h+JBqjnGRvq63ByVmCaVXI
 xGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1oVdWYiBLmO8xZwc/O5plm1Bega8kXDl6EjKrZwYO7c=;
 b=7y7I0l/A+3KLw2JGOQMeOTPgNUucgXNYQ7kz9ZuAaDjdGMDXPTNv088H4YZIPGleIM
 O/O9rPDCZ+TdjFiHquNiK6b9wFIrqOGSbZWJ2CNVzMPSn87IR+zs4DcTkFLERm+2P3Lk
 h/eZ0AQxygcbvrY5Ip9u7F+GnsY5ltxEp9HeTlUUQjIg22USP8bcZdtSLOtRlNh9msAm
 W5AHYwlkl2FvN9T5ccK7gyBVaceO/8xpqtch/AeJVLKOgRCw2j0mRgUw0K5BDO1dBQgN
 MVYXNpkU8ZWTfI/oEV/ju6piTJBiCjDABL6bfL5rX41adT2D9kzeUYA9Badm9GxOiain
 OmEg==
X-Gm-Message-State: AOAM532tPo3x5p8JBI3oeyW8QTBUzVyx/2gAD8lp0ANF7cxKFOGcui/j
 ApWg4vGmUMUGEMs1+Z4HppLXTC1b+Ik9Uw==
X-Google-Smtp-Source: ABdhPJyeCHcXkMZ0AJ37wo5nXWoEFTyAUkWjdWd+qa0UFh/MvSYdxTykbPnXTIq3RQq1WpjO0K2kVw==
X-Received: by 2002:a17:902:e5ca:b0:167:4e08:a63a with SMTP id
 u10-20020a170902e5ca00b001674e08a63amr24115391plf.69.1654655897867; 
 Tue, 07 Jun 2022 19:38:17 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:c626:2f70:ac99:7c97])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a63d813000000b003f66a518e48sm13607398pgh.86.2022.06.07.19.38.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 19:38:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] target/nios2: semihosting cleanup
Date: Tue,  7 Jun 2022 19:38:13 -0700
Message-Id: <20220608023816.759426-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Based-on: <20220607204557.658541-1-richard.henderson@linaro.org>
("[PATCH v4 00/53] semihosting cleanup")

Changes for v4:
  * Split out of v2.
  * Convert host errno to gdb errno, which for nios2 is guest errno.


r~


Richard Henderson (3):
  target/nios2: Eliminate nios2_semi_is_lseek
  target/nios2: Move nios2-semi.c to nios2_softmmu_ss
  target/nios2: Use semihosting/syscalls.h

 target/nios2/nios2-semi.c | 363 ++++++++++----------------------------
 target/nios2/meson.build  |   4 +-
 2 files changed, 91 insertions(+), 276 deletions(-)

-- 
2.34.1


