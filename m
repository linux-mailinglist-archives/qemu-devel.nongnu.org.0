Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC64C5EC474
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:29:43 +0200 (CEST)
Received: from localhost ([::1]:41166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAec-00012K-Vt
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Sb-0004SG-CE
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:09:13 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:33369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8SY-0005Rv-H2
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:09:09 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 bu5-20020a17090aee4500b00202e9ca2182so1281822pjb.0
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=u9y0Bk8UpiQYdx0PAo4T1aykPjEhJnHejAt7vIOrx4Y=;
 b=I/dQ5UgNRqqYbWyvHcvtzVqiedIGeoPCLRGGZqLqLmzFeR7ruzU7dE2brQ1W9AxaxQ
 OkzJ3lr+pL6yc3qBKiOV+X0SUhBvtPjfdye6MX6Lgp893mv/IpCZbwf5LdDZlOwOnNwK
 9QQWsPiRTxdABao1ZkgdOwu018Qvkfwoiimktb64aqiNRvUTTHYG3ZtD0PovCgjRLmua
 w3t4AtE1sjNB8rWHJavcXE9ct8o7cJeQn5DwEV+Coy6AyJoPtv9LggOaLsoFYWU5e4et
 NhV+EiaR4d7au2ixQTGyu0QMOhOeP8fR8cQq0bosNxdg9rKZBKP59l2qBqfY0VqVGKy3
 HCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=u9y0Bk8UpiQYdx0PAo4T1aykPjEhJnHejAt7vIOrx4Y=;
 b=6yPLACooB66VeWpH+XXhZ4VOgvR5kPuzNyfdR2CgXHvSUVwgelRXMTq6Hy/El8a6xw
 2Dna2WZTRkPx5UYYZ3mTyuY44jhif030zM6xhdlik+uDhX6PDkDR48i4ppOCbl7SYizV
 VZQiQGEPeuU0o+lss+2imMz3LgOwH0Z/rooYRpCGbE5suI1WV+4J+ExcyLzts3uiM9mt
 CoQRXxOKbl+weP82r7u11wBDZ9/WcxI27Tiof+WYynmOGUqf7m1G/7TpGKexa6/ZMUEH
 /aS+GtWkkFzqJnVMUEMwLb9pyXmvX+UUIcKv0YXaJBhRKrMbdRj+A9C6EgIQwioms4x9
 QzNg==
X-Gm-Message-State: ACrzQf1KiLv82dZe/zb5otVHyScKQwuxlHpGHwzL0Hm5eHjzuH2XD3Vo
 NhJQng6H5S4Ejqk68GGNMhmo+Ur1foo=
X-Google-Smtp-Source: AMsMyM623QEPzCgczNldclwfc5u1VQ8WXFgG/w1sVNca+cOZI0Q32ADW4wkxW/O+XBUBAU/mw+2DzQ==
X-Received: by 2002:a17:902:f0d4:b0:176:988a:77fd with SMTP id
 v20-20020a170902f0d400b00176988a77fdmr26650054pla.25.1664276945129; 
 Tue, 27 Sep 2022 04:09:05 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:09:04 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>
Subject: [PATCH v4 54/54] docs/devel: testing: Document writing portable test
 cases
Date: Tue, 27 Sep 2022 19:06:32 +0800
Message-Id: <20220927110632.1973965-55-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

Update the best practices of how to write portable test cases that
can be built and run successfully on both Linux and Windows hosts.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

Changes in v4:
- Move the new text section after the "QTest" section instead
- Use plural in both cases: "on POSIX hosts as well as Windows hosts"
- Use "The following list shows some best practices"
- Fix typo of delimiter

(no changes since v3)

Changes in v2:
- Minor wording changes
- Drop patches that were already applied in the mainline
- Drop patch: "qga/commands-posix-ssh: Use g_mkdir_with_parents()"
- Drop patch: "tests: Skip iotests and qtest when '--without-default-devices'"
- Drop patch: "tests/qtest: Fix ERROR_SHARING_VIOLATION for win32"

 docs/devel/testing.rst | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index aea5b42356..fbb98faabe 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -81,6 +81,36 @@ QTest cases can be executed with
 
    make check-qtest
 
+Writing portable test cases
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Both unit tests and qtests can run on POSIX hosts as well as Windows hosts.
+Care must be taken when writing portable test cases that can be built and run
+successfully on various hosts. The following list shows some best practices:
+
+* Use portable APIs from glib whenever necessary, e.g.: g_setenv(),
+  g_mkdtemp(), g_mkdir().
+* Avoid using hardcoded /tmp for temporary file directory.
+  Use g_get_tmp_dir() instead.
+* Bear in mind that Windows has different special string representation for
+  stdin/stdout/stderr and null devices. For example if your test case uses
+  "/dev/fd/2" and "/dev/null" on Linux, remember to use "2" and "nul" on
+  Windows instead. Also IO redirection does not work on Windows, so avoid
+  using "2>nul" whenever necessary.
+* If your test cases uses the blkdebug feature, use relative path to pass
+  the config and image file paths in the command line as Windows absolute
+  path contains the delimiter ":" which will confuse the blkdebug parser.
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
 QAPI schema tests
 ~~~~~~~~~~~~~~~~~
 
-- 
2.34.1


