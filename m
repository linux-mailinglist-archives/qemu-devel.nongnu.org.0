Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699BD4253B5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:09:38 +0200 (CEST)
Received: from localhost ([::1]:57230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYT9V-0006Cz-CD
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT6f-00024j-MM
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:06:41 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT6d-00077p-9P
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:06:41 -0400
Received: by mail-ed1-x529.google.com with SMTP id g8so22860211edt.7
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y1bn4TnWehEVd2MxT1WgUiKTLzFekpfK4F+S/RtUMuM=;
 b=SBd773ubybdzgJg8k4l0mJmCf4q9yuWJwIm2s9OS74YRAr0YdZlWdJ+v45ZmtrewcM
 jBpJwxY1KNBPXnGRgSwaeWJusUSo7bJ7hEIeLib/9L4vgOlyX/DcW9tsqWWM/+XAp5+U
 FO+YvV1hziHgl+LM1pExlQvaVpprSQYGFzQ4bm4Jafw2WmAwWfg5uxOrvtm00i5f87g5
 1aFXVQS2RzlY0wpqGeolff/6pEZPKtacyzB7EF/ufUwHdjVoNIwef9krVUPupQLaVWCV
 d26aUWOkHfGFj1HvmlwEULcRdAHKwN+YQEgBjak9VHpx2A1oNgb+21ojTcOVsGpP6VGU
 e76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Y1bn4TnWehEVd2MxT1WgUiKTLzFekpfK4F+S/RtUMuM=;
 b=izcuW9HGntv3vKjV5oQO8PXD4g5LRyKk88PDzhNlPKgyT/MNfH3tQn1YGOzLd5r7or
 ZSqgqewpHpE+6E/C3URp1ALfFwUOQj/LEz5IYFFJFZJPMsQOBtjYIx0pJig9plZIGDJ1
 ZI3FdZYUEZjZyeWz7wGx9niLZQW2XmWFTmbO7BdYe3bAOkC99g9hmi491d3SyWaA/Miz
 Un6k6vE02YU2ncQfv01EuAdy872yj7LAMQPyrtbYCAdQw3dpA7nZa7Z4dl7oY2mpc2HR
 36m49KFX0PvWv5QtaqgaMqpU8jwWH0VyJQhiZGGtpQtPyo0gCstu8Lh6kSux4UBRl0/Y
 CB7A==
X-Gm-Message-State: AOAM532/a/SxskI8bU9eS5ngoD+odcF5y0SuJnOYhT9qtCwFcWpUIGfa
 R1rZPOZoHl4ohMyrb0fb9FzTsHE+MNo=
X-Google-Smtp-Source: ABdhPJwXd43nqC/UUIxNECn6IOJsSmxljOiD5lX9Wy04Ec538WzpgRuUq5otcP8d6pjqSMqxMd06hw==
X-Received: by 2002:a50:9d42:: with SMTP id j2mr6298270edk.7.1633611994171;
 Thu, 07 Oct 2021 06:06:34 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ca4sm10167543ejb.1.2021.10.07.06.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:06:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/24] audio: remove CONFIG_AUDIO_WIN_INT
Date: Thu,  7 Oct 2021 15:06:08 +0200
Message-Id: <20211007130630.632028-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffman <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ever since winwaveaudio was removed in 2015, CONFIG_AUDIO_WIN_INT
is only set if dsound is in use, so use CONFIG_AUDIO_DSOUND directly.

Cc: Gerd Hoffman <kraxel@redhat.com>
Cc: Volker Rümelin <vr_qemu@t-online.de>
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



