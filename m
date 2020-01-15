Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4E713C9D0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 17:43:00 +0100 (CET)
Received: from localhost ([::1]:56990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irlkx-0002a2-Cm
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 11:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57116)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1irl0Q-0005zs-Eh
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:54:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1irl0M-0006FN-NY
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:54:54 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:34675 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Filip.Bozuta@rt-rk.com>)
 id 1irl0M-0006EI-Bz
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:54:50 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id F25271A2173;
 Wed, 15 Jan 2020 16:53:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw493-lin.domain.local (rtrkw493-lin.domain.local
 [10.10.14.93])
 by mail.rt-rk.com (Postfix) with ESMTPSA id C023E1A1F87;
 Wed, 15 Jan 2020 16:53:44 +0100 (CET)
From: Filip Bozuta <Filip.Bozuta@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/12] linux-user: Add support for selected alsa timer
 instructions using ioctls
Date: Wed, 15 Jan 2020 16:53:38 +0100
Message-Id: <1579103618-20217-13-git-send-email-Filip.Bozuta@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579103618-20217-1-git-send-email-Filip.Bozuta@rt-rk.com>
References: <1579103618-20217-1-git-send-email-Filip.Bozuta@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, arnd@arndb.de,
 richard.henderson@linaro.org, laurent@vivier.eu, jcmvbkbc@gmail.com,
 amarkovic@wavecomp.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implements functionalities of following ioctls:

SNDRV_TIMER_IOCTL_START - Start selected alsa timer

    Starts the timer device that is selected. The third ioctl's argument is
    ignored. Before calling this ioctl, the ioctl "SNDRV_TIMER_IOCTL_SELECT"
    should be called first to select the timer that is to be started. If no
    timer is selected, the error EBADFD ("File descriptor in bad shape")
    is returned.

SNDRV_TIMER_IOCTL_STOP - Stop selected alsa timer

    Stops the timer device that is selected. The third ioctl's argument is
    ignored. Before calling this ioctl, the ioctl "SNDRV_TIMER_IOCTL_SELECT"
    should be called first to select the timer that is to be stopped. If no
    timer is selected, the error EBADFD ("File descriptor in bad shape")
    is returned.

SNDRV_TIMER_IOCTL_CONTINUE - Continue selected alsa timer

    Continues the timer device that is selected. The third ioctl's argument is
    ignored. Before calling this ioctl, the ioctl "SNDRV_TIMER_IOCTL_SELECT"
    should be called first to select the timer that is to be continued. If no
    timer is selected, the error EBADFD ("File descriptor in bad shape")
    is returned.

SNDRV_TIMER_IOCTL_PAUSE - Pause selected alsa timer

    Pauses the timer device that is selected. The third ioctl's argument is
    ignored. Before calling this ioctl, the ioctl "SNDRV_TIMER_IOCTL_SELECT"
    should be called first to select the timer that is to be paused. If no
    timer is selected, the error EBADFD ("File descriptor in bad shape")
    is returned.

Implementation notes:

    Since all of the implemented ioctls have NULL as their third argument,
    their implementation was straightforward.

Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
---
 linux-user/ioctls.h       | 4 ++++
 linux-user/syscall_defs.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 43e7e5d..75a2f0e 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -466,6 +466,10 @@
         MK_PTR(MK_STRUCT(STRUCT_snd_timer_params)))
   IOCTL(SNDRV_TIMER_IOCTL_STATUS, IOC_R,
         MK_PTR(MK_STRUCT(STRUCT_snd_timer_status)))
+  IOCTL(SNDRV_TIMER_IOCTL_START, 0, TYPE_NULL)
+  IOCTL(SNDRV_TIMER_IOCTL_STOP, 0, TYPE_NULL)
+  IOCTL(SNDRV_TIMER_IOCTL_CONTINUE, 0, TYPE_NULL)
+  IOCTL(SNDRV_TIMER_IOCTL_PAUSE, 0, TYPE_NULL)
 
   IOCTL(HDIO_GETGEO, IOC_R, MK_PTR(MK_STRUCT(STRUCT_hd_geometry)))
   IOCTL(HDIO_GET_UNMASKINTR, IOC_R, MK_PTR(TYPE_INT))
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index d76124d..311aec0 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2505,6 +2505,10 @@ struct target_snd_timer_status {
                                                          struct snd_timer_params)
 #define TARGET_SNDRV_TIMER_IOCTL_STATUS       TARGET_IOR('T', 0x14,                      \
                                                          struct target_snd_timer_status)
+#define TARGET_SNDRV_TIMER_IOCTL_START        TARGET_IO('T', 0xa0)
+#define TARGET_SNDRV_TIMER_IOCTL_STOP         TARGET_IO('T', 0xa1)
+#define TARGET_SNDRV_TIMER_IOCTL_CONTINUE     TARGET_IO('T', 0xa2)
+#define TARGET_SNDRV_TIMER_IOCTL_PAUSE        TARGET_IO('T', 0xa3)
 
 /* vfat ioctls */
 #define TARGET_VFAT_IOCTL_READDIR_BOTH    TARGET_IORU('r', 1)
-- 
2.7.4


