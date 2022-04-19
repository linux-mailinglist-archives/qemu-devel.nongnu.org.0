Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223D850655D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:10:43 +0200 (CEST)
Received: from localhost ([::1]:36112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngi0X-0006FK-U3
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmD-0001EZ-Tl
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:51 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:53880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmB-0004Tv-7F
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:49 -0400
Received: by mail-wm1-x32d.google.com with SMTP id p189so9922917wmp.3
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WwK/2gOP+61Tv+uwzts7jYNsI4UO+BQb+MGUHQsXc0s=;
 b=cKx93KUs5DfmcOgt1P48ghfkm89U4g9qrqun8wJz6xbr82OUau2wKYWRLNfwku/BZK
 zYDJPdZE5Bjq3hIExd+OoTGj3AnFYLQopRfsjjZNuglWomw2RGOSlFSnPqrL/7Noj/Kv
 QS/l8ug/oNvmRCn9CNKzGrwkTtO+MTi7GENCCcS7WxsVcFm7Gx9wHufW5/GMSaw5H0OM
 hBWKCV6rr7dGPtcajx2J1f+6qXs+UefeD1hih3XIyGuWpBoZOT201zijMGGTNqcajNmv
 3R++e/EFEgUIyjuQMxz1lc4LUZjcLYZlXc30pupUqbkLqyxeeRDA8nhW3vEqpSKfZ/nI
 o7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WwK/2gOP+61Tv+uwzts7jYNsI4UO+BQb+MGUHQsXc0s=;
 b=JvB9x5lzTxpHh+hgzwJ4IWZU3uV00jZTrW4MvEFnRG+t32hAUHuf07oSC6PyfEgzwX
 7DZpL37TvlnwdYLcBf+CO35VVSvMvl2gazjC1HOz04m3mXcuLXdVeFrAP6ZSYFkeStSw
 O0uvenPcCJiR8SVs/UGjG0wYS8FdoWqCvMlDkTgc9wtiZXIjYPzfVfEj2nplojKbntvk
 YRAt163+CequraABc2tGsG5rR9lGKecIkSSw4CfTb/QapVM6Nns37RWAOrBjcxMCeRB9
 OuFVqTjqNPB9jy6V9jdo2AM7CqTeBCEYig3sn2pDOnwTLuJf2xfXbpQAjYWmfSBgsGhd
 JNNw==
X-Gm-Message-State: AOAM530I/9lxwy9q3Cu3yZx5z8ZSSxOWFrzoBoZ1uCUaCHDUPH4V54tE
 A8EWpKLRzcSnXUGkloFEajck9a+k59qvdg==
X-Google-Smtp-Source: ABdhPJwoA08LGLrwi3sgoDKx8S9KePwdd5q9pMP67YM9zmpeAXm5wqfTEAw1NJsPpGvUp/MH4Io+mA==
X-Received: by 2002:a05:600c:3543:b0:38e:bc4d:1d11 with SMTP id
 i3-20020a05600c354300b0038ebc4d1d11mr18229467wmq.137.1650347505931; 
 Mon, 18 Apr 2022 22:51:45 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 38/53] build-sys: simplify AF_VSOCK check
Date: Tue, 19 Apr 2022 07:50:54 +0200
Message-Id: <20220419055109.142788-39-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The current test checks more than AF_VSOCK availability, and doesn't
need to be that long.

Since its introduction in Linux in 2013, AF_VSOCK came with
linux/vm_sockets.h for sockaddr_vm, let's check that.

We could even go back to the initial configure-less approach
proposed by Stefan Hajnoczi, since Michael Roth added the configure-time
check back then to satisfy glibc in Ubuntu 14. See:
https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg08208.html

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220401115005.2204000-1-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/meson.build b/meson.build
index d92b633c5d..5a207ed0fb 100644
--- a/meson.build
+++ b/meson.build
@@ -1988,25 +1988,10 @@ have_afalg = get_option('crypto_afalg') \
   '''), error_message: 'AF_ALG requested but could not be detected').allowed()
 config_host_data.set('CONFIG_AF_ALG', have_afalg)
 
-config_host_data.set('CONFIG_AF_VSOCK', cc.compiles(gnu_source_prefix + '''
-  #include <errno.h>
-  #include <sys/types.h>
-  #include <sys/socket.h>
-  #if !defined(AF_VSOCK)
-  # error missing AF_VSOCK flag
-  #endif
-  #include <linux/vm_sockets.h>
-  int main(void) {
-    int sock, ret;
-    struct sockaddr_vm svm;
-    socklen_t len = sizeof(svm);
-    sock = socket(AF_VSOCK, SOCK_STREAM, 0);
-    ret = getpeername(sock, (struct sockaddr *)&svm, &len);
-    if ((ret == -1) && (errno == ENOTCONN)) {
-        return 0;
-    }
-    return -1;
-  }'''))
+config_host_data.set('CONFIG_AF_VSOCK', cc.has_header_symbol(
+  'linux/vm_sockets.h', 'AF_VSOCK',
+  prefix: '#include <sys/socket.h>',
+))
 
 have_vss = false
 have_vss_sdk = false # old xp/2003 SDK
-- 
2.35.1



