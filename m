Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBC26BF9A3
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 12:48:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdV1S-0004nR-K2; Sat, 18 Mar 2023 07:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1O-0004lP-Bh
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:50 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1M-0007Cb-0I
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:50 -0400
Received: by mail-wr1-x432.google.com with SMTP id p4so6495849wre.11
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 04:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679140006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B6zGJoVeKFYAhyoV9aUUZF5EezFXIRrgXHiT39hie2Y=;
 b=SD3G5J4KMId/+7/remHEa3logAcpEOBvJSZ63hJZqHzHIXaf/o69pwDR931YxTm+3Q
 asxYkdoTZK/el/Ga8+wr8EHayG19iZu9nToSTyeGAYGtKdlv8k1ivf9lPT2JXUj48SKD
 lZfaPsLGj/udRGbwG54OxJvCGPvxwK7F9RKVf90ptrwcmuduOYRrUc/aPjMW5NQJ6Azm
 kyhXNj+uUozRHFF4SX1j9LEwqiaLXtHknJAJiRaX3Mw+HQaOvshMQG58+CY64Fsdhz7k
 O0h2+r8Oo8ToINYYJRMsVyIe/PdbegHSeG2Z8Apip3bfi8p+FAYOsb3EHM9XXpxdW467
 aUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679140006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B6zGJoVeKFYAhyoV9aUUZF5EezFXIRrgXHiT39hie2Y=;
 b=TA771q5KxI7ThNxp77pQL0dOK4/qpxnt99jaJbYkfULdneL2jJYsXuKFtina7F2Mnf
 Y4RCd6zAXpWdcid0P8FqxjB/fAjLitjxgBZJl2bGFsQIOwZKf7xNdbh0QrxWlZllwFmD
 zCupbx90D8D3nFSCf8+BEimIOqKYygciUXCKImfBtgszBeyg/28DxQ/ODDy0JHQtIYPq
 +pVmMqU+Q8kXdKXFQbMUFSkY4SAkR04lTuDVLB7yfEFOsAe8ir5DpfFPv+BzvHS/HQCN
 grMMeEwkVXo1MLCnrLbsb8gF/hPUuvi0A7aeq6J6h5rLBkJlKlNqOHi2UAfrUv6j/+AB
 C9Qg==
X-Gm-Message-State: AO0yUKX5pbNjnI+BqRnTLVx6NKdcqBGH3PajEB8Ceyifo0kQW3iSa8xy
 J48nd+as1Eixb/ILx3tCqD1TcQ==
X-Google-Smtp-Source: AK7set+cTKFYlM8xnHIHUy6/wq0evb9LFqhKgvuNumqFl31PEhbPr0/rodwkUXYf7h2xWizZ/r+gag==
X-Received: by 2002:a5d:5090:0:b0:2ce:a8d6:5427 with SMTP id
 a16-20020a5d5090000000b002cea8d65427mr8993963wrt.15.1679140006629; 
 Sat, 18 Mar 2023 04:46:46 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u8-20020adfdb88000000b002cff06039d7sm4162112wri.39.2023.03.18.04.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 04:46:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C2E951FFBA;
 Sat, 18 Mar 2023 11:46:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 02/31] tests/docker: all add DOCKER_BUILDKIT to RUNC environment
Date: Sat, 18 Mar 2023 11:46:15 +0000
Message-Id: <20230318114644.1340899-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318114644.1340899-1-alex.bennee@linaro.org>
References: <20230318114644.1340899-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

It seems we also need to pass DOCKER_BUILDKIT as an argument to docker
itself to get the full benefit of caching.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Suggested-by: Fabiano Rosas <farosas@suse.de>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230315174331.2959-3-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 54ed77f671..9401525325 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -39,7 +39,7 @@ docker-qemu-src: $(DOCKER_SRC_COPY)
 # General rule for building docker images.
 docker-image-%: $(DOCKER_FILES_DIR)/%.docker
 	  $(call quiet-command,			\
-		$(RUNC) build				\
+		DOCKER_BUILDKIT=1 $(RUNC) build		\
 		$(if $V,,--quiet)			\
 		$(if $(NOCACHE),--no-cache,		\
 			$(if $(DOCKER_REGISTRY),--cache-from $(DOCKER_REGISTRY)/qemu/$*)) \
-- 
2.39.2


