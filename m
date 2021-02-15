Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81EF31BA74
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:38:03 +0100 (CET)
Received: from localhost ([::1]:38154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBe4g-0007Wz-Qz
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:38:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjz-0005cV-QO
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:39 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:44149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjy-0005Xl-Ag
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:39 -0500
Received: by mail-ej1-x635.google.com with SMTP id w1so10981594ejf.11
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pp/kQNjyS4VICCzImjwdyqsn8FUT6fpPnB3O9eihh7I=;
 b=MevVA3EF9tJ4XvPY2GyRcgb2Ypp/e5ukZl80QQlKpGsJ4YfHmbEhI1Z+hJlTPnDBNU
 lqDSKVygr9kdDQ02Y6aKQpoXj1bjd3p3aQJ1Ds5DX4lT+lvA1qwC8Fba4JuFUBOX2GCE
 tRtT/IXJSrQgfCf/I1EmBci9GaUSpGPSFvmZKfKcK/X4u+k/rjwK/eA8KZVWXmbBJInQ
 IpOUiojmOzCcMnTkedbtnf7aNgZS+CN279T+7A246Tk9E2WI54GZivpNl225x2LIi1aP
 ExHVDKJ5VNbVSm14rgV9ScmBbUHScyuTKFTmxh2Ry3rJ/JqKOtw21PV5if3fdbwtqfz0
 Mx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pp/kQNjyS4VICCzImjwdyqsn8FUT6fpPnB3O9eihh7I=;
 b=IcegKH/GeG2lTxpcRRN535PIRY22+rGEYZWAz+guV5NP9RJTSUffmp0N/rxNBnIpGt
 /lpN/vIej2DFSE7M+lRFz9ltGPv/nd9f7NVAzuM/R9HNqae5o5oGTI8tmK1a3hQCJfah
 4t+VVVr1Z/OepUrTxdhbD5PqoF92ZYyB/P9lHSGVq/irtg2GnjgGrVDva2woMBTn3Im/
 kpp+trG487IYrlUA/2v+/VztS8dCSranvb3PLwqSRBDe0JbbSsf34cmUckdBmI1m02T1
 pZ0pfk4QkTdeBlyEPjNV/rlYbWZhCwJdDCYgPFEOZFCvp8A9YashejQqRZz1B7aYblqY
 YeBg==
X-Gm-Message-State: AOAM5311AkbDnKlTJtS57v6K/tY05DM1AOKT22jaqR15/yq+6svv7MWe
 ZLoFArLeVHxS2dG+MAYpuY4x4yfCdbQ=
X-Google-Smtp-Source: ABdhPJyjGmdw3VPA9fGF0KiEZ/qJRGe0/T7JQIQTb6+CuTrlBtZe2bmPw/weJfK3id8cqSYv8qu+Gw==
X-Received: by 2002:a17:907:20d6:: with SMTP id
 qq22mr15526867ejb.517.1613394997061; 
 Mon, 15 Feb 2021 05:16:37 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/19] tests/qtest/qos-test: dump QEMU command if verbose
Date: Mon, 15 Feb 2021 14:16:20 +0100
Message-Id: <20210215131626.65640-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
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
was provided) then print the assembled qemu command line for each
test.

Use qos_printf() instead of g_test_message() to avoid the latter
cluttering the output.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <110bef3595cb841dfa1b86733c174ac9774eb37e.1611704181.git.qemu_oss@crudebyte.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/qos-test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index b279b6f816..f97d0a08fd 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -89,6 +89,9 @@ static void qos_set_machines_devices_available(void)
 
 static void restart_qemu_or_continue(char *path)
 {
+    if (g_test_verbose()) {
+        qos_printf("Run QEMU with: '%s'\n", path);
+    }
     /* compares the current command line with the
      * one previously executed: if they are the same,
      * don't restart QEMU, if they differ, stop previous
-- 
2.29.2



