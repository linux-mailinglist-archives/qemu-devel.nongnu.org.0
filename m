Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440FF66283C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:16:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEske-0001fe-Q2; Mon, 09 Jan 2023 09:03:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskc-0001f0-MO
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:03:46 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskb-0006To-5X
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:03:46 -0500
Received: by mail-wr1-x432.google.com with SMTP id d17so8270029wrs.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 06:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T4pU3THaws02dfbgdVpDCPkXfJOk73OCnszjjkzMNl4=;
 b=gTpYscWWuHEBwMkxY0fZdyOxp0QtqCaE7idC+8KSKcGMp5Mkr5ViyWdzuhpuhCevq8
 +Br5RuwHGqXVC+t57bmkbNLQtUqgLRUfwaFaraVeKc6DeQ5PNECe9s9GQZzA3oY7bcd6
 ctf+G/YdW0kXFCIk+3BWwAbFZsNBA4FbdToVY5K7InC0iBw464duE8S16UrBsowRxpAO
 hhvgHckhUnZRRbVC99PXboNN+Tk6FaxUtrEedquM9+2++LzzI84P9Tvg1d183JnD9DAV
 4adWDeJZiFOOHgj5GJzrtWz51fGPSzliz7IoAo8LH2D1725mHQOLwU+v1d6uR1xxr6Qm
 Q+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T4pU3THaws02dfbgdVpDCPkXfJOk73OCnszjjkzMNl4=;
 b=FZ1QxqkiAef5IuXFH8WkfSUOvml5yJJnp6DsIkVr/2TLgjpH/B7TNxnVfcl9Xq7ASx
 GNySTTgUeiJzsXkeLOtGKZ7O3xF3OPOzNSLayQTdjo3xgrdElmwcV7Kl+DXjtZ47O5Pw
 xbdybWSG2YULTtI2+rUQKk/QFOcGrPB+Omu9Lox1ltt8bhZ36O4ig5AqnUxbHkgZRtwt
 DejGUNbsv7Am+c/QN1iZQR8JT7whhBeyzEm7l/FHZL7se6evHUtUFuhMxgBaG9jpMeZd
 PAXN4R3I7EpN1P8Tsacv5uCIoyGYXxLTVQlhuChWMY05jpAZTik9q8VpEqqiz2tGdykk
 lKzQ==
X-Gm-Message-State: AFqh2ko5hn1aRzLIgaoohhHCHU9KfZ+ORigQ2bGjJYjGg5TbxtSspQH6
 89aK7aBhTnDDKhCUi/bouNH3UQO4BBGiKoEg
X-Google-Smtp-Source: AMrXdXuP42eQq7tzgtH5gvbnKPmk+Dgv7SrxyRA9JHud1/kiy9YM03d30r4uDgIeE/emeysBszOl+w==
X-Received: by 2002:a5d:430e:0:b0:279:53e1:5178 with SMTP id
 h14-20020a5d430e000000b0027953e15178mr32269083wrq.45.1673273023529; 
 Mon, 09 Jan 2023 06:03:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bj7-20020a0560001e0700b002b6667d3adfsm8669224wrb.80.2023.01.09.06.03.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:03:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 07/14] hw/arm/stellaris: Drop useless casts from void * to
 pointer
Date: Mon,  9 Jan 2023 15:02:59 +0100
Message-Id: <20230109140306.23161-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
References: <20230109140306.23161-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/stellaris.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index a9e96c37f8..051c242e9d 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -749,7 +749,7 @@ static void stellaris_adc_update(stellaris_adc_state *s)
 
 static void stellaris_adc_trigger(void *opaque, int irq, int level)
 {
-    stellaris_adc_state *s = (stellaris_adc_state *)opaque;
+    stellaris_adc_state *s = opaque;
     int n;
 
     for (n = 0; n < 4; n++) {
@@ -785,7 +785,7 @@ static void stellaris_adc_reset(stellaris_adc_state *s)
 static uint64_t stellaris_adc_read(void *opaque, hwaddr offset,
                                    unsigned size)
 {
-    stellaris_adc_state *s = (stellaris_adc_state *)opaque;
+    stellaris_adc_state *s = opaque;
 
     /* TODO: Implement this.  */
     if (offset >= 0x40 && offset < 0xc0) {
@@ -833,7 +833,7 @@ static uint64_t stellaris_adc_read(void *opaque, hwaddr offset,
 static void stellaris_adc_write(void *opaque, hwaddr offset,
                                 uint64_t value, unsigned size)
 {
-    stellaris_adc_state *s = (stellaris_adc_state *)opaque;
+    stellaris_adc_state *s = opaque;
 
     /* TODO: Implement this.  */
     if (offset >= 0x40 && offset < 0xc0) {
-- 
2.38.1


