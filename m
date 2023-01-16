Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0A566D1D3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 23:37:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHY5j-0000Ix-Sx; Mon, 16 Jan 2023 17:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHY5e-0000HI-Uv
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:36:31 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHY5c-0001Li-TU
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:36:30 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 s13-20020a17090a6e4d00b0022900843652so13679778pjm.1
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 14:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5KHBahtVyqoNrHye2ukHH9Bmolxcd30ojkDPXk2RDpI=;
 b=UgsXNaYRAITKYSvFOqii7d5PJ0Wj6C3vftTV3iY7qoYM9WtMlkSGU/rOigL7tIs3tb
 IFqzW2GZdgTife540gD9JJI2sWHainpxReYAlfP27pVtvEp3Q5ncPwpwtJvGSVT8d04p
 PK7glIe9U3YP9LeBmEH3jOQCVymNcdt8S9EtWJ8d+Wjb22AisyU36kMg4fhz9OyvDOJz
 Nic5fdYtTFw/Ii635RTz+EkJ/FvXQd1T0RwbYm0BGb66KakHLvIIcjez54t5ZqtRQt9P
 dCiGscmH+TAHgh0Us42RG8+fZ13ZsNnjXx2Q2xjkxziY0qiVEy3iQ9h81q24sy0xyhgt
 +LXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5KHBahtVyqoNrHye2ukHH9Bmolxcd30ojkDPXk2RDpI=;
 b=0OfLmUCcKsuQUKV5//Djx0alxaEr20YaErY5fdrOSvY9ICaHLuxaF2jJfQnBzqrtq0
 o1XBxWKu0u2051auEU08I2GAckT9QvO/GbUKmvXrVrh6L4gb/3G/ShktQflSSSP1FW2M
 Ei7YBIFTEeL26kpIzJwZGXs9/ceCeXf/C6M3NiVAq4+BF6HPq2+fJ9bSRyGe6LCdlHEP
 68X+UOzpKkv+uphSv/vdMsFpsmTdDYiCttUJSC/UdZgrsZ7/TstehlWXHXHybIk5tPlq
 CzGnxZ0LN1QD9d4U0pvelq+pnp0kVFmzGghKHSC6sg3fn7VP6oxvk/+VeKxwOQd28Ets
 b51A==
X-Gm-Message-State: AFqh2kpU2fQ0xhmxrh1OXaGCx40ZvlBM0f1u1MKthUjGMjBkjQiRqyQ6
 MOrhjze2Hm/IG8oCCcn8NgXPPWzcvVUXuax4
X-Google-Smtp-Source: AMrXdXvnPeXXSe2k+2Yg15+9Js9RSU7BBlGliXXPbO4Ce+expUDdtDmaptiMNyww5hntDUgXjmv2BQ==
X-Received: by 2002:a05:6a20:b914:b0:b8:537a:5525 with SMTP id
 fe20-20020a056a20b91400b000b8537a5525mr599927pzb.51.1673908586754; 
 Mon, 16 Jan 2023 14:36:26 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a631c04000000b004774b5dc24dsm16021221pgc.12.2023.01.16.14.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 14:36:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 0/5] tcg patch queue
Date: Mon, 16 Jan 2023 12:36:17 -1000
Message-Id: <20230116223623.3512459-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

The following changes since commit fb7e7990342e59cf67dbd895c1a1e3fb1741df7a:

  tests/qtest/qom-test: Do not print tested properties by default (2023-01-16 15:00:57 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230116

for you to fetch changes up to 61710a7e23a63546da0071ea32adb96476fa5d07:

  accel/tcg: Split out cpu_exec_{setjmp,loop} (2023-01-16 10:14:12 -1000)

----------------------------------------------------------------
- Reorg cpu_tb_exec around setjmp.
- Use __attribute__((target)) for buffer_is_zero.
- Add perfmap and jitdump for perf support.

----------------------------------------------------------------
Ilya Leoshkevich (3):
      linux-user: Clean up when exiting due to a signal
      accel/tcg: Add debuginfo support
      tcg: add perfmap and jitdump

Richard Henderson (2):
      util/bufferiszero: Use __attribute__((target)) for avx2/avx512
      accel/tcg: Split out cpu_exec_{setjmp,loop}

 docs/devel/tcg.rst        |  23 +++
 meson.build               |  16 +-
 accel/tcg/debuginfo.h     |  77 ++++++++++
 accel/tcg/perf.h          |  49 ++++++
 accel/tcg/cpu-exec.c      | 111 +++++++-------
 accel/tcg/debuginfo.c     |  96 ++++++++++++
 accel/tcg/perf.c          | 375 ++++++++++++++++++++++++++++++++++++++++++++++
 accel/tcg/translate-all.c |   7 +
 hw/core/loader.c          |   5 +
 linux-user/elfload.c      |   3 +
 linux-user/exit.c         |   2 +
 linux-user/main.c         |  15 ++
 linux-user/signal.c       |   8 +-
 softmmu/vl.c              |  11 ++
 tcg/tcg.c                 |   2 +
 util/bufferiszero.c       |  41 +----
 accel/tcg/meson.build     |   2 +
 linux-user/meson.build    |   1 +
 qemu-options.hx           |  20 +++
 19 files changed, 763 insertions(+), 101 deletions(-)
 create mode 100644 accel/tcg/debuginfo.h
 create mode 100644 accel/tcg/perf.h
 create mode 100644 accel/tcg/debuginfo.c
 create mode 100644 accel/tcg/perf.c

