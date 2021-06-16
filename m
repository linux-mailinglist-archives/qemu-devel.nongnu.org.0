Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638AC3AA121
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:20:26 +0200 (CEST)
Received: from localhost ([::1]:34902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYHB-0002XC-Br
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBa-0001ic-PC; Wed, 16 Jun 2021 12:14:38 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBZ-0005oM-7b; Wed, 16 Jun 2021 12:14:38 -0400
Received: by mail-wr1-x42a.google.com with SMTP id y7so3300977wrh.7;
 Wed, 16 Jun 2021 09:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a3rlIikyzOrYII/I4PVDBAmEgVhKf/CZtF0tScG6WL0=;
 b=HtbvU57kUem2qJOKQwQ1McwxTuzLlcNhZBPL55Jbt5VumOreVyU4LNPtaKYCRXZze2
 8ynrD9OmYvsfe+c1mR4+AFtXNfCi1iQsoEgKAbTVfs+KsEvo6Cp2Ry2Quk60z6MMr69E
 7uahYG01zevbWnepVxs6I/+PrqlT02GGzrO3GJHPK7t/OC+6vvj4UhEsxOBtkcRttLM0
 alu4TUKbnAHMcDLcUpUWQ6SlSszFvMRn6PPgIFp/UTSenljj4MgzWMtWVYG79ovBaLnl
 a0W8/aFwOv84kHo4KL1f7MxXD4JV5vvIq+etEg7a6IQFmfdk/PmDGD3duJeWbMERS2rN
 u5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=a3rlIikyzOrYII/I4PVDBAmEgVhKf/CZtF0tScG6WL0=;
 b=f7nB9Wu6iFd86fG1/2jiXvsrlqyG5yd/CvcT022vKurgPZfBcJ1GmjNb2TPSxNyTyR
 GdLmpGTH8r7K8u79B2p30/gMJPoMXTdASnNqmJ2p3hwweEAcif1dhcBUmicvKbc1DVqo
 8W6uZapu58yg8UwMJCNls1S/IW3BNySEAc7PO1Oe20LFE43cK+FfSsN8p30zc9I3s2z8
 6x59mCjjy0C3JJnVzLIlkGKr1gBD734OIHX4g2B3d1ctE61YVArRYQt5aUH3bSvVt5Zk
 1OrfCAPHLry70kLNvOX5flc4yCS5hizmNGgZNYvQQvurJQkbToYuPsxL42bBp7qm3+T/
 MC6A==
X-Gm-Message-State: AOAM532bCmfTOfPT5wA9TaK7XA+Sv8BsI+anzUcCdlYRwzze9wlUBXFm
 w2o7dRFsTlZuKVcqskGojM/vcBOSYTxygg==
X-Google-Smtp-Source: ABdhPJzu5a0AUyhRk0IM9wd4dU0vxxIG9d7UeUtN/KMON6mze24wApwiTEC6e0ty52QlBkhbh4p6dQ==
X-Received: by 2002:adf:8bc7:: with SMTP id w7mr253537wra.198.1623860074990;
 Wed, 16 Jun 2021 09:14:34 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id u15sm5201091wmq.48.2021.06.16.09.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:14:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/13] hw/display/sm501: Simplify sm501_i2c_write() logic
Date: Wed, 16 Jun 2021 18:14:08 +0200
Message-Id: <20210616161418.2514095-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616161418.2514095-1-f4bug@amsat.org>
References: <20210616161418.2514095-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/sm501.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 8789722ef27..f276276f7f1 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1036,8 +1036,9 @@ static void sm501_i2c_write(void *opaque, hwaddr addr, uint64_t value,
                 int res = i2c_start_transfer(s->i2c_bus,
                                              s->i2c_addr >> 1,
                                              s->i2c_addr & 1);
-                s->i2c_status |= (res ? SM501_I2C_STATUS_ERROR : 0);
-                if (!res) {
+                if (res) {
+                    s->i2c_status |= SM501_I2C_STATUS_ERROR;
+                } else {
                     int i;
                     for (i = 0; i <= s->i2c_byte_count; i++) {
                         res = i2c_send_recv(s->i2c_bus, &s->i2c_data[i],
-- 
2.31.1


