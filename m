Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB1C4C575A
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 19:13:29 +0100 (CET)
Received: from localhost ([::1]:42148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO1ZR-0006bV-2d
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 13:13:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1Th-0005Ye-QQ
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:34 -0500
Received: from [2a00:1450:4864:20::431] (port=36642
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1Tc-0004NH-OO
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:31 -0500
Received: by mail-wr1-x431.google.com with SMTP id r10so9201913wrp.3
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 10:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uPrIPUtrD7DVBHc6YiS8HprIW42ya5uWba9xJ+v1w9U=;
 b=SAQmO2obJJRRwjizDWZ10WP2vySBnCuGbbC2Sv7eYjyyppe57zfWwAjNwWMIqOus19
 FBVlp5hiVK58+Ygx70TtPFxlPmSXTRyWah73+kiOEl7doMohjIw+6l1FBX6mgkUAcqCc
 Fm6oUuHHWcCUrCoWyVYjHF2Eohl3bInT6gr+sMch+d3uQL9bDQSufcI5j7EkSN1bX5Ki
 UdBp7OudDNykDEU4fqCbVC025YEL4yRlOQ8qXhe6W3Hu7qmAQc47UaJJG/b0Yvk100RQ
 33dj9pEiWmhEvQn/Sk6AYAz4/kJMf78MmG1gWtPCvn1gM6Y6m/4fXQb8gjNVqy6KJz5L
 DvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uPrIPUtrD7DVBHc6YiS8HprIW42ya5uWba9xJ+v1w9U=;
 b=LmK+akDUBr+6Ogack93ylScFgDlGxvQzcDZnTDFKgCNdDG5zd+klYb4R+e+KbD8wWX
 Ker+tS+n5mVAFYZg3ATkHcfts6kP91WlYDOC0h5lSI4NeD11UyzWMfcY4OCBuo7v9cp9
 C6yd7B0ezzF7LFw/ZD2G18FpwGifgjew26mk4soaEbGT0F6Z87SyAQqD9y2hkA7HvGkm
 9u+aaolrkfM7RdD5GFKrtfPcGajJNCTFfq1xtSyWTizdZr4BokGljWvVFb+NzE6drQV/
 fPNyW5DeNtZD0hYYZ9pczMqmb3lvULlMQt1loLJU5hCGEq+xbEXEDButboR35NOXtCO1
 DX+A==
X-Gm-Message-State: AOAM533HYKNE5Hdf+GZTHMFSfibMxsoo5GwpfTPLaHdkKPXJBXHaI9sJ
 +botGYT4GuBow5QPX+l36BtPeVSaWUmcBA==
X-Google-Smtp-Source: ABdhPJy0o5RlBiM75lul6NzBpzIV22pFjVoJXgbrA2KkHRwoN7Uguko5BluZCifFAEAFZPJRux0tHw==
X-Received: by 2002:a5d:4892:0:b0:1ed:beaa:778a with SMTP id
 g18-20020a5d4892000000b001edbeaa778amr10095459wrq.35.1645898847282; 
 Sat, 26 Feb 2022 10:07:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adfe64f000000b001e60965a5d4sm5622409wrn.44.2022.02.26.10.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 10:07:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] hw/usb/redirect.c: Stop using qemu_oom_check()
Date: Sat, 26 Feb 2022 18:07:15 +0000
Message-Id: <20220226180723.1706285-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220226180723.1706285-1-peter.maydell@linaro.org>
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
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
---
I have left all of these errors as fatal, since that's what they
were previously. Possibly somebody with a better understanding
of the usbredir code might be able to make them theoretically
non-fatal, but we make malloc failures generally fatal anyway.
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


