Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C0C6BF99E
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 12:48:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdV1S-0004nU-OC; Sat, 18 Mar 2023 07:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1O-0004lc-KU
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:50 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1N-0007Cp-2s
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:50 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 bh21-20020a05600c3d1500b003ed1ff06fb0so4797892wmb.3
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 04:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679140007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l3IWUt4qXm1Qaj3/bmr93AtpCAQ5kYqJ6y+KW2Y6E4k=;
 b=vySbmrfDjFNg0WWgjJfClY/ekDHLwLttsXYQ2xXvhHoLTs2nmh2i9IMM3O0URi3gy2
 OMZ0aE9J+Fq5sCXfRKPN9j9CXTgQ6f+LL2z5RX9A4p1KWDsw0IIgWYBsdTn/tmKB9p1n
 nSRdpO0tdDuCY2YWtyzZmVpuQoLo370yp8TVkZCAK9DTk/naFKcQHZeTDhtEtVj6M0+5
 yBKKV57rHWDn1cG5CLHcdZ+S3hWduDj8d1kP9wYCumav2TaEEWkcQ93S7Xc4sMnm/seQ
 dkvtt1ffepOp0RXzR/ziL1V9pdptnp+TsosFJdRoOxQOxUm496uk+4FD0A+xTSoiDzZm
 2kWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679140007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l3IWUt4qXm1Qaj3/bmr93AtpCAQ5kYqJ6y+KW2Y6E4k=;
 b=OgX22EFu/dvqTppQEKYaTbdq1tgBQYZtHqYV18WiBo6wWhPKYGaBuYDl3eNCvYiJ5+
 PbKifPbisoCVDsxSIkwtGVIpLFyBpe2NaAILbYfYdT3ZHmJEyI7Cv0EwjslOW+TORvgP
 GRBV0Etj3u6d78OcjL0DaLswgGwpetK+Om8PtRVF28R94IOTwIekUM7L6d7IIPcHrFnk
 8yPNr96ZfnnURqqH6sKaVWC3I/OpvAhJmGMmmyavpDyV6M6+88ZYHyZWyom9pWizLPQf
 bDQaiIShgrePKxAvTLTrkAvaiDNjG/uhB+Z3ZmPOKDc7kcPtDliDkiO4GO4QtN3kd0TB
 EsHg==
X-Gm-Message-State: AO0yUKWfQhinT+xUj405KKyzzEs4xWc3xDqs8yl2CaH+84zsZK+MQVUn
 tLCU7jN2FssGdAZ8+DTkrRpzlQ==
X-Google-Smtp-Source: AK7set8+llslN04dJBZ7ARfftDfwNHUWwQzs5DSCq1cQITrJnNMSh3Zqan/khEE/3EKMr/YTla8lnQ==
X-Received: by 2002:a05:600c:a41:b0:3eb:9822:f0 with SMTP id
 c1-20020a05600c0a4100b003eb982200f0mr28757221wmq.30.1679140007574; 
 Sat, 18 Mar 2023 04:46:47 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a1c7516000000b003ed2357f7f1sm4568656wmc.37.2023.03.18.04.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 04:46:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3FD411FFBF;
 Sat, 18 Mar 2023 11:46:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 07/31] tests/tcg: add some help output for running individual
 tests
Date: Sat, 18 Mar 2023 11:46:20 +0000
Message-Id: <20230318114644.1340899-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318114644.1340899-1-alex.bennee@linaro.org>
References: <20230318114644.1340899-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

So you can do:

  cd tests/tcg/aarch64-linux-user
  make -f ../Makefile.target help

To see the list of tests. You can then run each one individually.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230315174331.2959-8-alex.bennee@linaro.org>

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index a3b0aaf8af..8318caf924 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -201,3 +201,10 @@ clean:
 
 distclean:
 	rm -f config-cc.mak config-target.mak ../config-$(TARGET).mak
+
+.PHONY: help
+help:
+	@echo "TCG tests help $(TARGET_NAME)"
+	@echo "Built with $(CC)"
+	@echo "Available tests:"
+	@$(foreach t,$(RUN_TESTS),echo "  $t";)
-- 
2.39.2


