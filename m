Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A12374A1A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:27:02 +0200 (CEST)
Received: from localhost ([::1]:57032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leP2r-0000uv-Ft
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOpE-0001wZ-Di
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOp6-00058T-97
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BNIGbNGB2kAXmzDhqFSxh3VfwsIC++UOzvIwklsGj4s=;
 b=Fk5Bwwx9aQ1pXtVS1K/0zc1ZW5lKNzYh8j+TZNxzPyFUSDN99YFL3l+OadNJza+LZ74UNO
 IpDa43WuDlZPIncs0aN6dtrYdKy59w7OmdCD9bwfq+ozxHOq7ZEOMijWJ1ZJtVkLMh3xPk
 zbJNYrXmvOte83j/37Gwa9IPrzi5gG8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-mxZlCHDoMZWxZBLe1GkIHQ-1; Wed, 05 May 2021 17:12:46 -0400
X-MC-Unique: mxZlCHDoMZWxZBLe1GkIHQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 4-20020adf91840000b029010d9c088599so1216572wri.10
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BNIGbNGB2kAXmzDhqFSxh3VfwsIC++UOzvIwklsGj4s=;
 b=o7K29iZQpq9/yxJBTRv2GLpf2PSuOkjNoJm1FimcixBe8PgL1DFDpSidIkubwEAwy/
 9M3zdiJflJx3gGiU+UoaFggUyJbYP5Yyispo48GsRL3rQgrnG3sJxHfQYEMLrT8Qet3/
 0HnboRD6ePoRLMe7R7IEieCXNqrqG3e07egRJfadSjnbNeJb1N1WwFtQptAANXsdhREq
 CN4HGV7j9TtdkA3w5iqLvFs/k13sBSjQt2KGsQzHYvE31TItPbcHfQl4S6Li1hKybkVJ
 o9OzmmxST/uuXN5qzUgRXPevhJV05iMGsYiwxmF4ch6ryhT5lqE3QfkrlcD9tfLt/Tqj
 6VuQ==
X-Gm-Message-State: AOAM530fxjw6PifGPqdowxMt1yR8tB7Bm0Etd1AXW5eZ6Trj06+xsDzZ
 UlIFyIiI+goJfdUIW6Lfd7LqUiAblnyyDtAcX1b7ePA5Yz8w+KzD8VicSzsWBBYa3mFPf2/hmT7
 CtMnMzrCiYfH3S71zp4HJ5afeWRKdQchHIUSWxGeYETuMiJAlzQ1+7RRr6N64q/RO
X-Received: by 2002:adf:cc85:: with SMTP id p5mr1048090wrj.75.1620249164963;
 Wed, 05 May 2021 14:12:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSKnbW9quRN+wUvUODkYnuSjkpq3sgG+NpbBMsKxtmu82GgOeCRXqipeTdWbz31k5j5lvi5Q==
X-Received: by 2002:adf:cc85:: with SMTP id p5mr1048067wrj.75.1620249164748;
 Wed, 05 May 2021 14:12:44 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id n10sm665996wrw.37.2021.05.05.14.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:12:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/23] configure: Prohibit variable-length allocations by
 using -Wvla CPPFLAG
Date: Wed,  5 May 2021 23:10:47 +0200
Message-Id: <20210505211047.1496765-24-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505211047.1496765-1-philmd@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we converted all variable-length allocations in the
repository, add the -Wvla CPPFLAG to trigger a build failure
if such allocation is used.

This should help avoiding vulnerabilities such CVE-2021-3527
(see commit range 3f67e2e7f13..05a40b172e4).

Inspired-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 4f374b48890..a78ff15b52f 100755
--- a/configure
+++ b/configure
@@ -552,7 +552,7 @@ ARFLAGS="${ARFLAGS-rv}"
 # provides these semantics.)
 QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv $QEMU_CFLAGS"
 QEMU_CFLAGS="-Wundef -Wwrite-strings -Wmissing-prototypes $QEMU_CFLAGS"
-QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
+QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls -Wvla $QEMU_CFLAGS"
 QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
 
 # Flags that are needed during configure but later taken care of by Meson
-- 
2.26.3


