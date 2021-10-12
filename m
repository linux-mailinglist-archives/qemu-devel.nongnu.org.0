Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 578E042A39B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:48:11 +0200 (CEST)
Received: from localhost ([::1]:39784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGGQ-0008WV-A7
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFib-0000F5-Ui
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:13 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:46055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFia-0007Un-Ay
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:13 -0400
Received: by mail-ed1-x52d.google.com with SMTP id r18so79804383edv.12
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DtMeh3NSVX/hkM+93lmYNjcI2Z0BmyBQyiCE9mpdoTU=;
 b=RH5ARWpwYzD4CZzPEvt0QN7BS/L2kVKLalp813lqemGoGQ8jqNlKsCEY8MFI6V2U0Q
 JvgbK9YdHIfNFIFWvNV9lOLh9ZEL9zBfsm5sKl20hg2dly6bGTninQCSHBN+sEngvrsP
 Yc6hSRzaBYd4fXrY92cDAwfwONixRIO6+wAFSg3DrHXJkdM3SDEnP7gc8gjY0QTkIcZg
 XIWuBT+ba698wHdH+tb2qewnvIst7dldDcjoFosZTZmX3L5gbbUVgHXVwH4Jog1qzlsQ
 cC/IdCPZMDZZYxb6xbLv7a/JOxNPzMncljzbwMiEo9PbFZA5Q8QqiufCYVmdHRMR1upO
 5tRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DtMeh3NSVX/hkM+93lmYNjcI2Z0BmyBQyiCE9mpdoTU=;
 b=6LrFX+IgZKruVdl6PHn4wCwTam6eXnvqC2TvvUN2/zMyel51eJjptwkjxCe5TCjIka
 tIPmzvJTr0Hw4HoC27WOhXPPsBvqLvXqH4bfAINCAbOxcKVRh0cKwPLYXFAFIid90ezw
 bfgSfc7eymEV0low67NVdKuTWIvucC3OMIAd/eo/CCnGkKgiZUWa7mAfHg93LAo55x+D
 AD5RWlssW/2Xig3DuyMLBj2IBkDBdh6bXfkfmuoeqSs7n4npM2Hb4YnIT8xlGOunBW1p
 LwAy1T6r2ix4bVaXr++gk/WUQMQ+axK3NiQIZQQk0bH8Pls2y+bgOccb8SYJWVO1eK0F
 Ouig==
X-Gm-Message-State: AOAM533B5WI4ljwgPHkN5hfbEeE3NcS1ZB3eTull5a7SgRAGxb0qNkXz
 b6VYHGcpAPQLw2l/V/3ljHXkN5fRKHE=
X-Google-Smtp-Source: ABdhPJyXkchYlMZb1bWh4/egNTTxabVhSdtTInxcBZtfXQd0zpYNCAWRnGolDm8l5ZeIC4lSHKEsKQ==
X-Received: by 2002:a17:906:ecf6:: with SMTP id
 qt22mr32010843ejb.292.1634037190949; 
 Tue, 12 Oct 2021 04:13:10 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm4742802eja.6.2021.10.12.04.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:13:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/24] trace: simple: pass trace_file unmodified to
 config-host.h
Date: Tue, 12 Oct 2021 13:12:46 +0200
Message-Id: <20211012111302.246627-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012111302.246627-1-pbonzini@redhat.com>
References: <20211012111302.246627-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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
Cc: marcandre.lureau@redhat.com, thuth@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the suffix directly in trace/simple.c, so that quoting is done
properly by Meson.

Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211007130829.632254-3-pbonzini@redhat.com>
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
index f59acc7677..9c1efa4731 100644
--- a/meson.build
+++ b/meson.build
@@ -1571,7 +1571,7 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
 
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



