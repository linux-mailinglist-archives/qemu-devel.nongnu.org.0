Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC2542A35D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:32:59 +0200 (CEST)
Received: from localhost ([::1]:45482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maG1i-0000x4-DZ
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFiX-00009n-7J
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:09 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:41705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFiV-0007TH-Db
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:08 -0400
Received: by mail-ed1-x529.google.com with SMTP id a25so63794924edx.8
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E74LozYXLQeg3/h24qw4fjp5+YO7btMJIso2OgGHhA8=;
 b=IN7hTNezQ9MxmQKg66nAXWZVT/AxjmGLK0KBKPIv+xXlD5W/7jOBcTPAfuIaBY+FmR
 5uKHSA2SoLLr1A3RN0AXsBpV5ngb+xL5sc+/pQ8J0NZVLGLwdvlEOTgX9EQhcSu7+MrU
 wLAHp0Uef7ctGoMI3FJDTsYyD+CDcs227XUPEI1H9b5bWZYObb7XdrWbDBKgmgCubZeZ
 jtxShenoHe+YV2gXviAqmcX5wHNgrz01Yo7uAeFWrVuN1QesueRuCnnqe37u0pdES+7O
 ONvuNC1mxVwnX0vslfWmaffMmyea5IIBrjMgy+CLbXgXVuCBzQpP/xLnklSgcI38UMrr
 Y0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=E74LozYXLQeg3/h24qw4fjp5+YO7btMJIso2OgGHhA8=;
 b=5+C6I+pFSnyhRkgx7mbH3EoJDNmxj8lkCIU8zBRQd+DWdug9r63JjQ8zA/KmdmbODg
 Z5zs2DKFA6AJC9ihD06CF/V0rUyzrujLbQbYmm/IQnSu5XlDVrtfm9ilogudhkNOXNB8
 tP1ly1wKXKGn721Wn0NYgE9EU/ytHhf7s9HJxJ+Ns+Ch+1lNF4kEz/cJ9vLjezA+eIYy
 d2I0PyySkLPjdNgTGcgNeZcBDo1spHdL5JXNgibRJluOLDbzilRJOIaksQk1bG3fxjmi
 LdNVnintOknwrRqVz1q5t5UJJ9VWM5rgA5v0zDO3sdKp+2HY9w7wzGUNxYVYl1A3IB59
 jL5g==
X-Gm-Message-State: AOAM531eWId4MDx645xl0LMKsrqE7cEXStvjZFlGf4knk5uOgIELfxHO
 KDI+abGfWVJxhZXErDSs9AkjsFlXVac=
X-Google-Smtp-Source: ABdhPJzLsu2s3jMPF6LV0mUFXbnAKuZq3ZwBmRcO/AFbtjccKI7rHoLiHBdgsWCMzY+vVmj+PWferA==
X-Received: by 2002:a05:6402:5215:: with SMTP id
 s21mr44899831edd.113.1634037185867; 
 Tue, 12 Oct 2021 04:13:05 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm4742802eja.6.2021.10.12.04.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:13:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/24] audio: remove CONFIG_AUDIO_WIN_INT
Date: Tue, 12 Oct 2021 13:12:40 +0200
Message-Id: <20211012111302.246627-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012111302.246627-1-pbonzini@redhat.com>
References: <20211012111302.246627-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffman <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ever since winwaveaudio was removed in 2015, CONFIG_AUDIO_WIN_INT
is only set if dsound is in use, so use CONFIG_AUDIO_DSOUND directly.

Cc: Gerd Hoffman <kraxel@redhat.com>
Cc: Volker Rümelin <vr_qemu@t-online.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211007130630.632028-3-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 audio/meson.build | 4 ++--
 configure         | 5 -----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/audio/meson.build b/audio/meson.build
index 7d53b0f920..9a95c58f18 100644
--- a/audio/meson.build
+++ b/audio/meson.build
@@ -8,8 +8,8 @@ softmmu_ss.add(files(
 ))
 
 softmmu_ss.add(when: [coreaudio, 'CONFIG_AUDIO_COREAUDIO'], if_true: files('coreaudio.c'))
-softmmu_ss.add(when: [dsound, 'CONFIG_AUDIO_DSOUND'], if_true: files('dsoundaudio.c'))
-softmmu_ss.add(when: ['CONFIG_AUDIO_WIN_INT'], if_true: files('audio_win_int.c'))
+softmmu_ss.add(when: [dsound, 'CONFIG_AUDIO_DSOUND'],
+               if_true: files('dsoundaudio.c', 'audio_win_int.c'))
 
 audio_modules = {}
 foreach m : [
diff --git a/configure b/configure
index ab6bc0c994..6a6273ce7b 100755
--- a/configure
+++ b/configure
@@ -245,7 +245,6 @@ block_drv_rw_whitelist=""
 block_drv_ro_whitelist=""
 block_drv_whitelist_tools="no"
 host_cc="cc"
-audio_win_int=""
 libs_qga=""
 debug_info="yes"
 lto="false"
@@ -3075,7 +3074,6 @@ for drv in $audio_drv_list; do
 
     dsound)
       dsound_libs="-lole32 -ldxguid"
-      audio_win_int="yes"
     ;;
 
     oss)
@@ -4560,9 +4558,6 @@ if test "$libjack" = "yes" ; then
     echo "CONFIG_LIBJACK=y" >> $config_host_mak
 fi
 echo "JACK_LIBS=$jack_libs" >> $config_host_mak
-if test "$audio_win_int" = "yes" ; then
-  echo "CONFIG_AUDIO_WIN_INT=y" >> $config_host_mak
-fi
 echo "CONFIG_BDRV_RW_WHITELIST=$block_drv_rw_whitelist" >> $config_host_mak
 echo "CONFIG_BDRV_RO_WHITELIST=$block_drv_ro_whitelist" >> $config_host_mak
 if test "$block_drv_whitelist_tools" = "yes" ; then
-- 
2.31.1



