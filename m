Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8136F08AE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:48:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3oE-0001s6-29; Thu, 27 Apr 2023 11:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o4-0001oU-Mh
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:18 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o2-0004iw-9U
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:16 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f19323259dso74608325e9.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610313; x=1685202313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G81MgRiGIts/A6nA0K+cz87dFeXnPcfbunuD/xKLhHk=;
 b=wFrC++d3Tgi2zn1i7R0Htq2qLimfNNOnYM/Cd9I5vD+cL6/b64qoAg7oawLixvqEbD
 Piaw7fNwT8qQITnmhBGld/eZ5rou/dVMS2cMKb+P0CTqGGljc5Ab+lGmj9/CowEXLTz3
 8o2vII+B4xiMr0hSKgfNARlKJz3HaID3Z7M0iBiwaTZFiBJP2Y2zx6v8aNa43mni+Bv6
 FRe7afRt4Lr7CS3ZYnaF79GuztzQqw5lCKs/6mHcxGaUR4U+7gSrDQJ1GVSfCo1kZj+W
 BnuvuSKPwHqCw33q8ou5ID8xUglibIP+8trAGy2HHQrDd3kkFqFU0k5+bufWw0MbmuTC
 xIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610313; x=1685202313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G81MgRiGIts/A6nA0K+cz87dFeXnPcfbunuD/xKLhHk=;
 b=KSU3uSxNx9yswUQhcNNk2PeAI3s/dTpCGItLQBobtobCH8xP1RO/68Vi9cTaRipi5c
 X7fspsc1lg7Og3BApGrg64ErGcswfn40aCFXYg43GrkR8MTN8SKwI8jgjlrJu2s4eLBW
 1WwlCUHVZyhbLNJCWBelnTblQpm4NLgTqUze9YPRNiFX4ET6SjfwGaqURGMeya5wtd/F
 APM2He9XlH+40Fdptbg4lAD3ukDcakhNaoiVQBdqYJ5o3jgr7ckrKnNV4/neWi1dDBUZ
 nRO75ggMkX9OHBzWrZwypC4Ey80XPF3pVd0BYi5YvDond5G0gmGfL7gLPWSxeW1Ekdzp
 /3/Q==
X-Gm-Message-State: AC+VfDxxsDSNGENirYxh7EAuzHbHo67DopbTW3MS7OF2Xrdh3zrEQD2p
 N8nvS7qi1rNciWtHkCllVNAq8Q==
X-Google-Smtp-Source: ACHHUZ4tj27KxXizT9+UzrGhhBcKNkczF2ah4mcA1nmLhPGNg1dYmgdAv5vE6OHWhRW11h+EqKlBXA==
X-Received: by 2002:a05:600c:28e:b0:3ea:d620:57a7 with SMTP id
 14-20020a05600c028e00b003ead62057a7mr2111876wmk.8.1682610312667; 
 Thu, 27 Apr 2023 08:45:12 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a1c4c13000000b003f173419e7asm21518496wmf.43.2023.04.27.08.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 08:45:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 22C1E1FFBC;
 Thu, 27 Apr 2023 16:45:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 04/18] gitlab-ci: Avoid to re-run "configure" in the
 device-crash-test jobs
Date: Thu, 27 Apr 2023 16:44:56 +0100
Message-Id: <20230427154510.1791273-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

From: Thomas Huth <thuth@redhat.com>

After "make check-venv" had been added to these jobs, they started
to re-run "configure" each time since our logic in the makefile
thinks that some files are out of date here. Avoid it with the same
trick that we are using in buildtest-template.yml already by disabling
the up-to-date check via NINJA=":".

Fixes: 1d8cf47e5b ("tests: run 'device-crash-test' from tests/venv")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230414145845.456145-2-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230424092249.58552-5-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index ba6f551752..333eea9dd3 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -102,7 +102,7 @@ crash-test-debian:
     IMAGE: debian-amd64
   script:
     - cd build
-    - make check-venv
+    - make NINJA=":" check-venv
     - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-i386
 
 build-system-fedora:
@@ -145,7 +145,7 @@ crash-test-fedora:
     IMAGE: fedora
   script:
     - cd build
-    - make check-venv
+    - make NINJA=":" check-venv
     - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-ppc
     - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-riscv32
 
-- 
2.39.2


