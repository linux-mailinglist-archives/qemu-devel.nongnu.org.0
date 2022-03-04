Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538ED4CD357
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 12:24:33 +0100 (CET)
Received: from localhost ([::1]:57696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ62x-0005Uv-Rx
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 06:24:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ606-0002VK-C2
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:21:34 -0500
Received: from [2a00:1450:4864:20::32d] (port=35643
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ603-0004dv-H2
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:21:34 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so7030832wmj.0
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 03:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZNZZHp62CxnlLWVTnJBVL309n4Twf4DbK/QyJ2gwLqA=;
 b=LjxK+GVmazJ8aWmC6+Xnh7J1XDLp+Pw6wKRVdWhqsEr7kh6W22e62CCGnhxJSM47vr
 Q4F2KqsQHmdJ+WuleYR3Tiqenod7iy4NaFtZ80MHhTkU/PxDC8WrD9GvJdSgEokXMwmJ
 lKvlOhm4LH/3WMmzHWGPsIA8+bt7NHdKoLIF1md4Awy74jWw1UsdDOYwtxEn+r0AVExK
 KkLoemUqOpJS8yewVxZGNfvXrQxdTkaMtrBe1qbeJRTGU0JLrRc4of6Rs5f/MxVlud0U
 T+NMmkF44qqFJNyHlEMQm024hQpnAAJBu1Owtdhha4bC+dYSKnn0RLMI+dNkQAnEoFA/
 kxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZNZZHp62CxnlLWVTnJBVL309n4Twf4DbK/QyJ2gwLqA=;
 b=4QUodWv+p9ehR128V2DOkz1IR4FwSsRu5Jv8F6e0tRztJvJTKGD16PyrI/3eAbU8KF
 ck4L+3Z8bvogrtSMXScmpbzjhG4kMLfhaD11Fz3B/iMQwzg3cq2ZClxoERQwv5cZi0ot
 BRKZ6y5f6MN/yrPwUK1whgTQ57BPaXID+ti9qQeNRkgWH0n1VwBD4oBHbCDGyVFGGzMP
 lVqFvInSRXxPdiEmt56hKbqsRv9zkDs9RGWxJHvMHP4kfigrV9+5f2MgHsU1auUzNRHs
 22BH4ZViSHDCqItrWdNt87TALI5WlJDFlUy22n+7VMWIoOVZ3NK53KgICgIJ2J6v+p4Q
 BY+g==
X-Gm-Message-State: AOAM533l2yh8QLRTITFev3hzOuVuhFBl+JIgaWlxLaINRVfdaj57d7m7
 78lp3sCgeDPU8/1hMqAty+GlTB50IZxviA==
X-Google-Smtp-Source: ABdhPJxlZJq381RY0wemJ27MpYpRTsQeOi+R4PgRIW26qsaKxX8Ibj7osbmF/c8x+fcaNc24Rr9SlQ==
X-Received: by 2002:a05:600c:4f85:b0:382:e2bf:5fd2 with SMTP id
 n5-20020a05600c4f8500b00382e2bf5fd2mr7354132wmq.30.1646392890257; 
 Fri, 04 Mar 2022 03:21:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfed4e000000b001e3323611e5sm4148651wro.26.2022.03.04.03.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 03:21:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/9] hw/usb/redirect.c: Stop using qemu_oom_check()
Date: Fri,  4 Mar 2022 11:21:18 +0000
Message-Id: <20220304112126.2261039-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304112126.2261039-1-peter.maydell@linaro.org>
References: <20220304112126.2261039-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_oom_check() is a function which essentially says "if you pass me
a NULL pointer then print a message then abort()".  On POSIX systems
the message includes strerror(errno); on Windows it includes the
GetLastError() error value printed as an integer.

Other than in the implementation of qemu_memalign(), we use this
function only in hw/usb/redirect.c, for three checks:

 * on a call to usbredirparser_create()
 * on a call to usberedirparser_serialize()
 * on a call to malloc()

The usbredir library API functions make no guarantees that they will
set errno on errors, let alone that they might set the
Windows-specific GetLastError string.  malloc() is documented as
setting errno, not GetLastError -- and in any case the only thing it
might set errno to is ENOMEM.  So qemu_oom_check() isn't the right
thing for any of these.  Replace them with straightforward
error-checking code.  This will allow us to get rid of
qemu_oom_check().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20220226180723.1706285-2-peter.maydell@linaro.org
---
 hw/usb/redirect.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 5f0ef9cb3b0..8692ea25610 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -1239,7 +1239,11 @@ static void usbredir_create_parser(USBRedirDevice *dev)
 
     DPRINTF("creating usbredirparser\n");
 
-    dev->parser = qemu_oom_check(usbredirparser_create());
+    dev->parser = usbredirparser_create();
+    if (!dev->parser) {
+        error_report("usbredirparser_create() failed");
+        exit(1);
+    }
     dev->parser->priv = dev;
     dev->parser->log_func = usbredir_log;
     dev->parser->read_func = usbredir_read;
@@ -2239,7 +2243,10 @@ static int usbredir_put_parser(QEMUFile *f, void *priv, size_t unused,
     }
 
     usbredirparser_serialize(dev->parser, &data, &len);
-    qemu_oom_check(data);
+    if (!data) {
+        error_report("usbredirparser_serialize failed");
+        exit(1);
+    }
 
     qemu_put_be32(f, len);
     qemu_put_buffer(f, data, len);
@@ -2330,7 +2337,11 @@ static int usbredir_get_bufpq(QEMUFile *f, void *priv, size_t unused,
         bufp->len = qemu_get_be32(f);
         bufp->status = qemu_get_be32(f);
         bufp->offset = 0;
-        bufp->data = qemu_oom_check(malloc(bufp->len)); /* regular malloc! */
+        bufp->data = malloc(bufp->len); /* regular malloc! */
+        if (!bufp->data) {
+            error_report("usbredir_get_bufpq: out of memory");
+            exit(1);
+        }
         bufp->free_on_destroy = bufp->data;
         qemu_get_buffer(f, bufp->data, bufp->len);
         QTAILQ_INSERT_TAIL(&endp->bufpq, bufp, next);
-- 
2.25.1


