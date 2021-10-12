Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EF342A3A1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:50:00 +0200 (CEST)
Received: from localhost ([::1]:48468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGI9-00060u-U0
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFif-0000TZ-4J
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:17 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:36727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFid-0007WS-FS
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:16 -0400
Received: by mail-ed1-x535.google.com with SMTP id d3so52075229edp.3
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=66cPKGA4LIApLmGYntyONXoCCycQzNc5PlgBd8qN3y0=;
 b=N09iytPJg6ojzOnW2Q/ZbNokQG4T7GcXdAOh8ibP/yv+uwXr5yC9N1ObatStnFLx2I
 tFIHsJjSYi/bZhMYhmIafxyKL0VQHag/clIGxmYlF6Bj1bcopPHVRBdmLDDuJTpbFJaq
 UbA96TEelNZneW0Odx3NNtgJrfd2jNB/6rT1ONjhgwzNtIIcW7MHjSpXj5Uxkl88EbES
 zsV5+VbVqh1FN2z1K9nDMtg7EsSInQZbpKs8MgK1Rz3XkaWrdAVNFQX1mLqSeqek5o28
 qlYMSm0TjXajEtJCh5EYwRBGF1aoaQo1HUekkTd11LhzdVU+luOKWU5+TKlvWhRnxsfo
 094A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=66cPKGA4LIApLmGYntyONXoCCycQzNc5PlgBd8qN3y0=;
 b=Ws53SdNhyEmbsFQxa9/fgEm6YZPcIKqtyWTKfEx1ywoyXFXU0dhTYNMPwRa7HhX/XP
 1XlPYNsFKTuHi9yLmIJkxD9NvVX7r4RrK0TP/TEG0w6L5k34+dj1/3hof0wEhJtp6mr9
 BWDWwYjFu9E9/5ZvnTOjmf1XIIWT92KhyZ9Ink0pfEobLzQlgwhy8p9d9dZTu7vd68Ja
 v/SKf5ZMoB2H3GB6oVv1Vbw/FYB4JEWUrgauFAumBeqhHGfxNkrOeenlWhC2yepusday
 +rB2kauJGZ2wYoMKliu862Y7pViDPV7bCPUEDGjI+ZX855RafgU7Zc3kS/Zj2s+M3fzd
 f/Gw==
X-Gm-Message-State: AOAM532qKXGjoi0cvD8AieXk0yFMQufq4gpcKxn7FIeqK+un6LkLmWwt
 4vb1/VKWDwWUL6iiwxJiJ+rpipy/Fmg=
X-Google-Smtp-Source: ABdhPJw9+FgFI3hnzDkYp1S3GvzOymVxDZ4Wd3TExKpB99TzGOc6810jg+PUKXkLBITOoajAiDc6dw==
X-Received: by 2002:a05:6402:40d2:: with SMTP id
 z18mr49270890edb.362.1634037194142; 
 Tue, 12 Oct 2021 04:13:14 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm4742802eja.6.2021.10.12.04.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:13:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/24] configure,
 meson: remove CONFIG_GCOV from config-host.mak
Date: Tue, 12 Oct 2021 13:12:50 +0200
Message-Id: <20211012111302.246627-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012111302.246627-1-pbonzini@redhat.com>
References: <20211012111302.246627-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: marcandre.lureau@redhat.com, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211007130829.632254-7-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 3 ---
 meson.build | 1 +
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/configure b/configure
index 35e25bb960..499c84859d 100755
--- a/configure
+++ b/configure
@@ -4628,9 +4628,6 @@ echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
 echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 echo "LIBS_QGA=$libs_qga" >> $config_host_mak
-if test "$gcov" = "yes" ; then
-  echo "CONFIG_GCOV=y" >> $config_host_mak
-fi
 
 if test "$rng_none" = "yes"; then
   echo "CONFIG_RNG_NONE=y" >> $config_host_mak
diff --git a/meson.build b/meson.build
index f8992e4b2c..b551080523 100644
--- a/meson.build
+++ b/meson.build
@@ -1402,6 +1402,7 @@ config_host_data.set('CONFIG_ATTR', libattr.found())
 config_host_data.set('CONFIG_BRLAPI', brlapi.found())
 config_host_data.set('CONFIG_COCOA', cocoa.found())
 config_host_data.set('CONFIG_FUZZ', get_option('fuzzing'))
+config_host_data.set('CONFIG_GCOV', get_option('b_coverage'))
 config_host_data.set('CONFIG_LIBUDEV', libudev.found())
 config_host_data.set('CONFIG_LZO', lzo.found())
 config_host_data.set('CONFIG_MPATH', mpathpersist.found())
-- 
2.31.1



