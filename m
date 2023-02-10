Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC916923CF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:59:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWio-0003Vd-EU; Fri, 10 Feb 2023 11:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWin-0003VQ-5A
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:58:01 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWil-0003y3-6L
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:58:00 -0500
Received: by mail-wr1-x42c.google.com with SMTP id co8so1932133wrb.1
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dxi5WXox0JhUvk9QjfhAAp2O4SXdsKR+vJ/DKs/5DDM=;
 b=OC8rb5V0Jzb1RnHelBO6BFR2R1NgZUtRjd5538x01vQtKOyplwTiH2rZc77IYtveKw
 8HhUnzZNW27rWT5Jq/sdP0grXKy74ZrE9aBWM98mr0vbgM4MWHfiHH5th1iATOu8sQ11
 F9cjWqw+hMpbOwG+WS/O1bRReIdZWYaj4KIoQCrrf/QijuDQbOGPQVBEn8hBptNh6g6Y
 k3KID8Rvb5wA5vVspMnglRZqnwd7sw1OpgICIa43flz1ybrNy1nweUy9BeuTv3jBJccp
 +qkFpOqsuQJngfz+E/eRHRFOBF3a8rGS2MpbQbGc7e3Lj7wLXZrSttnXVetXe2iytOUr
 Q03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dxi5WXox0JhUvk9QjfhAAp2O4SXdsKR+vJ/DKs/5DDM=;
 b=SzXWw7oq9NbJCjkvNV0fsSPt+sJ/1UnY8MQ6O6HUykmcYmDzRAXXGM7IfXIY1rlnhV
 8HFG+y/1/1L/DxG2597PAq73RtKmowjc0To4/P1Up6MLERlcK+fwLl5jWy9nhoGm8Jq7
 QOlYF0HPQBRCyVpGgdK+YaZRqtCzXuyVPQHCOi/nBwcXCBEIGy3ICC2Cx8xm+UQT3ZVN
 qz9DJgNMM94GtzA1YBO3kb+wvsZ2HlEBDnzQxiB1JoWyqoAzdxED/5WZMuhVF3FvpNcj
 9Zw6yo5sSl9Qc/QyV72yeJsBJ2rUjFLOMP46wGjKKS9yTjIVExJPtt7C+1altfDOvRLP
 psOg==
X-Gm-Message-State: AO0yUKVWw3m9J726Qc1ZnyxeuhHdCqc2cjxuolD2vaHfl74Nrr+NV4xP
 rqsytaVY7kWDZD3Z6H9d2i6NwXlwmsrirCVB
X-Google-Smtp-Source: AK7set8iEde3RrL4ymbxevTLzqevPT+PhOk1oSRK9PkHwptoXh8do1S3JlY8+KB3loN0T8vZoOUNEw==
X-Received: by 2002:a05:6000:12cb:b0:2c3:be89:7c30 with SMTP id
 l11-20020a05600012cb00b002c3be897c30mr8171040wrx.19.1676048276022; 
 Fri, 10 Feb 2023 08:57:56 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a5d4012000000b002b57bae7174sm4177239wrp.5.2023.02.10.08.57.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Feb 2023 08:57:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/4] hw/isa/piix: Housekeeping QOM names / macros
Date: Fri, 10 Feb 2023 17:57:50 +0100
Message-Id: <20230210165754.34342-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

- Use QOM macros
- Unify QOM type names

Based-on: <20230210163744.32182-1-philmd@linaro.org>

Philippe Mathieu-Daudé (4):
  hw/southbridge/piix: Use OBJECT_DECLARE_SIMPLE_TYPE() macro
  hw/isa/piix: Batch register QOM types using DEFINE_TYPES() macro
  hw/isa/piix: Unify QOM type name of PIIX ISA function
  hw/isa/piix: Unify PIIX-ISA QOM type names using qdev aliases

 hw/i386/pc_piix.c             |  5 ++-
 hw/isa/piix3.c                | 63 +++++++++++++++--------------------
 hw/isa/piix4.c                | 10 +++---
 hw/mips/malta.c               |  2 +-
 include/hw/southbridge/piix.h | 14 ++++----
 softmmu/qdev-monitor.c        |  3 ++
 6 files changed, 44 insertions(+), 53 deletions(-)

-- 
2.38.1


