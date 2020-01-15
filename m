Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E0113CD40
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 20:41:37 +0100 (CET)
Received: from localhost ([::1]:59768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iroXo-00035x-6S
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 14:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38678)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1iroTc-0005gH-BI
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 14:37:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1iroTU-0004qG-DS
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 14:37:16 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:43306 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Filip.Bozuta@rt-rk.com>)
 id 1iroTS-0004nl-JJ
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 14:37:07 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 63F5A1A21BB;
 Wed, 15 Jan 2020 20:36:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw493-lin.domain.local (rtrkw493-lin.domain.local
 [10.10.14.93])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 283B91A21CA;
 Wed, 15 Jan 2020 20:36:53 +0100 (CET)
From: Filip Bozuta <Filip.Bozuta@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 09/13] linux-user: Add support for getting/setting
 specified alsa timer parameters using ioctls
Date: Wed, 15 Jan 2020 20:36:43 +0100
Message-Id: <1579117007-7565-10-git-send-email-Filip.Bozuta@rt-rk.com>
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

SNDRV_TIMER_IOCTL_GINFO - Getting information about specified timer

    Read information about the specified timer. The information about the
    timer is returned in the following structure:

        struct snd_timer_ginfo {
            struct snd_timer_id tid;      /* requested timer ID */
            unsigned int flags;           /* timer flags - SNDRV_TIMER_FLG_* */
            int card;                     /* card number */
            unsigned char id[64];         /* timer identification */
            unsigned char name[80];       /* timer name */
            unsigned long reserved0;      /* reserved for future use */
            unsigned long resolution;     /* average period resolution in ns */
            unsigned long resolution_min; /* minimal period resolution in ns */
            unsigned long resolution_max; /* maximal period resolution in ns */
            unsigned int clients;         /* active timer clients */
            unsigned char reserved[32];   /* reserved */
        };

    A pointer to this structure should be passed as the third ioctl's argument.
    Before calling the ioctl, the field "tid" should be initialized with the id
    information for the timer which information is to be obtained. After the
    ioctl call, the rest of the structure fields are filled with values from
    the timer device with the specified id. If there is no device with the
    specified id, the error ENODEV ("No such device") is returned.

