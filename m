Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B500C51C537
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:34:26 +0200 (CEST)
Received: from localhost ([::1]:54188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmeQr-0002eA-Q5
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBN-0001xX-0e; Thu, 05 May 2022 12:18:25 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:33701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBL-0005ic-5n; Thu, 05 May 2022 12:18:24 -0400
Received: by mail-ej1-x629.google.com with SMTP id gh6so9747538ejb.0;
 Thu, 05 May 2022 09:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WIS0fBwOWDFkFZRgtYgAQeD0VQwUFTuck+f3lMt7aoY=;
 b=eZw5SfUchhFBYVLW/b7paoFTX539Rww88LDlPUZYAuYn2BOMzALPoBToe1SLbcTorA
 0RKBwKoJNkDWWJCX7NEAJK/dGWw/UBbu15XmOuC8Wz1GM8vvaPn3oPmlN51xbelNgysz
 /zvVNwgJWAixrq4XIWcXZbYlDH39MGTMctS4MaPdejzO5Pb1IqZgwwdaoVUNYhw4OSXM
 gd8fptBp6R6Zp3UJUpMNK7EAeaTfck1QI5Y0kZvrXfwV6Wu7OsJlmKlJD8PUC4EgFTwF
 QaivfsxTmJJ8zR0EbXtPOjBVylNVf29EH3oPnAUKfzdB5q1SFvD3Y5yqs0vZxGoXOiIQ
 Ssyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WIS0fBwOWDFkFZRgtYgAQeD0VQwUFTuck+f3lMt7aoY=;
 b=PlfoGfZ7jAWOd9mCbsoQZChdph41Pu0V/+Q2DecoJfV0hvwGF1uqj6XQqiutm5FAXk
 T02TaY5Ka53UnW60GdfRxAFDlSuxrI5ofgPHeGaS1frOqhXLIjEmRJRwb+ASu6KnA9OW
 eQzrOEkzZ6s9Ou/N7+y7/dYrlwGZYtz3lAo943/gXdxH6OZctrhkgpWlPil2BVxyRy22
 qobN8JXBu2YCPMXP9fW7bdcXpdjWhspXWIGOh4ixqC5KNPZT5pu8YEm4qymo0C3rLDpm
 7tWprTV5Q4FJp4mnFna/fuhlDnBOrGl58UVIop5QtEDo2UBLjpzsvdxqQ96ozzcGEiKr
 su/Q==
X-Gm-Message-State: AOAM531sYsiL0Y091XFWcv5AbHLUYEgxmbWQLIoiz15f0HPCvZmYIJ3w
 vo7nDEAKuDcYyh0VuGYeOh6JQJDvH0Y=
X-Google-Smtp-Source: ABdhPJydT6Z36pDDShAEAjBHEcYhAxy2bKCwbzlwnCwILV4M4lGgrgrKDV0LhkLT71qTcntZ51VlRw==
X-Received: by 2002:a17:907:629a:b0:6d7:b33e:43f4 with SMTP id
 nd26-20020a170907629a00b006d7b33e43f4mr27711981ejc.149.1651767501355; 
 Thu, 05 May 2022 09:18:21 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-123-159.78.54.pool.telefonica.de. [78.54.123.159])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a17090685c600b006f3ef214dcfsm868542ejy.53.2022.05.05.09.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 09:18:20 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 03/11] hw/audio/cs4231a: Const'ify global tables
Date: Thu,  5 May 2022 18:17:57 +0200
Message-Id: <20220505161805.11116-4-shentey@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505161805.11116-1-shentey@gmail.com>
References: <20220505161805.11116-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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

The tables contain spcifically crafted constants for algorithms, so make
them immutable.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
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
2.36.0


