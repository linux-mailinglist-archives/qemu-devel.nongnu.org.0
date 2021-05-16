Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BE4381F2F
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 16:01:01 +0200 (CEST)
Received: from localhost ([::1]:60844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liHKG-00017r-Fw
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 10:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kenta@lithdew.net>) id 1liCx6-00040y-Gw
 for qemu-devel@nongnu.org; Sun, 16 May 2021 05:20:48 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kenta@lithdew.net>) id 1liCx4-0006ZM-7K
 for qemu-devel@nongnu.org; Sun, 16 May 2021 05:20:48 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 ep16-20020a17090ae650b029015d00f578a8so2143098pjb.2
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 02:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lithdew-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lwFgkfiegTvUCCq9XMyB/9qIOAqIz3tB60NTjtV4nSE=;
 b=WFn5raH8XpoKvmwxyOnUkaG14LhE3uSmTFQN80GrR8tdSXHWZ4y1Dg4W2qDYMl2pnL
 IoFSl5+BWL27y4jMq/rg1gov4emMYC8dBBMab8ImFrw1Si2HlOT0ut4yMTeO90gqoXTU
 JQYkZWipJsU/mpKlu0NgEJsq7Oa4K0LVBVdUH1d4rUpZbw+rRY7fJ92ZV08rd/SM8/VR
 0ra+7verOOhyuebMg+SLKd0yu3w2SNCvqqfIzsK52/O2pPV5JcKE40cAO8dnzGAe/bGP
 WMNJpmSOKTX0002xktXLC2G4LBe6Bdzmrdepu2CMcGUdXr4qTnRIIAbagdQPYzPxnP5s
 +djg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lwFgkfiegTvUCCq9XMyB/9qIOAqIz3tB60NTjtV4nSE=;
 b=n6CVK7ZAcku6aHmYOMdix2PldL8AS55yftP9qy+L5oqvtCIMR+inBL73xvA8I08C6g
 SAxn7zT+wVI8gxbGk6tIao1+zHyF2F+tie+IKdO5UnhXmqU+y0FLvKX2NwoB2woevP75
 bq7DXbiIxWepAcAO+JORx9HHLf9miBvVMIU4sqK/vOOESVZEKI0wRPA1KiLCozrjeXdd
 VbftkZs++gX8Nb/YUZE4mFt1b4oicwSY/JeZQv1rxuzT1lsmvor2U2KphWXwDTa6X9sR
 wNd8leihg/LNlTejxo4BK3pr4VikeGYGNYVr+qJ8/N23LUJyzXBCzY+ASii2DnakZwJc
 S/TQ==
X-Gm-Message-State: AOAM533tX4nEgSj1+HjE03aKzH0cqsJkRyJQ5Z3LG6ZM7+XuIJ0hvICN
 uFK2MsD1WxB2KR42qap61fdNwPhP1gfxno1rSRA=
X-Google-Smtp-Source: ABdhPJw9uJbMYHJuUPA8iNQLDUksXT4bOUWVAh+iARp/JqzQ7evM9XKIEkQ2XEYsJuuBRKxlmIRZdQ==
X-Received: by 2002:a17:90a:5881:: with SMTP id
 j1mr34012911pji.122.1621156842362; 
 Sun, 16 May 2021 02:20:42 -0700 (PDT)
Received: from localhost.localdomain (ai126146207143.53.access-internet.ne.jp.
 [126.146.207.143])
 by smtp.gmail.com with ESMTPSA id v2sm7330996pfm.134.2021.05.16.02.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 02:20:42 -0700 (PDT)
From: Kenta Iwasaki <kenta@lithdew.net>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user/syscall: zero-init msghdr in do_sendrecvmsg_locked
Date: Sun, 16 May 2021 18:15:36 +0900
Message-Id: <20210516091536.1042693-1-kenta@lithdew.net>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=kenta@lithdew.net; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 16 May 2021 09:58:24 -0400
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
Cc: laurent@vivier.eu, Kenta Iwasaki <kenta@lithdew.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The mixing of libc and kernel versions of the layout of the `msghdr`
struct causes EMSGSIZE to be returned by sendmsg if the `msghdr` struct
is not zero-initialized (such that padding bytes comprise of
uninitialized memory).

Other parts of the QEMU codebase appear to zero-initialize the `msghdr`
struct to workaround these struct layout issues, except for
do_sendrecvmsg_locked in linux-user/syscall.c.

This patch zero-initializes the `msghdr` struct in
do_sendrecvmsg_locked.

Signed-off-by: Kenta Iwasaki <kenta@lithdew.net>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 95d79ddc43..f60b7e04d5 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3337,7 +3337,7 @@ static abi_long do_sendrecvmsg_locked(int fd, struct target_msghdr *msgp,
                                       int flags, int send)
 {
     abi_long ret, len;
-    struct msghdr msg;
+    struct msghdr msg = { 0 };
     abi_ulong count;
     struct iovec *vec;
     abi_ulong target_vec;
-- 
2.31.0


