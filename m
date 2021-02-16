Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C1031CCB5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:12:53 +0100 (CET)
Received: from localhost ([::1]:49076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC220-0006qG-8I
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC1s8-0003qP-CO; Tue, 16 Feb 2021 10:02:40 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC1s6-0006GG-Dd; Tue, 16 Feb 2021 10:02:39 -0500
Received: by mail-pl1-x62c.google.com with SMTP id ba1so5632826plb.1;
 Tue, 16 Feb 2021 07:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vrv0zRbyNqz29gYBdUicycG3LUQhbsLlflKxdiqwimM=;
 b=dSHkiVsxnmw326b+V6bBU4tbFD4o8iZf4k9UNV288uzShHdJJPNRDPISQ/Ec+Q2nTV
 u6asO7CsGYgm/TIW2hwKnN2YKadw/YTcrWvuXwHJbF7NC161GRFk6+cnjy+pJQpc3M4R
 sBNjU05GY9yDcXvQRnyycMWdzjSKmCUkw1yXDPaiIHIrw87OoaD654UoYt6qdkPm2aHw
 ZqiJ0kJ/KsEr9gg5rPzpIlx3kbHAFliBsIBiSlJmfCgdCoXyB2XyE17kgEnnWk2q4Yp4
 4nnPrb6KUze7raSf4npRzfQWqJcMSS3dGmsnOnrCd5AfZEnF1jEy82kfAWonW4IKM/O3
 WKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vrv0zRbyNqz29gYBdUicycG3LUQhbsLlflKxdiqwimM=;
 b=FbToU+uuSwYCvm1qteyZVsxEuztfGS52e/tvsi/jXpokjylt03yieDTZXu7FM08BI3
 pmx09QdIU4vyHDH02KRbRMtr749S0agn8778La2jqWJZC2L0E3fOYlf0iOCwrIXkawZO
 YzrUo2cwDKlueNhqp41PnCUyPlgXjwmSdfuPmrTw+ZHrRFvij6hw6MLjxwSmgYj8lSTA
 2yFqfPe49uN+Z66LbMhQEE2qyb9TULfDZGgd5npEwAqeBTYLCUnybIGJLZ7yiJ0D0MJz
 3Ckd+ieH+DQ2eiha8us0RAlqS+b18b+LZcupjhzTEbiVPoxWgwn+qCEJJSNr0QX8m1si
 owOA==
X-Gm-Message-State: AOAM533+puaNoT8ClbZvAajG3oV1Gq+xi/P8MtEAeiDPehDHRjh7XRd5
 kgkytZyGVWKeMy3u83BcYjo=
X-Google-Smtp-Source: ABdhPJx2/QLF9PiFg79F1TurbMumqZ7n/MqpEfmubJIj5VySa3DcrCl7MoykhLyVTzQ/fDlKifOKPA==
X-Received: by 2002:a17:90a:2a4e:: with SMTP id
 d14mr4359665pjg.36.1613487756437; 
 Tue, 16 Feb 2021 07:02:36 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id n15sm21960300pgl.31.2021.02.16.07.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 07:02:36 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] hw/sd: sd: Erase operation and other fixes
Date: Tue, 16 Feb 2021 23:02:17 +0800
Message-Id: <20210216150225.27996-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62c.google.com
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

This includes several fixes related to erase operation of a SD card.

Currently sd_erase() does not perform the actual erase operation to
reset the requested block contents to 0xFFs. When trying to add such
functionality, one issue was spotted that the write protection is
only supported by SDSC cards. This seems to be missed when adding
high capability card support to the SD model.

The write groups check is now bypassed in the erase and block write
handling codes for high capacity cards.

The last patch was previously sent as a standalone patch [1], and is
now included in this v2 series. It was about SD card in SPI mode that
CMD13 argument should be ignored.

[1] http://patchwork.ozlabs.org/project/qemu-devel/patch/20210129085124.21525-1-bmeng.cn@gmail.com/

Based-on:
http://patchwork.ozlabs.org/project/qemu-devel/list/?series=226785

Changes in v2:
- new patch: sd: Only SDSC cards support CMD28/29/30
- new patch: sd: Fix CMD30 response type
- new patch: sd: Skip write protect groups check in sd_erase() for high capacity card
- honor the write protection bits for SDSC cards
- new patch: sd: Skip write protect groups check in CMD24/25 for high capacity cards
- update commit message to include the reference in the spec

Bin Meng (8):
  hw/sd: sd: Fix address check in sd_erase()
  hw/sd: sd: Only SDSC cards support CMD28/29/30
  hw/sd: sd: Fix CMD30 response type
  hw/sd: sd: Move the sd_block_{read,write} and macros ahead
  hw/sd: sd: Skip write protect groups check in sd_erase() for high
    capacity cards
  hw/sd: sd: Actually perform the erase operation
  hw/sd: sd: Skip write protect groups check in CMD24/25 for high
    capacity cards
  hw/sd: sd: Bypass the RCA check for CMD13 in SPI mode

 hw/sd/sd.c | 99 +++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 64 insertions(+), 35 deletions(-)

-- 
2.25.1


