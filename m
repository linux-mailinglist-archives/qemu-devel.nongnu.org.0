Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5884CC204
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:56:30 +0100 (CET)
Received: from localhost ([::1]:48582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnob-0005Zk-5b
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:56:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nPnUJ-0002gW-BC; Thu, 03 Mar 2022 10:35:31 -0500
Received: from [2607:f8b0:4864:20::333] (port=46030
 helo=mail-ot1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nPnUH-0000kQ-R9; Thu, 03 Mar 2022 10:35:31 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 g6-20020a9d6486000000b005acf9a0b644so4876765otl.12; 
 Thu, 03 Mar 2022 07:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K7G/R6gh2qcQ20jCoRxQsit9P/xzKL//S118901jdwU=;
 b=VuzLAATur4BntbFtp/zwiea28EA8sUSJf+WbYWj4KAW/5JA0W8RFpb6DoVu3mzHajy
 Wtl4z47DpbLx4LvEeymmAUEWlZirn5/hVI9UdQIYPNVxJxPnb0afWiZ2ouPFCmC75kg6
 8p+z61+LLKPQpkYUi7goOCqmXSza/EwqN5cAHi0F3esXDZ1h3K3ZsXbOK+lO5RvrlTU4
 50MUXWuCzPJkVpspNLw+JLgWpfFDRWgILyunSYxm7p88O1qQz6VARL/Rnnp2KSskK62H
 GPOQbC/mFtYgYZ201PAVFl1hho8mvIv0JaMpUCWHYAIzgFjOkpLfn5gpw5iunD5ZPfJm
 6Ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K7G/R6gh2qcQ20jCoRxQsit9P/xzKL//S118901jdwU=;
 b=lYjjsItJdn/7JL4gfnYUEoriluxJGeNqghY98nL0d2/zHZk6TGmFsJhPwUOdccJmq7
 psEFFUDZGFJIIiuSA4Z64sBKP9e3N37Pfwh6XaboB9465yhau7LS66CxaQysVqJeJyyU
 E3/mkKZepo/vZ6AV5ZELbNuWE7vUQ7MwfeA7VqRncFU2yFTRnI6BqpZeh/JbdLYdO5wk
 UJrc4N8pAX5oGtUrLfbmFJYN0eEpZmf9mkXUevcx0D/UBwz3pkJm243tIUvf3hInG5R4
 Jq5ZBovNj/ytTdTC9mSqU5ile+UrgrRZElfimjZQP10FU4Qxx4A2yw31RH4cRBj7d4iW
 0Tbg==
X-Gm-Message-State: AOAM5331DZlXLh8m7Pc+333gkeMbNjPnKxQHcK7BBkZ6ugY4VSr0WMXd
 vvw4rWr5X2Rjd+iCOhXH4znj1iI+27s=
X-Google-Smtp-Source: ABdhPJxW7SqJPx6Qa5LiDT9ZY/cYEPLdC6sVsyFqx3W3hwzuIdA8S6hBd1XZiRLwhcsSlrMuQy/XoQ==
X-Received: by 2002:a05:6830:238f:b0:5ac:4cf8:7992 with SMTP id
 l15-20020a056830238f00b005ac4cf87992mr19729470ots.169.1646321727620; 
 Thu, 03 Mar 2022 07:35:27 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6])
 by smtp.gmail.com with ESMTPSA id
 dw7-20020a056870770700b000d9aa7a6d63sm1178798oab.6.2022.03.03.07.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 07:35:27 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] --disable-tcg qtest/avocado fixes for ppc64
Date: Thu,  3 Mar 2022 12:35:12 -0300
Message-Id: <20220303153517.168943-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::333
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, crosa@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

'make check' and 'make check-avocado' in a ppc64 host, using a QEMU
built with --disable-tcg, fails in a handful of tests/files due to the
lack of TCG support not being accounted for. The tests usually fall back
to KVM acceleration, and when running in an IBM POWER server this accel
type isn't able to run any other machine but 'pseries'. 

This series aims to fix it by checking for CONFIG_TCG in
qtest/meson.build, and using require_accelerator('tcg') in avocado
tests. I avoided changing the behavior when running the tests in other
host architectures because I can't assert about how KVM behaves in x86 and
aarch64. Patches 1, 2 and 4 were limited to ppc/ppc64 tests only because
of that.

Patch 5 is something that I am fairly confident that affects all archs
so the change is made in the common code for everyone.


Daniel Henrique Barboza (5):
  qtest/meson.build: check CONFIG_TCG for prom-env-test in qtests_ppc
  qtest/meson.build: check CONFIG_TCG for boot-serial-test in qtests_ppc
  avocado/boot_linux_console.py: check for tcg in test_ppc_powernv8/9
  avocado/boot_linux_console.py: check tcg accel in test_ppc64_e500
  avocado/replay_kernel.py: make tcg-icount check in run_vm()

 tests/avocado/boot_linux_console.py | 5 +++++
 tests/avocado/replay_kernel.py      | 4 ++++
 tests/qtest/meson.build             | 4 +++-
 3 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.35.1


