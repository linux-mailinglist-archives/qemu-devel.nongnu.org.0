Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D62370EA7
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 20:58:04 +0200 (CEST)
Received: from localhost ([::1]:54790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldHI3-0001St-Ra
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 14:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldHEt-0008CK-8l
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:54:47 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldHEr-00089c-IK
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:54:46 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n2so3366905wrm.0
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 11:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ujqbJ7Co9G2P7FoVvluHxP8vf8C8Aaji68UpHPAFZiw=;
 b=MYY7l5IVRCTj39C1ww34dLgkRd/KZrYeBoPUP0Mo2Vwq9hdiscxV3/uQJuE6XZXdR0
 +fRNnf1kowtUAEKOzFqnTT65Vj450UeS50nbxTikWrUkU+YLJqKn64120Ylyx+9p1qAq
 2rAdVcjibuOto6V1IB+rP/IU34u7BGsszFkqbKgmwRlp3PWKc8jQ2S+bfRskPxjXIdck
 MzHXvHcgU876S2gomiw7CPNCtakgCYJ7e8rlMbNo7v0WTvwZ5LjhEcZ11Xb2SrZ+ht+H
 XkEdMB3pUW8eXQuS0CmS+lpenk87dbfbSUc2JZWggbR4ZEQqADgh00NGvlCGh5rQn26M
 U49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ujqbJ7Co9G2P7FoVvluHxP8vf8C8Aaji68UpHPAFZiw=;
 b=XKde07N7jP3b0lbtBkE4+KSNJlq/DKUzSj1ObF11g7RxlpZVb/bSnjvNir6vcc9Ixf
 f4fnuk0QRp+j+zy+YroAq7opxZb3SqhCT+RCE4XDqGu4mzbJ4IYhSAhF1CTb1Lo7XqTd
 l1oL8+z1G/UIrrZqWe7o+MH2w4pYzPRwublr3JDAoJVmhTpbS0oBbcTYjyAH9E0EIURP
 unXxgco5mfjDYJZgEfLFTNhE8FEx0OKmL7ruHNslQMoIE1s8KeA4Ph7RL1yQEV17FAe/
 LjmRzCn+k4R2tMQnWRl4vVSG4MJ82gkxu79MYzoHoFD/GUgsizKxjLO600Alt1IklNda
 FJUQ==
X-Gm-Message-State: AOAM5339cIcr9kK3nf7mIx2x1BAPLsgspoiX0UU++kL6cNYBJvGS1dh+
 vJIu5dS9VmiKtCim3yw1XWg7i2qTBOCi5GGh
X-Google-Smtp-Source: ABdhPJwLZ0sbgt+6LHncXCXP9vj1POsQVaGfztuDPT+x4helNh1V7uWAC9GBChAlYxTKDAOos+0xEw==
X-Received: by 2002:adf:f043:: with SMTP id t3mr10951393wro.344.1619981683660; 
 Sun, 02 May 2021 11:54:43 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id k11sm19551793wmj.1.2021.05.02.11.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 11:54:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] hw/sparc/sun4m: Introduce Sun4mMachineClass to access
 sun4m_hwdefs
Date: Sun,  2 May 2021 20:54:35 +0200
Message-Id: <20210502185441.599980-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mark,=0D
=0D
This series QOM'ify the sun4m machines.=0D
I need it for a further memory maxsize check.=0D
It is mostly code movement (and the diff-stat is good).=0D
=0D
Since v1:=0D
- Full rewrite after Mark review=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  hw/sparc/sun4m: Have sun4m machines inherit new TYPE_SUN4M_MACHINE=0D
  hw/sparc/sun4m: Introduce Sun4mMachineClass=0D
  hw/sparc/sun4m: Factor out sun4m_machine_class_init()=0D
  hw/sparc/sun4m: Register machine types in sun4m_machine_types[]=0D
  hw/sparc/sun4m: Fix code style for checkpatch.pl=0D
  hw/sparc/sun4m: Move each sun4m_hwdef definition in its class_init=0D
=0D
 hw/sparc/sun4m.c | 458 +++++++++++++++++++----------------------------=0D
 1 file changed, 181 insertions(+), 277 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D

