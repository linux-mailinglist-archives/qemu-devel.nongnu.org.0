Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A6A3BC153
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:05:25 +0200 (CEST)
Received: from localhost ([::1]:58038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0R64-0006a2-Vm
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1F-0001An-Ph
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:25 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1D-0003Za-QQ
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:25 -0400
Received: by mail-wr1-x42f.google.com with SMTP id i8so9766187wrp.12
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tQohcOi9M98oH9ZAvNY+vlPX6tVOXI8Ysm893vULpdQ=;
 b=Wc6G0h8MEcm7ShKiD0NhDGRId15BB880kvVWO94uEBU7L0o8ZIBgGZHJFqA0vno901
 JfgLylPtbuH0U2Qg85P+SCk2Nc9o/7/HFWLPUDW0K/iMOOEnL5oGNuPU/K72VccYmm+o
 IEPXVtxqApO9i/xzGozSS2XVtpmzJL9t71EzyKIGXDukKv9nlWEqNiCHnL6Rj83Nl3Gn
 gqzOqoMEndh+SG8JgvOvvs+RVZtgztHe0Mbe7SkeWNwwEFubrLN6IW2bbXxE4DHReaGZ
 fk6svCNknkNtoOMJzjEmxM8JxN16SAcTNAn2ekD055lCy7af4OGoxAkAA08Co6phleyc
 +9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=tQohcOi9M98oH9ZAvNY+vlPX6tVOXI8Ysm893vULpdQ=;
 b=SKXvlFbtWS48xAIoDzxcB9JwdTIfNOptmS7l7aP8jRtEInslMYwzdGR3BHNkgvdfEn
 pMr/oIsyPC9iZjqcmQxQLLPrq/WPGxZLzGlTzCCICdMmitH79aiQqnBXDJ/aQ6AGYkHW
 Dpy6Z/eMQ9wEb5eyWQVmbR4WL1pnB/Ss0BoU79AxsLSP95tdWpwDqRX6HH1geDXdjDQb
 ltAsekLn3YgKdOnI3WZ4me+83LfuTrA3PqL86WZi0wLTi+0Zza/0CW6Yqr5woqrzf7dM
 L6dHVUJGHPLwPnwnO3Cd6iAzXgdeuLeufDx1kB41cLoL/U2s5lQL9gKu3knJuTeNBZzJ
 Mokg==
X-Gm-Message-State: AOAM533vIvuP/1w1bRr1w+LTUtiItywTOgch6zpJWc/Raj1DcwwFyVGm
 NSd40AdLGK50EXwu3Q0VNZTynUWATdU=
X-Google-Smtp-Source: ABdhPJyz+39+wW+4+GWf843s+1m0PyldSDABaSyFBEo8tOkqhekI4SWnp9SBz9LFZjUq9cHw2RvARg==
X-Received: by 2002:adf:dc8b:: with SMTP id r11mr16863304wrj.363.1625500820228; 
 Mon, 05 Jul 2021 09:00:20 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b12sm1217063wrt.78.2021.07.05.09.00.19 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 09:00:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/17] convert more library and compiler checks to Meson
Date: Mon,  5 Jul 2021 18:00:01 +0200
Message-Id: <20210705160018.241397-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rebased and retested.

v1->v2: drop support for vte-2.90, clarify the order in which
        compiler tests are kept

Paolo Bonzini (17):
  configure: drop vte-2.90 check
  configure, meson: convert vte detection to meson
  configure, meson: convert virgl detection to meson
  configure, meson: convert libdaxctl detection to meson
  configure, meson: convert libpmem detection to meson
  configure, meson: convert liburing detection to meson
  configure, meson: convert libxml2 detection to meson
  meson: sort existing compiler tests
  meson: store dependency('threads') in a variable
  configure, meson: move CONFIG_IVSHMEM to meson
  configure: convert HAVE_BROKEN_SIZE_MAX to meson
  configure: convert compiler tests to meson, part 1
  configure: convert compiler tests to meson, part 2
  configure: convert compiler tests to meson, part 3
  configure: convert compiler tests to meson, part 4
  configure: convert compiler tests to meson, part 5
  configure: convert compiler tests to meson, part 6

 configure              | 1013 +---------------------------------------
 docs/devel/kconfig.rst |    2 +-
 hw/display/meson.build |    6 +-
 meson.build            |  215 +++++++--
 meson_options.txt      |   12 +
 util/meson.build       |    5 +-
 6 files changed, 220 insertions(+), 1033 deletions(-)

-- 
2.31.1


