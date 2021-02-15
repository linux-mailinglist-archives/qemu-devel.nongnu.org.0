Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1BA31BA69
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:35:10 +0100 (CET)
Received: from localhost ([::1]:59286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBe1t-0004b6-Rw
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:35:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjz-0005bS-7n
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:39 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:41553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjx-0005Xf-NN
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:38 -0500
Received: by mail-ed1-x531.google.com with SMTP id v9so3592594edw.8
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v8B7dQMP2+1i46OpqrqPq2fC3acQ71+O471l3ttFlJY=;
 b=hiTUKrZrGkPhopODUfpsPxZwxzIIeEMvBIEXLUyM79v64KFVbsNnJ1orwwH8RticO4
 qZrgC8f/Pl8+YGSDCNI6wF0DdFbSVNSCyEIP6POPsB7gYFFc3CmWIZYV96F/ydXjC8A9
 2sQuZpj6W/6wlkJov86tzH3h5MBE2EK39NKd9wBTQaT+MP8dQi0AFgoTCt5IlWekPitj
 ng+tVLnC1yybhnibUB/zDW4w71CNCALa1GvhqLbdbb3A/Tr6XPw1PZkeSOWm9ADZLA3e
 7QHCrboy2g5vShKam0c9WAoBlRZt+VKRH49XdUdqraSoCS072+hwxpvHrSG5AvRZxV8z
 rzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=v8B7dQMP2+1i46OpqrqPq2fC3acQ71+O471l3ttFlJY=;
 b=ewcVN4zrSZdpaIjaj/MwckWy9qg3vAeHabD8TS4oH7qnw7EbYnyfLI8AAYl0AoyeRZ
 GjX03UHraloyMFPNLuQ+Ci4XghmLwBfAW5gv34yOqiXfhyHv7CrPnp22OVfTdk3bwrK2
 t0C6Sp3JezNm6uWNXOfq9kPgPOmQpaClQWeTB55jDJfcOJO+nV32vjFauilyLFYxEyUF
 saow/P81Akkxw2kAwWw0upYoyv4vXv7uCnwvGWVp6G5cwkrPdS/9JiGbOtOPP5oMS3ER
 jaM4qQDdDIbXXXDI8VFgBzIWjpoOAfcpcjoQBITfIF/frWu3hsnm9E6+825AZWUSQS1b
 80CQ==
X-Gm-Message-State: AOAM53129HZf8biK9N1kR6u5gJK76+N4j7rYDCsjzAHjJ9zb/YtCBuzg
 dqnL8t1FsuuSRn9NzEXVO6eHEMfSqZ4=
X-Google-Smtp-Source: ABdhPJzozOxVWZXlcERSiL/085JHb5KtJ2mcv8l0R3+wH0sFuN4c9PeHKe3C882e/FpqShMRKB3xrw==
X-Received: by 2002:a05:6402:216:: with SMTP id
 t22mr13687550edv.168.1613394996463; 
 Mon, 15 Feb 2021 05:16:36 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/19] tests/qtest/qos-test: dump environment variables if
 verbose
Date: Mon, 15 Feb 2021 14:16:19 +0100
Message-Id: <20210215131626.65640-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: qemu_oss--- via <qemu-devel@nongnu.org>

If qtests are run in verbose mode (i.e. if --verbose CL argument
was provided) then print all environment variables to stdout
before running the individual tests.

It is common nowadays, at least being able to output all config
vectors in a build chain, especially if it is required to
investigate build- and test-issues on foreign/remote machines,
which includes environment variables. In the context of writing
new test cases this is also useful for finding out whether there
are already some existing options for common questions like is
there a preferred location for writing test files to? Is there
a maximum size for test data? Is there a deadline for running
tests?

Use qos_printf() instead of g_test_message() to avoid the latter
cluttering the output.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <21d77b33c578d80b5bba1068e61fd3562958b3c2.1611704181.git.qemu_oss@crudebyte.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/qos-test.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index d98ef78613..b279b6f816 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -313,9 +313,16 @@ static void walk_path(QOSGraphNode *orig_path, int len)
  *   machine/drivers/test objects
  * - Cleans up everything
  */
-int main(int argc, char **argv)
+int main(int argc, char **argv, char** envp)
 {
     g_test_init(&argc, &argv, NULL);
+    if (g_test_verbose()) {
+        qos_printf("ENVIRONMENT VARIABLES: {\n");
+        for (char **env = envp; *env != 0; env++) {
+            qos_printf("\t%s\n", *env);
+        }
+        qos_printf("}\n");
+    }
     qos_graph_init();
     module_call_init(MODULE_INIT_QOM);
     module_call_init(MODULE_INIT_LIBQOS);
-- 
2.29.2



