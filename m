Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120F0625AA8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 13:46:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otTQ0-0005md-J8; Fri, 11 Nov 2022 07:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otTPx-0005lb-9l
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:45:58 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otTPu-0001l5-NU
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:45:56 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 ja4-20020a05600c556400b003cf6e77f89cso5660048wmb.0
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 04:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=11JiuZW9XczeUDUdrupJ37Xgv3YrtWkVOdT0bjn2y5Y=;
 b=P9SOla0jd7LsuZf8fkyQJP+cyJqwtaLEGxoydVSKrfVbHxgjq5+JdIg2WLRUkxlycA
 khjTYPNV9CpX3Lr8O92gn32sYMhKEo/QObM59lk2W59TGU6O5g6Yy6q1lLfdLwO91U+B
 159ZR//fIcpmyDGLcpnTZWatrP83j9x0BPjCSw5Jrff9q0oZ59PMHeDwi97nU5rLG0NW
 zRawREgIABz6vDHphGGaWlLBqc8Djyvj5uNB7eT/JEXVhFaFpjXxNibtjlQAvATJgX9M
 Rg1FBKPe2/MAuuRBB4QaTZ41v9MvWJFChBKomtQlxDWCMBlLmkRvCc4WssRvP1XXE4QD
 UHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=11JiuZW9XczeUDUdrupJ37Xgv3YrtWkVOdT0bjn2y5Y=;
 b=QZwJonbWDfkNXC4UTtQYBDiFHjce4mP6C37TOh5yaJZW/5B6+4Ro+w389GhnjYUeQl
 M0OXUTZgSB6oAF41cY9LbztCxAm5OIhCPhUrWSgM8OdvaG3p328jqytKI4gnBRvflVHj
 FIJ/zA9OjMul3eGwCIZc0Y5XZQ1vshEe1t9FrhCNg2RB0OJGdtmO9eVhhy8e44fqbtD+
 gK3GHCuQk0o/TqkoCDVnCYBzCLlmDIo3D5JZENQG/ovio6aA4bZxOOrNpTaOo2I/ap4Z
 FVKUhfyWHolihe5RN1hBNQRGBnsvdiVxZjRnrnzc9U9vZ9CbMbBR8kIJQTxcUAnhTD8J
 ExQA==
X-Gm-Message-State: ANoB5pnGxBigmAL3+zhSIsNjsX3cx/gkts2NnBmGQ49qtwzTXTrFaZlH
 vgwt5kEf5wo5iHVpLU3F41xsUVAEcdtn1x63cUA=
X-Google-Smtp-Source: AA0mqf4ZHvvnlVRTnkMCm9EijcN4WONg/sm2bjpjbonlcUx3dgbVvoqtG8c2zr2Wt4+x81kozw6g0A==
X-Received: by 2002:a05:600c:295:b0:3cf:a457:2d89 with SMTP id
 21-20020a05600c029500b003cfa4572d89mr1138651wmk.20.1668170752768; 
 Fri, 11 Nov 2022 04:45:52 -0800 (PST)
Received: from localhost.localdomain
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a05600c354b00b003b4ff30e566sm3391659wmq.3.2022.11.11.04.45.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 11 Nov 2022 04:45:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xie Yongji <xieyongji@bytedance.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH-for-7.2 v2] libvduse: Avoid warning about dangerous use of
 strncpy()
Date: Fri, 11 Nov 2022 13:45:50 +0100
Message-Id: <20221111124550.35753-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

GCC 8 added a -Wstringop-truncation warning:

  The -Wstringop-truncation warning added in GCC 8.0 via r254630 for
  bug 81117 is specifically intended to highlight likely unintended
  uses of the strncpy function that truncate the terminating NUL
  character from the source string.

Here the next line indeed unconditionally zeroes the last byte, but
1/ the buffer has been calloc'd, so we don't need to add an extra
byte, and 2/ we called vduse_name_is_invalid() which checked the
string length, so we can simply call strcpy().

This fixes when using gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0:

  [42/666] Compiling C object subprojects/libvduse/libvduse.a.p/libvduse.c.o
  FAILED: subprojects/libvduse/libvduse.a.p/libvduse.c.o
  cc -m64 -mcx16 -Isubprojects/libvduse/libvduse.a.p -Isubprojects/libvduse -I../../subprojects/libvduse [...] -o subprojects/libvduse/libvduse.a.p/libvduse.c.o -c ../../subprojects/libvduse/libvduse.c
  In file included from /usr/include/string.h:495,
                   from ../../subprojects/libvduse/libvduse.c:24:
  In function ‘strncpy’,
      inlined from ‘vduse_dev_create’ at ../../subprojects/libvduse/libvduse.c:1312:5:
  /usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error: ‘__builtin_strncpy’ specified bound 256 equals destination size [-Werror=stringop-truncation]
    106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors
  ninja: build stopped: cannot make progress due to previous errors.

Fixes: d9cf16c0be ("libvduse: Replace strcpy() with strncpy()")
Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Supersedes: <20220919192306.52729-1-f4bug@amsat.org>
Cc: Xie Yongji <xieyongji@bytedance.com>
Cc: Kevin Wolf <kwolf@redhat.com>
---
 subprojects/libvduse/libvduse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index 1a5981445c..e089d4d546 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -1309,8 +1309,8 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
         goto err_dev;
     }
 
-    strncpy(dev_config->name, name, VDUSE_NAME_MAX);
-    dev_config->name[VDUSE_NAME_MAX - 1] = '\0';
+    assert(!vduse_name_is_invalid(name));
+    strcpy(dev_config->name, name);
     dev_config->device_id = device_id;
     dev_config->vendor_id = vendor_id;
     dev_config->features = features;
-- 
2.38.1


