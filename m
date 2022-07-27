Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609705827C2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 15:33:45 +0200 (CEST)
Received: from localhost ([::1]:49086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGhAV-000875-VI
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 09:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGh5C-0003VX-VZ
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:28:14 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGh5B-00022W-Dj
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:28:14 -0400
Received: by mail-pl1-x635.google.com with SMTP id p1so7618686plr.11
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 06:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RFwJC4o8e5unv4cZEgy8YcWZ7BgqUqHRQ5uPl7IbilA=;
 b=Eoyll8sl06IqX1xvXH9a8yezpz/NHz96QCtlVdBOp0M7Xcxf4mtBIeCru8ExEpYdEw
 Uu+5kQ6lt0vu1iEUJd74UlOel1oMcsigKXPR3mpLHrdaKW3qLNs1yzoqFwm3uAOPmNgY
 skR7KcCWcD+56zeFxvRaU+yeIJWurayX2FOmP6GhxkRgqwjITvFCw0AsI8qOarvfOO+w
 gDl3dVjWjYCsdTaiduOsqcAV5wGoRMlc7b5aFTdpC40KFaW7/WHDe22xrBInBU/QnFHk
 rxK+Qwz3sG7hxslasHkQdAlZuv13+lfm2pkDG/VqrqCwLkkIdFWHXsa5+qEZ7W7p/qM1
 +Vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RFwJC4o8e5unv4cZEgy8YcWZ7BgqUqHRQ5uPl7IbilA=;
 b=oE4fPJAvikIzYIbKIA5/T346wUskqzH8G7KtKK5JRk3b2NFRshrFOtdxWEppojksXh
 ulona1ixt6+w1Y+qgw+tSIhWqiGsECACYSeYlnxaKlVO/JipSvEZdSbAPPuOE1LmYAL3
 nYVLCCsHoB0z4MZMVrTYvKo+UC6j0KI/9qrQwHjoSd93wTKxBgOz0g6Ps2Qp0KpCB8c5
 /Nfg4eKH+SN8nY+IcCUscz1HNjFDjKFbzv5MUUC7knp865T/yyydTk2HfiaQO9FncKCJ
 sa3EDjDpHKufb+cToobabLyfayy7UfFRVZKsQv311cuZYfQi9oTzsDoniTxzry1PD83h
 NnAg==
X-Gm-Message-State: AJIora+HdVP0IDkHukGE1gBX7gPStqh77gHYLN2LYaTrFhpASfIXtEcU
 EqvnsBVvjct8igwDqsncVTVwBgV01aQ=
X-Google-Smtp-Source: AGRyM1tL6mMepQ2rVum+15fCRIEsq1tCfUxfhx/xg8Q6Yl87nNhVq8s3eU4mHVJ3owSod5x6cpWDaA==
X-Received: by 2002:a17:90b:3c8c:b0:1f2:205c:2480 with SMTP id
 pv12-20020a17090b3c8c00b001f2205c2480mr4723848pjb.54.1658928489233; 
 Wed, 27 Jul 2022 06:28:09 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 ij13-20020a170902ab4d00b0016daee46b72sm1971192plb.237.2022.07.27.06.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 06:28:08 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 1/6] util/qemu-sockets: Replace the call to close a socket
 with closesocket()
Date: Wed, 27 Jul 2022 21:27:57 +0800
Message-Id: <20220727132802.812580-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727132802.812580-1-bmeng.cn@gmail.com>
References: <20220727132802.812580-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
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


