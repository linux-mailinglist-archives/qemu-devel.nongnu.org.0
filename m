Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD99306DA6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 07:34:20 +0100 (CET)
Received: from localhost ([::1]:44258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l50sm-0001E1-1R
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 01:34:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pM-0006wf-0S; Thu, 28 Jan 2021 01:30:48 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l50pK-00019F-Aw; Thu, 28 Jan 2021 01:30:47 -0500
Received: by mail-pj1-x1036.google.com with SMTP id md11so3285676pjb.0;
 Wed, 27 Jan 2021 22:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pQWI2hzzeYANOkzQvB/0EW5ra/qgFLCgmUxuhyK7OCA=;
 b=mfHy3op2bw8JHqrCkaOqlMB6a/PpEeP8gIYZcAfl3C6/0+GNAC6KNY7afs5EH/JZSB
 N0gnCGoHv7C4znWxfdKcK/QDFdzdSc5MezV5bXZVjznZtnACtQdQ3FFWVHrjAtzY/VyT
 yJIwSXq9PWP6P6YvboLujR7DNSiQvUbCRY0QO/30+SR1rvxwtpgu5/aKDC7luKiWRSpq
 ZFPr6bptXS1n4t3io4naTkr+3Q0E9weIRVR8HgfLMnbqHNUxP7YO2GhXw9lEi18ZUJOr
 NXbXcmG07n8Swv2XUdTnRgB0LJy8M7wtpS+FhaA1DX2Npqttw8JjTYsR6k/+MHVB3A5L
 pQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pQWI2hzzeYANOkzQvB/0EW5ra/qgFLCgmUxuhyK7OCA=;
 b=PJKYB15gm0xYEtZm/YKI59k9B4HcnigzMhJU3NU0vY+rL0gd3bj9PGJnlmCf1NNxr9
 WAqU9wNs7rFMjoW2YDypKR6J9AKmIsR45uA6h3Bmp79h6cSC/S5lUB+CJ+rsR3ZB/hGY
 tgeFdiUF76MqwFS2ndv4hnxIS+mciuEiPlgIYYZV7N/mmd2IVvT5/J/ptZqWk1S9sSZM
 Ivm8zIVFXQHVzHOudnOjNh/S631Q/ugfSTW+K/wgpdR+FVWbuJJexgrK0uzzFuHpO05y
 m+ctiALhqNfbmnB6bZ5F8ZHHVnC5D38TqsqK2ND3JiJnwXN9PiFpBxPbSnfZhMTEMr+b
 KGIw==
X-Gm-Message-State: AOAM533+oa+2RNNcjcztIYe4yxxSYdb65XkoITJ04ndKiLlf2oHc9oPm
 MDGbOfsm/GVpZdviZyOigi4=
X-Google-Smtp-Source: ABdhPJxuS1C0GRDgkLteVMilZjPqme7gTUJLSvZy/9/iCNfSEE1r6+P+uVoZ+Yu990pp2nVNEVwQYw==
X-Received: by 2002:a17:90a:df15:: with SMTP id
 gp21mr9324887pjb.63.1611815444118; 
 Wed, 27 Jan 2021 22:30:44 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t6sm4245080pfc.64.2021.01.27.22.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 22:30:43 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 0/9] hw/sd: Support block read/write in SPI mode
Date: Thu, 28 Jan 2021 14:30:26 +0800
Message-Id: <20210128063035.15674-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This includes the previously v3 series [1], and one single patch [2].

Compared to v3, this fixed the following issue in patch [v3,6/6]:
- Keep the card state to SSI_SD_CMD instead of SSI_SD_RESPONSE after
  receiving the STOP_TRAN token per the spec

All software tested so far (U-Boot/Linux/VxWorks) do work without
the fix, but it is better to comform with the spec.

In addition to [2], one more issue was exposed when testing with
VxWorks driver related to STOP_TRANSMISSION (CMD12) response.

[1] http://patchwork.ozlabs.org/project/qemu-devel/list/?series=226136
[2] http://patchwork.ozlabs.org/project/qemu-devel/patch/1611636214-52427-1-git-send-email-bmeng.cn@gmail.com/

Changes in v4:
- Keep the card state to SSI_SD_CMD instead of SSI_SD_RESPONSE after
  receiving the STOP_TRAN token per the spec
- new patch: fix STOP_TRANSMISSION (CMD12) response
- new patch: handle the rest commands with R1b response type

Bin Meng (9):
  hw/sd: ssi-sd: Support multiple block read
  hw/sd: sd: Remove duplicated codes in single/multiple block read/write
  hw/sd: sd: Allow single/multiple block write for SPI mode
  hw/sd: Introduce receive_ready() callback
  hw/sd: ssi-sd: Support single block write
  hw/sd: ssi-sd: Support multiple block write
  hw/sd: ssi-sd: Fix SEND_IF_COND (CMD8) response
  hw/sd: ssi-sd: Fix STOP_TRANSMISSION (CMD12) response
  hw/sd: ssi-sd: Handle the rest commands with R1b response type

 include/hw/sd/sd.h |   2 +
 hw/sd/core.c       |  13 +++++
 hw/sd/sd.c         |  56 ++-----------------
 hw/sd/ssi-sd.c     | 136 ++++++++++++++++++++++++++++++++++++++-------
 4 files changed, 137 insertions(+), 70 deletions(-)

-- 
2.25.1


