Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160D25FA2EF
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 19:51:02 +0200 (CEST)
Received: from localhost ([::1]:58458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohwvc-0000pj-Sf
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 13:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwax-0000wF-5X
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwar-0006Zh-Or
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665422972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2iwODXw0y1ZBoetM/4mM4qd7/Y+WK2plkhEqQ5sfQbQ=;
 b=JHCuPQ1dAmOFeGoh8A7MnH8rzCoOeTSeOM28PZLr9vdFloY5pDllM+Hvp/m7GhPsY6p95p
 1yjHr0SyXGoRrDKjpaaG9Acx3n4foO7/rP/GLYIvxZXB7s3vp+wdwMbyRmbWQuQeqEYnzJ
 LYPAxDSjSWu6DfQTH/XQOM9UPR028F4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-498-F1Lmhsh5NrmAOjl1jyQD4A-1; Mon, 10 Oct 2022 13:29:31 -0400
X-MC-Unique: F1Lmhsh5NrmAOjl1jyQD4A-1
Received: by mail-wm1-f69.google.com with SMTP id
 fc12-20020a05600c524c00b003b5054c70d3so7291277wmb.5
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2iwODXw0y1ZBoetM/4mM4qd7/Y+WK2plkhEqQ5sfQbQ=;
 b=gCRfQmoyEA5hbILX2H7poqZ6PND03ml/6nil9Yy7ou5EBtk+3YZySAbQBfVbltkyOh
 alyvCBulpkn1/j/jtc5an+i7wvYL7KLm5thy6zylkqzMH4PSsSE6beu4FiSL0Fw38ZCz
 2Zh+3rDw4PsR25h0LXa/br0ellq+s2hrgHYt7JFcWUhlPg8TUTy3RomkC9UD6ySAUAwo
 0UzGqosvoJ1zYuvqfwhiycRxwT83TLyeAXK559Un/7RsdRP90t8A5bP7DOuHfZxzCD1V
 9Ry6I1Ntq51eQhIPE3mUnElT8yuCW2usd0kurqsfpw5U29XQ4tu4HsJvcw44zhtRt29F
 Pkig==
X-Gm-Message-State: ACrzQf0n8dU5a4+hOWl+81yNfi1rWzFEzypblgTO0Aj/IyaBCGwrSfrd
 1Fa559hTh6dGfx2C2ERvh4gvPwim9Ead1EvXLYpQJpdDxQhqPNRonJ1vvdQJ3XrKedM36w0liyM
 RsKRYHJo0EUIxah5TWHCUHALKKhAZlsrB57Gp8rW4kxjUHf64pj8+CosNG2Da
X-Received: by 2002:adf:e112:0:b0:21d:7195:3a8d with SMTP id
 t18-20020adfe112000000b0021d71953a8dmr12813380wrz.371.1665422969920; 
 Mon, 10 Oct 2022 10:29:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM707a/IObCaFtb9WHMjypQEwjKKu5V7Zo3e15IxTnCB4Ee7Pg0J5tEictIfHozO+veB074yyA==
X-Received: by 2002:adf:e112:0:b0:21d:7195:3a8d with SMTP id
 t18-20020adfe112000000b0021d71953a8dmr12813361wrz.371.1665422969623; 
 Mon, 10 Oct 2022 10:29:29 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 d4-20020adffbc4000000b00225307f43fbsm7281023wrs.44.2022.10.10.10.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:29:29 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:29:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 11/55] tests/qtest: pass stdout/stderr down to subtests
Message-ID: <20221010172813.204597-12-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Alex Bennée <alex.bennee@linaro.org>

When trying to work out what the virtio-net-tests where doing it was
hard because the g_test_trap_subprocess redirects all output to
/dev/null. Lift this restriction by using the appropriate flags so you
can see something similar to what the vhost-user-blk tests show when
running.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220407150042.2338562-1-alex.bennee@linaro.org>

Message-Id: <20220802095010.3330793-15-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/qos-test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index 831db5cf2a..33cdada380 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -185,7 +185,9 @@ static void run_one_test(const void *arg)
 static void subprocess_run_one_test(const void *arg)
 {
     const gchar *path = arg;
-    g_test_trap_subprocess(path, 0, 0);
+    g_test_trap_subprocess(path, 0,
+                           G_TEST_SUBPROCESS_INHERIT_STDOUT |
+                           G_TEST_SUBPROCESS_INHERIT_STDERR);
     g_test_trap_assert_passed();
 }
 
-- 
MST


