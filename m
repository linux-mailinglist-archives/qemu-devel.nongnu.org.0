Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA8D445EE5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 04:52:36 +0100 (CET)
Received: from localhost ([::1]:47546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miqHL-0000Lw-Fx
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 23:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipmD-00057Z-Q8
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:20:25 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:43784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipmC-0004Hf-1D
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:20:25 -0400
Received: by mail-io1-xd36.google.com with SMTP id b203so5836085iof.10
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 20:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oGGtdxP6C7IR5B/d8MtcD0XVsN4clM86GpBWW0b3ip4=;
 b=IODnI5ysjViDz+oiVQeSswIn9JrCWONFbSi456soCQJPsf9+4DtVbIfcflnhFj/53P
 9o++fPvRll1aox1I7lwoy6wd6eq8jjcBB1dnRSIVnzdGq83FUsWdu7lxahYQQFmW20gE
 gOT5IyI4exKG7hMgZQoTqmOn9iTQIqdzUvfd5FewshKs0RwL7m9iwmeB2cyVAn+wSpaq
 LqSX9fw9FWwThCj0yyerDnwTAi5Oqhpr9YPRCwwRO3xpmyHGmwQWGWmFAHyMpZ3h4od7
 GlOF+z4x+tZGyyqec45TqTJ3udu/a0OrmBGYQzH4zFv+iX+4iDlWaNuVDhvhtfi/z73r
 4zHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oGGtdxP6C7IR5B/d8MtcD0XVsN4clM86GpBWW0b3ip4=;
 b=6h16ak9BDqCQjkdS3L/bxQSoLt2tGGO/l5dKvljhKkl2pPrqlMyHGL5/I5knN2p3uL
 cmSZ+je5Kr0941EUG9+Cy3PvpFgdhYiALMJQgvMAwGVi8H1yQRC5wQeU33QZiTSOg6qO
 bKy05YuwCKR562ioi1JJ98qIswrRuN/K1LIN4yDmer11yym9kPwjCvxXLiGuAQTFXCaq
 SYzx91eUBCcg9QD2lji/KgSlKJTo6bDhR2+DgU948D9CtpMB4Qi7z/mBYcsXNsCmgCfW
 2uVr61Tdt3vJCaV9BnszBtQcRFwCvnhODNwHNK8Vr5iIiiEpPLZJsLvfx4m/flvoLles
 XeHw==
X-Gm-Message-State: AOAM532mAW+NqfX/0tTRckBrNZBt/aO4000SCnE22skZZmHre9bToaEb
 4VqSF2YOxxrhv4lz7nw51DpZ4uElMp7eRQ==
X-Google-Smtp-Source: ABdhPJwT+u3jnAGK0lr5m/Oh9JX9OMLtgV014styqiUV1x+jxbb1ImVHcTNI28uSZwBHQU1hVzhu7w==
X-Received: by 2002:a05:6638:dcc:: with SMTP id
 m12mr6956941jaj.143.1636082422536; 
 Thu, 04 Nov 2021 20:20:22 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:20:22 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 35/36] bsd-user/freebsd/target_os_ucontext.h: Require
 TARGET_*CONTEXT_SIZE
Date: Thu,  4 Nov 2021 21:19:16 -0600
Message-Id: <20211105031917.87837-36-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all architecutres define TARGET_[MU]CONTEXT_SIZE, enforce
requiring them and always check the sizeof target_{u,m}context_t
sizes.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/target_os_ucontext.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/bsd-user/freebsd/target_os_ucontext.h b/bsd-user/freebsd/target_os_ucontext.h
index 1d0c3c4e65..64ed60e583 100644
--- a/bsd-user/freebsd/target_os_ucontext.h
+++ b/bsd-user/freebsd/target_os_ucontext.h
@@ -27,9 +27,7 @@ typedef struct target_ucontext {
     int32_t             __spare__[4];
 } target_ucontext_t;
 
-#ifdef TARGET_MCONTEXT_SIZE
 G_STATIC_ASSERT(TARGET_MCONTEXT_SIZE == sizeof(target_mcontext_t));
 G_STATIC_ASSERT(TARGET_UCONTEXT_SIZE == sizeof(target_ucontext_t));
-#endif /* TARGET_MCONTEXT_SIZE */
 
 #endif /* TARGET_OS_UCONTEXT_H */
-- 
2.33.0


