Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC2A5879C4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:20:53 +0200 (CEST)
Received: from localhost ([::1]:57226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIo55-0006ly-U1
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oImhI-0006pb-62
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:52:14 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:43876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oImhG-0007Zz-Md
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:52:11 -0400
Received: by mail-pf1-x435.google.com with SMTP id u133so6179641pfc.10
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 00:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CAT2FKyokp6jIbF5cQnfF4hEF5YeiWS/OD4dpe4OUP4=;
 b=IObT1ejy2FcCKX/O5nNt53uiNVeUa7Fp3hixbmvcn1l71anIH5nBje2YXmj/7nQKCv
 ZGcHgFnItQcQiwfS3kykEnoC3RqYDkyorondL6IPfxkjZVKjugz40wwUDqvMhBUitEOs
 aGML4JSZuzFzMOfE/di3W8bgoviv0FQKAEgvoHFSuR3W2MLoF3Pl+TqILTQlceRbRTCy
 FNTSd7+6skJWO6DU1Y1UqOvs9wlscKpKCFgoYRxU1CPEvKIIY2s1MsGT6VBAqcE34W/6
 7GmMm4XPOFzNXGA1l9c9MQzyec+htf8r2TThlKgGTn4oiyw28wDEETB8citSsLwjg22Z
 OWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CAT2FKyokp6jIbF5cQnfF4hEF5YeiWS/OD4dpe4OUP4=;
 b=NpHzxSUvr8J1viuLAbw6x5t2TTsDAYgq4O7HbtyOcXTfX5F5FAKKsh3jM92/tJyiZK
 yF/+S/7jwOXkkt9Y6RDiP7BNUbqz4fbfuSm6IrUJ8s5QAfnVlWUPDQym2KDlXPd1uPHB
 aL/wr+2ihPrzj1xXVafyV0j5fz2V9a29QQIhzMObG7wUmUx90zUJFgya1303IwNcl5rr
 GHXyASSu9qtNJHi8Y8+bt7S/LeksCFa68jx7F6u7GTD4a9DIkrC2VNWIggoFDhr3xMES
 eiKMApvhrMJXmF4+1NVuoohpTXKfAR+Ei1YVZtS/9Z6aJR8FZ6L3BpdSSsJ6XjprLFQ+
 CKhA==
X-Gm-Message-State: AJIora85qTfcm3cTDkcQAd/rARKecOlVAn+itzc3NvHRpmLSPlJCgaWv
 QnAX57aH0u5ncI/xTRpqm6KsbG0pOGA=
X-Google-Smtp-Source: AGRyM1t/rWFoTCcgkXxEFWb/w6hx2rpRxjUIvPFOU7e0aMT2MtsKzisGFADoIFD+TyqgwjvoV4C/cw==
X-Received: by 2002:a65:604f:0:b0:41a:77fe:2bbe with SMTP id
 a15-20020a65604f000000b0041a77fe2bbemr15658820pgp.242.1659426727715; 
 Tue, 02 Aug 2022 00:52:07 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 q19-20020aa79613000000b0052d92ccaad9sm3226098pfg.131.2022.08.02.00.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 00:52:07 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v4 1/4] util/qemu-sockets: Replace the call to close a socket
 with closesocket()
Date: Tue,  2 Aug 2022 15:51:57 +0800
Message-Id: <20220802075200.907360-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220802075200.907360-1-bmeng.cn@gmail.com>
References: <20220802075200.907360-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x435.google.com
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

 util/qemu-sockets.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 13b5b197f9..0e2298278f 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -487,7 +487,7 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
 
         if (ret < 0) {
             error_setg_errno(errp, errno, "Unable to set KEEPALIVE");
-            close(sock);
+            closesocket(sock);
             return -1;
         }
     }
@@ -1050,7 +1050,7 @@ static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
     return sock;
 
  err:
-    close(sock);
+    closesocket(sock);
     return -1;
 }
 
-- 
2.34.1


