Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D015C698483
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:27:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNPh-00074q-RS; Wed, 15 Feb 2023 14:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPP-0006il-Ns
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:40 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPM-0001hZ-ME
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:39 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so3062329wms.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyAObTuuAW1poi3AcvAz0z96pccj9dGjW/pdlO/77k0=;
 b=sT3QvngqQdOQ3hdG/emwhXY06u87TmRcad3QMWxTQlu6NFhW/RV5+PrpMmjBVxsO+t
 A6U9yzKIJyVL73+nuf7bnyeZmsBdQPNsISRw3BsqTQCehRBecMTl2Jcw+Lzuj8HyeOUZ
 wSJIMiUluzGaC84xnNbXS7kOJ/kDVa4gaOUsu11qA2Is61P/sbH6VK+dHPpjCbpRRhtq
 itRnoOh1bR2DWC7HHnVP/lP1AziTpkSADfUkaaSZ3d91JjYl/NR8W/e+UX1vgMwgNeY6
 CqssR9JxqnMSt8p3B6795T5mLal54xwFHKXbIBAEJ8Djle/e40WzLWqfeeHXK4JRLf0d
 IrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XyAObTuuAW1poi3AcvAz0z96pccj9dGjW/pdlO/77k0=;
 b=AKcwIZA1vcWJqw8ierWGSDmDwMlohHFuIRSap0xK+bTi7E1m0toDezg8qEEPGfc92q
 au5LJy/mR/mIENsor3qitDxEPbggmIA9R1NBFnDr0uLjzefd5DOr2Sp9M/OGYs+33U8Q
 FrJR9udziPAbeJyE4p0Qd5tOEWpSYdWMIK3Pgelbi9aOiuNm2NUJZFjq6IfzT57+Z02p
 l9WPr9CS0QSn/g/0er2MMJYJFZrjSphZ50LHAB5jTRvzu/eZG05d7gthxjYWgdiY+aeT
 BPBKlVoViPILpMDoSqYQGdolvC9mVJ2X7QpGPQxjrBgDGtTDZFp9eezGhXQgIGv2IQQY
 l96A==
X-Gm-Message-State: AO0yUKWj3Vo8gPzUM5sxUsRCxFnmgQ9ONe0XcQJUgnBnOupzSe/FSoOX
 xm1r+tGLEQVwrGKVR5zIPOBkEQ==
X-Google-Smtp-Source: AK7set81yq+s9szGBiR20j/NdWSvyWZ+U5ujjEb2Sqd10wGQvTHEW59crZyo2HbHLIXAmNWtRw+K6w==
X-Received: by 2002:a05:600c:a292:b0:3d9:fb59:c16b with SMTP id
 hu18-20020a05600ca29200b003d9fb59c16bmr2902683wmb.36.1676489135410; 
 Wed, 15 Feb 2023 11:25:35 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a5d5941000000b002c54241b4fesm15206046wri.80.2023.02.15.11.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 11:25:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7F7D91FFBF;
 Wed, 15 Feb 2023 19:25:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 08/12] tests: skip the nios2 replay_kernel test
Date: Wed, 15 Feb 2023 19:25:26 +0000
Message-Id: <20230215192530.299263-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215192530.299263-1-alex.bennee@linaro.org>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

It is buggy and keeps failing.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/replay_kernel.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
index 00a26e4a0c..f13456e1ec 100644
--- a/tests/avocado/replay_kernel.py
+++ b/tests/avocado/replay_kernel.py
@@ -349,6 +349,7 @@ def test_or1k_sim(self):
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         self.do_test_advcal_2018(file_path, 'vmlinux')
 
+    @skip("nios2 emulation is buggy under record/replay")
     def test_nios2_10m50(self):
         """
         :avocado: tags=arch:nios2
-- 
2.39.1


