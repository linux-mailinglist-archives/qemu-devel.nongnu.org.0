Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364D45EC2D4
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:37:10 +0200 (CEST)
Received: from localhost ([::1]:58454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9pl-0002pM-8m
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8S5-0003Qs-Hu
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:37 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:51113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8S3-0005Hg-Qp
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:37 -0400
Received: by mail-pj1-x102d.google.com with SMTP id lx7so2515324pjb.0
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Gd4IFwSiMUXcAFhlVTo/cHgzPvOGzPOAZZa5JOwEkAY=;
 b=DJWb0rha1r84tfLJcxqIR1HQ36rxir/ZJfDgKgqzvvC0CDidvfmR1fxqAVSfrdZhrC
 6RR1KFaV4owOnIAAtor7mbgztiXPjd1tFIlG/qFmtobqCjizpHhSYjsaFESYYi50iCoR
 EVBL8r8VHSQnur0rhLyWpLChBHPUmPlE5iNvnlo3OsOSVse25fGptNVEO65pNzqv7pMh
 GmsrkkHiEqYDiBSgSzHZNejlKFmAUaWBte3hH4U10huYJ46klGLz/DcQq9Yl33LXWqeD
 l6hd9ojjz+MehD3YR7uw+R3HDZ6Nv3i/0ggmOD4Tk/A0WsNQJAJh0CKBZVuMxPlcgGCs
 9tnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Gd4IFwSiMUXcAFhlVTo/cHgzPvOGzPOAZZa5JOwEkAY=;
 b=p4VjLqV6jiJ7gQzg1yQq9Rm/kcw98onEJp5pRkOQ/RRoNTOkdZtdTf0dmBXXfIvQ41
 9dZrd7uCzNnRUAtCacfhH84b7A8ut7krhVThEi57Zrpe+r8LoWc6bWtUjvu30kbgRZLb
 6cHjs1DQo9SSef7H94XCt5cUern/fNMzTLUsIoskl0yB9L6Ph2uYOrOx3AJgzT3fVfuL
 TJeVFFEih/mi6em6Ak8zXYWII/DKYDiXkl6fANTNxSaQvi4hQh8JnwUJA2aGTdrqPCzS
 zP9Zgu0rUAJE8W086VxyWTAPYuiFVZUp/LTDCscN0xNwfqKlk1ZzB9CMtNYDT2PrvaAo
 GvZA==
X-Gm-Message-State: ACrzQf0AofbtWD+dWudRdm/suec2Is0PjeMrnTIqXlkvP58/w1OM6nbZ
 X6PbInKz9h/e27kCYyp1UjMSj+etZbY=
X-Google-Smtp-Source: AMsMyM61jm9bG9VDHtdIemgvNSgloRTFcAhcBorrer09rbPKZD97LXKIMkOJz4FIVL9X4lWLVA5++w==
X-Received: by 2002:a17:90b:4d07:b0:1ef:521c:f051 with SMTP id
 mw7-20020a17090b4d0700b001ef521cf051mr4089015pjb.164.1664276914412; 
 Tue, 27 Sep 2022 04:08:34 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:34 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 42/54] tests/qtest: migration-test: Disable IO redirection
 for win32
Date: Tue, 27 Sep 2022 19:06:20 +0800
Message-Id: <20220927110632.1973965-43-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102d.google.com
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

On Windows the QEMU executable is created via CreateProcess() and
IO redirection does not work, so don't bother adding IO redirection
to the command line.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v2)

Changes in v2:
- Change the place that sets IO redirection in the command line

 tests/qtest/migration-test.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index f57e07fe2d..45c5f5761b 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -647,7 +647,16 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     }
 
     if (!getenv("QTEST_LOG") && args->hide_stderr) {
+#ifndef _WIN32
         ignore_stderr = "2>/dev/null";
+#else
+        /*
+         * On Windows the QEMU executable is created via CreateProcess() and
+         * IO redirection does not work, so don't bother adding IO redirection
+         * to the command line.
+         */
+        ignore_stderr = "";
+#endif
     } else {
         ignore_stderr = "";
     }
-- 
2.34.1


