Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1381169CBE6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 14:20:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU648-00029I-Vn; Mon, 20 Feb 2023 08:18:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU647-000292-Ee
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:18:47 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU645-000719-Qv
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:18:47 -0500
Received: by mail-wr1-x42f.google.com with SMTP id 6so777234wrb.11
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 05:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lt9veAgE0Qx8cN7QVCMW2YY/Dg4R/ayGnqIMuOJ9MeA=;
 b=T0LPw+izGF6qkOgsYYWZ1zbjcND3HiHtHmDLAWHloceVDPHamhpsDUEZcQrDOtvR3v
 +0qk7OrYrLZ82s3BkgdXHoC9WNqBpDFe5CbCMR1iPH0W7f6MNfsdB+7T/w6+VmrItuJF
 Yf1PHYn5lw+bmnNZpq1SPTa8p98ynim2juJ/NwbQYXGBnv8nw+XE4UXSSzt2bKyvjdg5
 Mwsas9F8sz9cGezvk/5xVEjInM94WM+sK+U+QQVBOuBvRciELe/k/LmCZlw5p19theUl
 jegJVYI5SI/O91neQ3Nzgax8cvoCeVaH8e9OxRf3rks+7+bEreYfvNbvYiHkii+EKRbS
 nazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lt9veAgE0Qx8cN7QVCMW2YY/Dg4R/ayGnqIMuOJ9MeA=;
 b=PqiEFJ5PXrXHjPESSdUj6E9K85MfoOH22Qflx0zeXHJCSzX2Ls5RkLKcyAn9uv14b8
 Uq3LHxrAsqfAEvfUpr2dcrp2seL7Zc95ppq5v8kdGmCVQt1/bFxcu63bghwG3QvOVvsb
 H5aNqxrw3uGgWeQc4dJF9d6xFJFTjOItToEZtCExlYGYe0osunQbe/k36xYH+PYnvVlT
 BoQk9iFS6m06/vvbzGhlOQGccgeKy8TFZiDRJzhcMs67eTbDS887Hnagyni8zChDoHNd
 1l9otjZZ7K2VbajkG/N63ZLnhVlGUJyYAM0uznI8FeGvz9Y1qssl+AfDA6DJLHUMeU/N
 Bmhw==
X-Gm-Message-State: AO0yUKULhX0p9QSdihGR0xFIYT6pNEh8YhA60sjDbRUgbzzMQX5zyc06
 ImUKAvHav2RdqmCnwubbWhPVQOfKOFJdD1WT
X-Google-Smtp-Source: AK7set8yHxfCWsnuPtUqykfW29JwiZvAY+l7qXMAb6cqcI/IFP35efeoXvr6etjvXMtvKxFdZwo4eg==
X-Received: by 2002:a05:6000:46:b0:2c5:5847:7374 with SMTP id
 k6-20020a056000004600b002c558477374mr1084231wrx.67.1676899123061; 
 Mon, 20 Feb 2023 05:18:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c11-20020adffb0b000000b002c5503a8d21sm6188436wrr.70.2023.02.20.05.18.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 05:18:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/5] hw/audio: Cleanups around QOM style
Date: Mon, 20 Feb 2023 14:18:32 +0100
Message-Id: <20230220131837.26292-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

- Use QOM's OBJECT_DECLARE*TYPE() to declare typedef / macros
- Use QOM cast macros instead of container_of()
- Open-code QDev helpers used few times

Philippe Mathieu-Daudé (5):
  hw/audio/hda-codec: Avoid forward-declaring HDAAudioState
  hw/audio/es1370: Avoid forward-declaring ES1370State
  hw/audio/es1370: Replace container_of() by ES1370() QOM cast macro
  hw/audio/ac97: Replace container_of() by AC97() QOM cast macro
  hw/audio/pcspk: Open-code pcspk_init()

 hw/audio/ac97.c          |  2 +-
 hw/audio/es1370.c        | 10 +++++-----
 hw/audio/hda-codec.c     |  7 +++----
 hw/i386/pc.c             |  3 ++-
 hw/isa/i82378.c          |  5 ++++-
 hw/mips/jazz.c           |  5 ++++-
 include/hw/audio/pcspk.h | 10 ----------
 7 files changed, 19 insertions(+), 23 deletions(-)

-- 
2.38.1


