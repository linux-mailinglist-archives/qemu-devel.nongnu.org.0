Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 047C559F757
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:20:56 +0200 (CEST)
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnVH-0000U7-2n
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmu5-0003S2-Ny
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:29 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:52737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmu3-0001Z8-8T
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:28 -0400
Received: by mail-pj1-x102e.google.com with SMTP id f21so16511204pjt.2
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=o/vNmGGWktBgN2DDen09I7Im1S9JADF0xZI5Ri8LXOA=;
 b=JfPa2gw0RpTDfNi7CXk9AiSRSEHycE2Ui2elHgCAASoH2CTOVeekl8r9bI5oSFSRBU
 rqYu6Ax/COVtVZPStLKuY2lIQsej574khAyJPGw5LyIswH2I63DXSADPdcblNEM7+UVd
 1si3fTa1j9UY5gZzkBeBE3G5uJ6O9/c9NEpwfy6xXPrwi+9t8HZWGbUGUNBz7QK4Syzk
 1FGal5INJKP6i0S9YGJhHwvZxsoNIUv2V7bjrdUgnSEHHTdVU7l13Hz9crYsyp44JozI
 DDEh3CYva3WkEBwicPtzBp6T0uZ7U5VFthBMc66NzRzYv2ODmkN4ogjf6S2QiTMkprh3
 6WBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=o/vNmGGWktBgN2DDen09I7Im1S9JADF0xZI5Ri8LXOA=;
 b=MjxFIXcEVeOow4VP1Wi6Ky5Gsp4kH/Yr+6SXpBHBYxa+saZRgjwkHGaCuj7Z3WTFHV
 QAMJWo1VxAl8N9zFJeIs1psjII5w4s2HkvY+T6oAMa3i8kjEWrcyu6ztPIKUKcnRjrTW
 BlXvjO2m1lG6aIdMXWN5XXqnKA7jefZevff9FgRT+6Xo2d6O/SVSTaJe61bBMhTYqKo+
 WdQSJsPoDjrKat5S0TsjKq/dvEEmPbt1r+XvUW1+74OuRzb7zGRkukl9LX4YqV9pFZMY
 tW7rBbKoDbvltTjZH3bNbt+4KkD/xIYeDoJWzxgEsYjG3oGF9dnK2u/B7Toc0BG6VQey
 598Q==
X-Gm-Message-State: ACgBeo1RVrBYOOgejdqYXZul9UoNuYaPL2rW93pMFj3PBJtANrJaO3Dk
 bgGW9XQ5lj0h55uYB20Nn2PGWASgbLw=
X-Google-Smtp-Source: AA6agR5A9QOVfTfpygKeicp+08FdUArPB+j5VWE9g6tmMVc+3a4NsMPnxvbnHoYGNAYAkgbt2n3p4A==
X-Received: by 2002:a17:902:ab8d:b0:172:9382:4d1e with SMTP id
 f13-20020a170902ab8d00b0017293824d1emr27914872plr.133.1661334145658; 
 Wed, 24 Aug 2022 02:42:25 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:25 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 20/51] tests/qtest: i440fx-test: Skip running request_{bios,
 pflash} for win32
Date: Wed, 24 Aug 2022 17:39:58 +0800
Message-Id: <20220824094029.1634519-21-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102e.google.com
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

The request_{bios,pflash} test cases call mmap() which does not
exist on win32. Exclude them.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/i440fx-test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/i440fx-test.c b/tests/qtest/i440fx-test.c
index 6d7d4d8d8f..3890f1237c 100644
--- a/tests/qtest/i440fx-test.c
+++ b/tests/qtest/i440fx-test.c
@@ -278,6 +278,8 @@ static void test_i440fx_pam(gconstpointer opaque)
     qtest_end();
 }
 
+#ifndef _WIN32
+
 #define BLOB_SIZE ((size_t)65536)
 #define ISA_BIOS_MAXSZ ((size_t)(128 * 1024))
 
@@ -396,6 +398,8 @@ static void request_pflash(FirmwareTestFixture *fixture,
     fixture->is_bios = false;
 }
 
+#endif /* _WIN32 */
+
 int main(int argc, char **argv)
 {
     TestData data;
@@ -406,8 +410,10 @@ int main(int argc, char **argv)
 
     qtest_add_data_func("i440fx/defaults", &data, test_i440fx_defaults);
     qtest_add_data_func("i440fx/pam", &data, test_i440fx_pam);
+#ifndef _WIN32
     add_firmware_test("i440fx/firmware/bios", request_bios);
     add_firmware_test("i440fx/firmware/pflash", request_pflash);
+#endif
 
     return g_test_run();
 }
-- 
2.34.1


