Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE53938FCE3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 10:33:28 +0200 (CEST)
Received: from localhost ([::1]:46834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llSVD-0002R0-I7
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 04:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSOa-00057r-5d
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:26:36 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSOY-0007UK-La
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:26:35 -0400
Received: by mail-wr1-x432.google.com with SMTP id j14so29435329wrq.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 01:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SkoozkaB7xWv3v3H2rLnYDJGNp2meEPJ8CYN/joh4jA=;
 b=lkxZ0X2xkSGD9JUTXHKzB2ZqbPUm8jPdv1d22wOSkwk1vm6Vz3DvKXv6cZavRcgwLJ
 dkhqTFRtBUXBN1c6jw2bbvK1CBQDvzg53NRgr+5wB1tkWr/KgLIGVZDc761q+boWL3kt
 rN/yRa7Go3DkcW1pxBjmufQ3GbFxLkv2XdWMOS9ygX1H+lIUWcMm4ABAByPEzfv8jRrF
 QVcqrleSQ3Gb8IcE90tFjbd0dZAC6mrPNtPSpcfLmdzF8Q3QuG7ZtWjrwMxGm9YPinVJ
 gXo/VUYj/JPGO6CBUYoNSVGL09/lOP/fOlPaFdVSUuJrnOvIvd6Ax5t6RZz4WHy3tckI
 /CIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SkoozkaB7xWv3v3H2rLnYDJGNp2meEPJ8CYN/joh4jA=;
 b=tK/ZD+JedIOsje+hLR0gz5Lt+U7VBFNA7rtFo1PBndOAmO3NNNn3FUzaqtJPLPdwfq
 MUwIBkf5QKJEy8mlL2xjsv69BkFacqxFJpBxeGzWlYpY6j7Yd3vMMpiN4GkolQ365ksB
 hPNzOIipPgagffXA35Oy3zDC7rrORMyf8UFBECAlg64jYgpe0NbLkIp6MggovS9d57PO
 WgrU5I9MOrsIjO/1piARsBqZVAhQ9wO1DwtDXWNcQLX/+gP9+aUjZqOJ+h6StjPci05j
 juu1jEEDNqEkSt2euD2/9/Cai2V19CEb/2aJ7c+OkarRDrj1FHIAxVZ13CujsS+Q1OI8
 HmKA==
X-Gm-Message-State: AOAM532C120qQhq884vJIxyZ7wuRzWadXkyk2Nan4IDhXMy7ZvVpNA2H
 xAxhNPSz5JRfKINlJWW32p3NmA7sr25yvQ==
X-Google-Smtp-Source: ABdhPJx6Y5qY1ZkNIyQkeXH4XxMibACbwCcJEIt8mDdvf0LmGuSy6bMdHUhmusomzEcmzKudgpvtDA==
X-Received: by 2002:a5d:53ce:: with SMTP id a14mr25800197wrw.410.1621931193180; 
 Tue, 25 May 2021 01:26:33 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x10sm14968937wrt.65.2021.05.25.01.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 01:26:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] gitlab-ci: Keep Avocado reports during 1 week
Date: Tue, 25 May 2021 10:25:54 +0200
Message-Id: <20210525082556.4011380-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525082556.4011380-1-f4bug@amsat.org>
References: <20210525082556.4011380-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sometimes pull requests are merged during the week-end, triggering
a CI pipeline. Currently if such pipeline fails, the Avocado reports
are available for 2 days. For the reviewers working on the project
during office hours, the reports are already discarded when they
want to look at them. Increase this time to 1 week, which should
give reviewers enough time.

Only keep the reports on failure, which is the only case we'll
look at them.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/buildtest-template.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 167ee88c410..180bf1aee7e 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -46,8 +46,8 @@
     policy: pull-push
   artifacts:
     name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
-    when: always
-    expire_in: 2 days
+    when: on_failure
+    expire_in: 7 days
     paths:
       - build/tests/results/latest/results.xml
       - build/tests/results/latest/test-results
-- 
2.26.3


