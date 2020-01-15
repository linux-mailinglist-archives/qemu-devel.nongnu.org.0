Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD70913C9BD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 17:39:20 +0100 (CET)
Received: from localhost ([::1]:56922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irlhP-0005T1-Mw
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 11:39:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57133)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1irl0Q-00060L-Od
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:54:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1irl0M-0006Fe-SO
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:54:54 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:34652 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Filip.Bozuta@rt-rk.com>)
 id 1irl0M-0006EB-Co
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:54:50 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id C81101A21AB;
 Wed, 15 Jan 2020 16:53:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw493-lin.domain.local (rtrkw493-lin.domain.local
 [10.10.14.93])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 8EACC1A2173;
 Wed, 15 Jan 2020 16:53:44 +0100 (CET)
From: Filip Bozuta <Filip.Bozuta@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/12] linux-user: Add support for selecting alsa timer using
 ioctl
Date: Wed, 15 Jan 2020 16:53:36 +0100
Message-Id: <1579103618-20217-11-git-send-email-Filip.Bozuta@rt-rk.com>
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

This patch implements functionality of following ioctl:

SNDRV_TIMER_IOCTL_SELECT - Selecting timer

    Selects the timer which id is specified. The timer id is specified in the
    following strcuture:

    struct snd_timer_select {
        struct snd_timer_id id;         /* timer ID */
        unsigned char reserved[32];     /* reserved */
    };

    A pointer to this structure should be passed as the third ioctl's argument.
    Before calling the ioctl, the field "tid" should be initialized with the id
    information for the timer which is to be selected. If there is no timer
    device with the specified id, the error ENODEV ("No such device") is
    returned.

Implementation notes:

    Ioctl implemented in this patch has a pointer to a
    'struct snd_timer_select' as its third argument.
    That is the reason why a corresponding definition
    was added in 'linux-user/syscall_types.h'. The rest
    of the implementation was straightforward.

Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
---
 linux-user/ioctls.h        | 2 ++
 linux-user/syscall_defs.h  | 7 +++++++
 linux-user/syscall_types.h | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 989eb9b..7652117 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -459,6 +459,8 @@
         MK_PTR(MK_STRUCT(STRUCT_snd_timer_gparams)))
   IOCTL(SNDRV_TIMER_IOCTL_GSTATUS, IOC_RW,
         MK_PTR(MK_STRUCT(STRUCT_snd_timer_gstatus)))
+  IOCTL(SNDRV_TIMER_IOCTL_SELECT, IOC_W,
+        MK_PTR(MK_STRUCT(STRUCT_snd_timer_select)))
 
   IOCTL(HDIO_GETGEO, IOC_R, MK_PTR(MK_STRUCT(STRUCT_hd_geometry)))
   IOCTL(HDIO_GET_UNMASKINTR, IOC_R, MK_PTR(TYPE_INT))
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 4d4dad3..9a33b71 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2462,6 +2462,11 @@ struct target_snd_timer_gstatus {
     unsigned char reserved[32];
 };
 
+struct target_snd_timer_select {
+    struct target_snd_timer_id id;
+    unsigned char reserved[32];
+};
+
 /* alsa timer ioctls */
 #define TARGET_SNDRV_TIMER_IOCTL_PVERSION     TARGET_IOR('T', 0x00, int)
 #define TARGET_SNDRV_TIMER_IOCTL_NEXT_DEVICE  TARGET_IOWR('T', 0x01,                     \
@@ -2473,6 +2478,8 @@ struct target_snd_timer_gstatus {
                                                          struct target_snd_timer_gparams)
 #define TARGET_SNDRV_TIMER_IOCTL_GSTATUS      TARGET_IOWR('T', 0x05,                     \
                                                           struct target_snd_timer_gstatus)
+#define TARGET_SNDRV_TIMER_IOCTL_SELECT       TARGET_IOW('T', 0x10,                      \
+                                                         struct target_snd_timer_select)
 
 /* vfat ioctls */
 #define TARGET_VFAT_IOCTL_READDIR_BOTH    TARGET_IORU('r', 1)
diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
index 4e90716..767632d 100644
--- a/linux-user/syscall_types.h
+++ b/linux-user/syscall_types.h
@@ -116,6 +116,10 @@ STRUCT(snd_timer_gstatus,
        TYPE_ULONG, /* resolution_den */
        MK_ARRAY(TYPE_CHAR, 32)) /* reserved */
 
+STRUCT(snd_timer_select,
+       MK_STRUCT(STRUCT_snd_timer_id), /* id */
+       MK_ARRAY(TYPE_CHAR, 32)) /* reserved */
+
 /* loop device ioctls */
 STRUCT(loop_info,
        TYPE_INT,                 /* lo_number */
-- 
2.7.4


