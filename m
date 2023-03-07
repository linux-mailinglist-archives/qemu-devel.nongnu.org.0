Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A343A6AE2D3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:39:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYSf-0005P7-3o; Tue, 07 Mar 2023 09:38:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZYSP-0005I3-1G
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:38:26 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZYSM-0000ag-7A
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:38:24 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso10590878wmb.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678199900;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fe2e5i1Oo/hYejnJYYGHH9g6ZkTYL+pBlAahG6PXsbo=;
 b=Ymjq3f0kfcTVAxudFaC1TaeVXHDSbAaSXAukNrYyH+koWNpLQrE7gNG7i57J3PnCRN
 XGtEI645YxmblhHDrWfN9tZ0DsdVEQTbVC7/sQI4RZYRbPtFhWj/a6PtIwUgXnosS/i5
 DrXM6rARPu+w66gSpfH0HHiyUgm/ovSOs0pxKYwWTyTTpxkIhLzkjqH/F/gd7Ym4mlP2
 m/2kjDUAiNMElTAA4CiMnq/waqaofAAbM17xOvnkR8YlxiIgr/Iq9vIH7XzixpAEX9ka
 dUDekV7t9cx2WaKrs+rkOvRwaq//0Ad7NkmBL+oFp/RAnC/JJlYaaeKQhWI/KaM4LO0m
 gfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678199900;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fe2e5i1Oo/hYejnJYYGHH9g6ZkTYL+pBlAahG6PXsbo=;
 b=0v0aO8DhADRgX8XWbNoaJlm7usAuyUxvH49dRjlfCd9yK1PqWf/KTUeCADQUzPDCvC
 Pv8o+ZsvEg/2nZmwLN58yKA2N8rQaR77IscstM3t9d061SlRu/auSBu0Mk6Vo11NKeLB
 h3fzQx0PH4k2AtoyriKfg1tyTXP3hxs6dB5RQ7qaSvilWCdz5B9y5pk2QvcqJy9btDWG
 EjpgfJWDHKe4jfZhyK4Sx1wEnKUqClawYwKpvExZkTC5sAhosSMU+dom1L7CitNuRDzN
 Agoqpr5vhVd4jTp+gDZEkrHfA5NY7aW9lfE39twrM48fAbm9L+KFuuxZMB3Xjr8BQu1a
 HCuA==
X-Gm-Message-State: AO0yUKXJSTqbKMhnoQi9L4fFl/DRrH9ZnYDgz/S9ANa6ZBqsvSqVGs+w
 pzsB1zRIYNFwcmOdT/XoWWII8w==
X-Google-Smtp-Source: AK7set/FXbPLwFKxOjOcAUNyIZQbvaTfKeo3loA+/N9+lSYyQsrAXYjp09OGvgvrntYtIvX7Bo3JsA==
X-Received: by 2002:a05:600c:474b:b0:3dd:1c46:b92 with SMTP id
 w11-20020a05600c474b00b003dd1c460b92mr14451066wmo.16.1678199900121; 
 Tue, 07 Mar 2023 06:38:20 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n37-20020a05600c3ba500b003e2052bad94sm18798790wms.33.2023.03.07.06.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 06:38:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 60BFA1FFB7;
 Tue,  7 Mar 2023 14:38:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/5] testing/next: docker, ansible
Date: Tue,  7 Mar 2023 14:38:14 +0000
Message-Id: <20230307143819.510186-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

A quick fix to docker which should help layer re-use. I was also
trying to get the KVM version of the boot_linux.py tests running on
the centos8-stream machine so we could disable the TCG equivalents.
Unfortunately this doesn't help as the TCG versions exercise both the
fdc emulation and the out-of-kernel APIC emulation. We may not care
too much about the fdc coverage but it would be awesome if we could
find a better way of exercising the x86 interrupt controller code than
running a very slow distro boot.

Alex Bennée (4):
  tests/docker: all add DOCKER_BUILDKIT to RUNC environment
  scripts/ci: add libslirp-devel to build-environment
  scripts/ci: update gitlab-runner playbook to handle CentOS
  gitlab: update centos-8-stream job

Marcin Juszkiewicz (1):
  tests/avocado: update AArch64 tests to Alpine 3.17.2

 .../custom-runners/centos-stream-8-x86_64.yml | 18 ++++++-----------
 .../org.centos/stream/8/build-environment.yml |  1 +
 scripts/ci/setup/gitlab-runner.yml            | 20 +++++++++++++++++--
 tests/avocado/machine_aarch64_virt.py         |  8 ++++----
 tests/docker/Makefile.include                 |  2 +-
 5 files changed, 30 insertions(+), 19 deletions(-)

-- 
2.39.2


