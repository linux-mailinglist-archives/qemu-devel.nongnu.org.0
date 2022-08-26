Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 773B85A270A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 13:47:29 +0200 (CEST)
Received: from localhost ([::1]:36288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRXo7-0003fs-IU
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 07:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oRXg9-0006eS-4Y
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:39:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oRXg5-0001ZY-Ub
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:39:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661513947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QGQfiRXY1P7oSqFM0DZ3WGxhXMFrLt1ZWKqLPALdsJo=;
 b=EF0gqAcbrhZR8tCcXeCRRdZHx6zoC2Vy5HjrooYo9+362ZgWNHMVZoS2cHBC2jRjZ2VtbQ
 bBkCwf1eT3XwT4W1tramyUk6bk8itF+mx/++Q4cxJyNHuRuDjJzbko4CNuwTsQk4EurNiM
 a6dKFLdpyx39WkFMuTRC5ztnRdSxNvs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-RD5H3c87NlKGjxvY1MDg2A-1; Fri, 26 Aug 2022 07:39:04 -0400
X-MC-Unique: RD5H3c87NlKGjxvY1MDg2A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11D1D3802B88;
 Fri, 26 Aug 2022 11:39:04 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7945492C3B;
 Fri, 26 Aug 2022 11:39:02 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] linux-user: use 'max' instead of 'qemu32' / 'qemu64' by
 defualt
Date: Fri, 26 Aug 2022 12:39:00 +0100
Message-Id: <20220826113900.794046-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The 'qemu64' CPU model implements the least featureful x86_64 CPU that's
possible. Historically this hasn't been an issue since it was rare for
OS distros to build with a higher mandatory CPU baseline.

With RHEL-9, however, the entire distro is built for the x86_64-v2 ABI
baseline:

  https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise-linux-9-for-the-x86-64-v2-microarchitecture-level

It is likely that other distros may take similar steps in the not too
distant future. For example, it has been suggested for Fedora on a
number of occassions.

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

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
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


