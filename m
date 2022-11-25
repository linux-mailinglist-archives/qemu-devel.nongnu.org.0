Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829A56388FB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 12:42:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyX53-0000RH-Mr; Fri, 25 Nov 2022 06:41:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyX51-0000PS-B6
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:41:15 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyX4z-0007GZ-RK
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:41:15 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 b13-20020a17090a5a0d00b0021906102d05so2446556pjd.5
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 03:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZDijJETnCufbJJRGG9gGP5GnFudVrYngYSIjOtUgPto=;
 b=Qes/NIYjFl37oQ4Z6446LSsb2ruR/SXOsHmnlMce1g2r8zpMDmgm73tuY5LbBi4Lvd
 CwvQPV/Yv/Zsjf0KR0jl8uYYQKRszHqwlUDkQbdtBGnh/celanTGUCxXb3weM9GOPTQQ
 6UgmJFk4hrOAnwVzyXrh4rNxP2NhzEtYvOkL3jK88xsmI4H8GtXQFZccjXAww4VuSUDU
 GOZcmiJNHJtLLW0scB0jY2htPXCV40K3A33mGatEKqSkfb33HS5B+XbTPYRDwYf9BN9s
 jKpbgqL+roIt8LcM2lcfCq0CaFFNuNCD6OUvEmTHSRw6/JUnLW88WQ/a2WnFJD1XaTu7
 Dm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZDijJETnCufbJJRGG9gGP5GnFudVrYngYSIjOtUgPto=;
 b=FA6CqMR60B5yYfgmYuW0FPwiywJUoSNFpIdR99inTglKQIL1WYkGNGkq0hCOPOSH7f
 O6AvxDjqv6iG/LZv5ROHYhwuT+UjSGoUqot7/eT0siRvSoW8Nu7r9qGA2nwq0dxktIRQ
 OkKmVXCp8WkObFLTIaSGwmRyPDjx9UpqWW9/erLhQvM/RVreDHPUzmyFgL3pFVbawONE
 N63HdH9aHTFa/R2ISAnI5kX0oObEggRcyuW5pesp+Fop8P8hVLFKzjQGvSCDPJKr7JwL
 aQuvBOeFmyuMgYaPEw+iRK1S6cUcv24j0f4r80gyaBQjHXoebis8AdoWThADVt6fOSDr
 6MPg==
X-Gm-Message-State: ANoB5pkXe4GpSUcNRMqvW61/BinnFQkqVilLRpRrVwlt5RB55PJiXbhh
 IdUai1O6Gho9jzoxlX9IOUE0Q+1VVjU=
X-Google-Smtp-Source: AA0mqf4UynitlQvuDvE9zYOukj0Vuc2jNnRuwOxot8zKNwMc04J29cDkzkO+/xkcktH3SPRDj9IqLQ==
X-Received: by 2002:a17:90a:a88e:b0:213:13ab:c309 with SMTP id
 h14-20020a17090aa88e00b0021313abc309mr39756840pjq.80.1669376472296; 
 Fri, 25 Nov 2022 03:41:12 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a62830b000000b0056c063dd4cfsm2917884pfe.66.2022.11.25.03.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 03:41:11 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v2 3/4] .gitlab-ci.d/windows.yml: Exclude qTests from 64-bit
 CI job for now
Date: Fri, 25 Nov 2022 19:40:59 +0800
Message-Id: <20221125114100.3184790-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125114100.3184790-1-bmeng.cn@gmail.com>
References: <20221125114100.3184790-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

qTests don't run successfully with "--without-default-devices",
so let's exclude the qtests from CI for now.

Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 .gitlab-ci.d/windows.yml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 6741c90ff1..9b5c4bcd8a 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -73,7 +73,9 @@ msys2-64bit:
   - ..\msys64\usr\bin\bash -lc '../configure --target-list=x86_64-softmmu
       --without-default-devices'
   - ..\msys64\usr\bin\bash -lc 'make'
-  - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.txt; exit 1; } ;'
+  # qTests don't run successfully with "--without-default-devices",
+  # so let's exclude the qtests from CI for now.
+  - ..\msys64\usr\bin\bash -lc 'make check MTESTARGS=\"--no-suite qtest\" || { cat meson-logs/testlog.txt; exit 1; } ;'
 
 msys2-32bit:
   extends: .shared_msys2_builder
-- 
2.34.1


