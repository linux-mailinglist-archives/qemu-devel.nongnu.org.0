Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03290547446
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:37:43 +0200 (CEST)
Received: from localhost ([::1]:35632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzQz-0007Pb-Vq
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyUB-000723-BO
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:37:00 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyU8-0006p6-4u
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:53 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v14so1491822wra.5
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rBFs/23+voIyOyZJdZK9wiVFvT/WUORppjnpNo+75eQ=;
 b=B6tvqKLWw08+iiKlmhC5v2fBp/VbUbnJ3PTnr4tdtzs7LfrhTSF10pzz8oSYryKE0s
 cCdQeM+1myRzHg5KfSvuAY8g3NtsF3hBo9IESkEGGI21Rfirdn5TaVVsJccPF06eI1CV
 AMnvKJOslCPtKuUW4bVdnkaqVeifcuvFTW7PNLubv1krC4n0gYsjo0uLGdiBqKn8Q61Z
 WrwOJiQzIHTh4RRVBu5fVeFvcNVgKH6r96Y72+OnXWe831VbAjAiiIGQ30Dt55Mzdwtd
 87nSdDVB3oYYThoXDFaFWCtrEpW64hF/plb/n5/7xveFxQUhVTv1OpyxBruFDqx6vH+q
 jvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rBFs/23+voIyOyZJdZK9wiVFvT/WUORppjnpNo+75eQ=;
 b=TqQjjaboix8+OTkAm/LVEVNyKu7Y7qkPdUKgXoBm4XG4i6CeB/IiB6eDauL70VXCe/
 TwqujwmNiPG+AadCkItYnVY28f1Y8Ul7F/0VAXRYiAYCfR6YBWGwhc9QSzGqvmK7LIbg
 97Ny/atggqBGl64Iqcjz8BJjEe85HgUoa1x2Byfc9FeulV/hhvfyG2qN1GOGva83htsX
 LsXRiFd06/mDvfnunLzCC0Mamkt0KoiPakTqWCbAdClemJqHrNykUuraeiac6NYDYfGc
 QuSa2RI9x+GsdtvQx2d2gY3lqrwjf2/1/v121SmctXz39Dm8fBCxN1ubfIyjTaUIpYje
 EXqQ==
X-Gm-Message-State: AOAM5309N70itd/nPoZO/hWLrhcznENxcdj9ZLWQtL+F9ciF3NE4NGx6
 mON2Asmuzvw3FS7Spul56fDEDv/VcrA=
X-Google-Smtp-Source: ABdhPJyD7F7XnpJ4dc7FMLf63ohFdTPHtMXPNxpDsgwOzbRCPpWo5UPPvgGwiGcWmEWyudNozwtAzg==
X-Received: by 2002:adf:f60d:0:b0:210:2cce:1922 with SMTP id
 t13-20020adff60d000000b002102cce1922mr46560803wrp.616.1654943810575; 
 Sat, 11 Jun 2022 03:36:50 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 m10-20020a5d56ca000000b0020c5253d8f7sm2154884wrw.67.2022.06.11.03.36.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:36:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 42/49] hw/audio/cs4231a: Const'ify global tables
Date: Sat, 11 Jun 2022 12:33:05 +0200
Message-Id: <20220611103312.67773-43-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

The tables contain spcifically crafted constants for algorithms, so make
them immutable.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220520180109.8224-3-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/audio/cs4231a.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/audio/cs4231a.c b/hw/audio/cs4231a.c
index 0723e39430..7f17a72a9c 100644
--- a/hw/audio/cs4231a.c
+++ b/hw/audio/cs4231a.c
@@ -84,7 +84,7 @@ struct CSState {
     int transferred;
     int aci_counter;
     SWVoiceOut *voice;
-    int16_t *tab;
+    const int16_t *tab;
 };
 
 #define MODE2 (1 << 6)
@@ -142,13 +142,13 @@ enum {
     Capture_Lower_Base_Count
 };
 
-static int freqs[2][8] = {
+static const int freqs[2][8] = {
     { 8000, 16000, 27420, 32000,    -1,    -1, 48000, 9000 },
     { 5510, 11025, 18900, 22050, 37800, 44100, 33075, 6620 }
 };
 
 /* Tables courtesy http://hazelware.luggle.com/tutorials/mulawcompression.html */
-static int16_t MuLawDecompressTable[256] =
+static const int16_t MuLawDecompressTable[256] =
 {
      -32124,-31100,-30076,-29052,-28028,-27004,-25980,-24956,
      -23932,-22908,-21884,-20860,-19836,-18812,-17788,-16764,
@@ -184,7 +184,7 @@ static int16_t MuLawDecompressTable[256] =
          56,    48,    40,    32,    24,    16,     8,     0
 };
 
-static int16_t ALawDecompressTable[256] =
+static const int16_t ALawDecompressTable[256] =
 {
      -5504, -5248, -6016, -5760, -4480, -4224, -4992, -4736,
      -7552, -7296, -8064, -7808, -6528, -6272, -7040, -6784,
-- 
2.36.1


