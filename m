Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D2267C9C6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:23:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0LL-0001dX-Hh; Thu, 26 Jan 2023 06:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LH-0001Qu-Qz
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:22:55 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LF-0003ZJ-SG
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:22:55 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r2so1418097wrv.7
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D0JFQN/51pRFc3qNTyiffpOYu7KU2O9q0f5EjNXPtwc=;
 b=EzTZP4EahKslCdRWpl9tOgpHXJbBX+9pFWJ2tTumttErrOYX11ASUGbEZ+XWTtS4as
 jHhChSb6CZPS/7vZ+ycfWFk0Nz9TvCSNCkbvAzTNVYd118V6fpZ3TvH70GLrG3ju7LZP
 XYeU2K3no2G8eHQYa/B0HOh+LdRrco9+AILScK6JNW8F/buLiqb8hKI2IN+gybqWYNvc
 A/dWmyzerv0LpN1sOPLmGROniNNLJjR0eGSouH8qKwyUy0uLPHXWCmS+qvK3qWCdH3kl
 uq6lmLua7+kt6kuIaYnFhsG7GaGZlpqutuz3o7IYOxAxEk2dtqDEvwPfw3+Z3U3Ifzpo
 0GOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D0JFQN/51pRFc3qNTyiffpOYu7KU2O9q0f5EjNXPtwc=;
 b=TsDugQ/vRxXD73/Px1MWsPApwZ7ispfR8riVsAVE9KPGCEDYRilaqCz2VsLEHNHoO8
 fiweIPUihqqNO5HBt5F2636BquJZuF394VaWJAUFdoDYae5ElJPmQoy5zxn0eR/u2X3W
 2GuiwS1OxhUagSdglNkNm7JIiGKNuLpR6Lxem1zOqubnGBhQi+u5mQT422JOJxpUuXmr
 Ehy0RI5ZWbPpGGYONPKONU8KGNZ48GA8CJjrt0D/jfcsBhSb6wuRYhRIHvew6jw4iG0J
 9CMrR/NVUaHzYe4hDKx/3Qu2t+1XTe4CM1Zw30PKKKRrIUreeJa+VBrnty9NUGjhT3oB
 JCzw==
X-Gm-Message-State: AFqh2kqNTX04c7pW5iNPYxhKsscfSxwfC8T9xGsS82GI0rcotAlBiAm7
 7nAuaW73SrdU6A7yoaRP+1WrJw==
X-Google-Smtp-Source: AMrXdXuukYliBm9786omCJL9ODrpD9dxXo/p52YsaQmfWDHa/IdEgHLZbnhBUPZ+giBQDPMYUFOlUg==
X-Received: by 2002:adf:f4ca:0:b0:250:779a:7391 with SMTP id
 h10-20020adff4ca000000b00250779a7391mr30981607wrp.47.1674732172200; 
 Thu, 26 Jan 2023 03:22:52 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a5d508b000000b002be099f78c0sm996655wrt.69.2023.01.26.03.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:22:51 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 511CD1FFBA;
 Thu, 26 Jan 2023 11:22:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 02/35] gitlab: add FF_SCRIPT_SECTIONS for timings
Date: Thu, 26 Jan 2023 11:22:17 +0000
Message-Id: <20230126112250.2584701-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230124180127.1881110-3-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
index 69b36c148a..50fb59e147 100644
--- a/.gitlab-ci.d/base.yml
+++ b/.gitlab-ci.d/base.yml
@@ -6,6 +6,11 @@
 # most restrictive to least restrictive
 #
 .base_job_template:
+  variables:
+    # Each script line from will be in a collapsible section in the job output
+    # and show the duration of each line.
+    FF_SCRIPT_SECTIONS: 1
+
   rules:
     #############################################################
     # Stage 1: exclude scenarios where we definitely don't
-- 
2.34.1


