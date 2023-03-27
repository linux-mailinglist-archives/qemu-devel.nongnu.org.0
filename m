Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6147B6CA8BA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 17:14:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgoXm-00029b-3A; Mon, 27 Mar 2023 11:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pgoXk-00028s-0H
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 11:13:56 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pgoXh-0007EW-Rn
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 11:13:55 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 o24-20020a05600c511800b003ef59905f26so5519026wms.2
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 08:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679930032;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QR3eFI1YBusjJFxELA1uMrW+HLPKDF1RqkNPTjIurW4=;
 b=uCMlBD3rIbIwVezUcXkwGnCIPCI/8+LiqVP1jvXMAPCRtUSfONmko4uH+t7bkdnMak
 HReWY5vhoU5HEkQyVqS7m7k4tnzo5guWDCTTAgod6CbIFVx0/smCDHl+32BJBVVRhq7m
 MTHwaT5mCi0JbG5R8hcPYrS6HVd8R5hGy6NrvKL/FctnWxad3dnp0sNdoz2eCFQbkkji
 RYL39QUlK2hiie3cgeMmjkMQD9jyvWBxUepFqBk+KcI5poPZ7dcidFojVE1XKdQkcBQY
 ie9aEoDv6Ngzgvnl++cc1EEvCB265q4VS9vcVCyS5k/es1Q1lqTn0VIA9ig9YI3v0gb/
 VO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679930032;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QR3eFI1YBusjJFxELA1uMrW+HLPKDF1RqkNPTjIurW4=;
 b=6u9MNf9xjJFYUbKDZw/CYziVvFiREgrC7ezDSdY0oUu9rrOKna9YQXuCwDsKqb/3/v
 6DA5rupFEUefoAwcUu4X6k1XMH10sh9hl9pVDQ1U7Ej3VUsQAtsnSVeRrIn3zPIlmW1v
 aj0aeQgDgh2nYhYSd6vl4IVb8OQdoLq9Tirw6qkR1nZh9HQeGGiLhqcsFpWF0LyNMrCB
 wenWynwe/C6A3NR0yw9ymK0yb+NTHzkmZBo83hUYlwwAoDPlI1fcrURdhvopZVglzPgt
 21GENOdHQGrXwJbDDIlFedJT4n+Cv0Y9dzxGm/UiwwcU3cblsnUVVy+Mloj8rJJOpr7n
 d6yA==
X-Gm-Message-State: AO0yUKWl5vWjRR7Vz1BYEIKGZorPERZoybfX4Dm3hpYcTeiBo/AK+OP5
 0IQiHzxXvq1DfB/930UGHr4rVHgs8tuJLOvgNlc=
X-Google-Smtp-Source: AK7set/IekUOyRwyIJOP83RHR6xw/27WzVhoGjbjEJgLd0SQ9glIe4n89h1EKoO+m6kgkCoLzupHmA==
X-Received: by 2002:a05:600c:b42:b0:3ee:6cdf:c357 with SMTP id
 k2-20020a05600c0b4200b003ee6cdfc357mr8667483wmr.20.1679930032017; 
 Mon, 27 Mar 2023 08:13:52 -0700 (PDT)
Received: from localhost.localdomain
 (4be54-h02-176-184-9-157.dsl.sta.abo.bbox.fr. [176.184.9.157])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a7bc8d8000000b003eb596cbc54sm14122103wml.0.2023.03.27.08.13.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Mar 2023 08:13:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Peter Wu <peter@lekensteyn.nl>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Julio Faracco <jcfaracco@gmail.com>
Subject: [PATCH-for-8.0] block/dmg: Ignore C99 prototype declaration mismatch
 from <lzfse.h>
Date: Mon, 27 Mar 2023 17:13:49 +0200
Message-Id: <20230327151349.97572-1-philmd@linaro.org>
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

When liblzfe (Apple LZFSE compression library) is present
(for example installed via 'brew') on Darwin, QEMU build
fails as:

  Has header "lzfse.h" : YES
  Library lzfse found: YES

    Dependencies
      lzo support                  : NO
      snappy support               : NO
      bzip2 support                : YES
      lzfse support                : YES
      zstd support                 : YES 1.5.2

    User defined options
      dmg                          : enabled
      lzfse                        : enabled

  [221/903] Compiling C object libblock.fa.p/block_dmg-lzfse.c.o
  FAILED: libblock.fa.p/block_dmg-lzfse.c.o
  /opt/homebrew/Cellar/lzfse/1.0/include/lzfse.h:56:43: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
  LZFSE_API size_t lzfse_encode_scratch_size();
                                            ^
                                             void
  /opt/homebrew/Cellar/lzfse/1.0/include/lzfse.h:94:43: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
  LZFSE_API size_t lzfse_decode_scratch_size();
                                            ^
                                             void
  2 errors generated.
  ninja: build stopped: subcommand failed.

This issue has been reported in the lzfse project in 2016:
https://github.com/lzfse/lzfse/issues/3#issuecomment-226574719

Since the project seems unmaintained, simply ignore the
strict-prototypes warning check for the <lzfse.h> header,
similarly to how we deal with the GtkItemFactoryCallback
prototype from <gtk/gtkitemfactory.h>, indirectly included
by <gtk/gtk.h>.

Cc: Julio Faracco <jcfaracco@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 block/dmg-lzfse.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/block/dmg-lzfse.c b/block/dmg-lzfse.c
index 6798cf4fbf..0abc970bf6 100644
--- a/block/dmg-lzfse.c
+++ b/block/dmg-lzfse.c
@@ -23,7 +23,12 @@
  */
 #include "qemu/osdep.h"
 #include "dmg.h"
+
+/* Work around an -Wstrict-prototypes warning in LZFSE headers */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wstrict-prototypes"
 #include <lzfse.h>
+#pragma GCC diagnostic pop
 
 static int dmg_uncompress_lzfse_do(char *next_in, unsigned int avail_in,
                                    char *next_out, unsigned int avail_out)
-- 
2.38.1


