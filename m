Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FD82F54B4
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 22:59:57 +0100 (CET)
Received: from localhost ([::1]:50894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzoBI-0005sw-Ca
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 16:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mforney@mforney.org>)
 id 1kzo97-0005Oh-KM
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 16:57:41 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mforney@mforney.org>)
 id 1kzo95-0005sj-Gf
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 16:57:41 -0500
Received: by mail-pj1-x1029.google.com with SMTP id m5so2025659pjv.5
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 13:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ESmcMAnWBHSju3uQEPj3whFpqEMjgBqgGp2w8gcr9E8=;
 b=UbL36ckuCBomOWV22TdRQ2YiffoVyevA/2Dt/OoWE8fKYLGSyW6JSY2bN5EEGHQajm
 2jDcIrLyloa2wsyBPfdYXjO22F42XePxRdRErZVxbTEHri6WrUb2HrOBJ8N82pYWj6bm
 zSgFyfNYP0L0Zs62ISrmfbHUl4RXu4wndTyQ4644RLHuVISPZkqxE33i0y1Fj5od5vcN
 xBfvg1oFXauXjc20cDDUVjDTMsVnVtZWmkHH1ydq8OVT0D4gcdsP1SEv6ga8sdx/0hSl
 NAhoDeisPh/MvVLrbHwPLqsVPOpdK7bXhl+nB8j0FKKKqteoujwkm7AWLANjwWNpxIQy
 i/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ESmcMAnWBHSju3uQEPj3whFpqEMjgBqgGp2w8gcr9E8=;
 b=o+mQZOyrgOo7e6wwjdquhVSEv2uDOXPjhLh9cXlGCFMwDJTqHKvYGoBJXQg12QtKME
 0q5gDwjAnWwNR4xNKSlrSFmA69d0/FRKCcMse5NlRJudzAgvRFvLrji5n13IpYehAzch
 Y8XhfaFIhlB2TRDMK1GtEqLHF60A2RbVrdwcgoNhGGEcnSNrdlgACPFmpaWq8jioRbdI
 7D09gpFELRcq3ak7rHu18PE69fTBCuz1BB0neYCqqTYHRgOsbI8g0Drtt/BspMA+vphz
 HytCzmVOBbP0slGfrzEnoqcwp7E4O9j6DwSMywLhLhB3fVnIN7lwsvsTaBZP3QKUToQd
 nukQ==
X-Gm-Message-State: AOAM5330n/Y5XDOOI5dnyBd/TtffHqgnX5Ze1zrd79ElxnvE+9olBmu3
 vnsbjR+8BB+IPfM+d6X6Uizy3YhJ6df/dDP8Oa4=
X-Google-Smtp-Source: ABdhPJwvQapnkMFi4dWdcg3lGLIHT5/ad1uUxLRwlozz/YgXQW/o9QA+IXphtESAm8ENB1E39V0GcQ==
X-Received: by 2002:a17:902:b097:b029:dc:5c:a986 with SMTP id
 p23-20020a170902b097b02900dc005ca986mr4242617plr.59.1610575056102; 
 Wed, 13 Jan 2021 13:57:36 -0800 (PST)
Received: from localhost ([2601:647:5180:4570:c90:56ff:fe92:3a06])
 by smtp.gmail.com with ESMTPSA id p15sm3542138pgl.19.2021.01.13.13.57.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 13 Jan 2021 13:57:34 -0800 (PST)
From: Michael Forney <mforney@mforney.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] osdep.h: Remove <sys/signal.h> include
Date: Wed, 13 Jan 2021 13:56:00 -0800
Message-Id: <20210113215600.16100-1-mforney@mforney.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201027003848.10920-1-mforney@mforney.org>
References: <20201027003848.10920-1-mforney@mforney.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=mforney@mforney.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prior to 2a4b472c3c, sys/signal.h was only included on OpenBSD
(apart from two .c files). The POSIX standard location for this
header is just <signal.h> and in fact, OpenBSD's signal.h includes
sys/signal.h itself.

Unconditionally including <sys/signal.h> on musl causes warnings
for just about every source file:

  /usr/include/sys/signal.h:1:2: warning: #warning redirecting incorrect #include <sys/signal.h> to <signal.h> [-Wcpp]
      1 | #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
        |  ^~~~~~~

Since there don't seem to be any platforms which require including
<sys/signal.h> in addition to <signal.h>, and some platforms like
Haiku lack it completely, just remove it.

Tested building on OpenBSD after removing this include.

Signed-off-by: Michael Forney <mforney@mforney.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
Changes since v1: rebase on latest master

 include/qemu/osdep.h | 4 ----
 meson.build          | 1 -
 2 files changed, 5 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index f9ec8c84e9..a434382c58 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -104,10 +104,6 @@ extern int daemon(int, int);
 #include <setjmp.h>
 #include <signal.h>
 
-#ifdef HAVE_SYS_SIGNAL_H
-#include <sys/signal.h>
-#endif
-
 #ifndef _WIN32
 #include <sys/wait.h>
 #else
diff --git a/meson.build b/meson.build
index 3d889857a0..af2bc89741 100644
--- a/meson.build
+++ b/meson.build
@@ -1113,7 +1113,6 @@ config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
 config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
-config_host_data.set('HAVE_SYS_SIGNAL_H', cc.has_header('sys/signal.h'))
 
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
 arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
-- 
2.30.0


