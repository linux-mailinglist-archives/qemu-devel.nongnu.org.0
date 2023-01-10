Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6242A664B7A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:45:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIav-0003Jc-NY; Tue, 10 Jan 2023 12:39:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIat-0003Ir-Od
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:27 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIas-0001Ce-9N
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:27 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so10700607wms.2
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Ym9gdSPhZxMkyn4UTQeALU+Eaq7pKLjjgJFPFRFMFo=;
 b=IwMri1UroJmqHHjGkSCCc4vj3TAjqOnAE7F6UGLMCNnr/x2Uo6+FWheQqvFnhRZEql
 l1XdRHbMNcEx40WrV3fKDbxVcirzk/rJSf/a9vr/dEeX+YunbZFtAy2gjrMZPI+wp/Hv
 aFhSWtwdlVw8ujSfRWVOyeXjAvYg9n2Nx/x9bTkS+xL8c7FpIghRMXYu6HRToTd3Gm6G
 88P1WM+LUVf3pdYoEwtzDRrVntyHBbavJqmmZf5B+m6qoR/1us8PGdfBlSRH9N9WiJL6
 lJ3uyjOefOIrDVjgEiCVUq0jeWW9CfeXIJf+FOaRTpz8Jmr+x+olrpZd527Kj6zZa6v0
 NCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Ym9gdSPhZxMkyn4UTQeALU+Eaq7pKLjjgJFPFRFMFo=;
 b=LFEFzPOzixTF3mWBgQCen5BqbtDesWTIi2TT5FHID2XDXh8f+k4g0FATU211IGwYl5
 K2KlF9PJCusK6PnwcHD4XhcJsfvGL9YnY7Jk/Ex9DccxvCrqW5XKY+tgjW5u/+Zdg191
 fENSuhjKLCAA5jNlDaENwiSQzBNUHTt7VC4o9xbXCzEx4Kqj9xae5EeJ96T2dqotRflD
 eKdLxK1fsWaW2xx6Z0peI9Wmg+nVbiuW2/KFMBhWySdHum3dei+vWMt2P/X321eb1ufo
 tJWAXqSRSgqE4jmcelXDGi94Huag4IPPBmTgIIeRnQfFWrmrldf4P1/Z4uvVIVWovKTa
 2DYA==
X-Gm-Message-State: AFqh2kqDN/JOgh5lFzCOUUuc+JWYKiN6L1UMaRaqaDY7c8pw3pHTIsK1
 XvxiMir2loB4LRt305fKAatJTQ==
X-Google-Smtp-Source: AMrXdXsJgiRxExaYQEPmIWCb5+AokHaCzBRfopE9ukbMMeL3bQyT4w2iidJ7sOjjJtuA0aRnAlj86g==
X-Received: by 2002:a05:600c:35cc:b0:3d3:3c93:af34 with SMTP id
 r12-20020a05600c35cc00b003d33c93af34mr60557033wmq.2.1673372364626; 
 Tue, 10 Jan 2023 09:39:24 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l36-20020a05600c1d2400b003d9fb59c16fsm2455833wms.11.2023.01.10.09.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:39:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EE1101FFBA;
 Tue, 10 Jan 2023 17:39:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ed Maste <emaste@freebsd.org>, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH 02/26] gitlab: add FF_SCRIPT_SECTIONS for timings
Date: Tue, 10 Jan 2023 17:38:58 +0000
Message-Id: <20230110173922.265055-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/base.yml | 5 +++++
 1 file changed, 5 insertions(+)

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


