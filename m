Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8C813CD38
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 20:39:26 +0100 (CET)
Received: from localhost ([::1]:59728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iroVg-0007xY-SZ
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 14:39:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38645)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1iroTa-0005ew-12
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 14:37:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1iroTU-0004q7-F6
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 14:37:12 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:43312 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Filip.Bozuta@rt-rk.com>)
 id 1iroTS-0004oP-JR
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 14:37:07 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 78E631A21CA;
 Wed, 15 Jan 2020 20:36:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw493-lin.domain.local (rtrkw493-lin.domain.local
 [10.10.14.93])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 3E13E1A21CF;
 Wed, 15 Jan 2020 20:36:53 +0100 (CET)
From: Filip Bozuta <Filip.Bozuta@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 11/13] linux-user: Add support for getting/setting selected
 alsa timer parameters using ioctls
Date: Wed, 15 Jan 2020 20:36:45 +0100
Message-Id: <1579117007-7565-12-git-send-email-Filip.Bozuta@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579117007-7565-1-git-send-email-Filip.Bozuta@rt-rk.com>
References: <1579117007-7565-1-git-send-email-Filip.Bozuta@rt-rk.com>
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

SNDRV_TIMER_IOCTL_INFO - Getting information about selected timer

    Read information about the selected timer. The information is returned in
    the following structure:

    struct snd_timer_info {
        unsigned int flags;         /* timer flags - SNDRV_TIMER_FLG_* */
        int card;                   /* card number */
        unsigned char id[64];       /* timer identificator */
        unsigned char name[80];     /* timer name */
        unsigned long reserved0;    /* reserved for future use */
        unsigned long resolution;   /* average period resolution in ns */
        unsigned char reserved[64]; /* reserved for future use */
    };

    A pointer to this structure should be passed as the third ioctl's argument.
    Before calling this ioctl, the ioctl "SNDRV_TIMER_IOCTL_SELECT" should be
    called first to select the timer which information is to be obtained. If no
    timer is selected, the error EBADFD ("File descriptor in bad shape") is
    returned.

SNDRV_TIMER_IOCTL_PARAMS - Setting parameters for selected timer

    Sets parameters for the selected timer. The paramaters are set in the
    following structure:

    struct snd_timer_params {
        unsigned int flags;         /* flags - SNDRV_TIMER_PSFLG_* */
        unsigned int ticks;         /* requested resolution in ticks */
        unsigned int queue_size;    /* total size of queue (32-1024) */
        unsigned int reserved0;     /* reserved, was: failure locations */
        unsigned int filter;        /* event filter */
        unsigned char reserved[60]; /* reserved */
    };

    A pointer to this structure should be passed as the third ioctl's argument.
    Before calling this ioctl, the ioctl "SNDRV_TIMER_IOCTL_SELECT" should be
    called first to select the timer which parameters are to be set. If no
    timer is selected, the error EBADFD ("File descriptor in bad shape") is
    returned.

SNDRV_TIMER_IOCTL_STATUS - Getting status of selected timer

    Read status of the selected timer. The status of the timer is returned in
    the following structure:

    struct snd_timer_status {
        struct timespec tstamp;     /* Timestamp - last update */
        unsigned int resolution;    /* current period resolution in ns */
        unsigned int lost;          /* counter of master tick lost */
        unsigned int overrun;       /* count of read queue overruns */
        unsigned int queue;         /* used queue size */
        unsigned char reserved[64]; /* reserved */
    };

    A pointer to this structure should be passed as the third ioctl's argument.
    Before calling this ioctl, the ioctl "SNDRV_TIMER_IOCTL_SELECT" should be
    called first to select the timer which status is to be obtained. If no
    timer is selected, the error EBADFD ("File descriptor in bad shape") is
    returned.

Implementation notes:

    All ioctls in this patch have pointer to some kind of a structure
    as their third argument. That is the reason why corresponding
    definitions were added in 'linux-user/syscall_types.h'. Structure
    'snd_timer_status' has field of type 'struct timespec' which is why
    a corresponding definition of that structure was also added in
    'linux-user/syscall_types.h'. All of these strucutures have some
    fields that are of type 'unsigned long'. That is the reason why
    separate target structures were defined in 'linux-user/syscall_defs.h'.
    Structure 'struct timespec' already had a separate target definition
    so that definition was used to define a target structure for
    'snd_timer_status'. The rest of the implementation was straightforward.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
---
 linux-user/ioctls.h        |  5 +++++
 linux-user/syscall_defs.h  | 25 +++++++++++++++++++++++++
 linux-user/syscall_types.h | 29 +++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 7652117..43e7e5d 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -461,6 +461,11 @@
         MK_PTR(MK_STRUCT(STRUCT_snd_timer_gstatus)))
   IOCTL(SNDRV_TIMER_IOCTL_SELECT, IOC_W,
         MK_PTR(MK_STRUCT(STRUCT_snd_timer_select)))
