Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB2D3DE34A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 01:56:59 +0200 (CEST)
Received: from localhost ([::1]:43504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAhnn-0007af-13
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 19:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAhmO-00054d-Db; Mon, 02 Aug 2021 19:55:32 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:42519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAhmL-0006MQ-3a; Mon, 02 Aug 2021 19:55:32 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso991540wmp.1; 
 Mon, 02 Aug 2021 16:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GPSIHv4eRtDJzkdd5cdvK6iIW9NuIx+8aNEvZFnhPOQ=;
 b=vMXzftWHxOrP+obSluB+DOS23Yl9gi7Eoig1Ty+H5g8bW7xYT0Ntmhqtc0+hZ8gyoH
 M1BqQUn8Pyq/a8pL8tV1aHRNq8ChtPzFBC1gH6IpEfbbLXYcesNZ7wJQRHqexT3sxPeT
 6BmvsuyHPdisaB6g3cm9Y3Vwofr9xmk2M0ugVv2/nBsS8Mjoh1xk+15QwFQ4J8Y/bX3t
 7yiUGgVbP66lTTyf0p/CR/sslYHBxE7VaEMPt89oO5qTpIr1iHLmie+nBLsOn0cf620k
 fW+mZqvCKo7048IhIGIecS+Iq5aVhl6S3vAyzO0QR4qUCiA8hJ9eWErYG+Xf4pRkyxj+
 A+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GPSIHv4eRtDJzkdd5cdvK6iIW9NuIx+8aNEvZFnhPOQ=;
 b=M4KPRmAqZlzrGuXBq4g1KLffz8JEQZQvjiHQ1+wJ7FWwXKvmNkL5j+neud+T0rmwC8
 8081X0fcv/fCx688xJEoOk3m30lMSmHnfES+NgMlE9t9jONjk+Fri8VU3gT5LFImofqQ
 kwn72U4qAeL+TgVR8m24ajs0zDhjauUloyuqAlleGUvyLo+iyiajqkDP44UdbZJjXY3I
 mBGkcH9BdZ0DfCeP6lG/U/Ou/GTPsRnJrDYs95NTZackaRo0NKlJtbBLG2ZaplrqA1tm
 GyRPzKzIm3elY4dxTcpquX/FDR9QfzHAFExIOFg/1/zlH716qIStNjklhJRBN4NT/yCa
 WvCQ==
X-Gm-Message-State: AOAM530+yNH+I72tYMWEqUyinzLPL9DA325Gxc1ejL/QiS4LdE0/hkvn
 FYPbTBzLfe3cORfXTVwPnelyNZEP6+sN/w==
X-Google-Smtp-Source: ABdhPJzgBSIm5qT2zqjUsmsKIbDWxMVDMRdgmMQaUiJP2oT2233iO+nkfvTN/rE8UG4MtRjW8wjSxw==
X-Received: by 2002:a1c:1d13:: with SMTP id d19mr1357046wmd.0.1627948526620;
 Mon, 02 Aug 2021 16:55:26 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id d15sm12492424wrn.28.2021.08.02.16.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 16:55:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v2 0/2] hw/sd/sdcard: Fix assertion accessing
 out-of-range addresses with CMD30
Date: Tue,  3 Aug 2021 01:55:22 +0200
Message-Id: <20210802235524.3417739-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix an assertion reported by OSS-Fuzz, add corresponding qtest.=0D
=0D
The change is (now) simple enough for the next rc.=0D
=0D
Since v1:=0D
- Simplified/corrected following Peter's suggestion=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/sd/sdcard: Document out-of-range addresses for SEND_WRITE_PROT=0D
  hw/sd/sdcard: Fix assertion accessing out-of-range addresses with=0D
    CMD30=0D
=0D
 hw/sd/sd.c                     |  9 ++++++++-=0D
 tests/qtest/fuzz-sdcard-test.c | 36 ++++++++++++++++++++++++++++++++++=0D
 2 files changed, 44 insertions(+), 1 deletion(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

