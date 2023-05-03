Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A216F5442
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:15:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8Y7-00050M-M9; Wed, 03 May 2023 05:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xm-0004Eu-04
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:13:02 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xb-0005tV-V8
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:13:01 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f315735514so14866945e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105170; x=1685697170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VqO4tgmt23pLvH9fiJJvgEch5z2FCSupD5WpmCKXmvE=;
 b=Vd19HwLtD9VU+3IBPN4yoGw5RNoVFeLulPo8WDSSvsc0YvIiGnXrU8AoGazilqNm5+
 JsUIY5XfN+mfBJMl3AN9j5scKENsVjIs6qLXc8pCGsiKWLxyHVEDwWMC6pVaI6hzbml0
 qiSY1LMCyxPjuH2nnapHcxbSB6HKDMVlFPsxWWVsWXHyc2nmJt5wBTnzGLD3I1QzIStV
 0cQvOGvBffeqJAYGHJvTZgbhCCwLOeIX2aUVDJbW/4kLNru8JB3DcNfLXavYc3bPpru6
 CoB1mFxZTUW14UplI+zL6MyQurcaCyuLwRJUSdUR4viXG9xrsLl1u/GdnsVjat5Vllj1
 45Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105170; x=1685697170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VqO4tgmt23pLvH9fiJJvgEch5z2FCSupD5WpmCKXmvE=;
 b=awDUveVCubqkksYu95wq7a4WqSeceRyRnMTztcQ9/A55QZIxlI73uaoGrpmPMC3b9K
 W27NK0nzP/u7Ep6B3h8b55LNZT3TBnX2KjDluH8QiE38D9HisHxKfyruZgX55nh3z+xd
 YqOajdA8K0rjW58GnNJqaVGpy0/Ij6k6PsJV7uzS7pod5t1rmzua5hXBDl6dVHWByYss
 n+3ehMw22RRiHikosVdYw3Y3jyvdF11iwAkTw96yCCsK8S8HHkuQL87hs3h8qcBFER/F
 G8k7sS8bUuZL3JkLmjgXG4bM11jg25v2sOWyQCWkgrR686FmUNuwXh/HL6sE606+WaX1
 NKiA==
X-Gm-Message-State: AC+VfDxlqEx4lRc4r1qaCdY2gi5ZAbqcyGVZBeIAv5kyONgvJertiNbp
 ZBUT1QcI2jdjWRagUjskXfEhhA==
X-Google-Smtp-Source: ACHHUZ7vJyhbQCgiHK1iU52WHOjKR10s7sJ9q2dHIevJPJfIjrailRySSgkAILseVsuBs/HS9WQEMA==
X-Received: by 2002:adf:f8cc:0:b0:306:2639:a1a2 with SMTP id
 f12-20020adff8cc000000b003062639a1a2mr1038310wrq.31.1683105170294; 
 Wed, 03 May 2023 02:12:50 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a5d4c82000000b003021288a56dsm32345385wrs.115.2023.05.03.02.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:12:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4219D1FFC5;
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
Subject: [PATCH 12/22] hw/hppa: add TULIP as a dependency for HPPA_B160L
Date: Wed,  3 May 2023 10:12:34 +0100
Message-Id: <20230503091244.1450613-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These are needed for board creation so fail under "make check" with a
--without-default-devices build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/hppa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/hppa/Kconfig b/hw/hppa/Kconfig
index 5dd8b5b21e..f405663839 100644
--- a/hw/hppa/Kconfig
+++ b/hw/hppa/Kconfig
@@ -15,3 +15,4 @@ config HPPA_B160L
     select LASIPS2
     select PARALLEL
     select ARTIST
+    select TULIP
-- 
2.39.2


