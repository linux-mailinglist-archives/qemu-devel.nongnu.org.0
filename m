Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9FA6C3ECA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 00:52:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pell3-0006d6-PV; Tue, 21 Mar 2023 19:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pell1-0006b0-TK
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 19:51:11 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pelkx-0001Qp-II
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 19:51:11 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r29so15332914wra.13
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 16:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679442665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lZwor3radjJTn8NWLwZnwml44EZNNFLqjZoROoK7krM=;
 b=w0PU73c+oatiZlnU7KUE9zvfpKub3nKDdS1KlKJjr7KEKILgvLdok3a3pupq6YCYVW
 vsHiRk/tgiuFw5g13rlt/xtYqFyt5M98UdeO40UaCJ2IvJQOKHqq64IzpWeN2AsVNu05
 WX4BKQBj42jXZ5mkzD281YMxqDtSnPYHjJ1uArNXcJJRjo5GLerSemnjSd+fgcLZ8WgC
 7pRodgM8RrENTClPG9piEfzgLjcLuAgWUH9+DtW6HPOFViPJMXdHebcqIqkjJhxK3vt+
 mZJe2TWpm6C/i7QBBMoVAyt3oz9kKcUmu5CHpVW+od/porJavqz20j1pisk/dnBabZKB
 sgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679442665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lZwor3radjJTn8NWLwZnwml44EZNNFLqjZoROoK7krM=;
 b=3KxaPzvs7VmvYeEGnNhDgTyEUw0KZoASSqoSxMFi0kx/8yVboA12V1/KlZ1DfsBzxs
 qT11dqwV2lHp6fNZRE72mtHTfGvFKQvNkZUaM7P0tZB7++k6gNj7fZv3J1JM5rSPkqTj
 32uvjw2453eIaq44nw+4455gWpvC3/4EL5ojq1GswuF3yjJHdRHJoeDszmFm42bhha8Q
 m4qBB0el0gdv2o+DMJq8xEO3NWr6+mgzVDyHwK5tUfM60GkVHz3Svii+cVBOlrbgexUu
 VBaIRzNOSiXVQ1brUJfA0b/yrD/IZMU5PO7xsNwRrCKOsAEMqORraPzlnfHydWuX5RrF
 Ruwg==
X-Gm-Message-State: AO0yUKXRN41U80RtlCJMhuPmvb/WyC+uy7r0Sk0DDTcaLh50rvUXTjem
 pOxpv3fdOAcJWlhMukXsTnp7eg==
X-Google-Smtp-Source: AK7set8Q1JovlnenQk0SR1zqLJZYLLNdTqTjASCGxyWZ6s9+8V4GGcJ5LRQ3z7SXjdNabcJpBaHmUw==
X-Received: by 2002:adf:f542:0:b0:2cf:eeae:88c3 with SMTP id
 j2-20020adff542000000b002cfeeae88c3mr3869135wrp.32.1679442665343; 
 Tue, 21 Mar 2023 16:51:05 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a5d6082000000b002c6d0462163sm12360940wrt.100.2023.03.21.16.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 16:51:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D7391FFB7;
 Tue, 21 Mar 2023 23:51:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org (open list:Block layer core)
Subject: [RFC PATCH] tests/qemu-iotests: serialise all the qemu-iotests
Date: Tue, 21 Mar 2023 23:51:02 +0000
Message-Id: <20230321235102.3832417-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

Something on OpenBSD fails with multiple tests running at once and
fiddling with J=1 on invocation just made everything else very slow.

Based-on: 20230318114644.1340899-1-alex.bennee@linaro.org
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qemu-iotests/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
index a162f683ef..d572205a60 100644
--- a/tests/qemu-iotests/meson.build
+++ b/tests/qemu-iotests/meson.build
@@ -64,6 +64,7 @@ foreach format, speed: qemu_iotests_formats
            depends: qemu_iotests_binaries,
            env: qemu_iotests_env,
            protocol: 'tap',
+           is_parallel : false,
            timeout: 180,
            suite: suites)
   endforeach
-- 
2.39.2


