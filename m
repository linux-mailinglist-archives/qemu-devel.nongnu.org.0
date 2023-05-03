Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427E36F5433
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:14:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8Y9-0005Hb-FY; Wed, 03 May 2023 05:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xo-0004Nf-6p
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:13:07 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xc-0005lw-Hh
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:13:03 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f315712406so15392565e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105171; x=1685697171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UssL+Xd37S4dKZ++H+2Hj+q6XSQOYdxd4wKYV/4po58=;
 b=kOrDR1WKZsjUwMQigT9FwIqQZtq/DO04u52VZ5xI26FLIgM2g6bVPW0z6jJzcWyC4l
 o++tL50jTGlSAo5qhzStE1hhYkm7M2urfrnZ1zAiNuTh0zOHP0ow2+O2PMBrzLZ35qHB
 EoSB7f3eRNq6juO+RUgrL/xM09WY/fkkFNsAg9PapMCQsR1qMHHzCKRgUPt5Bn2KxD7p
 lPVhHl8LmJztahqOfJ8ue7cTeFRxEs4S+i2oebH02VgC1HzUHYn4kYMTwOGsyAn/W3Er
 NM+IqJn86QfsiYffsZX9bZ0qedf7POipvvUmvuBYCj5Nqi1ydQc7ZOOwlUeO84MkCvwx
 zI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105171; x=1685697171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UssL+Xd37S4dKZ++H+2Hj+q6XSQOYdxd4wKYV/4po58=;
 b=XVmJhlZ+uGGdWYl9I3ybP7v/RM6embQfrkbNDI+0B6oHvZE7ACtxoRpDpeVJ7ddacq
 671yGGr4ac3i6MXn5B72E1zmVDkDsRv3ww1A2gaA61MrSLU7SCSYDbzUTAfHf073LXRN
 93hXo4LcVDNy8m15IwLJywfB7SSHVbpl8m7eHXu8zwvtAnum63zREsQmmcjN8miSGCKO
 ejA242dQbhQzz52GSYjz0X7vjRbvZcL/NgpEZQhAStGcjNwx2PA2Fik2HfYy69M7ntll
 P081VdyN7n9UiRUDO+Mi7m+TGeaRvP3G9zzT3/ko5TCP+vfnRn5kP4cvujZBYgg2kmu6
 GxOg==
X-Gm-Message-State: AC+VfDy7N+u68rI1B1k8GyEuw+ZFyZmn1QC444gOVm5/SZD1rIxRbuxv
 3B5YSHcL0Eagm6QgIFj88rREVQ==
X-Google-Smtp-Source: ACHHUZ7ZEtQY6wUqhu7NqNgSn/z0o89mpK3mt6Q5CyeGvS/tyxSm+JdmyN2P9dsmEaD7v8g4QTfA4g==
X-Received: by 2002:a05:600c:1c82:b0:3f3:fe24:609c with SMTP id
 k2-20020a05600c1c8200b003f3fe24609cmr581780wms.11.1683105171523; 
 Wed, 03 May 2023 02:12:51 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f046ad52efsm1249169wmk.31.2023.05.03.02.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:12:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5B4DF1FFBB;
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
Subject: [PATCH 13/22] hw/sparc: add a TCX dependency for SUN4M machines
Date: Wed,  3 May 2023 10:12:35 +0100
Message-Id: <20230503091244.1450613-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

This is the fallback VGA devices needed for board creation so will
otherwise fail under "make check" with a --without-default-devices
build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/sparc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/sparc/Kconfig b/hw/sparc/Kconfig
index 79d58beb7a..721b37a9ca 100644
--- a/hw/sparc/Kconfig
+++ b/hw/sparc/Kconfig
@@ -15,6 +15,7 @@ config SUN4M
     select STP2000
     select CHRP_NVRAM
     select OR_IRQ
+    select TCX
 
 config LEON3
     bool
-- 
2.39.2