+  IOCTL(SNDRV_TIMER_IOCTL_INFO, IOC_R, MK_PTR(MK_STRUCT(STRUCT_snd_timer_info)))
+  IOCTL(SNDRV_TIMER_IOCTL_PARAMS, IOC_W,
+        MK_PTR(MK_STRUCT(STRUCT_snd_timer_params)))
+  IOCTL(SNDRV_TIMER_IOCTL_STATUS, IOC_R,
+        MK_PTR(MK_STRUCT(STRUCT_snd_timer_status)))
 
   IOCTL(HDIO_GETGEO, IOC_R, MK_PTR(MK_STRUCT(STRUCT_hd_geometry)))
   IOCTL(HDIO_GET_UNMASKINTR, IOC_R, MK_PTR(TYPE_INT))
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 39b9739..d5f5cad 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2467,6 +2467,25 @@ struct target_snd_timer_select {
     unsigned char reserved[32];
 };
 
+struct target_snd_timer_info {
+    unsigned int flags;
+    int card;
+    unsigned char id[64];
+    unsigned char name[80];
+    abi_ulong reserved0;
+    abi_ulong resolution;
+    unsigned char reserved[64];
+};
+
+struct target_snd_timer_status {
+    struct target_timespec tstamp;
+    unsigned int resolution;
+    unsigned int lost;
+    unsigned int overrun;
+    unsigned int queue;
+    unsigned char reserved[64];
+};
+
 /* alsa timer ioctls */
 #define TARGET_SNDRV_TIMER_IOCTL_PVERSION     TARGET_IOR('T', 0x00, int)
 #define TARGET_SNDRV_TIMER_IOCTL_NEXT_DEVICE  TARGET_IOWR('T', 0x01,           \
@@ -2480,6 +2499,12 @@ struct target_snd_timer_select {
                                                 struct target_snd_timer_gstatus)
 #define TARGET_SNDRV_TIMER_IOCTL_SELECT       TARGET_IOW('T', 0x10,            \
                                                 struct target_snd_timer_select)
+#define TARGET_SNDRV_TIMER_IOCTL_INFO         TARGET_IOR('T', 0x11,            \
+                                                struct target_snd_timer_info)
+#define TARGET_SNDRV_TIMER_IOCTL_PARAMS       TARGET_IOW('T', 0x12,            \
+                                                struct snd_timer_params)
+#define TARGET_SNDRV_TIMER_IOCTL_STATUS       TARGET_IOR('T', 0x14,            \
+                                                struct target_snd_timer_status)
 
 /* vfat ioctls */
 #define TARGET_VFAT_IOCTL_READDIR_BOTH    TARGET_IORU('r', 1)
diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
index 767632d..fbc4be7 100644
--- a/linux-user/syscall_types.h
+++ b/linux-user/syscall_types.h
@@ -120,6 +120,35 @@ STRUCT(snd_timer_select,
        MK_STRUCT(STRUCT_snd_timer_id), /* id */
        MK_ARRAY(TYPE_CHAR, 32)) /* reserved */
 
+STRUCT(snd_timer_info,
+       TYPE_INT, /* flags */
+       TYPE_INT, /* card */
+       MK_ARRAY(TYPE_CHAR, 64), /* id */
+       MK_ARRAY(TYPE_CHAR, 80), /* name */
+       TYPE_ULONG, /* reserved0 */
+       TYPE_ULONG, /* resolution */
+       MK_ARRAY(TYPE_CHAR, 64)) /* reserved */
+
+STRUCT(snd_timer_params,
+       TYPE_INT, /* flags */
+       TYPE_INT, /* ticks */
+       TYPE_INT, /* queue_size */
+       TYPE_INT, /* reserved0 */
+       TYPE_INT, /* filter */
+       MK_ARRAY(TYPE_CHAR, 60)) /* reserved */
+
+STRUCT(timespec,
+       TYPE_LONG, /* tv_sec */
+       TYPE_LONG) /* tv_nsec */
+
+STRUCT(snd_timer_status,
+       MK_STRUCT(STRUCT_timespec), /* tstamp */
+       TYPE_INT, /* resolution */
+       TYPE_INT, /* lost */
+       TYPE_INT, /* overrun */
+       TYPE_INT, /* queue */
+       MK_ARRAY(TYPE_CHAR, 64)) /* reserved */
+
 /* loop device ioctls */
 STRUCT(loop_info,
        TYPE_INT,                 /* lo_number */
-- 
2.7.4


