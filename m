Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7BD2F6436
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:21:01 +0100 (CET)
Received: from localhost ([::1]:38222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04Qm-0007r8-99
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04GZ-00068r-BG; Thu, 14 Jan 2021 10:10:27 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:47085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04GX-00049F-Iq; Thu, 14 Jan 2021 10:10:27 -0500
Received: by mail-pf1-x433.google.com with SMTP id w2so3487097pfc.13;
 Thu, 14 Jan 2021 07:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bnloPjCNqMXt/4pwLudRlG/+uRuop2VlpB/XYKBzID8=;
 b=Ldjj4cAnoba7WgN2B3kDbEpAnd79x5JaJ7OEy5Y9AjtDLXifZxxs71uFm1KM5b6yY5
 /HndBKlcxVZDib3mD7haLS8R74OYizNwsZhwfMN1ymhKUeDAvKLryI7bIpQkcBxQr1b9
 IA1dPe7fCfhHm1Q77To9AsTgFDmfXZY/rxCedWgqjL/7rm7/+P9Z/3pLMrSbzfmM+O7i
 1G+evEslko70fMfXZbfO/Q6gzkt1LU+MA++sbn/whvgZCNJfiH8xEUqL2/UsXBUB0r1T
 lAmT8Co3MfBedzr53pCh+VOBdgYqobNkcDZ/MpH4B9VYjFYCDkdsnw3lFRL380tiTTto
 bepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bnloPjCNqMXt/4pwLudRlG/+uRuop2VlpB/XYKBzID8=;
 b=clnEVHFpDrDmySpkybR25QoSRW6rRKtoagp369kemPM0px53j5ptQtXV67Gf1CEqbS
 LE+vsE7fHHatOVnASw+ZOvSu+5JUqBo5FN1bucyJAkUN8Koer7xhE+dVLO8TTfE9vf76
 dvDGMNCtkngGpeIQlIkuWXeWnZt524D8IZfLngU4yDbEKibqtoJJec3w/K0qv/MQ6G+t
 LM+er0+b6LivEMhoOiL2VwEFtJaeGK3OUnnxJLOGuq0YZ1brHh4daf0MMDi4FZ8DuZur
 Z1mGvaaxy0dvnZl+6qigYeYDB7NdPBzEtOEcEfBtZXKvq6UkJUhUm/SvoVDI8k0Q0pRI
 AFCQ==
X-Gm-Message-State: AOAM532MlpJvuR7ZCscGxCqs93Dv7yFZKDm3OKvwIaRv81TUfbwoVA+b
 /FuzoFUFaySHbMdaas7HX9M=
X-Google-Smtp-Source: ABdhPJw936E+3+Ak+ibL67TMe0Xtp0WTzyZAEve98J0RXbBz4dFgfLz+0c8cJUfoiQcMOa/vOGzUyA==
X-Received: by 2002:a65:4785:: with SMTP id e5mr8060055pgs.0.1610637023962;
 Thu, 14 Jan 2021 07:10:23 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id w21sm5372051pfq.67.2021.01.14.07.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 07:10:23 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PATCH 5/9] hw/block: m25p80: Support fast read for SST flashes
Date: Thu, 14 Jan 2021 23:08:58 +0800
Message-Id: <20210114150902.11515-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114150902.11515-1-bmeng.cn@gmail.com>
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x433.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Per SST25VF016B datasheet [1], SST flash requires a dummy byte after
the address bytes. Note only SPI mode is supported by SST flashes.

[1] http://ww1.microchip.com/downloads/en/devicedoc/s71271_04.pdf

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/block/m25p80.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index e1e5d5a76f..512af61ba5 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -928,6 +928,9 @@ static void decode_fast_read_cmd(Flash *s)
     s->needed_bytes = get_addr_length(s);
     switch (get_man(s)) {
     /* Dummy cycles - modeled with bytes writes */
+    case MAN_SST:
+        s->needed_bytes += 1;
+        break;
     case MAN_WINBOND:
         switch (s->cmd_in_progress) {
         case FAST_READ:
-- 
2.25.1


