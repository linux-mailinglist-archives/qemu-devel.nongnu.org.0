Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0FA6A176B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 08:40:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVSfX-0006TO-SG; Fri, 24 Feb 2023 02:39:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVSfQ-0006SJ-48
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:38:56 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVSfO-0006ms-Ec
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:38:55 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 iv11-20020a05600c548b00b003dc52fed235so1154956wmb.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 23:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EeYArS5hWZCjgwU4Fv516wl6zFFk8QoPAiu0DqtwGv4=;
 b=haCWqaJboAoaQU4SqSQTz4A033cxnEKyLMvVULtoBbOUCUVev3PgTAVBY/TqcCULlJ
 XxQyyE5vdIFhxmlJsMIUs7xfFzeSnYFK0yY4/DrdutL9Fsp1kFvrYMVeadmH8NhxfMmt
 V95tPibpNLSy8Tdy4zdleqCo9GAoI1aIQstpyBh3n3kV/phaosTntOxXOG6sKxBGVLVR
 ThogNpIaTYm1ZZR19+GKLEKw7I1YSsGxWRP70VbCjdoi00iTZAUkpGOeAT2adGx51/nM
 3DcwZvMDZ9Y+dye31Rnv0vRBfyXbjxaYKgCs77tnurOjo8SE/DBbp0SqVauWf1r0Nor2
 dyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EeYArS5hWZCjgwU4Fv516wl6zFFk8QoPAiu0DqtwGv4=;
 b=x4ntqvdUJJN533A3tZwinT8sY3Z1bdyln88K2zzS9ZE0eVDM8gYwOQTNpduziZVKO0
 IXQWYo7zzrswn1c0jARXypAQ6lsQg/UBg8cPaydQRkuR3J/LZweV5l395vHORoik5njZ
 kSPk18p0R04Jdbet5ZKTuWms1PmV3jlHn5SUyulqjcCPPynIP9kKkwNpDTYWXorC5O3j
 7QXZsqE1lABNzd0Gx5kkxqOCHs+0+FEbRawlC2a4SsEa5PlOGOOmKfEH43++huLaYiLM
 63wdF6c9yb+5e09FmJG5HuNjFeRn6G1DRkccrD8FHmXMftWvtQJqjx8E2TNaFEgdHCqr
 C2pA==
X-Gm-Message-State: AO0yUKWdJL4t4IP3wayiI9VhXP2qKA/QjssauHxGWdIzCq9jrhjt/VID
 TcCGsDBW9DuSmMva1UTfFCWf7c5tgNM0utb/
X-Google-Smtp-Source: AK7set92Z5fHS/TuOXiR7t8CbyR/+mlmCTLcdeSQGbzdQpiP5eyOXxfwZOlxRPNHjRlYgIw7EynbBA==
X-Received: by 2002:a05:600c:3089:b0:3eb:29fe:734a with SMTP id
 g9-20020a05600c308900b003eb29fe734amr1675wmn.39.1677224332387; 
 Thu, 23 Feb 2023 23:38:52 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a05600c34c800b003dc4480df80sm1955798wmq.34.2023.02.23.23.38.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 23:38:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 0/5] dump: Make most of it target agnostic (build once)
Date: Fri, 24 Feb 2023 08:38:45 +0100
Message-Id: <20230224073850.84913-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

Since v4:
- more unused headers removed
- KISS, use a bit of #ifdef'ry to avoid a stub file

Thanks to Richard help, we can now build dump.o once
for all targets, keeping win_dump.o for x86* targets.

Philippe Mathieu-Daudé (5):
  dump: Replace tswapN() -> cpu_to_dumpN()
  dump: Replace TARGET_PAGE_SIZE -> qemu_target_page_size()
  dump: Clean included headers
  dump: Introduce win_dump_available()
  dump: Add create_win_dump() stub for non-x86 targets

 dump/dump-hmp-cmds.c |  2 +-
 dump/dump.c          | 35 +++++++++++++----------------------
 dump/meson.build     |  4 ++--
 dump/win_dump.c      | 38 ++++++++++++++++++++++++++++----------
 dump/win_dump.h      |  5 ++++-
 5 files changed, 48 insertions(+), 36 deletions(-)

-- 
2.38.1


