Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80A326446B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 12:44:15 +0200 (CEST)
Received: from localhost ([::1]:59904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGK3q-0004pK-NI
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 06:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kGJxf-0001on-TU; Thu, 10 Sep 2020 06:37:51 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:37341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kGJxe-0003iq-9X; Thu, 10 Sep 2020 06:37:51 -0400
Received: by mail-pl1-x643.google.com with SMTP id u9so709695plk.4;
 Thu, 10 Sep 2020 03:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8LMHSaPzW0hzgrIuj2ua/jt2cvPDmkrSyzCQ3oAKLyw=;
 b=T0S7ngHUKTEFimNYY5jeld2DsCu72+4qJK08GG9GI0+SE7o+8RhXC7V4UotuzeQUrb
 Iyq9t03U4SHV9BkffgRzNnJ30wZHW6dDC8/UFsFSI6d7MBl+49u+mCkZX5x90kqoKBxS
 pDYlFrml9sw+98ubrl9FqlYZdmP6VyziFcV1mLkOguRQQiClMELau017RAx20Djp44/p
 jur98X5W7ITwzkoXEumDA5xRlkuOEtsZgVOXPvDg/+otRoEaIHGknEDrIwtLv5p0VPsB
 cBozahc9+6kWmINER5xCnh6P8ADt02AXyghJjok0Ieqmp/UZLeJKzhMG8XGNHw636Qsv
 76dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8LMHSaPzW0hzgrIuj2ua/jt2cvPDmkrSyzCQ3oAKLyw=;
 b=t6HsumWv+k//74avEo647iS4FYo7uTjJJJ30inbIRRUrJeSAV8aDbnNOYgJCa0If9J
 qLf06wbBxhd6HEJPpv/yk8KbJF8evlAG+04j73WamIsbLx372B6WzgzQN+hDsUMOg23M
 6fo1Cm0egxWefu66JkSm7//Uo8mRJ2NgoFg7Zb9Fyuapyth/LjvOX7HqWkW1lH6vOVhB
 TzrkN0ZOroz1xpCRKiuzHsiCnoQJKSMYMRxR0AhDIY1EUSSTjmaKHjKSKCswFuR0T8sv
 2aad4rP9amQ3+zCBU7A6d/6Pmy6pNJImXwPhMmkDYVGcBqjRkjgdH53ww5NWaLZuK6ZQ
 YWow==
X-Gm-Message-State: AOAM533tzR/nNe8k6Q3Nvl+aqTo1i57095egXZYiqUDu46O08q28B1Ii
 pA304OK24VdH8WAGxX0fjf3MrwSJ0gZsL165su0=
X-Google-Smtp-Source: ABdhPJzgmKZSR+x1p1zY81cyrBseZ0ATZeiF6zK8pacKxk8AEw+8c5FmKDsttv509ssQBrmyaOYr8A==
X-Received: by 2002:a17:90b:1050:: with SMTP id
 gq16mr4893169pjb.234.1599734268103; 
 Thu, 10 Sep 2020 03:37:48 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id 99sm1781191pjo.40.2020.09.10.03.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 03:37:47 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 18/25] tests: Convert g_free to g_autofree macro in
 test-logging.c
Date: Thu, 10 Sep 2020 18:37:18 +0800
Message-Id: <20200910103725.1439-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200910103725.1439-1-luoyonggang@gmail.com>
References: <20200910103725.1439-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 qemu-block@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Lieven <pl@kamp.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

g_autofree are prefer than g_free when possible.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/test-logging.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/test-logging.c b/tests/test-logging.c
index 8a1161de1d..783fe09a27 100644
--- a/tests/test-logging.c
+++ b/tests/test-logging.c
@@ -196,7 +196,7 @@ static void rmdir_full(gchar const *root)
 
 int main(int argc, char **argv)
 {
-    gchar *tmp_path = g_dir_make_tmp("qemu-test-logging.XXXXXX", NULL);
+    g_autofree gchar *tmp_path = g_dir_make_tmp("qemu-test-logging.XXXXXX", NULL);
     int rc;
 
     g_test_init(&argc, &argv, NULL);
@@ -212,6 +212,5 @@ int main(int argc, char **argv)
     rc = g_test_run();
 
     rmdir_full(tmp_path);
-    g_free(tmp_path);
     return rc;
 }
-- 
2.28.0.windows.1


