Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42144313C4D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:07:18 +0100 (CET)
Received: from localhost ([::1]:52038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9AwP-0006ww-4e
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96kJ-0003A0-Oz
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96jr-00053v-NV
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612791479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zd2sUby5yhKeqxKOsP+O8+QU7t821C4Cc3m/BR5oUhI=;
 b=En2gf6GO4PQfgeoFa1aK4ZwDBieq0YF33ExH/mjTVRkpx6xNv96hXtMns80l78pVKBoQXz
 s69yJLwOwF/nhfivMAyA9p3nNgIne9h0AZk8NVrZq9mYc3x4AWeC70DUERNUTJCvm2kajg
 /njXVuzPNNe6pGIxdTOQW7GFbNvTs10=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-llkV1B1MN5eBBRIUU3zTbQ-1; Mon, 08 Feb 2021 08:37:57 -0500
X-MC-Unique: llkV1B1MN5eBBRIUU3zTbQ-1
Received: by mail-wr1-f70.google.com with SMTP id c1so13252333wrx.2
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:37:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zd2sUby5yhKeqxKOsP+O8+QU7t821C4Cc3m/BR5oUhI=;
 b=WJ/LlYH7Qu2haReBy7PKusl/SbedYwKx8c/9sGhH1IMCKu8lyveXvk156GfabLYF6s
 phipit+L4cN+G6D9GtLDZawHvGy00CQQKBIEs6AEp7KtTV0u2sHJ2ycci2Jadu4BlDNC
 w7zf7SEJLpl1ND857f2rZhcwqBxqZVsWpv+M/nGk9upcbM0znhKnfb0Rt1OOqoA476DK
 QWrjN9pM6u2t2F+B4+31K5jdXb/w8/zTEGu+vnK8EGcfqN107ePVEW9Ww0KIdrgw0sAm
 G6Lko/9luEd8BzY7VYoOWVoyTc2O19iQZejOacxubKNchsa+yH3rNwxrzP7k3XFuGdKn
 YptQ==
X-Gm-Message-State: AOAM530IlNZy0G6/zHo27wtb87b+7jvRQ88rHeoU7UGx9VqFpZ9B7TYq
 jUW7+S6bovsHsm4hbq7truZzRcmFjrHyV7RD6jhk8fhzPvZ5g/CLoJ7kio3c7QOVgrkRVsGzrc1
 oB0Przx+rvaoTMbyzMXgIJNYV9HrklW4ODuLZyCLxs+j6yxyKKD2JTXV+Ub5In098
X-Received: by 2002:adf:efc2:: with SMTP id i2mr19503447wrp.422.1612791476281; 
 Mon, 08 Feb 2021 05:37:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8ZuS3cyjdXoQRQ9Dnw1GIXZcyaQ9W9UqBNZbI1HUyoc9FCD0aX9rp11GgC9p05cBmFgCS4w==
X-Received: by 2002:adf:efc2:: with SMTP id i2mr19503423wrp.422.1612791475975; 
 Mon, 08 Feb 2021 05:37:55 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k11sm14738930wrv.51.2021.02.08.05.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:37:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/18] tests/acceptance: Increase the timeout in the replay
 tests
Date: Mon,  8 Feb 2021 14:37:01 +0100
Message-Id: <20210208133711.2596075-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208133711.2596075-1-philmd@redhat.com>
References: <20210208133711.2596075-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Our gitlab-CI just showed a failed test_ppc_mac99 since it was apparently
killed some few seconds before the test finished. Allow it some more
time to complete.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Acked-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-Id: <20210127065222.48650-1-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/replay_kernel.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 772633b01da..c1cb8624683 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -31,7 +31,7 @@ class ReplayKernelBase(LinuxKernelTest):
     terminates.
     """
 
-    timeout = 90
+    timeout = 120
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=1 panic=-1 '
 
     def run_vm(self, kernel_path, kernel_command_line, console_pattern,
-- 
2.26.2


