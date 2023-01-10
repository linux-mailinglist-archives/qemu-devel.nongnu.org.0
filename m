Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEBC664C6F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 20:26:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIay-0003L1-DY; Tue, 10 Jan 2023 12:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIaw-0003KH-EG
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:30 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIat-0001Cn-KT
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:30 -0500
Received: by mail-wm1-x334.google.com with SMTP id o15so9366073wmr.4
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tWrA1H3MbdFdqlxyQ4CmgYC/VVivnEmfuY1CfmoIerQ=;
 b=qQLSAW5PGctkKTEh+rYAhRF4FVowuclvSvXAhe4QCF0zdxorHLZe8FDKGs/W6eAqr2
 nDNsOmz0idm6O0J7EpknyDlx2UnwrXdT/ZG1BqfQd0CAc7cWvssGai2QDOwI72sFq25Z
 0KnbQX74rQvBcLyB7Qp3U5dcEbtdc5ia8MbfNfSXEdZWp8erq/ImDht73/okwDYqhTtE
 6olwFfx599dxBuhzFf/nw/27VY/kX+Z3uUhYAk3Jpyfdf10fzNbhY1BRC70wctrCnWIb
 oGloVLo2ib4mw78N9P8dYOwvOrSuTKVy5dvsqNyTDkHbvTiLGCOVGMVCWAJ3YgMRERdg
 VfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tWrA1H3MbdFdqlxyQ4CmgYC/VVivnEmfuY1CfmoIerQ=;
 b=wNKcpnezzWvdGVRqs8KJ/r0PigGq5TLUKnRD1/cVXkO2bFdo5+KeSMA+d0AOb3zWJh
 BF+xMTCmBwCroh74r4KSDthXIEoddiwwO110/pnyzc6KO0275GgIhpjgxD5ue+Tfyend
 DIXopzhR+DydZ/44s7HA1MSxQbFhL0iXsDZZmvNJa1wCpaES7pN41nMpuEXGDjMkR0bX
 QIkQTo8F7WIUClQuT6/kH0Qf14XotvX8VK/wcSafi44p2CsHXmlwITMTSiw6H5len8dB
 UyyylB9gLdiPIYerw4yOqqXVPNmF3zpuGnM7t68rZWoPX+TyxOk4FQmAInIQ2/FJQSAe
 zRog==
X-Gm-Message-State: AFqh2krfUvnWFCndXbpvQF0OxBNe61HXJGv667QQYfeHnEpXY+z9Qzqv
 NWqNcNJs7IC4jpPHziZP5Qgp9A==
X-Google-Smtp-Source: AMrXdXvYSo43EXVPVBNT9E5Ql205tHvp7NsMMHDeloh8iueT0EBCJqmduabME6vQc6GZ6j+zGqb8ow==
X-Received: by 2002:a05:600c:1da3:b0:3d3:4dbc:75ef with SMTP id
 p35-20020a05600c1da300b003d34dbc75efmr49662134wms.17.1673372365289; 
 Tue, 10 Jan 2023 09:39:25 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a05600c3b9700b003cf71b1f66csm18055801wms.0.2023.01.10.09.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:39:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 131CB1FFBB;
 Tue, 10 Jan 2023 17:39:23 +0000 (GMT)
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
 John G Johnson <john.g.johnson@oracle.com>
Subject: [PATCH 03/26] gitlab: just use plain --cc=clang for custom runner
 build
Date: Tue, 10 Jan 2023 17:38:59 +0000
Message-Id: <20230110173922.265055-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
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

I think this was because older Ubuntu's didn't alias clang to whatever
the latest version was. They do now so lets use that and not break.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index abeb33eaff..725ca8ffea 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
@@ -81,7 +81,7 @@ ubuntu-22.04-aarch64-clang:
  script:
  - mkdir build
  - cd build
- - ../configure --disable-libssh --cc=clang-10 --cxx=clang++-10 --enable-sanitizers
+ - ../configure --disable-libssh --cc=clang --cxx=clang++ --enable-sanitizers
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
-- 
2.34.1


