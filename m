Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4CE2DFD7A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:25:42 +0100 (CET)
Received: from localhost ([::1]:57108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krN49-0007Cj-Sw
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:25:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRR-0005G4-3X
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:41 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRO-00080x-DE
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:40 -0500
Received: by mail-wr1-x430.google.com with SMTP id d26so11283517wrb.12
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3dnpjFrRZ3Pps/Dhvh5pKZJV/WyB1MHI0RknEGiEb1k=;
 b=bOGe03f61jBDEzK2juPygpVhKgLtlH7P8Y49LYTOi94/nVZKJzXRH5Jm4J5eh2AxvM
 20AM0/N8Ux64Bznas/WhEPkkivvTJJvd8GChEiVEeOoyBYb5oqdniVtQm/tqH1bD7zeu
 RpNdeblFsQuUmusruRiXfXBJ4wR0Y/OMU2KXCQ3eEG71W6TgiY0KXvy78GCPAfTo3Bgr
 91tR68lMg4fPvDF/pKoTebRWYsR+5hflvVLh+C1Tr9kM7QpA9MgHx+23nEzfmIvvRAeX
 S4f7pmYcjK3jyGyf92Hr1PdhIP/c5STEW5zP6aE0jBUU5yCAAncY6QvPWntq1YZZje+N
 sscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3dnpjFrRZ3Pps/Dhvh5pKZJV/WyB1MHI0RknEGiEb1k=;
 b=M6vs+EmdYVZdzkTkgAHwKgCvU6QBHSWVrdUHU/1hTLKbpgA/k5TQKxFDzRTE8V5wWJ
 65u1xF6hOrDODQMdNcdUKA68B626b0b6kCHFmAL6r9gGf7ECkx7dCr4xqPeQtCXL6pGx
 596Dhy2cbmGHNJbBR+XTvAreLxSQDtlFnMYrx/YJ39pxbp49j9b/Vln5QBJ23eYr/wOW
 c8Szhp7/HKP8rawUmQkKw/lR38LzbfylAG7XS/qfBkEKYlOvlZYCd7HQfUKL+xl0iNN/
 wFbddLIX93D8LPbqIktkAzsnU0XHQNTp2j7ugfu7AYT+/DXb2pad7pz60tRkxj8oPLDQ
 jt8A==
X-Gm-Message-State: AOAM532UtwvIF8s0bf5qY5znfs0Tsw+KzqopoKXrPySl3bmt6vY1qzf9
 hayB6ihx6iU9XBW9rXR4tp74xE03+X0=
X-Google-Smtp-Source: ABdhPJwhrkTO07pcJmIsb8QOH6D8Jt+MMBFaSIemA5pzEi+g5V63NI/LUFsMmjsTwAKEszkM1Xixeg==
X-Received: by 2002:adf:8290:: with SMTP id 16mr18484839wrc.27.1608561937204; 
 Mon, 21 Dec 2020 06:45:37 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 55/55] win32: drop fd registration to the main-loop on setting
 non-block
Date: Mon, 21 Dec 2020 15:44:47 +0100
Message-Id: <20201221144447.26161-56-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Low-level fd users from QEMU use aio_set_fd_handler(), which handles
event registration with the main loop; qemu_fd_register() is only
needed together with the main loop's poll notifiers, of which SLIRP
is the only user.

This removes a dependency from oslib-win32.c to main-loop.c.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201218135712.674094-1-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/oslib-win32.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 23a7c7320b..01787df74c 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -221,7 +221,6 @@ int qemu_try_set_nonblock(int fd)
     if (ioctlsocket(fd, FIONBIO, &opt) != NO_ERROR) {
         return -socket_error();
     }
-    qemu_fd_register(fd);
     return 0;
 }
 
-- 
2.29.2


