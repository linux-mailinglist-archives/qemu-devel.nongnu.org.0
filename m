Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E166D0665
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 15:20:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phsBg-0008LG-7Q; Thu, 30 Mar 2023 09:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phsBW-0007uG-Tm
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:19:24 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phsBU-00022j-Lt
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:19:21 -0400
Received: by mail-wr1-x434.google.com with SMTP id m2so19054675wrh.6
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 06:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680182359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hLMvNuV9m+vGoYBzqYhhlHDKS4XBdozQbF/ABoeVmps=;
 b=VnyZ+TcRxuX99uNbCKeRZg7FhEE509QXf1SS33Ac3Ca+75J+il4M4fhrdC5okwHSPh
 4nl8s9LcvPJcLelLRiOBGcvz98MGWaOKb+krbet5aBMRZJp21uxZI1VghuoHP0gOnR2z
 EiERgIhooz8X7ZnLHrVvsckG+TzKEhkOqUHmGmlzCRAFU+1jo4BMOtsgesT/x4htmj90
 CLBDJVzli55LGQqmtXh0S4C00ceOOn1Mjl1LQcomP6BFILsbcAGDxJAKnyGjG1WEdHYN
 Xx4WThaNoNmf8hfne1WKbQSd2SAdAzr+w2JdF2YAJUp92uKW60Ur90PrQgxZ45WUUOoF
 BSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680182359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hLMvNuV9m+vGoYBzqYhhlHDKS4XBdozQbF/ABoeVmps=;
 b=Kw61ZB+vYddiMTij2975C5DL5nNtlrA0ZBt68/St65sBJcr8QFXDv/TQ/SRHIp1gYL
 SgWOBDHIPsAgIucAsJ4gt0yiYWPlkPWUHLBd5HOaTDb9sOW2ZsTY5cPKRAQzEdGxCkb1
 EJLQYiFx6s0FSv3AlRANg57VGbHuhK8HS+HDlhZ2mRyg9JqzP19p2ddaAuYGzzcs2djF
 hBacE+5DvhvVuALtaTrVbogq+WYv98xDfdZsFx9NmwZve7/FCHk+lS+RCpI68jFTF1XW
 oNz85OXIhex6feLWxCADg0Q5+hXTG1AnUNPsx8nGMW8pQMdCmsdVl3LfsqNppHxE28Zr
 fT3g==
X-Gm-Message-State: AAQBX9dNAQTbPgDmMxnoEhS3LABSeOn+uIGzq+Z5TYOZjagoDG/CD77U
 xM6vov2VLQnih+Dk4LMv22pxP3g+8GU2Jfp0i6M=
X-Google-Smtp-Source: AKy350bQHFq3EE4XMROSlzfQgq2LT/V45+MLVsoZB2LiJi4IhCSNLFsS7As25oF2xPf+nV4brhnP/g==
X-Received: by 2002:adf:f0cf:0:b0:2ce:aed5:7dc with SMTP id
 x15-20020adff0cf000000b002ceaed507dcmr17714530wro.68.1680182359219; 
 Thu, 30 Mar 2023 06:19:19 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 b5-20020adfee85000000b002c573778432sm32650792wro.102.2023.03.30.06.19.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Mar 2023 06:19:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Titus Rwantare <titusr@google.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Subject: [PULL 4/6] tests/avocado: Enable TuxRun/mips64 (big-endian) test
Date: Thu, 30 Mar 2023 15:18:54 +0200
Message-Id: <20230330131856.94210-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230330131856.94210-1-philmd@linaro.org>
References: <20230330131856.94210-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

Now that the previous commit ("hw/mips/gt64xxx_pci: Don't
endian-swap GT_PCI0_CFGADDR") fixed the issue accessing
the GT64120 PCI config-address register on big-endian
targets, we can enable this TuxRun test.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230223220404.63630-1-philmd@linaro.org>
---
 tests/avocado/tuxrun_baselines.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index c3fb67f5dc..d343376faa 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -270,7 +270,6 @@ def test_mips32el(self):
         """
         self.common_tuxrun(drive="driver=ide-hd,bus=ide.0,unit=0")
 
-    @skip("QEMU currently broken") # regression against stable QEMU
     def test_mips64(self):
         """
         :avocado: tags=arch:mips64
-- 
2.38.1


