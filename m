Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD365E7927
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 13:12:15 +0200 (CEST)
Received: from localhost ([::1]:34184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obgbO-0000wy-67
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 07:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obgTo-0005uE-36
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 07:04:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obgTl-0000dB-7N
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 07:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663931060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q2wXTt/5gtqQIFKu/m4cPBoS/8RPYWpZV+qFB4AFiyo=;
 b=HdCf/38d9z0NuIZ6a1csJgPDQgjA/PJUHEsUEygfT1sVwXlrDmqGXAwuWRclsjXcb9w7py
 wL3YlnkjNHUmIAo9uPBIUZxwI3T7db+xDIvtgD15r90GwMUiC3Kd8nKM3WUFfAgeztq7jr
 /sGhDoDJFukm0i9Vpg4QsV+lpJQtcrY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-MlSTBCblMmC5ZJVKv9kCKA-1; Fri, 23 Sep 2022 07:04:16 -0400
X-MC-Unique: MlSTBCblMmC5ZJVKv9kCKA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6773B29324B9;
 Fri, 23 Sep 2022 11:04:16 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FF392027061;
 Fri, 23 Sep 2022 11:04:15 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2] linux-user: use 'max' instead of 'qemu32' / 'qemu64' by
 default
Date: Fri, 23 Sep 2022 12:04:13 +0100
Message-Id: <20220923110413.70593-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

The 'qemu64' CPU model implements the least featureful x86_64 CPU that's
possible. Historically this hasn't been an issue since it was rare for
OS distros to build with a higher mandatory CPU baseline.

With RHEL-9, however, the entire distro is built for the x86_64-v2 ABI
baseline:

  https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise-linux-9-for-the-x86-64-v2-microarchitecture-level

It is likely that other distros may take similar steps in the not too
distant future. For example, it has been suggested for Fedora on a
number of occasions.

This new baseline is not compatible with the qemu64 CPU model though.
While it is possible to pass a '-cpu xxx' flag to qemu-x86_64, the
usage of QEMU doesn't always allow for this. For example, the args
are typically controlled via binfmt rules that the user has no ability
to change. This impacts users who are trying to use podman on aarch64
platforms, to run containers with x86_64 content. There's no arg to
podman that can be used to change the qemu-x86_64 args, and a non-root
user of podman can not change binfmt rules without elevating privileges:

  https://github.com/containers/podman/issues/15456#issuecomment-1228210973

Changing to the 'max' CPU model gives 'qemu-x86_64' maximum
compatibility with binaries it is likely to encounter in the wild,
and not likely to have a significant downside for existing usage.

Most other architectures already use an 'any' CPU model, which is
often mapped to 'max' (or similar) already, rather than the oldest
possible CPU model.

For the sake of consistency the 'i386' architecture is also changed
from using 'qemu32' to 'max'.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---

Changed in v2:

 - Fixed commit message typos

 linux-user/i386/target_elf.h   | 2 +-
 linux-user/x86_64/target_elf.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/i386/target_elf.h b/linux-user/i386/target_elf.h
index 1c6142e7da..238a9aba73 100644
--- a/linux-user/i386/target_elf.h
+++ b/linux-user/i386/target_elf.h
@@ -9,6 +9,6 @@
 #define I386_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
-    return "qemu32";
+    return "max";
 }
 #endif
diff --git a/linux-user/x86_64/target_elf.h b/linux-user/x86_64/target_elf.h
index 7b76a90de8..3f628f8d66 100644
--- a/linux-user/x86_64/target_elf.h
+++ b/linux-user/x86_64/target_elf.h
@@ -9,6 +9,6 @@
 #define X86_64_TARGET_ELF_H
 static inline const char *cpu_get_model(uint32_t eflags)
 {
-    return "qemu64";
+    return "max";
 }
 #endif
-- 
2.37.2


