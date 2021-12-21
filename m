Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53AD47C3F3
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 17:39:56 +0100 (CET)
Received: from localhost ([::1]:55476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziB9-0001C5-UL
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 11:39:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mzi4k-0003VC-Og
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:33:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mzi4g-0004rL-Cm
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:33:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640104389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6fJbVcXmjfK7yiOxQQ/pnlKHKr7JD5Q1ZEyUBPZTFTU=;
 b=Mf3jfAXsEMU5QI7OdKWePw4nXecb8JxVRNWPodoy7hPcJtrhtcNVr088ULjf0Kxal3/U1Z
 RjvMxWZsTKANhap69lLX0uw4Vc+Xrsvqgt7kLVT3G3MVv7NMLEPFJkw1ErKWnFszBN1toM
 43RDVamsuKNaZX2PVGg+n4muEZ3YxS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-U6JiD3ddO1a81NWvwa6RqA-1; Tue, 21 Dec 2021 11:33:06 -0500
X-MC-Unique: U6JiD3ddO1a81NWvwa6RqA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 613D3835E21;
 Tue, 21 Dec 2021 16:33:05 +0000 (UTC)
Received: from avogadro.lan (unknown [10.39.193.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E6F510911A5;
 Tue, 21 Dec 2021 16:33:04 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] user: move common-user includes to a subdirectory of {bsd,
 linux}-user/
Date: Tue, 21 Dec 2021 17:32:59 +0100
Message-Id: <20211221163300.453146-3-pbonzini@redhat.com>
In-Reply-To: <20211221163300.453146-1-pbonzini@redhat.com>
References: <20211221163300.453146-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid polluting the compilation of common-user/ with local include files;
making an include file available to common-user/ should be a deliberate
decision in order to keep a clear interface that can be used by both
bsd-user/ and linux-user/.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 bsd-user/{ => include}/special-errno.h              | 0
 bsd-user/meson.build                                | 2 +-
 linux-user/{ => include}/host/aarch64/host-signal.h | 0
 linux-user/{ => include}/host/alpha/host-signal.h   | 0
 linux-user/{ => include}/host/arm/host-signal.h     | 0
 linux-user/{ => include}/host/i386/host-signal.h    | 0
 linux-user/{ => include}/host/mips/host-signal.h    | 0
 linux-user/{ => include}/host/ppc/host-signal.h     | 0
 linux-user/{ => include}/host/ppc64/host-signal.h   | 0
 linux-user/{ => include}/host/riscv/host-signal.h   | 0
 linux-user/{ => include}/host/s390/host-signal.h    | 0
 linux-user/{ => include}/host/s390x/host-signal.h   | 0
 linux-user/{ => include}/host/sparc/host-signal.h   | 0
 linux-user/{ => include}/host/sparc64/host-signal.h | 0
 linux-user/{ => include}/host/x32/host-signal.h     | 0
 linux-user/{ => include}/host/x86_64/host-signal.h  | 0
 linux-user/{ => include}/special-errno.h            | 0
 linux-user/meson.build                              | 4 ++--
 18 files changed, 3 insertions(+), 3 deletions(-)
 rename bsd-user/{ => include}/special-errno.h (100%)
 rename linux-user/{ => include}/host/aarch64/host-signal.h (100%)
 rename linux-user/{ => include}/host/alpha/host-signal.h (100%)
 rename linux-user/{ => include}/host/arm/host-signal.h (100%)
 rename linux-user/{ => include}/host/i386/host-signal.h (100%)
 rename linux-user/{ => include}/host/mips/host-signal.h (100%)
 rename linux-user/{ => include}/host/ppc/host-signal.h (100%)
 rename linux-user/{ => include}/host/ppc64/host-signal.h (100%)
 rename linux-user/{ => include}/host/riscv/host-signal.h (100%)
 rename linux-user/{ => include}/host/s390/host-signal.h (100%)
 rename linux-user/{ => include}/host/s390x/host-signal.h (100%)
 rename linux-user/{ => include}/host/sparc/host-signal.h (100%)
 rename linux-user/{ => include}/host/sparc64/host-signal.h (100%)
 rename linux-user/{ => include}/host/x32/host-signal.h (100%)
 rename linux-user/{ => include}/host/x86_64/host-signal.h (100%)
 rename linux-user/{ => include}/special-errno.h (100%)

diff --git a/bsd-user/special-errno.h b/bsd-user/include/special-errno.h
similarity index 100%
rename from bsd-user/special-errno.h
rename to bsd-user/include/special-errno.h
diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 9fcb80c3fa..8380fa44c2 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -4,7 +4,7 @@ endif
 
 bsd_user_ss = ss.source_set()
 
-common_user_inc += include_directories('.')
+common_user_inc += include_directories('include')
 
 bsd_user_ss.add(files(
   'bsdload.c',
diff --git a/linux-user/host/aarch64/host-signal.h b/linux-user/include/host/aarch64/host-signal.h
similarity index 100%
rename from linux-user/host/aarch64/host-signal.h
rename to linux-user/include/host/aarch64/host-signal.h
diff --git a/linux-user/host/alpha/host-signal.h b/linux-user/include/host/alpha/host-signal.h
similarity index 100%
rename from linux-user/host/alpha/host-signal.h
rename to linux-user/include/host/alpha/host-signal.h
diff --git a/linux-user/host/arm/host-signal.h b/linux-user/include/host/arm/host-signal.h
similarity index 100%
rename from linux-user/host/arm/host-signal.h
rename to linux-user/include/host/arm/host-signal.h
diff --git a/linux-user/host/i386/host-signal.h b/linux-user/include/host/i386/host-signal.h
similarity index 100%
rename from linux-user/host/i386/host-signal.h
rename to linux-user/include/host/i386/host-signal.h
diff --git a/linux-user/host/mips/host-signal.h b/linux-user/include/host/mips/host-signal.h
similarity index 100%
rename from linux-user/host/mips/host-signal.h
rename to linux-user/include/host/mips/host-signal.h
diff --git a/linux-user/host/ppc/host-signal.h b/linux-user/include/host/ppc/host-signal.h
similarity index 100%
rename from linux-user/host/ppc/host-signal.h
rename to linux-user/include/host/ppc/host-signal.h
diff --git a/linux-user/host/ppc64/host-signal.h b/linux-user/include/host/ppc64/host-signal.h
similarity index 100%
rename from linux-user/host/ppc64/host-signal.h
rename to linux-user/include/host/ppc64/host-signal.h
diff --git a/linux-user/host/riscv/host-signal.h b/linux-user/include/host/riscv/host-signal.h
similarity index 100%
rename from linux-user/host/riscv/host-signal.h
rename to linux-user/include/host/riscv/host-signal.h
diff --git a/linux-user/host/s390/host-signal.h b/linux-user/include/host/s390/host-signal.h
similarity index 100%
rename from linux-user/host/s390/host-signal.h
rename to linux-user/include/host/s390/host-signal.h
diff --git a/linux-user/host/s390x/host-signal.h b/linux-user/include/host/s390x/host-signal.h
similarity index 100%
rename from linux-user/host/s390x/host-signal.h
rename to linux-user/include/host/s390x/host-signal.h
diff --git a/linux-user/host/sparc/host-signal.h b/linux-user/include/host/sparc/host-signal.h
similarity index 100%
rename from linux-user/host/sparc/host-signal.h
rename to linux-user/include/host/sparc/host-signal.h
diff --git a/linux-user/host/sparc64/host-signal.h b/linux-user/include/host/sparc64/host-signal.h
similarity index 100%
rename from linux-user/host/sparc64/host-signal.h
rename to linux-user/include/host/sparc64/host-signal.h
diff --git a/linux-user/host/x32/host-signal.h b/linux-user/include/host/x32/host-signal.h
similarity index 100%
rename from linux-user/host/x32/host-signal.h
rename to linux-user/include/host/x32/host-signal.h
diff --git a/linux-user/host/x86_64/host-signal.h b/linux-user/include/host/x86_64/host-signal.h
similarity index 100%
rename from linux-user/host/x86_64/host-signal.h
rename to linux-user/include/host/x86_64/host-signal.h
diff --git a/linux-user/special-errno.h b/linux-user/include/special-errno.h
similarity index 100%
rename from linux-user/special-errno.h
rename to linux-user/include/special-errno.h
diff --git a/linux-user/meson.build b/linux-user/meson.build
index b2f4afd5e7..de4320af05 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -4,8 +4,8 @@ endif
 
 linux_user_ss = ss.source_set()
 
-common_user_inc += include_directories('host/' / host_arch)
-common_user_inc += include_directories('.')
+common_user_inc += include_directories('include/host/' / host_arch)
+common_user_inc += include_directories('include')
 
 linux_user_ss.add(files(
   'elfload.c',
-- 
2.33.1



