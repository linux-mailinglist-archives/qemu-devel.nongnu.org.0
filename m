Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CEB59F75E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:22:42 +0200 (CEST)
Received: from localhost ([::1]:56610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnX0-00025Z-2D
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmtp-0002zk-Es
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:14 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:42698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmtn-0001XS-VP
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:13 -0400
Received: by mail-pg1-x52b.google.com with SMTP id q63so308900pga.9
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=W9655HKzuq1+51j74aBikX9dYDW+xgLkZuf/6fT2hgM=;
 b=LZ9T9xLYEDIxRmLrG3Z7caIqTnkKVucJaTIwdnqgRI/rNSwVne+Fh72ubSqCSFhn2B
 wuRns4mpJjX9lUQZikwgTmzTJIpzKmdAycv7DYJp3C2lcrK/6qXJ4qX4jzgcj02KO3Ur
 axb1Y7YVfrhiuCeFyT1U0GX1E4xh4W14vPlhvxgK487CNk+RkC4hN9LkVhO4E/a6TxUD
 hBUYaVAz8kB6mSKmq5E0W3y/38IbogIQOBSEwsn/cL6xyUsESHMg45y2xPxz2bEoc5Yn
 CMpw6rWI/C8kIghPoMNFwvzgpMf+VBfkaKe8GNiMGBUeuEe6j5qv6yo2SBLlmVGrtTV7
 dcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=W9655HKzuq1+51j74aBikX9dYDW+xgLkZuf/6fT2hgM=;
 b=VPU07YZGN03kYYnHGWub+T3O5zuqgHew3C8uYW9K5o15BjIi8aFZgWu6PJpJaiI2Dr
 1X7xcudo482GZ09mYOYoIIBdiLgdkdSeucpQ0CYy4d12lkYUNo4IuN+Wu9/VwWIjFk3u
 eXGEWon1X34MlplsNhOQu6PHmmQ6gJJvq6t+BArUUou8c0tuSn0nBNxOOs7Bnka7C9Ma
 gMhlycttNt+v8Xsb2vqsroXbCZ15rn2ukeVfbr15EPyTXbCMtgW0xe4tdURguCu+vce1
 o8u1PlzXmc9QKjd2Msjoh5kOirEx1n0ZITg/YZl0lyYy/whsMNIH8d21hpYTfyKbfh/r
 Juzw==
X-Gm-Message-State: ACgBeo13Vh5nYHCxPwc/dYdaQfB+EkUWwhQsbPXxHf0A6gQx2RRorUAB
 FmuEg8p0vTq00IsKQeLIZiA8lAQrX5Y=
X-Google-Smtp-Source: AA6agR4SM2xNBCe3ylE4R19QBJfDEEq6QBITiQSsCCr2necm9ff4/U1il/2Qt/bPhz+KUh5aL9GWyA==
X-Received: by 2002:a62:be0e:0:b0:536:76fe:ee96 with SMTP id
 l14-20020a62be0e000000b0053676feee96mr14546120pff.44.1661334130469; 
 Wed, 24 Aug 2022 02:42:10 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:10 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 13/51] tests/qtest: migration-test: Handle link() for win32
Date: Wed, 24 Aug 2022 17:39:51 +0800
Message-Id: <20220824094029.1634519-14-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

Windows does not provide a link() API like POSIX. Instead it provides
a similar API CreateHardLink() that does the same thing, but with
different argument order and return value.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/migration-test.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 38356d4aba..af9250750b 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -876,9 +876,17 @@ test_migrate_tls_x509_start_common(QTestState *from,
     g_mkdir_with_parents(data->workdir, 0700);
 
     test_tls_init(data->keyfile);
+#ifndef _WIN32
     g_assert(link(data->keyfile, data->serverkey) == 0);
+#else
+    g_assert(CreateHardLink(data->serverkey, data->keyfile, NULL) != 0);
+#endif
     if (args->clientcert) {
+#ifndef _WIN32
         g_assert(link(data->keyfile, data->clientkey) == 0);
+#else
+        g_assert(CreateHardLink(data->clientkey, data->keyfile, NULL) != 0);
+#endif
     }
 
     TLS_ROOT_REQ_SIMPLE(cacertreq, data->cacert);
-- 
2.34.1


