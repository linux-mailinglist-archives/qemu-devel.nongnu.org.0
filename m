Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F398459F726
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:10:14 +0200 (CEST)
Received: from localhost ([::1]:34490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnKv-0005tE-Vt
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuc-0004MQ-TF; Wed, 24 Aug 2022 05:43:03 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:54853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmua-0001ef-Jq; Wed, 24 Aug 2022 05:43:01 -0400
Received: by mail-pj1-x1029.google.com with SMTP id bf22so16490340pjb.4;
 Wed, 24 Aug 2022 02:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Fh5IADzLChmDjxkrpWsCj8Fs3Tnsz/cyvb/BerXAflg=;
 b=LqblTMxq3Mc6jUl5h8nnSzgNibYFICp8fZsnoRN19X1eqDPQIKuenoldw82V/ni8du
 jJckz9Yx1U4bfRebjJUN9lxoKP7x4ajA+IGd6ZgJgQQ88BQJ4DMOvg8Pe0zla7tciQzH
 8eP2bsnAcoqn0eHjZanLP5A2CTeM78ZmYnOnW60WfNs/YNRJ6gzYYn9wCjKxBi1q1/zy
 336xswD8TUW21oI+M79kW+6DbwvgiPkCBLDNRDVwS13S4x8jKsyBcjRyfhQt7ep+cgVd
 SDOwRW8181J2pLmG8I+pWHjDWov+cMnIUnJxc7ijTHtFWn91zNeo2F6Iwgma6YJVrMz3
 4cxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Fh5IADzLChmDjxkrpWsCj8Fs3Tnsz/cyvb/BerXAflg=;
 b=SZKxcrSk3IwfmIfO5SpJ24vXs06hC+UnkuEAXVM6mWa4MfxVdYYdwespmQAVenW/Y4
 D9HPNAbCTybKaZfKXb6OopXskkdRjPmJwevNsDAXHckkejrisHLBC5WIfECsRn53eCdG
 UeGi8AM1trHCl3aa3mCvTRw5lwWitvhfVcP/GVV0JODrSv8u9Ahp1NRYNwXCg9h6CtEB
 pZoAOzxalVyJm5IDawKQ6bCvMwikb1NG4EVDq8jlfRkWVUU9bTclPlp9hmAzvqqCz4+S
 PRbeQ7k7pFJOy8mAjJU3MS1GkYFXdQeTk+qhQLmBcXcp4ydlJ7jtti1u46M2wuFJR/Hd
 LnSg==
X-Gm-Message-State: ACgBeo2yhqdNKslQCUSs+IfMBF2XhTnsmkFvUULBwjkEVPYir82TevgB
 QHLMVF5x2PULUeHZS4lMI+ASVzQFmNM=
X-Google-Smtp-Source: AA6agR4rIQOiAg2O2QvH0ykk9DKb2bOB3N3VoYE7fp6sDLNSeafa4RG4CcjKoXk9BXSGR0RSDa0HUw==
X-Received: by 2002:a17:902:ea12:b0:172:de75:bc7b with SMTP id
 s18-20020a170902ea1200b00172de75bc7bmr15835560plg.25.1661334178803; 
 Wed, 24 Aug 2022 02:42:58 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:58 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH 32/51] tests/qtest: Fix ERROR_SHARING_VIOLATION for win32
Date: Wed, 24 Aug 2022 17:40:10 +0800
Message-Id: <20220824094029.1634519-33-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1029.google.com
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

On Windows, the MinGW provided mkstemp() API opens the file with
exclusive access, denying other processes to read/write the file.
Such behavior prevents the QEMU executable from opening the file,
(e.g.: CreateFile returns ERROR_SHARING_VIOLATION).

This can be fixed by closing the file and reopening it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/ahci-test.c        | 14 ++++++++++++++
 tests/qtest/boot-serial-test.c | 13 +++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
index f26cd6f86f..0e88cd0eef 100644
--- a/tests/qtest/ahci-test.c
+++ b/tests/qtest/ahci-test.c
@@ -1443,6 +1443,20 @@ static int prepare_iso(size_t size, unsigned char **buf, char **name)
     int fd = mkstemp(cdrom_path);
 
     g_assert(fd != -1);
+#ifdef _WIN32
+    /*
+     * On Windows, the MinGW provided mkstemp() API opens the file with
+     * exclusive access, denying other processes to read/write the file.
+     * Such behavior prevents the QEMU executable from opening the file,
+     * (e.g.: CreateFile returns ERROR_SHARING_VIOLATION).
+     *
+     * Close the file and reopen it.
+     */
+    close(fd);
+    fd = open(cdrom_path, O_WRONLY);
+    g_assert(fd != -1);
+#endif
+
     g_assert(buf);
     g_assert(name);
     patt = g_malloc(size);
diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 404adcfa20..fb6c81bf35 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -235,6 +235,19 @@ static void test_machine(const void *data)
 
     ser_fd = mkstemp(serialtmp);
     g_assert(ser_fd != -1);
+#ifdef _WIN32
+    /*
+     * On Windows, the MinGW provided mkstemp() API opens the file with
+     * exclusive access, denying other processes to read/write the file.
+     * Such behavior prevents the QEMU executable from opening the file,
+     * (e.g.: CreateFile returns ERROR_SHARING_VIOLATION).
+     *
+     * Close the file and reopen it.
+     */
+    close(ser_fd);
+    ser_fd = open(serialtmp, O_RDONLY);
+    g_assert(ser_fd != -1);
+#endif
 
     if (test->kernel) {
         code = test->kernel;
-- 
2.34.1


