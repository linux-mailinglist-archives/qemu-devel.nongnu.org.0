Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCEE3C65C6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 23:58:12 +0200 (CEST)
Received: from localhost ([::1]:33004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m33wI-0003Oi-Qn
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 17:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33tu-0000XI-6y
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:42 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33tr-0006q7-0N
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:41 -0400
Received: by mail-pg1-x529.google.com with SMTP id t9so19744434pgn.4
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 14:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KuFWlyQfsTC700l34L8WQPukt8R7vtzeaY2C9szAhUk=;
 b=jbItZAHGEmy0SbDe55s3CLuobrI+dGMjU5tKIaoD3NFiHsLQr7fBF30+ja9iSWW2E1
 pBTYZYQhh/dCZHeGng16AaqXhvAyfarM0bbTI9n0NPrG0K+TZ1IOO7bqiwdjugALiE6a
 dxexLaUDBUX3bK3tFB+oRAbukxTkvOIaunmvOf8QZmX2BqpugU/lHnB/tkJtATry2kT/
 xVbO8T/JR5mUrRIKdMmxKoKuRmYnQMS6B7pjMvUDLH5IPP/up6FFr9HZXBMk30Ow+q9O
 Yv5CcT7px9kQs+fcZzdW/HtSlnAUJUcJhh240W/cCOMJXGtQDvJtf/9esS5Md9/aLMf0
 cq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KuFWlyQfsTC700l34L8WQPukt8R7vtzeaY2C9szAhUk=;
 b=PEzRt6TDnaY2TVqrqiSXrxD0JWLahgfkwuXvHF/IgfUskKMbVQgwO7eQhcf8hJzgC+
 Fh2v5Emxug8iJCcn653Mb8qP1WECPeMgGvnfgqP7bGCBb3+dFX8JpfLCsmB8JzbuIQ9M
 z/aj5zCx4wlEbGge/DkWbLC7yra/bcr+sMHoumnC/mTDZ1uJvSPsZ+DVpttkxAf2evZA
 ABTTQpmTvd6Q7KnjdO2a5Tw+Y/lAPAz0Ax57Iv/pkfEwo7FuM4mH3Bwy2ZjhqEGDOGtw
 pbQqcx0OYIeWr70kU3MwFB0Zif6AV9Wh2uW4E5254mD+hKQWvPYoPsW3BhDqLTxQ2h81
 8z1g==
X-Gm-Message-State: AOAM5308lQbo1ejo5Jvl7zlCNpDU8PEtP3gK4nvPTLJ592RLjEFxQqW9
 Swq/dipfQ8Kih42TANixDyv6L3x8IjqkMw==
X-Google-Smtp-Source: ABdhPJxriLA9xg8TANt82jyR8+NwAazKuO2UQhxHydSG9bRfASxrke2PzNga/4qqc9v8LbKa3mlngQ==
X-Received: by 2002:a05:6a00:1481:b029:304:87ea:8dcc with SMTP id
 v1-20020a056a001481b029030487ea8dccmr1138354pfu.46.1626126937302; 
 Mon, 12 Jul 2021 14:55:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d2sm376932pjo.50.2021.07.12.14.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 14:55:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] Fixes for clang-13 plus tcg/ppc
Date: Mon, 12 Jul 2021 14:55:24 -0700
Message-Id: <20210712215535.1471256-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Brad Smith <brad@comstyle.com>,
 Eric Blake <eblake@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The goal here was to address Brad's report for clang vs ppc32.

Somewhere in between here and there I forgot about the ppc32 part,
needed a newer clang for gcc135, accidentally built master instead
of the clang-12 release branch, fixed a bunch of buggy looking
things, and only then remembered I was building ppc64 and wasn't
going to test what I thought I would.

So: Brad, could you double-check this fixes your problem?

Others: Only patch 7 obviously should have been using the
variable indicated as unused.  But please double-check.


r~


Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Brad Smith <brad@comstyle.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Eric Blake <eblake@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Greg Kurz <groug@kaod.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-block@nongnu.org
Cc: qemu-ppc@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


Richard Henderson (11):
  nbd/server: Remove unused variable
  accel/tcg: Remove unused variable in cpu_exec
  util/selfmap: Discard mapping on error
  net/checksum: Remove unused variable in net_checksum_add_iov
  hw/audio/adlib: Remove unused variable in adlib_callback
  hw/ppc/spapr_events: Remove unused variable from check_exception
  hw/pci-hist/pnv_phb4: Fix typo in pnv_phb4_ioda_write
  linux-user/syscall: Remove unused variable from execve
  tests/unit: Remove unused variable from test_io
  tcg/ppc: Replace TCG_TARGET_CALL_DARWIN with _CALL_DARWIN
  tcg/ppc: Ensure _CALL_SYSV is set for 32-bit ELF

 accel/tcg/cpu-exec.c     |  3 ---
 hw/audio/adlib.c         |  3 +--
 hw/pci-host/pnv_phb4.c   |  2 +-
 hw/ppc/spapr_events.c    |  5 -----
 linux-user/syscall.c     |  3 ---
 nbd/server.c             |  4 ----
 net/checksum.c           |  4 +---
 tests/unit/test-iov.c    |  5 +----
 util/selfmap.c           | 28 ++++++++++++++++------------
 tcg/ppc/tcg-target.c.inc | 25 ++++++++++++++++++++-----
 10 files changed, 40 insertions(+), 42 deletions(-)

-- 
2.25.1