SNDRV_TIMER_IOCTL_GPARAMS - Setting precise period duration

    Sets timer precise period duration numerator and denominator in seconds. The
    period duration is set in the following structure:

        struct snd_timer_gparams {
            struct snd_timer_id tid;    /* requested timer ID */
            unsigned long period_num;   /* period duration - numerator */
            unsigned long period_den;   /* period duration - denominator */
            unsigned char reserved[32]; /* reserved */
        };

    A pointer to this structure should be passed as the third ioctl's argument.
    Before calling the ioctl, the field "tid" should be initialized with the id
    information for the timer which period duration is to be set. Also, the
    fileds "period_num" and "period_den" should be filled with the period
    duration numerator and denominator values that are to be set respectively.
    If there is no device with the specified id, the error ENODEV ("No such
    device") is returned.

SNDRV_TIMER_IOCTL_GSTATUS - Getting current period resolution

    Read timer current period resolution in nanoseconds and period resolution
    numerator and denominator in seconds. The period resolution information is
    returned in the following structure:

    struct snd_timer_gstatus {
        struct snd_timer_id tid;        /* requested timer ID */
        unsigned long resolution;       /* current period resolution in ns */
        unsigned long resolution_num;   /* period resolution - numerator */
        unsigned long resolution_den;   /* period resolution - denominator */
        unsigned char reserved[32];     /* reserved for future use */
    };

    A pointer to this structure should be passed as the third ioctl's argument.
    Before calling the ioctl, the field "tid" should be initialized with the id
    information for the timer which period resolution is to be obtained. After
    the ioctl call, the rest of the structure fields are filled with values
    from the timer device with the specified id. If there is no device with the
    specified id, the error ENODEV ("No such device") is returned.

Implementation notes:

    All ioctls in this patch have pointer to some kind of a structure as their
    third argument. That is the reason why corresponding definitions were added
    in 'linux-user/syscall_types.h'. All of these strcutures have some fields
    that are of type 'unsigned long'. That is the reason why separate target
    structures were defined in 'linux-user/syscall_defs.h'. Also, all of the
    structures have a field with type 'struct snd_timer_id' which is the reason
    why a separate target structure 'struct target_snd_timer_id' was also
    defined. The rest of the implementation was straightforward.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
---
 linux-user/ioctls.h        |  6 ++++++
 linux-user/syscall_defs.h  | 43 +++++++++++++++++++++++++++++++++++++++++++
 linux-user/syscall_types.h | 26 ++++++++++++++++++++++++++
 3 files changed, 75 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 9106773..989eb9b 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -453,6 +453,12 @@
   IOCTL(SNDRV_TIMER_IOCTL_NEXT_DEVICE, IOC_RW,
         MK_PTR(MK_STRUCT(STRUCT_snd_timer_id)))
   IOCTL(SNDRV_TIMER_IOCTL_TREAD, IOC_W, MK_PTR(TYPE_INT))
+  IOCTL(SNDRV_TIMER_IOCTL_GINFO, IOC_RW,
+        MK_PTR(MK_STRUCT(STRUCT_snd_timer_ginfo)))
+  IOCTL(SNDRV_TIMER_IOCTL_GPARAMS, IOC_W,
+        MK_PTR(MK_STRUCT(STRUCT_snd_timer_gparams)))
+  IOCTL(SNDRV_TIMER_IOCTL_GSTATUS, IOC_RW,
+        MK_PTR(MK_STRUCT(STRUCT_snd_timer_gstatus)))
 
   IOCTL(HDIO_GETGEO, IOC_R, MK_PTR(MK_STRUCT(STRUCT_hd_geometry)))
   IOCTL(HDIO_GET_UNMASKINTR, IOC_R, MK_PTR(TYPE_INT))
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 0971623..a675b92 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2425,11 +2425,54 @@ struct target_statfs64 {
 
 #define TARGET_SOUND_MIXER_WRITE_RECSRC	TARGET_MIXER_WRITE(SOUND_MIXER_RECSRC)
 
+struct target_snd_timer_id {
+    int dev_class;
+    int dev_sclass;
+    int card;
+    int device;
+    int subdevice;
+};
+
+struct target_snd_timer_ginfo {
+    struct target_snd_timer_id tid;
+    unsigned int flags;
+    int card;
+    unsigned char id[64];
+    unsigned char name[80];
+    abi_ulong reserved0;
+    abi_ulong resolution;
+    abi_ulong resolution_min;
+    abi_ulong resolution_max;
+    unsigned int clients;
+    unsigned char reserved[32];
+};
+
+struct target_snd_timer_gparams {
+    struct target_snd_timer_id tid;
+    abi_ulong period_num;
+    abi_ulong period_den;
+    unsigned char reserved[32];
+};
+
+struct target_snd_timer_gstatus {
+    struct target_snd_timer_id tid;
+    abi_ulong resolution;
+    abi_ulong resolution_num;
+    abi_ulong resolution_den;
+    unsigned char reserved[32];
+};
+
 /* alsa timer ioctls */
 #define TARGET_SNDRV_TIMER_IOCTL_PVERSION     TARGET_IOR('T', 0x00, int)
 #define TARGET_SNDRV_TIMER_IOCTL_NEXT_DEVICE  TARGET_IOWR('T', 0x01,           \
                                                 struct snd_timer_id)
 #define TARGET_SNDRV_TIMER_IOCTL_TREAD        TARGET_IOW('T', 0x02, int)
+#define TARGET_SNDRV_TIMER_IOCTL_GINFO        TARGET_IOWR('T', 0x03,           \
+                                                struct target_snd_timer_ginfo)
+#define TARGET_SNDRV_TIMER_IOCTL_GPARAMS      TARGET_IOW('T', 0x04,            \
+                                                struct target_snd_timer_gparams)
+#define TARGET_SNDRV_TIMER_IOCTL_GSTATUS      TARGET_IOWR('T', 0x05,           \
+                                                struct target_snd_timer_gstatus)
 
 /* vfat ioctls */
 #define TARGET_VFAT_IOCTL_READDIR_BOTH    TARGET_IORU('r', 1)
diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
index 2f4cd78..4e90716 100644
--- a/linux-user/syscall_types.h
+++ b/linux-user/syscall_types.h
@@ -90,6 +90,32 @@ STRUCT(snd_timer_id,
        TYPE_INT, /* device */
        TYPE_INT) /* subdevice */
 
+STRUCT(snd_timer_ginfo,
+       MK_STRUCT(STRUCT_snd_timer_id), /* tid */
+       TYPE_INT, /* flags */
+       TYPE_INT, /* card */
+       MK_ARRAY(TYPE_CHAR, 64), /* id */
+       MK_ARRAY(TYPE_CHAR, 80), /* name */
+       TYPE_ULONG, /* reserved0 */
+       TYPE_ULONG, /* resolution */
+       TYPE_ULONG, /* resolution_min */
+       TYPE_ULONG, /* resolution_max */
+       TYPE_INT, /* clients */
+       MK_ARRAY(TYPE_CHAR, 32)) /* reserved */
+
+STRUCT(snd_timer_gparams,
+       MK_STRUCT(STRUCT_snd_timer_id), /* tid */
+       TYPE_ULONG, /* period_num */
+       TYPE_ULONG, /* period_den */
+       MK_ARRAY(TYPE_CHAR, 32)) /* reserved */
+
+STRUCT(snd_timer_gstatus,
+       MK_STRUCT(STRUCT_snd_timer_id), /* tid */
+       TYPE_ULONG, /* resolution */
+       TYPE_ULONG, /* resolution_num */
+       TYPE_ULONG, /* resolution_den */
+       MK_ARRAY(TYPE_CHAR, 32)) /* reserved */
+
 /* loop device ioctls */
 STRUCT(loop_info,
        TYPE_INT,                 /* lo_number */
-- 
2.7.4


