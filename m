Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C166F5434
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:14:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8Y6-0004uN-UY; Wed, 03 May 2023 05:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xq-0004PB-Ik
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:13:09 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xc-0005r6-Lj
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:13:05 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3023a56048bso4552151f8f.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105172; x=1685697172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+tg4pt8n5fSPZ9UQaNU7BUQLCBKZxcUMpPKPM60oNss=;
 b=h/U+EGdEkYRU2u+IeFdeylMEOTImzp2OzyiB0BIpzVrGv1tlxJIa8hXN8QQaSUHfcO
 pEP5EQtTNf+wEfkTBpD6oRU4d2MWU/4QxAwJdtB5SKjkB5d1AtFRjxLl8nI6MI6aEY62
 Sl0JpnFfsOWFT9MUMapej3EJUNw7VUOQiBMlzzYod2gmldfCRtOvwsR+R1/CDDZaxnXi
 IqvUZCtEjzZCgoElEx+mCb3gmrXQf7QGFD29MYYy9M2qrVJSeYcZXm57GVzd+OTHcyj1
 OY+x7uiG9R0Bjs6H4MC5XwBWP/rYOJOpFGJ1sEr3iY+bpJse31MldM4hb/dJHXtv5vNI
 l0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105172; x=1685697172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+tg4pt8n5fSPZ9UQaNU7BUQLCBKZxcUMpPKPM60oNss=;
 b=QU9qTkXLEI4zPHZ4yqK7uKwTzAx3KVODUTvGGT+ZsBD5CJ0ODMxWCBXBsvnezVkfBk
 zwi/edg+O9ARZ6kKV456JuSg0M2NOj7Hp3cm2GCJB49N/Nn0tPSv6LA5Lt5NoQtPjg8+
 3pSqNB4pw9aySNPT90Sn9sqSx9RImWmWaLs14mpL+gq671np70kL8jnqCyXi/PSLeUK6
 dmKjQwJYXm7LwRNXqk/lUfpCHIPqAJZn9Jo+36jtk/8AmI5dNrHH7BsdN2/KG0eb7Qbt
 EdaHvmzD0yxs4FMgw2b0shOzLWwhgdI32ZSbORCz/3Os41XGU5Z9qz39nLqKNN+jgJww
 VxmA==
X-Gm-Message-State: AC+VfDx02GktqiDYQjiBxdH4ZFqQIP98El/TkBcHC1dqkhTCWKar2DA7
 /eI2k15/AWnCMrD/yCS14dYHBQ==
X-Google-Smtp-Source: ACHHUZ459blYaiFLD/+knEVYLGPWgPJC+vJ+pXu0oCQSVG04oe+GWPg2QCYUmsfycAoImTJyeEirnQ==
X-Received: by 2002:a5d:61ca:0:b0:306:2dd6:95d3 with SMTP id
 q10-20020a5d61ca000000b003062dd695d3mr6623630wrv.22.1683105171720; 
 Wed, 03 May 2023 02:12:51 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a5d6884000000b003062d815fa6sm7630796wru.85.2023.05.03.02.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:12:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 732BE1FFC6;
 Wed,  3 May 2023 10:12:46 +0100 (BST)
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
Subject: [PATCH 14/22] hw/loongarch: add VIRTIO as a dependency for
 LOONGARCH_VIRT
Date: Wed,  3 May 2023 10:12:36 +0100
Message-Id: <20230503091244.1450613-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

These are needed for board creation so fail under "make check" with a
--without-default-devices build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/loongarch/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index eb112af990..74d8449100 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -21,3 +21,5 @@ config LOONGARCH_VIRT
     select FW_CFG_DMA
     select DIMM
     select PFLASH_CFI01
+    select VIRTIO_PCI
+    select VIRTIO_NET
-- 
2.39.2


