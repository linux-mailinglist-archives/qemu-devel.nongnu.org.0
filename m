Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9DF59F83C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:57:27 +0200 (CEST)
Received: from localhost ([::1]:44902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQo4c-0006SQ-Uv
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuW-0004H9-Tl; Wed, 24 Aug 2022 05:42:57 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:43528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuV-0001cf-9S; Wed, 24 Aug 2022 05:42:56 -0400
Received: by mail-pg1-x531.google.com with SMTP id v4so14530702pgi.10;
 Wed, 24 Aug 2022 02:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=sE4uin/5Bmc8/yGa6VCpnxa0hplMimzWw2M8gv5/mEQ=;
 b=fV1hODKhOZvakcFDKm461LeBn6X9stN3iz2YM9PxYQmpmn29VpVPGPBcOd4Kd5QUNI
 yMeMwKYr4eHe8luNoSBvtRMlzUhz2dNR3FEaUtUZ0WZYrMHxDvU/hlDRq6tl0U9iN3u8
 LhZL6b/QSSkQLp0qOYCEc4V87KPLliXiQIwl/31BvLcFcDharzzqQbiLNF9V048xTN+j
 6x99p4LYHVCP682xu716wOzfYReZ52TovFs05XT0kJBWJIg3YGOzAm2Rtctf8HbXR+oE
 nF6IJ0DIJjvPZZv4SKSU1ibwXDyB/L0zNGp8qQ4s66yjqTt7OOE84VDvCjNK9+zFkiz3
 zcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=sE4uin/5Bmc8/yGa6VCpnxa0hplMimzWw2M8gv5/mEQ=;
 b=MEVfcLJyKDgisvy02G0Enyt7wKaMNIaYJ+iXZdbanjkqnM6ZL61Go2Nl71F+KRb4I8
 8x12m7RGPrPoIhR9npXl7tLPOvWkiHG2ysdD2EqjPlAV3eYE2e4Gvkzi9ch3iaVc6i8p
 6asfWhcDzU32HTus6Lmy4cXXxYVfixaUKJbdT7ryV8rypG8yABWgLVKActlfNFZpFP1M
 kZDSQ5hWAfsY1ZSRyk6xUkrREYHXhzdruHubDRt5xuAQ6c+HbW2/+tHDs3TEqHYUA1fC
 stIjwjmCoObv1M1VJQutzUOqqcTQzWYxfmYa2z4UGQk1PkiWMlYEPsz9xv7VxVNNc6tP
 6V1w==
X-Gm-Message-State: ACgBeo31Qd2TcdZeJxy4dfnNbdfGcYB4JWVa+bMlDfSs5tcWqI5rKLDc
 /qEVBjxdN7uh+yuI+ZlCPl/XXht0pQY=
X-Google-Smtp-Source: AA6agR6rZkHeHlGQXKdzSxISjnNBYsPTX5eqpxcAX8FqaIhEPaQP3uY/1HZW/G9r1dCM33evv7zbuw==
X-Received: by 2002:a05:6a00:180b:b0:536:816b:f770 with SMTP id
 y11-20020a056a00180b00b00536816bf770mr15277423pfa.3.1661334173373; 
 Wed, 24 Aug 2022 02:42:53 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:53 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH 30/51] tests: Skip iotests and qtest when
 '--without-default-devices'
Date: Wed, 24 Aug 2022 17:40:08 +0800
Message-Id: <20220824094029.1634519-31-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When QEMU is configured with '--without-default-devices', we should
not build and run iotests and qtest because devices used by these
test cases are not built in.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qemu-iotests/meson.build | 5 +++++
 tests/qtest/meson.build        | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
index 323a4acb6a..38d9a874d2 100644
--- a/tests/qemu-iotests/meson.build
+++ b/tests/qemu-iotests/meson.build
@@ -2,6 +2,11 @@ if not have_tools or targetos == 'windows' or get_option('gprof')
   subdir_done()
 endif
 
+# Skip iotests if configured without a default selection of devices
+if not get_option('default_devices')
+  subdir_done()
+endif
+
 foreach cflag: config_host['QEMU_CFLAGS'].split()
   if cflag.startswith('-fsanitize') and \
      not cflag.contains('safe-stack') and not cflag.contains('cfi-icall')
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c97da5a062..0291b3966c 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -4,6 +4,11 @@ if not config_host.has_key('CONFIG_POSIX')
   subdir_done()
 endif
 
+# Skip QTests if configured without a default selection of devices
+if not get_option('default_devices')
+  subdir_done()
+endif
+
 slow_qtests = {
   'ahci-test' : 60,
   'bios-tables-test' : 120,
-- 
2.34.1


