Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D4A2818E9
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 19:15:13 +0200 (CEST)
Received: from localhost ([::1]:39720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOOeG-0004ug-K7
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 13:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <54781ff3e3231fa1b7e1bea8d16e825c5084a74f@lizzy.crudebyte.com>)
 id 1kOOd2-0003zr-I6
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 13:13:56 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:58511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <54781ff3e3231fa1b7e1bea8d16e825c5084a74f@lizzy.crudebyte.com>)
 id 1kOOd0-0000W0-IP
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 13:13:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=iovGPj5Q92eV7i24vjrQeAdFBH4d8kiFupqK9XpeZzs=; b=Su25C
 8gaw3BTY6ngHHdkJOLPBrdJUgNYVuAS+THvX35c2OMe5cbkHF09VDDjy6WoNMR4j3wqkM68DQQmyx
 4S53+xwqVTJr2/CLVehm7yr7ElooOB3aY5k6VLfVG5j36JGo3o9ebTgpzDWN0NQizNI7fD2Ro3cTF
 AiGMpEzCqu0tcq5rfvdU0VMwwmWgf0c62e1Jk4zQjt32BByar0M7gBSlwK9xiGpVasvhfAk8lif2N
 7FZPVPHu9/mx4cfPZuuVAGvoMG8wBF2tJZHESHZYIy6fTdpH4NllX/vn+VWhv61QPUSei/CZDNBsz
 4EVCL9c8xKGs7jGbEzHrRocJUuWYw==;
Message-Id: <54781ff3e3231fa1b7e1bea8d16e825c5084a74f.1601655308.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1601655308.git.qemu_oss@crudebyte.com>
References: <cover.1601655308.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 2 Oct 2020 18:15:05 +0200
Subject: [PATCH v3 06/11] tests/qtest/qos-test: dump QEMU command if verbose
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 Greg Kurz <groug@kaod.org>, berrange@redhat.com
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=54781ff3e3231fa1b7e1bea8d16e825c5084a74f@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 08:18:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If qtests are run in verbose mode (i.e. if --verbose CL argument
was provided) then print the assembled qemu command line for each
test.

Instead of using g_test_message() rather use printf() in combination
with g_test_verbose(), to avoid g_test_message() cluttering the
output.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/qos-test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index fe240b32a7..b9f0942386 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -89,6 +89,9 @@ static void qos_set_machines_devices_available(void)
 
 static void restart_qemu_or_continue(char *path)
 {
+    if (g_test_verbose()) {
+        printf("Run QEMU with: '%s'\n", path);
+    }
     /* compares the current command line with the
      * one previously executed: if they are the same,
      * don't restart QEMU, if they differ, stop previous
-- 
2.20.1


