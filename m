Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1B3267CCB
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Sep 2020 00:58:41 +0200 (CEST)
Received: from localhost ([::1]:57922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHETg-0002SN-3i
	for lists+qemu-devel@lfdr.de; Sat, 12 Sep 2020 18:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kHEHy-0004d6-0l; Sat, 12 Sep 2020 18:46:37 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:56107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kHEHw-0004YE-1U; Sat, 12 Sep 2020 18:46:33 -0400
Received: by mail-pj1-x1042.google.com with SMTP id q4so3481210pjh.5;
 Sat, 12 Sep 2020 15:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K7y5ZJD/cG5cMFm0+/8rHEDw15+8VS3xMSK8qF/3N8U=;
 b=FF0L9bapInKkX4o8YTYuvP0aqfzZut36gvlKDuOd7Gds/KPmEwHI3fNI7sSK9QaJry
 Gw7ok6NMesWxJYBtoNgjBbq9CJZRMfqpw04PH97psVY8AzwG+qhG3lu4hyPU0EDLFznG
 bfYXJaJ89Q2WMPrvbvkgbCrHFhdY5905zYUSi4pkfWTvGGIAn4uEigcex/RaUGw2hJA1
 Zdv4ZtsZvSVW4zwhX13HhWCbh9fNVd4UjwrFdXFbdBL0r2+RAQ2pWRUbBj5+SvcMeXPz
 jIlas4S1HqRUx+Jh/X6IBCoJ0Z8fEyMSrE1KiEcQKvYAKSnvmYuv3HXhKt2x9BLIkhUK
 2VgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K7y5ZJD/cG5cMFm0+/8rHEDw15+8VS3xMSK8qF/3N8U=;
 b=MUpHdhfxPXXQUbZZZCGVqIRhx9sYsO1dljnwvuSrUvVZMV+7U13n57JOSF0u6/8uQ1
 +0EPuVhAwHAJFrnntatU6/EbitBe6O3O6+mc3WgVKoR3PxngNAuXYIZ3KXYlD2GM+TMo
 UCe9m/bkWZGmo0GkNK6UFh5li2OK8p6mTD3EKbY/VMpFMfHYmszE/G8YI+XCXt+nJWGJ
 eKZ0lwnhBiqyNs0ke1mzi6Hrsw82JbkTqiAFXQ9+dhauZPcc1RJx8woqUvrgtN2KFk5A
 nd4f8z2qMJ9N1n4arKDkZD8iPPu+jtqFZmiyda83r5f/vrNdxkH1pULSJ5W3fuySfc12
 ogLA==
X-Gm-Message-State: AOAM532xe2Hktt7oMkQu6FfyxHwx0d59y001lacy2+gOO3jZ4CddM86z
 yj3warVPK95f3bxrr4Q3aXn00Wnw0mn6lpKj6pM=
X-Google-Smtp-Source: ABdhPJxJKU4nziBn1PsXg6/2s04hzj7NC5VTCmM1LWJHX/0eqDW8eYZH/v8Q7WEvEiAupznHU/1/gA==
X-Received: by 2002:a17:902:6941:b029:d0:cbe1:e76b with SMTP id
 k1-20020a1709026941b02900d0cbe1e76bmr8250199plt.18.1599950789255; 
 Sat, 12 Sep 2020 15:46:29 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id t10sm4639266pgp.15.2020.09.12.15.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 15:46:28 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 23/27] rcu: fixes test-logging.c by call drain_call_rcu
 before rmdir_full
Date: Sun, 13 Sep 2020 06:44:27 +0800
Message-Id: <20200912224431.1428-24-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200912224431.1428-1-luoyonggang@gmail.com>
References: <20200912224431.1428-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
 Peter Lieven <pl@kamp.de>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

drain_call_rcu is necessary on win32, because under win32, if you
don't close the file before remove it, the remove would be fail.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 tests/test-logging.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/test-logging.c b/tests/test-logging.c
index 783fe09a27..8b1522cfed 100644
--- a/tests/test-logging.c
+++ b/tests/test-logging.c
@@ -210,6 +210,8 @@ int main(int argc, char **argv)
                          tmp_path, test_logfile_lock);
 
     rc = g_test_run();
+    qemu_log_close();
+    drain_call_rcu();
 
     rmdir_full(tmp_path);
     return rc;
-- 
2.28.0.windows.1


