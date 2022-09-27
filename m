Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2388E5EC465
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:27:01 +0200 (CEST)
Received: from localhost ([::1]:50474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAbz-000385-L2
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8SX-0004HY-Fk
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:09:05 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:40614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8SV-0005QU-L9
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:09:05 -0400
Received: by mail-pg1-x532.google.com with SMTP id s26so9092507pgv.7
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=6vWxOeY7p82uUk8+zkR48MfJ74ST+TkRBLA0VziokAo=;
 b=d2EHnyCUMjhBzLXvE/j2/megnS2cQCDZv2TVpZYmVvTs3yQjFdz594YRPFWscsWHSn
 KcgAMZFl5y1yP1ygcNyruqnUaJuxsv0z3DrDNUIReGDRJLpdqRxJK3/oZBTj6ZjDRJFv
 n4kBq3pHdh+aJ0Uf1EKMM7hCZNsECK5RdIa1b2DO1PRtSb106UG9zKs/WnB1GdmRF5lQ
 FuH27jstOVdHcuYvZOIH/yV+kGKBof8DbCDlLS5RZBMm1MXnDTrzcSoZ4vUR7sgiO7is
 8hre6EkaI71QsXx2XnlffEkBdMzYYzX0osr7Hsr0sEAjylWsITmq1XDCFzwU9LFwWl35
 J5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=6vWxOeY7p82uUk8+zkR48MfJ74ST+TkRBLA0VziokAo=;
 b=HyrJxmkjm16ynP5pOrVx8EARhoqM2ycrbLXGgTZBXHeJSPI6SSrz9gCy0kdajN0l4E
 LaiIHBSAJVLbgdqQtK4M5RjCRrFHGd/P/UgmpASa1vq+XCc7FJ3P4YOy80HzVI5SwtcZ
 BHzN0GXVftLVxtdzvfgmVdBXCfCh/AVebekLcwtZdDi1afbb6avaifX9/G1+/dPM5K65
 LzRTK2/WuWlI5E03S0wjw9lUINHODA2s8iBr47N8rVJaQ1BIoFYU13l66YPJstwxcue6
 P2CFunaPxqApxX/AYCiwmXrqcaPF/V0/zOZkgKrX8TZpObrrkMTGZqZ+RPIknte6QqGL
 Y0cA==
X-Gm-Message-State: ACrzQf0S40UoXdngcOTAp9cd9YGCgs15opI0GX5vtYn5uj56F9Smjt2K
 OkVLVIwTstHXUlQRQUTcOCfXDGU20Xs=
X-Google-Smtp-Source: AMsMyM5MXUHYyDK2PK0iDj3F0TKuwI+mtto5ccr6byTJTmdoOmJMqRzH4F5HVZwIWNQr+hLqpW5vkw==
X-Received: by 2002:a05:6a02:28b:b0:439:19d6:fad5 with SMTP id
 bk11-20020a056a02028b00b0043919d6fad5mr24832691pgb.591.1664276942228; 
 Tue, 27 Sep 2022 04:09:02 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:09:01 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 53/54] tests/qtest: Enable qtest build on Windows
Date: Tue, 27 Sep 2022 19:06:31 +0800
Message-Id: <20220927110632.1973965-54-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x532.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Now that we have fixed various test case issues as seen when running
on Windows, let's enable the qtest build on Windows.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v3)

Changes in v3:
- Drop the host test

Changes in v2:
- new patch: "tests/qtest: Enable qtest build on Windows"

 tests/qtest/meson.build | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 455f1bbb7e..8701c3a8e7 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -1,9 +1,3 @@
-# All QTests for now are POSIX-only, but the dependencies are
-# really in libqtest, not in the testcases themselves.
-if not config_host.has_key('CONFIG_POSIX')
-  subdir_done()
-endif
-
 slow_qtests = {
   'ahci-test' : 60,
   'bios-tables-test' : 120,
-- 
2.34.1


