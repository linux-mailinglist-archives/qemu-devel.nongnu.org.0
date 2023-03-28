Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFED6CC94A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 19:32:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phDAQ-0004bC-BG; Tue, 28 Mar 2023 13:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phDAL-0004Zk-7J
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:31:28 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phDAI-0003Lc-Uv
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:31:24 -0400
Received: by mail-wr1-x435.google.com with SMTP id j24so13079834wrd.0
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 10:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680024680;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uAtXz3+z83jZ4XKxVvQOajUrR6GL+K0tj/4mml7wKes=;
 b=PMct70HWgBQSS8kPLkhk431pJ6oAQfReDZqw80n9NAlZF7OUqS5mrRxS0GnwL+u9Ar
 yDm2iJXKJF3/7z+HcT7TQsAsNczStWGo3hvm1ChBjCqp3NGIn/4RneXXD80OM5s5C+Ij
 KuG0UK0Kqj3vZNKjkQ0wGN8/G+itFD52lISzJEaEu/oXp80gR5r0nX5ft8YMmLaLo2LH
 dgnI1V0N/WmmnQCX0nroDrWTi2Uc6eaohp+eFkrm/d1sctxsfxoo0kUPqdPWuHyM+yzk
 5az0v9Lq78P/+QQuLr3b1ob1Dk6TugtlfBANBoKzIEvbd2213SUWsAaIC4njYEw1OxqQ
 zqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680024680;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uAtXz3+z83jZ4XKxVvQOajUrR6GL+K0tj/4mml7wKes=;
 b=iSxcIPlrbarJUj75V0iGAZ/iwf47C6K6mDhuVLEAndQMIFXKxNQWpA2qPYL7HK3qiM
 721QRWPyNeH1kf7a53CUB74UQgtPWG0vInSGW1fnXYHvhyQ7wExAyWAXiWUmW13FAJ/t
 vMjAsWHynpMeqj/3EVWeRAb2smoA/URKN8U+F1hNw4RVeWErVD/M07ph0SbnerzK4jIN
 mKZQp/NmoJCE0FSmLdg+kDjLH4P8h+1bQQ1zJIWEGY5+vU2Ulk18K9S9DgyB6FphxSnO
 d4gZqMpo6OHGNzyw8Hb5dtMs0I4gd2EwQaQjprBe5ucbzunTx+DkDHN6pvLZWigpse3l
 nx2g==
X-Gm-Message-State: AAQBX9frhQfVN/wXl5oDnwBu9rQHubBGPYbQtval/XCNv60+0gl6ZFhx
 Qwuf2Pe/0jzKsUv1TxrqsxhXiaFK14HPWhg6Lt0=
X-Google-Smtp-Source: AKy350Y0vKkd2d/Lw5hqDKOcKFrPz7QPtN81Whiu4WPgwDE9O5P8ogWhZfwvQ+iyCoJtHQ3Cm+wnZQ==
X-Received: by 2002:a5d:4848:0:b0:2ce:a9e9:490b with SMTP id
 n8-20020a5d4848000000b002cea9e9490bmr12156949wrs.31.1680024680638; 
 Tue, 28 Mar 2023 10:31:20 -0700 (PDT)
Received: from localhost.localdomain ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 z8-20020adfec88000000b002c5691f13eesm28014319wrn.50.2023.03.28.10.31.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Mar 2023 10:31:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Greg Kurz <groug@kaod.org>,
 kvm@vger.kernel.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH-for-8.0 v2 0/3] softmmu: Restore use of CPU watchpoint for
 non-TCG accelerators
Date: Tue, 28 Mar 2023 19:31:14 +0200
Message-Id: <20230328173117.15226-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

Commit 2609ec2868 ("softmmu: Extract watchpoint API from physmem.c")
restricted CPU watchpoints to TCG accelerator. This is wrong, as
other accelerators such KVM do use watchpoints. Revert (partially)
this commit.

Since v1:
- Include "hw/core/tcg-cpu-ops.h" where cpu_check_watchpoint()
  and cpu_watchpoint_address_matches() are called.

Philippe Mathieu-Daudé (3):
  softmmu: Restrict cpu_check_watchpoint / address_matches to TCG accel
  softmmu/watchpoint: Add missing 'qemu/error-report.h' include
  softmmu: Restore use of CPU watchpoint for all accelerators

 include/hw/core/cpu.h         | 39 +------------------------------
 include/hw/core/tcg-cpu-ops.h | 43 +++++++++++++++++++++++++++++++++++
 softmmu/watchpoint.c          |  5 ++++
 target/arm/tcg/mte_helper.c   |  1 +
 target/arm/tcg/sve_helper.c   |  1 +
 target/s390x/tcg/mem_helper.c |  1 +
 softmmu/meson.build           |  2 +-
 7 files changed, 53 insertions(+), 39 deletions(-)

-- 
2.38.1


