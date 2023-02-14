Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E6069555D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 01:29:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRjB2-0007Nk-VH; Mon, 13 Feb 2023 19:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjB0-0007N9-SO
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:06 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjAz-0005ym-Ah
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:06 -0500
Received: by mail-io1-xd2a.google.com with SMTP id z5so2474340iow.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 16:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UDKo+pEqLr25ECZFRWghhYmC5CZ9G4l3ZCThpSQaZZ4=;
 b=HgZdSEPf5Jr0RZKiV3bQOAPEdiCXdjZKhDOiK4TMGMs+1cxNWEpcjud0jN13yaa5QW
 4kuHtKhNmFweDoMoTASZpWJRG+5f5xnT897lxm9eZXwi6nVdVaSgq4bD7vsFXqO5d5wt
 QsJUGpbOTgTm8VvaQJ6vQcEcBG4DM/ElXeDLh61USEYQJuPMvcYrj15qoNlzgLgxXq/o
 rSTtLvyNOTg31pLsMU6IZRjHKD0XHUk0kjHpBtc7HJVuoJNiFYryP1wNJVa/sImqMY+H
 zfB8tTrwKKBfHIjGTSrw65gwAS4Ght6GaBcRhX74rtbZPKqBoDXk/A+5jzNup5htjrPB
 Ae0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UDKo+pEqLr25ECZFRWghhYmC5CZ9G4l3ZCThpSQaZZ4=;
 b=t81aHhEi2+I7VwKgvVFq5meWxEJEKgQR7RET7xtOpg3QzqwX4W0++5+b9hKd7OXprt
 FHge4GwMu7zHLBqmqC97EFiR7CgfNmVjuIr22d6vFIwVnbRVF/QyAf0A0ghJ9pSKAm6l
 9FFv9DnGvga8Ug0LuGr5Q7X5jN1Hv0dqNGMzkR29A6/wZyeBdoVC5KEWqxXqfs3CvKaz
 5lwK6JHEKD0brHi21LCoAsJ6LunKCVMCq5vSDVfhOa0y0KE8gpAXbmLDIQkIcKxmkWat
 xJPFPgEBqOkKS7fADKDsG2TV6QRFp86rDgErrauOwDV2wPviSoLrRkC3WATQmzX4Kg4B
 kDBA==
X-Gm-Message-State: AO0yUKVPsoyIMjcU3ypauFWhKGsVBe8YOEHZ8UzdB55su8EYNs+8aHgM
 91bA2uO+plHGstJRxRozwpyjA2njsqh9ydGP
X-Google-Smtp-Source: AK7set9W4Hc90g8iFa8+u8EV6BsHjEh4nOFribD1bqRt4aI+4VmQYo91XyuUEmoPqImaAc0g8lfKHg==
X-Received: by 2002:a5e:c816:0:b0:73a:69e3:64c8 with SMTP id
 y22-20020a5ec816000000b0073a69e364c8mr316640iol.9.1676334483786; 
 Mon, 13 Feb 2023 16:28:03 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 r17-20020a028811000000b003af4300d670sm4500923jai.27.2023.02.13.16.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 16:28:03 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>, Stacey Son <sson@FreeBSD.org>,
 Juergen Lock <nox@jelal.kn-bremen.de>
Subject: [PATCH v2 03/12] bsd-user: Add sysarch syscall
Date: Mon, 13 Feb 2023 17:27:48 -0700
Message-Id: <20230214002757.99240-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214002757.99240-1-imp@bsdimp.com>
References: <20230214002757.99240-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Stacey Son <sson@FreeBSD.org>

Connect up the sysarch system call.

Signed-off-by: Juergen Lock <nox@jelal.kn-bremen.de>
Co-authored-by: Juergen Lock <nox@jelal.kn-bremen.de>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-syscall.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index b4a663fc021..e00997a818c 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -491,6 +491,13 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_undelete(arg1);
         break;
 
+        /*
+         * sys{ctl, arch, call}
+         */
+    case TARGET_FREEBSD_NR_sysarch: /* sysarch(2) */
+        ret = do_freebsd_sysarch(cpu_env, arg1, arg2);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.39.1


