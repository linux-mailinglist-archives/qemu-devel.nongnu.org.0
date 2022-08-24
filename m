Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D0B59F84D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 13:03:02 +0200 (CEST)
Received: from localhost ([::1]:57616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQoA1-0004Vy-IE
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 07:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmvR-00050d-WD
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:54 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:34560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmvI-0001wz-89
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:53 -0400
Received: by mail-pl1-x634.google.com with SMTP id io24so1900802plb.1
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=4oQw+eQhY7hVGzdAfMaik/NQNQlk5bn8HV+UO9xrDSE=;
 b=f2HY8z/CO/OBp04wuKvuQwgymMtZa73d6IuR7cPd5mM/SZZu/v9nJeY5D0JozmrxlT
 cjrWdnLeTlZENE/dp1Qw/1Qf9OChl/4+SZOWrCzvJN4dgBM7DH5iWS0DLqgn3eRYOG21
 uqJj7NFeIeNcKKlzakeR+3PM+AGRzqYmmu17hxf8EZcA6WluPQNUcKMg0XeBBHrJdr3V
 9igS01XS1SApzZMimjAEf8sjr94/GpOOlcbhGS99DYE1cLp11i0HSI1xxl8IpHfL2B4O
 Q6JJv7ER2FXtcIZZfY6GMDBLqB827vcum3FTHuSqOCh8S5VcvJrpT3+Yk16GwGEoR2ny
 58Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=4oQw+eQhY7hVGzdAfMaik/NQNQlk5bn8HV+UO9xrDSE=;
 b=mmGuQMJQxNl7KmwCYuZyhVHE2A8Io9CTO1/AXKbVRA+EMZdyaLVoDtGDIoXXIqPCp5
 puOGTC76KfXZF+snLgv89mEsWd4rIAzXgJEC/zFOlITCnip2OouclOolYOUI6q3why/i
 CqVChaQPuSRaVjLzKD3Jm+/mHUZ7+rNCagaNVxqrXvM/GbuG2Izc0vEThZNxwZ84VDRh
 xcRAXRlsXfCL1LEvxQKT/KftVyxcIDVSJ9PIrk/EKapE5qFMPpWzHAWsUmm6JtpznveV
 GxxXOx68U6PuW8JMm+gx/haT1ltpwZy5eMQnEpZoGuUuQxIJyUFGeZf/bLbYToySz1at
 fGcQ==
X-Gm-Message-State: ACgBeo0qcSqwT3oid8Z0MsHZXQSfcRy9QinHyjGbXP2ZnwKFBJnRqT33
 NYgQbe/sB7E8o5WmZOxi2qByMQ6jk/E=
X-Google-Smtp-Source: AA6agR6U2Ff7fq2DkSsnsBw10MHiNNF26Ys3D2dsl58nWz0J/xzQ0r7mSgnI4KL5vK7RKnJCoi8XJQ==
X-Received: by 2002:a17:903:2450:b0:173:9fe:70e5 with SMTP id
 l16-20020a170903245000b0017309fe70e5mr4863488pls.148.1661334222779; 
 Wed, 24 Aug 2022 02:43:42 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:43:42 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Willian Rampazzo <willianr@redhat.com>
Subject: [PATCH 51/51] docs/devel: testing: Document writing portable test
 cases
Date: Wed, 24 Aug 2022 17:40:29 +0800
Message-Id: <20220824094029.1634519-52-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Update the best practices of how to write portable test cases that
can be built and run successfully on both Linux and Windows hosts.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 docs/devel/testing.rst | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 3f6ebd5073..8fcabda30f 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -115,6 +115,36 @@ check-block
 are in the "auto" group).
 See the "QEMU iotests" section below for more information.
 
+Writing portable test cases
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Both unit tests and qtests can run on a Linux host as well as a Windows host.
+Care must be taken when writing portable test cases that can be built and run
+successfully on both hosts. The following are some best practices:
+
+* Use portable APIs from glib whenever necessary, e.g.: g_setenv(),
+  g_mkdtemp(), g_mkdir_with_parents().
+* Avoid using hardcoded /tmp for temporary file directory.
+  Use g_get_tmp_dir() instead.
+* Bear in mind that Windows has different special string representation for
+  stdin/stdout/stderr and null devices. For example if your test case uses
+  "/dev/fd/2" and "/dev/null" on Linux, remember to use "2" and "nul" on
+  Windows instead. Also IO redirection does not work on Windows, so avoid
+  using "2>nul" whenever necessary.
+* If your test cases uses the blkdebug feature, use relative path to pass
+  the config and image file paths in the command line as Windows absolute
+  path contains the delimeter ":" which will confuse the blkdebug parser.
+* Use double quotes in your extra QEMU commmand line in your test cases
+  instead of single quotes, as Windows does not drop single quotes when
+  passing the command line to QEMU.
+* Windows opens a file in text mode by default, while a POSIX compliant
+  implementation treats text files and binary files the same. So if your
+  test cases opens a file to write some data and later wants to compare the
+  written data with the original one, be sure to pass the letter 'b' as
+  part of the mode string to fopen(), or O_BINARY flag for the open() call.
+* If a certain test case can only run on POSIX or Linux hosts, use a proper
+  #ifdef in the codes. If the whole test suite cannot run on Windows, disable
+  the build in the meson.build file.
+
 QEMU iotests
 ------------
 
-- 
2.34.1


