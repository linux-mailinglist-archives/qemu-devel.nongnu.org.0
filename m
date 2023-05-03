Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AFB6F5490
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:23:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8hJ-0000q7-Ap; Wed, 03 May 2023 05:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8h4-0000Im-Kp
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:22:38 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8h0-00065Y-QL
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:22:37 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f182d745deso47699895e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105753; x=1685697753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yWRDmm4fTQGdVDGEVeXWjAX3jawozx4yERCbR87qEzg=;
 b=ddaiVAnqjv5xatOGEvKXpOWM8IThcWUAUr8vUkycCzJQuDeCeONQIBIDTPWCIkH/1V
 d+QFRXZmX6KXVJB+j3uOBlsm4sOOGRzFYxbqHWMdgtM9p2Du70Mlh77AA9q1kYANblME
 J5cVz1Tku/phZMYYgk8p7phD4HupbJrQLYG+ie68txRZnavHG78RVyqftlFflOdWoaYI
 8uQYg7hTrFjAJCRpOdQ2wYbNf6gw886L+Gp3StBdB/MYaSoaHGnU4LLuXvIi5/FEr+sy
 NBRA53EAikLdyc28nmTtv0gy3cLiyDDgwq8NcCqXj+ApHzjR5AmhcEjgjn3OE0mNkgEa
 BF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105753; x=1685697753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yWRDmm4fTQGdVDGEVeXWjAX3jawozx4yERCbR87qEzg=;
 b=REuYuuYleYOSi9DDZYjTl0HTZBzevPYlLgtL/ug/FfbaMn85Gf4IiPXRK6LrvKJzsZ
 tDKhvpYqwrMn3kIM6Oc/BkHr9y10OIcRQQk5hKWfDIE5py9TloJFf8EoDe3c+FL5CYha
 o/JP67hxOm8jbpJiSCisTmeYfQdgxBs7hUyr1dCr6WSqqxfhODE1o+b/godMP+4Zwk3h
 1HO1nD3xiy8ctdc/Y67F2Wget3A+hwUeH4cKVEOaIXTzt98OvlpbNQt3qCt4SITBlvRN
 fxm1ygKU3gMZuShYXMegp1LvebG/5ZKftSY6NaSk6vst394poG3X0EwovrYoXR3g3e/1
 tLlA==
X-Gm-Message-State: AC+VfDxJfWgKH98YYo0IokUKYwXwQHgLykzAHvlCC94DQIn7yQLR6F+Q
 U0PZZUCi+IRPkJMLNIdyTBMiuA==
X-Google-Smtp-Source: ACHHUZ6f9ORtClX3It3EOKJCLfrCo9JRmxhpxbh1Ln+puwTo3Ki8/L/wekikR3Xfyc21l89U8UNvJg==
X-Received: by 2002:a1c:750f:0:b0:3f1:661e:4686 with SMTP id
 o15-20020a1c750f000000b003f1661e4686mr14401010wmc.7.1683105753302; 
 Wed, 03 May 2023 02:22:33 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a5d6884000000b003062d815fa6sm7655998wru.85.2023.05.03.02.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:22:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A34521FFC7;
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
Subject: [PATCH 16/22] hw/mips: add VIRTIO and USB dependencies for LOONGSON3V
Date: Wed,  3 May 2023 10:12:38 +0100
Message-Id: <20230503091244.1450613-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

These are hardwired into the board so must be selected. This shows up
as a "make check" failure with a --without-default-devices build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/mips/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index da3a37e215..0fcc3da41c 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -45,6 +45,9 @@ config LOONGSON3V
     select PCI_EXPRESS_GENERIC_BRIDGE
     select MSI_NONBROKEN
     select FW_CFG_MIPS
+    select VIRTIO_PCI
+    select VIRTIO_NET
+    select USB_OHCI_PCI
 
 config MIPS_CPS
     bool
-- 
2.39.2


