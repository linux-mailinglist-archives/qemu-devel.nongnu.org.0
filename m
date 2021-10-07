Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0D24253BE
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:11:05 +0200 (CEST)
Received: from localhost ([::1]:60156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTAu-0008AQ-6t
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8W-0005K3-L7
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:36 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:39655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8T-0007jy-PV
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:36 -0400
Received: by mail-ed1-x52d.google.com with SMTP id x7so22273920edd.6
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rGWLqLZqbjLbWaTFBwtDPnR5RfeNUARQ5s5ewQw2PBk=;
 b=QnT9n1UX5gQiOVrKvkX2ZarRC9Hz+gIcyz+j3hoO6LC2k3EESWW9HBJ9lw3CyfXtD+
 V6v67Z/FpeGnQ3pOG1eZxtSuPBYcU0cNdENeg8tpy2BPv/Mn8jSuggoK4cLM0IQx7LXb
 ZaorMfAuew0pHRHjpiNU48CEP8sTFaVL8Y5uKsA3jxFBE2z8H33k799EH1bEFQiaO1tT
 qrVNoRfxM0/SF6t4Ao+18tEmLS+YXCrIR90GF1w0Bp3c1m/4/CW25i6Iu/dOJXZ0N5/B
 wCfiyZo15hsGQQK/E5MueGFJ/eA7kw9KtrBYEzHzp1a+fzdkDe9dvkSkmM8XeyemiVwg
 MmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rGWLqLZqbjLbWaTFBwtDPnR5RfeNUARQ5s5ewQw2PBk=;
 b=jN9kWyyR00POGyHORvSHJ0Ljp5Hm0ovjMqqKKlVZKaL1CkbiB79AdSgHXsjcB7wSnw
 KulqeBs/tOtkWhKUI5duJ628tIMmSHt98WE4BESK2fWiqTvLrizdr8l0WbJZbS3xe/vV
 uDTRP0Nj2ictkJdrU+/7xQ/QubXQL7ZydTPjZtSHuTdhVlFkQ8Gyc8ygUiX67VYGNkph
 jKn9mZN99MF7NFrgEtU9Z6GZHaHNchMz+yGgd7KxnGKtEk/LeM7bjWKzn/PYC+Wa2rjq
 IQCqF14AdvTKBKNlKNPA5cApHkLYx4ZXX8eevQsenwGUOqeTuoBIy0PF9u6kTpE/p87U
 c33w==
X-Gm-Message-State: AOAM532MUFuKyoVl8paLmDhgu9uzuMg1UU3evdvYXihP9WtD6gb0m/aU
 hCfdgdyM5uz/pMBOOXFMQW8de0XsUDc=
X-Google-Smtp-Source: ABdhPJyxBKYpazDgwJpJKkl6dfKW7kilHUoHq9dKNHGkEZYOJZ8puq75m7V5F/YQ+aG0X3ibEMc0rA==
X-Received: by 2002:a05:6402:40d3:: with SMTP id
 z19mr6166919edb.393.1633612112325; 
 Thu, 07 Oct 2021 06:08:32 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o12sm791254edw.84.2021.10.07.06.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:08:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/24] trace: simple: pass trace_file unmodified to
 config-host.h
Date: Thu,  7 Oct 2021 15:08:13 +0200
Message-Id: <20211007130829.632254-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the suffix directly in trace/simple.c, so that quoting is done
properly by Meson.

Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure      | 2 --
 meson.build    | 2 +-
 trace/simple.c | 2 +-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index f5dfcf1a08..98723db0cd 100755
--- a/configure
+++ b/configure
@@ -4578,8 +4578,6 @@ if have_backend "nop"; then
 fi
 if have_backend "simple"; then
   echo "CONFIG_TRACE_SIMPLE=y" >> $config_host_mak
-  # Set the appropriate trace file.
-  trace_file="\"$trace_file-\" FMT_pid"
 fi
 if have_backend "log"; then
   echo "CONFIG_TRACE_LOG=y" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 745b8c3c46..8752b757cc 100644
--- a/meson.build
+++ b/meson.build
@@ -1574,7 +1574,7 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
 
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
 arrays = ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
-strings = ['HOST_DSOSUF', 'CONFIG_IASL']
+strings = ['HOST_DSOSUF', 'CONFIG_IASL', 'CONFIG_TRACE_FILE']
 foreach k, v: config_host
   if ignored.contains(k)
     # do nothing
diff --git a/trace/simple.c b/trace/simple.c
index ac499edee0..18af590cf7 100644
--- a/trace/simple.c
+++ b/trace/simple.c
@@ -364,7 +364,7 @@ void st_set_trace_file(const char *file)
 
     if (!file) {
         /* Type cast needed for Windows where getpid() returns an int. */
-        trace_file_name = g_strdup_printf(CONFIG_TRACE_FILE, (pid_t)getpid());
+        trace_file_name = g_strdup_printf(CONFIG_TRACE_FILE "-" FMT_pid, (pid_t)getpid());
     } else {
         trace_file_name = g_strdup_printf("%s", file);
     }
-- 
2.31.1



