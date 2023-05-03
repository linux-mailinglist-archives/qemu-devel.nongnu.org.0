Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEFB6F548F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:23:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8hI-0000gy-3h; Wed, 03 May 2023 05:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8h4-0000Ip-NP
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:22:38 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8h1-00065Q-Fn
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:22:37 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-2f55ffdbaedso2989293f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105753; x=1685697753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CNfwyGTXREVlcwDJev212ecLngQvJTwdm4EqlF0mGis=;
 b=MKTNCbJuML+9FMIht3qXRn5jFn29DAPpxo2xRIuHXVU+eXSFD7Atdw8eIcyyFQvzhf
 ITkXC56XMibc2TOOp2bgCIit9uxOF9LwqclZYLGdX5GMfva6W+VtcQTwTu7AvOMTstM/
 wa2XNq6hJZGY/fh8ODzhQ+HsiG+M0X90uTBLSbpQxjCJHsNtkN8YBbkdbNMPzX/ySFvk
 EeC2hJWZvwcw7hHVMqun7tUzq389NAGCTqJXTHHd62aIFCIPMiuLe/ico+7aschodvNP
 3hutjkyrXhuqaJ846+XyQFxCvOB7CmQodAtw4e1B6BrZWaCv3fIf7rd5aQFJ3uRkNcyb
 M1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105753; x=1685697753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CNfwyGTXREVlcwDJev212ecLngQvJTwdm4EqlF0mGis=;
 b=S+KROnxhC/zGZHcispd+jd054ScRtogE2OcQ+IW0BoertyirSreKVSl9B71H/yL01U
 ILfKoOPNgdMNAdI76f5/pzqxUd6hCyzly3toNgAy5rgABeWFelgtmSjZ0mzZE1NM0uAI
 mnA6VDmwroH//3gwZ/PitPaNaP39opR3wMx4MoDN3sMnl/H0QrbP8Psjfrc/zP8crGCm
 4OAnbDLIguJHiEfvT/AeHGj7dGrnwPGHCrTr8COIxMFYPa8DUSditwLMCKBG1Vd4jDrg
 we85p6ZUFK60353l11JHu0tI3VXptn1ikAmy5u8lYyVH7zzwVmzrIu+BXGuTLmeoVmaT
 65gA==
X-Gm-Message-State: AC+VfDz/DaFKQnkn9tLz6bFJt6yR+ojWsm6UBuOzu9OUqxQz534i15i9
 rPZsstHztu1iZ8iPtAh3QctZoQ==
X-Google-Smtp-Source: ACHHUZ5G1fk0ox6ZY3rquRVFtr90T5+Tvns8dr0pF4cbtpOyMurlmXw3Rk2gmoLuU9GPE8qXAp8fzg==
X-Received: by 2002:adf:e507:0:b0:306:2a21:b5ff with SMTP id
 j7-20020adfe507000000b003062a21b5ffmr8148531wrm.17.1683105752836; 
 Wed, 03 May 2023 02:22:32 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a05600c290100b003edf2dc7ca3sm1272810wmd.34.2023.05.03.02.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:22:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3086D1FFCC;
 Wed,  3 May 2023 10:12:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 21/22] tests/avocado: use http for mipsdistros.mips.com
Date: Wed,  3 May 2023 10:12:43 +0100
Message-Id: <20230503091244.1450613-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

As the cached assets have fallen out of our cache new attempts to
fetch these binaries fail hard due to certificate expirty. It's hard
to find a contact email for the domain as the root page of mipsdistros
throws up some random XML. I suspect Amazon are merely the hosts.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/replay_kernel.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
index f13456e1ec..fe1e901f4b 100644
--- a/tests/avocado/replay_kernel.py
+++ b/tests/avocado/replay_kernel.py
@@ -493,7 +493,7 @@ def test_mips_malta32el_nanomips_4k(self):
         :avocado: tags=endian:little
         :avocado: tags=cpu:I7200
         """
-        kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
+        kernel_url = ('http://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
                       'generic_nano32r6el_page4k.xz')
         kernel_hash = '477456aafd2a0f1ddc9482727f20fe9575565dd6'
@@ -507,7 +507,7 @@ def test_mips_malta32el_nanomips_16k_up(self):
         :avocado: tags=endian:little
         :avocado: tags=cpu:I7200
         """
-        kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
+        kernel_url = ('http://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
                       'generic_nano32r6el_page16k_up.xz')
         kernel_hash = 'e882868f944c71c816e832e2303b7874d044a7bc'
@@ -521,7 +521,7 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
         :avocado: tags=endian:little
         :avocado: tags=cpu:I7200
         """
-        kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
+        kernel_url = ('http://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
                       'generic_nano32r6el_page64k_dbg.xz')
         kernel_hash = '18d1c68f2e23429e266ca39ba5349ccd0aeb7180'
-- 
2.39.2


