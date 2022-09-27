Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FD65EC31C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:42:58 +0200 (CEST)
Received: from localhost ([::1]:52020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9vN-0002Sv-E4
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8SD-0003e0-JO
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:45 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8SC-0005Jw-12
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:45 -0400
Received: by mail-pl1-x629.google.com with SMTP id jm5so8729264plb.13
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=GlznwSHa9K/cOS1FRxJZ04KXhLV4Kvl8Dx3ESYYXk8U=;
 b=VaFL+Hd7zujksmRda54YrsN4XeeLNjB2z0sbAThf2Psm3M8m+AyvVScRMF2ztXxttw
 usCXq9z72/ett/U9sCD3oYHKOq38cmW/O03i16CX1kHivlNWXuiTMWH+NWHSkPoPZOZ4
 wUAaHprqMUuBtpdsR94Tc01yXhK5+Ysp2Fu+yriil3D/Mvn6NbaUzyS0Ea2nQ4C+0zbb
 J7DwxZDfcmPWRpCH84azKOf+P+yaAsymsolYJPwSLi7KIqAXsUG3J+puoAh6HUv4rP4w
 VHls3s35eA4LpD9zsUHGgczoH8hVH6HSAzkKbCSy3GGdVOruP9Kb9sRF0FMihW9YHM+b
 JDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=GlznwSHa9K/cOS1FRxJZ04KXhLV4Kvl8Dx3ESYYXk8U=;
 b=PER8Bwdg8iSFA80Vv1DoQUQGnungROQUnP8YJiZPfp1WmizNVPfmnh//TjiyQKtmlq
 jfpazVd9Wff3jcEGhjTi9d7uUE37Lr8cg8UCawUGKd4LkIlvWeHo6q9uq2Lhs5Zqwu1l
 s13QVzcM9DSmWr8SobbvFPT707cvrGnFp5ujx2/b+SKR3OojgioOHnCMQjpB4PbdrC5o
 VtXWI/ArW+OBFssKxSgj/H5vnC23TmPxXiJjV0NSGSPIrwfrSC3Er8lk0uZCGpFbAnDU
 0YkO+YPdAgOR0nJ8FVI+4eeZdZW+MSnhGrJEtsn1WoZwG8jax6u2P/t7kp3ERZM73avN
 qmgA==
X-Gm-Message-State: ACrzQf3e4vzkZQyatpJAkXDmFKzuyy/as8NtD77evH2keX1KKgYvFfux
 3zBUlhKLsqJERWjB1S3/arJ8ajwC+vk=
X-Google-Smtp-Source: AMsMyM70J8Vtc2GVBRXX5bgn2hxB6IUWKbV84dvALKmbwq/LOgiWtcqp0+Y5gfz4lPh29m3GCoiVyg==
X-Received: by 2002:a17:90a:e644:b0:200:2f9a:bd0a with SMTP id
 ep4-20020a17090ae64400b002002f9abd0amr3978210pjb.88.1664276922469; 
 Tue, 27 Sep 2022 04:08:42 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:42 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 45/54] tests/qtest: libqtest: Replace the call to close a
 socket with closesocket()
Date: Tue, 27 Sep 2022 19:06:23 +0800
Message-Id: <20220927110632.1973965-46-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x629.google.com
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

close() is a *nix function. It works on any file descriptor, and
sockets in *nix are an example of a file descriptor.

closesocket() is a Windows-specific function, which works only
specifically with sockets. Sockets on Windows do not use *nix-style
file descriptors, and socket() returns a handle to a kernel object
instead, so it must be closed with closesocket().

In QEMU there is already a logic to handle such platform difference
in os-posix.h and os-win32.h, that:

  * closesocket maps to close on POSIX
  * closesocket maps to a wrapper that calls the real closesocket()
    on Windows

Replace the call to close a socket with closesocket() instead.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

 tests/qtest/libqtest.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 12b1e85b51..1ae58624d9 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -113,7 +113,7 @@ static int socket_accept(int sock)
                    (void *)&timeout, sizeof(timeout))) {
         fprintf(stderr, "%s failed to set SO_RCVTIMEO: %s\n",
                 __func__, strerror(errno));
-        close(sock);
+        closesocket(sock);
         return -1;
     }
 
@@ -124,7 +124,7 @@ static int socket_accept(int sock)
     if (ret == -1) {
         fprintf(stderr, "%s failed: %s\n", __func__, strerror(errno));
     }
-    close(sock);
+    closesocket(sock);
 
     return ret;
 }
@@ -507,8 +507,8 @@ void qtest_quit(QTestState *s)
     qtest_remove_abrt_handler(s);
 
     qtest_kill_qemu(s);
-    close(s->fd);
-    close(s->qmp_fd);
+    closesocket(s->fd);
+    closesocket(s->qmp_fd);
     g_string_free(s->rx, true);
 
     for (GList *it = s->pending_events; it != NULL; it = it->next) {
-- 
2.34.1


