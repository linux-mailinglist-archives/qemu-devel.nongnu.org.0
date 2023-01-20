Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156DD67540E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:03:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIq6k-0007gl-6f; Fri, 20 Jan 2023 07:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIq5m-0007WM-Qa
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:02:18 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIq5b-0003Jt-2I
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:01:51 -0500
Received: by mail-oi1-x233.google.com with SMTP id r9so4180554oie.13
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 04:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0qyy3nh/Qe0A9uCmuVTyDBMQWajOfoXNDNCbyKUAJbM=;
 b=NmdiO212FLdz+5PuBcmTNhY31GX5l2LRNfa0HFhePe6Op5GzyvquAp1hgY1xQzWw1P
 9hrx2lgr3eaYzzBuU43xjWjsHqHotmuSi31puLY+GLQSV1sACa8LhQq+X9+WxZglS2FM
 JIr2a/u7WvXgbxBcLMOJpbN7pp6qPXvcPws1lHtQ8kjncqOwrpaHJ7vZOJvyFUPTmUFx
 xbx3v3rk8IIZq6O2RnbEI31NGsf9gWelPyxyxKmoctOLyq92Y2nfBaq83lJZLE7T/Gsj
 Yccem2T/aJkiMgEkEF6sH/fb9lxJ428QjRkz/Ndo9pQyfVEG1Gl8qfBmIz26Cgs6qE6g
 Q2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0qyy3nh/Qe0A9uCmuVTyDBMQWajOfoXNDNCbyKUAJbM=;
 b=pPj9Pvjy7SAgean+4rzvwA+9V+oFZmkbzX6PIRodKTYYi/oE/JUN/LY87wrh1gRKHO
 yV1Gz3QrdCdlFQPA1UavUbeQtnkW0tTooYTGtDSvuQ+OZe0hqXHkemugfMokH/vAJgej
 EJ7WmiWaA3Zd7fMSRPBa6X13PIFCXMDt/4BgooHBYBrDBdon578hlAmNFk66P/OoUCad
 /YknaUr8f7Kk/8MLjrr2t2dmlFd93gFf/hNTBVNe0JpJZqc7Ywpj9LUJj4XsXvguBDtg
 ISLmvAYdQQxZNPdQhIG+P5VsrC+OBEdME1hVsGioXv9ndXPpFxsC82YkF3+MCZ+cXPl6
 zkvQ==
X-Gm-Message-State: AFqh2kqUOPvPkC7Fn2CK5A2Fu+8Y8SmAMgE2MB7A9kCUy6X1tqtfOzxC
 K/Omo0D8LCup37kGbbIRwvwD798FCQiWckaVZ50=
X-Google-Smtp-Source: AMrXdXuWZb4wkV+zIB0WL7V0BxDiA8iv420xvWrPhaAEkD2UgTNyo8KV9rH6uUSpceaTNNL8uWrM2g==
X-Received: by 2002:a05:6808:3b6:b0:35e:7acb:603c with SMTP id
 n22-20020a05680803b600b0035e7acb603cmr4864098oie.27.1674216098289; 
 Fri, 20 Jan 2023 04:01:38 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 o66-20020acaf045000000b003645ec41412sm9946836oih.27.2023.01.20.04.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 04:01:37 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>
Subject: [RFC PATCH 0/2] fix SD card migration 
Date: Fri, 20 Jan 2023 09:01:31 -0300
Message-Id: <20230120120133.666993-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
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

Hi, 

I found this bug by accident when doing avocado tests with the RISC-V
machines. Trying to migrate the sifive_u machine, which always has a SD
card, fails every time:

qemu-system-riscv64: ../hw/sd/sd.c:297: sd_ocr_powerup: Assertion
`!FIELD_EX32(sd->ocr, OCR, CARD_POWER_UP)' failed.

I'm sending it as RFC because I am not sure if this fix is a bandaid for
something else that should be worked on. The code in question was
introduced a while ago to circumvent a power on bug with EDK2, where a
timer was introduced to power on the card after receiving a ACMD41
event/command.  There is a possibility that the assumptions made back
then no longer hold true.

Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>

Daniel Henrique Barboza (2):
  hw/sd/sd.c: add sd_card_powered_up()
  hw/sd: skip double power-up in sd_vmstate_pre_load()

 hw/sd/sd.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

-- 
2.39.0


