Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126FD5BE617
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 14:43:03 +0200 (CEST)
Received: from localhost ([::1]:38986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oacab-0000kh-NW
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 08:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZE-0001I5-NW
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:28 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:33585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZ9-0004zF-4b
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:25 -0400
Received: by mail-pg1-x531.google.com with SMTP id f193so2171122pgc.0
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=I4w8ZLcZpvp8/NNOmL2eCZPj1DbnvXOQyYE4DsQCU8c=;
 b=Ro01hkOaAa6m0bCs8g1QaKxd116SNNMZkiljZruAsnDqW07aK0mazXd7xMXPABV0RC
 ez6y2ApS3ds6Hj578bY4hsFsNCxRH3uLnecH2qHhvH25oCMfrQRj3ScGmVCTDdus4abr
 KPQvZURldiVx+8Gn3ADTsUgk5pexSuFjC3KmqqrPdtl3YDOgw1CVf/BCGv4CzHai4IJL
 Q8k45/scufAl13L2ILkrhdopIEuJNVDDrnQYS5S3p3PfW5xB4qZANbS2DyoO7QoAdHFd
 9SLvJ9Jc9EN+/SzwOws1dzioWvC8/09dykNoKoerfJc+7KnAGJJh8sC2IQ0qbqxYW9aZ
 q6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=I4w8ZLcZpvp8/NNOmL2eCZPj1DbnvXOQyYE4DsQCU8c=;
 b=6ePceuab8mLaAYfMPDVpo0cdA8Hu6RglEx1N2xZLTqyHVf6HYJ4DiTavGYpDCgwUAf
 6yZ5PzWy8FbACd2208CVp3jrAtmKFkJ6Ta5DJKH3JFUCziP5OG6fiNdVJ0m1ZptzecFw
 GgObHRQmjvimcGHo1AYDUxMkmVXmTymSE8z2BDZNLir5gCpreVOVLqg9BKDJZ0xNugn3
 wVin0ckmBLH7K3qwoBYUiUfcD0RIlMOcu5NlWJgjJ66lhTf2iJlX6ED8Sn2dYMsiytQa
 wZ83L7vg+uJAoGba13Hp/pwJMpZax+kTTXM3DvEWvDdIVMJaxjk9KmpIhovpyJnPKzUP
 kVyg==
X-Gm-Message-State: ACrzQf1+7FJ7/Kn49QktE6nDYO+cuNQqwlif/bHhi6275VJ2/3jR2zd8
 tOZ80fePcPnHZRJHp6tJTuq1Y3YsHyU=
X-Google-Smtp-Source: AMsMyM5CdY/o+YHFx8y1h5MDJEhAJ5M+Tc7Wb9zDBZep7oy+un1N/ds6xK3U+YCbgvFT+MnxOA3AUQ==
X-Received: by 2002:a05:6a00:1823:b0:544:b4db:50c with SMTP id
 y35-20020a056a00182300b00544b4db050cmr22275547pfa.33.1663670001159; 
 Tue, 20 Sep 2022 03:33:21 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:20 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 25/39] chardev/char-file: Add FILE_SHARE_WRITE when
 openning the file for win32
Date: Tue, 20 Sep 2022 18:31:45 +0800
Message-Id: <20220920103159.1865256-26-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x531.google.com
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

The combination of GENERIC_WRITE and FILE_SHARE_READ options does
not allow the same file to be opened again by CreateFile() from
another QEMU process with the same options when the previous QEMU
process still holds the file handle opened.

This was triggered by running the test_multifd_tcp_cancel() case on
Windows, which cancels the migration, and launches another QEMU
process to migrate with the same file opened for write. Chances are
that the previous QEMU process does not quit before the new QEMU
process runs hence the old one still holds the file handle that does
not allow shared write permission then the new QEMU process will fail.

As per [1] we should add FILE_SHARE_WRITE to the share mode to allow
such use case. This change makes the behavior be consistent with the
POSIX platforms.

[1] https://docs.microsoft.com/en-us/windows/win32/fileio/creating-and-opening-files

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v2:
- Update commit message to include the use case why we should set
  FILE_SHARE_WRITE when openning the file for win32

 chardev/char-file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/chardev/char-file.c b/chardev/char-file.c
index 2fd80707e5..66385211eb 100644
--- a/chardev/char-file.c
+++ b/chardev/char-file.c
@@ -60,8 +60,8 @@ static void qmp_chardev_open_file(Chardev *chr,
         flags = CREATE_ALWAYS;
     }
 
-    out = CreateFile(file->out, accessmode, FILE_SHARE_READ, NULL, flags,
-                     FILE_ATTRIBUTE_NORMAL, NULL);
+    out = CreateFile(file->out, accessmode, FILE_SHARE_READ | FILE_SHARE_WRITE,
+                     NULL, flags, FILE_ATTRIBUTE_NORMAL, NULL);
     if (out == INVALID_HANDLE_VALUE) {
         error_setg(errp, "open %s failed", file->out);
         return;
-- 
2.34.1


