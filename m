Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8D4310CA4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:46:44 +0100 (CET)
Received: from localhost ([::1]:55218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82Ne-0003yV-Se
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:46:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82Kx-0002BF-QV; Fri, 05 Feb 2021 09:43:55 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82Ks-0002DQ-JA; Fri, 05 Feb 2021 09:43:55 -0500
Received: by mail-ej1-x634.google.com with SMTP id lg21so12337293ejb.3;
 Fri, 05 Feb 2021 06:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hy0qGV9DilKihgUr935Gn+o6e7BY54ie7jVVK9w0at8=;
 b=puiqGaMqLCZnMIOfQNtH8IVMxyX4t5ARh6TOjAh8JwyWkBwt8SF3gI+hdm7Jy6s5tH
 otqBiAk/gah+985fXzaHz2m20WHW6vjAc+3yEf4GB393N9pBASZlG8PfCkK/2uNXV5lP
 gTUgRBJnSzcwsj4aiDvie9DWo6EY+27lr1vGOuFcN51G9cKcSnAWeHT6XPCYAK00JVoB
 cweecA2fs+oP12apIpoZ+5RilqqvuN4jyI49/uHWRfJU9kWtDVtp31HRShu04TB+PFx2
 zl1fB+TFAuLzCxe0pDAqaUTK9+jJF/M8zZbBCAyJyt3Jtu5wKNqHhPVjhNaTt+6vfKzh
 P0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=hy0qGV9DilKihgUr935Gn+o6e7BY54ie7jVVK9w0at8=;
 b=hUmDCOMSLHzdZmCvBCpn9tLd0j4+iV5ysnsbe+f+/A51GPmez1GvydXeMtxofHC4KE
 Vxyq/Lg/hVxDTSG+O0OFwwzn+slaIuYIbV69kPDCWzV2Sqt8E+riKAIYArVl65AsYTE+
 3tgwXicqj3QKubKsWPvcqcYaQ89ij9U5je3+NbxJ8Dmr6gLOuHoTrJwoS/cPJeUT+7po
 R3qMBjv+42XZcX2ki+3h6x0xbZwE6/NFZKuers7xysieNwW8QOoiEKbavCt8rguEJcUM
 PYivYKJLPuGAVsAU3P4Qn/vaK2A7b0i1xnnz0OAT2MQEVIIJ4ZWIf4Nw1wA1MExgLpcv
 m4dA==
X-Gm-Message-State: AOAM532FjSHOdebEaspHmzQXIs5aLQSyycmH6SwCbrAZmpn5GAK+g0u9
 i2L8DHGEicCgsZBqQlSAS3CFSw0dXNw=
X-Google-Smtp-Source: ABdhPJzS4oQWhMo5j21ddbpOiD4aI6BAAA+G6n7gy4AsegoJyBiauRjtcg+4b2wvc8em0s/EFr9Vkw==
X-Received: by 2002:a17:907:9495:: with SMTP id
 dm21mr4345045ejc.462.1612536228124; 
 Fri, 05 Feb 2021 06:43:48 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f6sm1343494edr.72.2021.02.05.06.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 06:43:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] hw/arm/virt: Improve CPU help and fix testing under KVM
Date: Fri,  5 Feb 2021 15:43:36 +0100
Message-Id: <20210205144345.2068758-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yet again bugfixes and cleanup patches noticed while=0D
rebasing my "Support disabling TCG on ARM (part 2)" series.=0D
=0D
Sending them independently as they aren't directly dependent=0D
of it so don't have to be delayed by other unanswered questions.=0D
=0D
Please review,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  tests/qtest/arm-cpu-features: Remove Cortex-A15 check=0D
  tests/qtest: Restrict xlnx-can-test to TCG builds=0D
  tests/qtest/boot-serial-test: Test Virt machine with 'max'=0D
  tests/qtest/cdrom-test: Only allow the Virt machine under KVM=0D
  hw/arm/virt: Improve CPU name in help message=0D
  hw/arm/virt: Display list of valid CPUs for the Virt machine=0D
  hw/arm/virt: Do not include 64-bit CPUs in 32-bit build=0D
  hw/arm/virt: Restrict 32-bit CPUs to TCG=0D
  tests/qtest/arm-cpu-features: Restrict TCG-only tests=0D
=0D
 hw/arm/virt.c                  | 20 +++++++++++++++++-=0D
 tests/qtest/arm-cpu-features.c | 37 ++++++++++++++++++++++++++--------=0D
 tests/qtest/boot-serial-test.c |  2 +-=0D
 tests/qtest/cdrom-test.c       |  5 ++++-=0D
 tests/qtest/meson.build        |  2 +-=0D
 5 files changed, 54 insertions(+), 12 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

