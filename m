Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C284253E5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:19:43 +0200 (CEST)
Received: from localhost ([::1]:54280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTJG-0006UD-6x
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8d-0005UU-BP
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:44 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:45949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8c-0007qp-31
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:43 -0400
Received: by mail-ed1-x52b.google.com with SMTP id r18so22919489edv.12
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=POfZpzlorSjMdh5Eu10c3iImd8qfm8JcbJfxM0yg91Q=;
 b=Iy5VCKCENtAybPaDx6pfD083uKCmNgD4cp7ZV2pXVnZSB1519yfBY0Ukt7dPOIEO06
 gyflrj73GP4n5oU/K3EyiU0F5TL+iMGXf7DFt9qSFLYCSNsXcU+Si/rrPt7LleBfuUra
 375jgFr7/FzqI3job7ZLH7qN20NP7IXVomVmPVNv4103JRHZpQ30nq8Fo+TGY2ufMLzU
 60yHX4OkFlx6+6tMtkAu6PUpCFC8dEdICjn9H/o+8oMvhIqLn50kXEpSIXxI/4FIMhAk
 5URnHfRjQv2C1KvgTSjbxGaCvYMBOPlPUcRrmnmzd1u/gqVAqF4m3Ts8uDq2eyxHYyZO
 N5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=POfZpzlorSjMdh5Eu10c3iImd8qfm8JcbJfxM0yg91Q=;
 b=mcWIy//bfiQESvq8HjQNZAJQtwLvR/7iT7r36fl1KyDQe+dmYVktR9U64DFwMSGab/
 ywiSTt6fEEUoBezabMfCAlr93LVLaEzWxUAFmNnr2Iu516DYucxBOd5CqH2upTA73oqA
 bv4l5fdNAyg2vUfrkp3EJ1Zfx6Q+xrOE2fN3GPV4lkXzZsqrLZFSuDF51psRAm42i6t5
 1OdJyA7x8zEEtJaGlfrVSaz7+UdBxRktRYbLmv0N/32kc2BYe+E3p3YFohsAgJ1yH/UV
 xPmrBwJnvGaQs5ZEnyENTBzTX1ZEDGsaoPQGp//MiJ/oz1lGApcrHIsTUt8+wM2Rapku
 md6g==
X-Gm-Message-State: AOAM533tLZnsteDz9H7dzVn4ObBXmlOZRV0paOLkSYF5qfV7N+as3/O1
 H04HDOwuZWvL1hl35mOpyzAM8KeisCw=
X-Google-Smtp-Source: ABdhPJzW2jA2wUIqAgAfD7uPef637l952xvloR1RKgGgT9mLvLW4o8zxI3XiGaul7/ce0yH33Gw9hg==
X-Received: by 2002:a05:6402:5215:: with SMTP id
 s21mr996706edd.113.1633612119657; 
 Thu, 07 Oct 2021 06:08:39 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o12sm791254edw.84.2021.10.07.06.08.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:08:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/24] configure: remove obsolete Solaris ar check
Date: Thu,  7 Oct 2021 15:08:24 +0200
Message-Id: <20211007130829.632254-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson already has its own logic to find the "ar" binary, so remove the
Solaris specific check.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/configure b/configure
index 016814d23b..2091844ad6 100755
--- a/configure
+++ b/configure
@@ -2284,21 +2284,6 @@ EOF
   fi
 fi
 
-#########################################
-# Solaris specific configure tool chain decisions
-
-if test "$solaris" = "yes" ; then
-  if has ar; then
-    :
-  else
-    if test -f /usr/ccs/bin/ar ; then
-      error_exit "No path includes ar" \
-          "Add /usr/ccs/bin to your path and rerun configure"
-    fi
-    error_exit "No path includes ar"
-  fi
-fi
-
 if test "$tcg" = "enabled"; then
     git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
     git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
-- 
2.31.1



