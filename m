Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6A83C18A0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:48:30 +0200 (CEST)
Received: from localhost ([::1]:55266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Y8T-0000yf-Ko
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1XTn-00074c-2C
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:06:27 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1XTj-00081b-NC
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:06:26 -0400
Received: by mail-wr1-x434.google.com with SMTP id a13so8389778wrf.10
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C457WX7lvvGq8FmR+1cRntqxdlitWUX8bDm+o8qaTks=;
 b=V9QmzjPyIAOum5HRw8Hih3Xlf/egqkaQcO2Gf1L4BuUoffLQGx0yCcHvL0E8COq7EJ
 1NR1QzjV0t6SZ0uRBfCkGjj+dmYn8uw9VCe/64AMDFlb7m/qunJzMGDpnQKOfKbknhhC
 5lQUT15wuoWL7mqwQq6azpFJOoWtqNHAElQbt8RyBECpBQMWWlPZhGJgbmVXKwrHiDUE
 ngLvO+ki7qCF582P32qhdyahbi+xwtXZ2xLb24pKG/AtvmnUqTbN18OQaMaQeYcBpQbv
 lBfb7Kh0qA5khDoOFN1wQ8UsC8WrEze1jWC23IXrKUmsomNAUwLUVGJup4IEcG1RDuwr
 95Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=C457WX7lvvGq8FmR+1cRntqxdlitWUX8bDm+o8qaTks=;
 b=jtBi4TOfPpZjybWnLeM7zWPMG8hKZMcBb6G8s9APBUFVwLE0fEIHYkBSCECfwAYlUT
 qmwzP85jEFzcSIzRLzLYBw9P0ouPgJHm65S0vAruB9oMIxLnXX39lxjTxYPyV/Fg1TNm
 GmlHN164ziH5zuQaeEj3jzRymOVhhVGlO/Dht7wfv7wdR8Ykc8Z5H0AX0VQjZGJg56kg
 j73tQ8LVIA2n6/4mBOvF3gZNAWyCaLkCpBbv6gr81cvFHOTs1//TKJdURSKV2VMNUVEw
 DKmQ1ENL6eXV/OZaLNGvulUeNpdjGrJs+ulO3JDTWoOyI3IFR64RX8mHuw17cUiHGzsE
 Blig==
X-Gm-Message-State: AOAM531upF8PIZgEVmjd/R8L1Uo0qmgxaD+u6q7S/87RoSwJPVAz2Up3
 Pyyy/mwGbxUlwbStMaWQ2RfqOF9yn+g=
X-Google-Smtp-Source: ABdhPJzZJKHk/dA2chvMpQyohCMK+adcVIvFQmB3GOAkZgvK+ba/hyjFeKEmU5zero0S4+kGlnlUiw==
X-Received: by 2002:adf:fb8c:: with SMTP id a12mr36626272wrr.406.1625763981673; 
 Thu, 08 Jul 2021 10:06:21 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p15sm2379140wmq.43.2021.07.08.10.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:06:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/8] linux-user/mips: Move errno definitions to
 'target_errno_defs.h'
Date: Thu,  8 Jul 2021 19:05:48 +0200
Message-Id: <20210708170550.1846343-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708170550.1846343-1-f4bug@amsat.org>
References: <20210708170550.1846343-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/mips/target_errno_defs.h   | 215 ++++++++++++++++++++++++++
 linux-user/mips/target_syscall.h      | 211 -------------------------
 linux-user/mips64/target_errno_defs.h |   6 +-
 linux-user/mips64/target_syscall.h    | 211 -------------------------
 4 files changed, 220 insertions(+), 423 deletions(-)

diff --git a/linux-user/mips/target_errno_defs.h b/linux-user/mips/target_errno_defs.h
index daef95ea703..5685cda10db 100644
--- a/linux-user/mips/target_errno_defs.h
+++ b/linux-user/mips/target_errno_defs.h
@@ -3,4 +3,219 @@
 
 #include "../generic/target_errno_defs.h"
 
+/*
+ * Generic target errno overridden with definitions taken
+ * from asm-mips/errno.h
+ */
+
+#undef TARGET_EWOULDBLOCK
+#define TARGET_EWOULDBLOCK     TARGET_EAGAIN /* Operation would block */
+#undef TARGET_ENOMSG
+#define TARGET_ENOMSG          35      /* Identifier removed */
+#undef TARGET_EIDRM
+#define TARGET_EIDRM           36      /* Identifier removed */
+#undef TARGET_ECHRNG
+#define TARGET_ECHRNG          37      /* Channel number out of range */
+#undef TARGET_EL2NSYNC
+#define TARGET_EL2NSYNC        38      /* Level 2 not synchronized */
+#undef TARGET_EL3HLT
+#define TARGET_EL3HLT          39      /* Level 3 halted */
+#undef TARGET_EL3RST
+#define TARGET_EL3RST          40      /* Level 3 reset */
+#undef TARGET_ELNRNG
+#define TARGET_ELNRNG          41      /* Link number out of range */
+#undef TARGET_EUNATCH
+#define TARGET_EUNATCH         42      /* Protocol driver not attached */
+#undef TARGET_ENOCSI
+#define TARGET_ENOCSI          43      /* No CSI structure available */
+#undef TARGET_EL2HLT
+#define TARGET_EL2HLT          44      /* Level 2 halted */
+#undef TARGET_EDEADLK
+#define TARGET_EDEADLK         45      /* Resource deadlock would occur */
+#undef TARGET_ENOLCK
+#define TARGET_ENOLCK          46      /* No record locks available */
+#undef TARGET_EBADE
+#define TARGET_EBADE           50      /* Invalid exchange */
+#undef TARGET_EBADR
+#define TARGET_EBADR           51      /* Invalid request descriptor */
+#undef TARGET_EXFULL
+#define TARGET_EXFULL          52      /* TARGET_Exchange full */
+#undef TARGET_ENOANO
+#define TARGET_ENOANO          53      /* No anode */
+#undef TARGET_EBADRQC
+#define TARGET_EBADRQC         54      /* Invalid request code */
+#undef TARGET_EBADSLT
+#define TARGET_EBADSLT         55      /* Invalid slot */
+#undef TARGET_EDEADLOCK
+#define TARGET_EDEADLOCK       56      /* File locking deadlock error */
+#undef TARGET_EBFONT
+#define TARGET_EBFONT          59      /* Bad font file format */
+#undef TARGET_ENOSTR
+#define TARGET_ENOSTR          60      /* Device not a stream */
+#undef TARGET_ENODATA
+#define TARGET_ENODATA         61      /* No data available */
+#undef TARGET_ETIME
+#define TARGET_ETIME           62      /* Timer expired */
+#undef TARGET_ENOSR
+#define TARGET_ENOSR           63      /* Out of streams resources */
+#undef TARGET_ENONET
+#define TARGET_ENONET          64      /* Machine is not on the network */
+#undef TARGET_ENOPKG
+#define TARGET_ENOPKG          65      /* Package not installed */
+#undef TARGET_EREMOTE
+#define TARGET_EREMOTE         66      /* Object is remote */
+#undef TARGET_ENOLINK
+#define TARGET_ENOLINK         67      /* Link has been severed */
+#undef TARGET_EADV
+#define TARGET_EADV            68      /* Advertise error */
+#undef TARGET_ESRMNT
+#define TARGET_ESRMNT          69      /* Srmount error */
+#undef TARGET_ECOMM
+#define TARGET_ECOMM           70      /* Communication error on send */
+#undef TARGET_EPROTO
+#define TARGET_EPROTO          71      /* Protocol error */
+#undef TARGET_EDOTDOT
+#define TARGET_EDOTDOT         73      /* RFS specific error */
+#undef TARGET_EMULTIHOP
+#define TARGET_EMULTIHOP       74      /* Multihop attempted */
+#undef TARGET_EBADMSG
+#define TARGET_EBADMSG         77      /* Not a data message */
+#undef TARGET_ENAMETOOLONG
+#define TARGET_ENAMETOOLONG    78      /* File name too long */
+#undef TARGET_EOVERFLOW
+#define TARGET_EOVERFLOW       79      /* Value too large for defined data type */
+#undef TARGET_ENOTUNIQ
+#define TARGET_ENOTUNIQ        80      /* Name not unique on network */
+#undef TARGET_EBADFD
+#define TARGET_EBADFD          81      /* File descriptor in bad state */
+#undef TARGET_EREMCHG
+#define TARGET_EREMCHG         82      /* Remote address changed */
+#undef TARGET_ELIBACC
+#define TARGET_ELIBACC         83      /* Can not access a needed shared library */
+#undef TARGET_ELIBBAD
+#define TARGET_ELIBBAD         84      /* Accessing a corrupted shared library */
+#undef TARGET_ELIBSCN
+#define TARGET_ELIBSCN         85      /* .lib section in a.out corrupted */
+#undef TARGET_ELIBMAX
+#define TARGET_ELIBMAX         86      /* Attempting to link in too many shared libraries */
+#undef TARGET_ELIBEXEC
+#define TARGET_ELIBEXEC        87      /* Cannot exec a shared library directly */
+#undef TARGET_EILSEQ
+#define TARGET_EILSEQ          88      /* Illegal byte sequence */
+#undef TARGET_ENOSYS
+#define TARGET_ENOSYS          89      /* Function not implemented */
+#undef TARGET_ELOOP
+#define TARGET_ELOOP           90      /* Too many symbolic links encountered */
+#undef TARGET_ERESTART
+#define TARGET_ERESTART        91      /* Interrupted system call should be restarted */
+#undef TARGET_ESTRPIPE
+#define TARGET_ESTRPIPE        92      /* Streams pipe error */
+#undef TARGET_ENOTEMPTY
+#define TARGET_ENOTEMPTY       93      /* Directory not empty */
+#undef TARGET_EUSERS
+#define TARGET_EUSERS          94      /* Too many users */
+#undef TARGET_ENOTSOCK
+#define TARGET_ENOTSOCK        95      /* Socket operation on non-socket */
+#undef TARGET_EDESTADDRREQ
+#define TARGET_EDESTADDRREQ    96      /* Destination address required */
+#undef TARGET_EMSGSIZE
+#define TARGET_EMSGSIZE        97      /* Message too long */
+#undef TARGET_EPROTOTYPE
+#define TARGET_EPROTOTYPE      98      /* Protocol wrong type for socket */
+#undef TARGET_ENOPROTOOPT
+#define TARGET_ENOPROTOOPT     99      /* Protocol not available */
+#undef TARGET_EPROTONOSUPPORT
+#define TARGET_EPROTONOSUPPORT 120     /* Protocol not supported */
+#undef TARGET_ESOCKTNOSUPPORT
+#define TARGET_ESOCKTNOSUPPORT 121     /* Socket type not supported */
+#undef TARGET_EOPNOTSUPP
+#define TARGET_EOPNOTSUPP      122     /* Operation not supported on transport endpoint */
+#undef TARGET_EPFNOSUPPORT
+#define TARGET_EPFNOSUPPORT    123     /* Protocol family not supported */
+#undef TARGET_EAFNOSUPPORT
+#define TARGET_EAFNOSUPPORT    124     /* Address family not supported by protocol */
+#undef TARGET_EADDRINUSE
+#define TARGET_EADDRINUSE      125     /* Address already in use */
+#undef TARGET_EADDRNOTAVAIL
+#define TARGET_EADDRNOTAVAIL   126     /* Cannot assign requested address */
+#undef TARGET_ENETDOWN
+#define TARGET_ENETDOWN        127     /* Network is down */
+#undef TARGET_ENETUNREACH
+#define TARGET_ENETUNREACH     128     /* Network is unreachable */
+#undef TARGET_ENETRESET
+#define TARGET_ENETRESET       129     /* Network dropped connection because of reset */
+#undef TARGET_ECONNABORTED
+#define TARGET_ECONNABORTED    130     /* Software caused connection abort */
+#undef TARGET_ECONNRESET
+#define TARGET_ECONNRESET      131     /* Connection reset by peer */
+#undef TARGET_ENOBUFS
+#define TARGET_ENOBUFS         132     /* No buffer space available */
+#undef TARGET_EISCONN
+#define TARGET_EISCONN         133     /* Transport endpoint is already connected */
+#undef TARGET_ENOTCONN
+#define TARGET_ENOTCONN        134     /* Transport endpoint is not connected */
+#undef TARGET_EUCLEAN
+#define TARGET_EUCLEAN         135     /* Structure needs cleaning */
+#undef TARGET_ENOTNAM
+#define TARGET_ENOTNAM         137     /* Not a XENIX named type file */
+#undef TARGET_ENAVAIL
+#define TARGET_ENAVAIL         138     /* No XENIX semaphores available */
+#undef TARGET_EISNAM
+#define TARGET_EISNAM          139     /* Is a named type file */
+#undef TARGET_EREMOTEIO
+#define TARGET_EREMOTEIO       140     /* Remote I/O error */
+#undef TARGET_EINIT
+#define TARGET_EINIT           141     /* Reserved */
+#undef TARGET_EREMDEV
+#define TARGET_EREMDEV         142     /* TARGET_Error 142 */
+#undef TARGET_ESHUTDOWN
+#define TARGET_ESHUTDOWN       143     /* Cannot send after transport endpoint shutdown */
+#undef TARGET_ETOOMANYREFS
+#define TARGET_ETOOMANYREFS    144     /* Too many references: cannot splice */
+#undef TARGET_ETIMEDOUT
+#define TARGET_ETIMEDOUT       145     /* Connection timed out */
+#undef TARGET_ECONNREFUSED
+#define TARGET_ECONNREFUSED    146     /* Connection refused */
+#undef TARGET_EHOSTDOWN
+#define TARGET_EHOSTDOWN       147     /* Host is down */
+#undef TARGET_EHOSTUNREACH
+#define TARGET_EHOSTUNREACH    148     /* No route to host */
+#undef TARGET_EALREADY
+#define TARGET_EALREADY        149     /* Operation already in progress */
+#undef TARGET_EINPROGRESS
+#define TARGET_EINPROGRESS     150     /* Operation now in progress */
+#undef TARGET_ESTALE
+#define TARGET_ESTALE          151     /* Stale NFS file handle */
+#undef TARGET_ECANCELED
+#define TARGET_ECANCELED       158     /* AIO operation canceled */
+/*
+ * These error are Linux extensions.
+ */
+#undef TARGET_ENOMEDIUM
+#define TARGET_ENOMEDIUM       159     /* No medium found */
+#undef TARGET_EMEDIUMTYPE
+#define TARGET_EMEDIUMTYPE     160     /* Wrong medium type */
+#undef TARGET_ENOKEY
+#define TARGET_ENOKEY          161     /* Required key not available */
+#undef TARGET_EKEYEXPIRED
+#define TARGET_EKEYEXPIRED     162     /* Key has expired */
+#undef TARGET_EKEYREVOKED
+#define TARGET_EKEYREVOKED     163     /* Key has been revoked */
+#undef TARGET_EKEYREJECTED
+#define TARGET_EKEYREJECTED    164     /* Key was rejected by service */
+
+/* for robust mutexes */
+#undef TARGET_EOWNERDEAD
+#define TARGET_EOWNERDEAD      165     /* Owner died */
+#undef TARGET_ENOTRECOVERABLE
+#define TARGET_ENOTRECOVERABLE 166     /* State not recoverable */
+
+#undef TARGET_ERFKILL
+#define TARGET_ERFKILL         167
+#undef TARGET_EHWPOISON
+#define TARGET_EHWPOISON       168
+
+#undef TARGET_EDQUOT
+#define TARGET_EDQUOT          1133    /* Quota exceeded */
+
 #endif
diff --git a/linux-user/mips/target_syscall.h b/linux-user/mips/target_syscall.h
index 3e558fdb4b4..f59057493a3 100644
--- a/linux-user/mips/target_syscall.h
+++ b/linux-user/mips/target_syscall.h
@@ -20,217 +20,6 @@ struct target_pt_regs {
 	abi_ulong cp0_epc;
 };
 
-/* Target errno definitions taken from asm-mips/errno.h */
-#undef TARGET_EWOULDBLOCK
-#define TARGET_EWOULDBLOCK     TARGET_EAGAIN /* Operation would block */
-#undef TARGET_ENOMSG
-#define TARGET_ENOMSG          35      /* Identifier removed */
-#undef TARGET_EIDRM
-#define TARGET_EIDRM           36      /* Identifier removed */
-#undef TARGET_ECHRNG
-#define TARGET_ECHRNG          37      /* Channel number out of range */
-#undef TARGET_EL2NSYNC
-#define TARGET_EL2NSYNC        38      /* Level 2 not synchronized */
-#undef TARGET_EL3HLT
-#define TARGET_EL3HLT          39      /* Level 3 halted */
-#undef TARGET_EL3RST
-#define TARGET_EL3RST          40      /* Level 3 reset */
-#undef TARGET_ELNRNG
-#define TARGET_ELNRNG          41      /* Link number out of range */
-#undef TARGET_EUNATCH
-#define TARGET_EUNATCH         42      /* Protocol driver not attached */
-#undef TARGET_ENOCSI
-#define TARGET_ENOCSI          43      /* No CSI structure available */
-#undef TARGET_EL2HLT
-#define TARGET_EL2HLT          44      /* Level 2 halted */
-#undef TARGET_EDEADLK
-#define TARGET_EDEADLK         45      /* Resource deadlock would occur */
-#undef TARGET_ENOLCK
-#define TARGET_ENOLCK          46      /* No record locks available */
-#undef TARGET_EBADE
-#define TARGET_EBADE           50      /* Invalid exchange */
-#undef TARGET_EBADR
-#define TARGET_EBADR           51      /* Invalid request descriptor */
-#undef TARGET_EXFULL
-#define TARGET_EXFULL          52      /* TARGET_Exchange full */
-#undef TARGET_ENOANO
-#define TARGET_ENOANO          53      /* No anode */
-#undef TARGET_EBADRQC
-#define TARGET_EBADRQC         54      /* Invalid request code */
-#undef TARGET_EBADSLT
-#define TARGET_EBADSLT         55      /* Invalid slot */
-#undef TARGET_EDEADLOCK
-#define TARGET_EDEADLOCK       56      /* File locking deadlock error */
-#undef TARGET_EBFONT
-#define TARGET_EBFONT          59      /* Bad font file format */
-#undef TARGET_ENOSTR
-#define TARGET_ENOSTR          60      /* Device not a stream */
-#undef TARGET_ENODATA
-#define TARGET_ENODATA         61      /* No data available */
-#undef TARGET_ETIME
-#define TARGET_ETIME           62      /* Timer expired */
-#undef TARGET_ENOSR
-#define TARGET_ENOSR           63      /* Out of streams resources */
-#undef TARGET_ENONET
-#define TARGET_ENONET          64      /* Machine is not on the network */
-#undef TARGET_ENOPKG
-#define TARGET_ENOPKG          65      /* Package not installed */
-#undef TARGET_EREMOTE
-#define TARGET_EREMOTE         66      /* Object is remote */
-#undef TARGET_ENOLINK
-#define TARGET_ENOLINK         67      /* Link has been severed */
-#undef TARGET_EADV
-#define TARGET_EADV            68      /* Advertise error */
-#undef TARGET_ESRMNT
-#define TARGET_ESRMNT          69      /* Srmount error */
-#undef TARGET_ECOMM
-#define TARGET_ECOMM           70      /* Communication error on send */
-#undef TARGET_EPROTO
-#define TARGET_EPROTO          71      /* Protocol error */
-#undef TARGET_EDOTDOT
-#define TARGET_EDOTDOT         73      /* RFS specific error */
-#undef TARGET_EMULTIHOP
-#define TARGET_EMULTIHOP       74      /* Multihop attempted */
-#undef TARGET_EBADMSG
-#define TARGET_EBADMSG         77      /* Not a data message */
-#undef TARGET_ENAMETOOLONG
-#define TARGET_ENAMETOOLONG    78      /* File name too long */
-#undef TARGET_EOVERFLOW
-#define TARGET_EOVERFLOW       79      /* Value too large for defined data type */
-#undef TARGET_ENOTUNIQ
-#define TARGET_ENOTUNIQ        80      /* Name not unique on network */
-#undef TARGET_EBADFD
-#define TARGET_EBADFD          81      /* File descriptor in bad state */
-#undef TARGET_EREMCHG
-#define TARGET_EREMCHG         82      /* Remote address changed */
-#undef TARGET_ELIBACC
-#define TARGET_ELIBACC         83      /* Can not access a needed shared library */
-#undef TARGET_ELIBBAD
-#define TARGET_ELIBBAD         84      /* Accessing a corrupted shared library */
-#undef TARGET_ELIBSCN
-#define TARGET_ELIBSCN         85      /* .lib section in a.out corrupted */
-#undef TARGET_ELIBMAX
-#define TARGET_ELIBMAX         86      /* Attempting to link in too many shared libraries */
-#undef TARGET_ELIBEXEC
-#define TARGET_ELIBEXEC        87      /* Cannot exec a shared library directly */
-#undef TARGET_EILSEQ
-#define TARGET_EILSEQ          88      /* Illegal byte sequence */
-#undef TARGET_ENOSYS
-#define TARGET_ENOSYS          89      /* Function not implemented */
-#undef TARGET_ELOOP
-#define TARGET_ELOOP           90      /* Too many symbolic links encountered */
-#undef TARGET_ERESTART
-#define TARGET_ERESTART        91      /* Interrupted system call should be restarted */
-#undef TARGET_ESTRPIPE
-#define TARGET_ESTRPIPE        92      /* Streams pipe error */
-#undef TARGET_ENOTEMPTY
-#define TARGET_ENOTEMPTY       93      /* Directory not empty */
-#undef TARGET_EUSERS
-#define TARGET_EUSERS          94      /* Too many users */
-#undef TARGET_ENOTSOCK
-#define TARGET_ENOTSOCK        95      /* Socket operation on non-socket */
-#undef TARGET_EDESTADDRREQ
-#define TARGET_EDESTADDRREQ    96      /* Destination address required */
-#undef TARGET_EMSGSIZE
-#define TARGET_EMSGSIZE        97      /* Message too long */
-#undef TARGET_EPROTOTYPE
-#define TARGET_EPROTOTYPE      98      /* Protocol wrong type for socket */
-#undef TARGET_ENOPROTOOPT
-#define TARGET_ENOPROTOOPT     99      /* Protocol not available */
-#undef TARGET_EPROTONOSUPPORT
-#define TARGET_EPROTONOSUPPORT 120     /* Protocol not supported */
-#undef TARGET_ESOCKTNOSUPPORT
-#define TARGET_ESOCKTNOSUPPORT 121     /* Socket type not supported */
-#undef TARGET_EOPNOTSUPP
-#define TARGET_EOPNOTSUPP      122     /* Operation not supported on transport endpoint */
-#undef TARGET_EPFNOSUPPORT
-#define TARGET_EPFNOSUPPORT    123     /* Protocol family not supported */
-#undef TARGET_EAFNOSUPPORT
-#define TARGET_EAFNOSUPPORT    124     /* Address family not supported by protocol */
-#undef TARGET_EADDRINUSE
-#define TARGET_EADDRINUSE      125     /* Address already in use */
-#undef TARGET_EADDRNOTAVAIL
-#define TARGET_EADDRNOTAVAIL   126     /* Cannot assign requested address */
-#undef TARGET_ENETDOWN
-#define TARGET_ENETDOWN        127     /* Network is down */
-#undef TARGET_ENETUNREACH
-#define TARGET_ENETUNREACH     128     /* Network is unreachable */
-#undef TARGET_ENETRESET
-#define TARGET_ENETRESET       129     /* Network dropped connection because of reset */
-#undef TARGET_ECONNABORTED
-#define TARGET_ECONNABORTED    130     /* Software caused connection abort */
-#undef TARGET_ECONNRESET
-#define TARGET_ECONNRESET      131     /* Connection reset by peer */
-#undef TARGET_ENOBUFS
-#define TARGET_ENOBUFS         132     /* No buffer space available */
-#undef TARGET_EISCONN
-#define TARGET_EISCONN         133     /* Transport endpoint is already connected */
-#undef TARGET_ENOTCONN
-#define TARGET_ENOTCONN        134     /* Transport endpoint is not connected */
-#undef TARGET_EUCLEAN
-#define TARGET_EUCLEAN         135     /* Structure needs cleaning */
-#undef TARGET_ENOTNAM
-#define TARGET_ENOTNAM         137     /* Not a XENIX named type file */
-#undef TARGET_ENAVAIL
-#define TARGET_ENAVAIL         138     /* No XENIX semaphores available */
-#undef TARGET_EISNAM
-#define TARGET_EISNAM          139     /* Is a named type file */
-#undef TARGET_EREMOTEIO
-#define TARGET_EREMOTEIO       140     /* Remote I/O error */
-#undef TARGET_EINIT
-#define TARGET_EINIT           141     /* Reserved */
-#undef TARGET_EREMDEV
-#define TARGET_EREMDEV         142     /* TARGET_Error 142 */
-#undef TARGET_ESHUTDOWN
-#define TARGET_ESHUTDOWN       143     /* Cannot send after transport endpoint shutdown */
-#undef TARGET_ETOOMANYREFS
-#define TARGET_ETOOMANYREFS    144     /* Too many references: cannot splice */
-#undef TARGET_ETIMEDOUT
-#define TARGET_ETIMEDOUT       145     /* Connection timed out */
-#undef TARGET_ECONNREFUSED
-#define TARGET_ECONNREFUSED    146     /* Connection refused */
-#undef TARGET_EHOSTDOWN
-#define TARGET_EHOSTDOWN       147     /* Host is down */
-#undef TARGET_EHOSTUNREACH
-#define TARGET_EHOSTUNREACH    148     /* No route to host */
-#undef TARGET_EALREADY
-#define TARGET_EALREADY        149     /* Operation already in progress */
-#undef TARGET_EINPROGRESS
-#define TARGET_EINPROGRESS     150     /* Operation now in progress */
-#undef TARGET_ESTALE
-#define TARGET_ESTALE          151     /* Stale NFS file handle */
-#undef TARGET_ECANCELED
-#define TARGET_ECANCELED       158     /* AIO operation canceled */
-/*
- * These error are Linux extensions.
- */
-#undef TARGET_ENOMEDIUM
-#define TARGET_ENOMEDIUM       159     /* No medium found */
-#undef TARGET_EMEDIUMTYPE
-#define TARGET_EMEDIUMTYPE     160     /* Wrong medium type */
-#undef TARGET_ENOKEY
-#define TARGET_ENOKEY          161     /* Required key not available */
-#undef TARGET_EKEYEXPIRED
-#define TARGET_EKEYEXPIRED     162     /* Key has expired */
-#undef TARGET_EKEYREVOKED
-#define TARGET_EKEYREVOKED     163     /* Key has been revoked */
-#undef TARGET_EKEYREJECTED
-#define TARGET_EKEYREJECTED    164     /* Key was rejected by service */
-
-/* for robust mutexes */
-#undef TARGET_EOWNERDEAD
-#define TARGET_EOWNERDEAD      165     /* Owner died */
-#undef TARGET_ENOTRECOVERABLE
-#define TARGET_ENOTRECOVERABLE 166     /* State not recoverable */
-
-#undef TARGET_ERFKILL
-#define TARGET_ERFKILL         167
-#undef TARGET_EHWPOISON
-#define TARGET_EHWPOISON       168
-
-#undef TARGET_EDQUOT
-#define TARGET_EDQUOT          1133    /* Quota exceeded */
-
 #define UNAME_MACHINE "mips"
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
diff --git a/linux-user/mips64/target_errno_defs.h b/linux-user/mips64/target_errno_defs.h
index 82b0a704f62..fb7b4628a9b 100644
--- a/linux-user/mips64/target_errno_defs.h
+++ b/linux-user/mips64/target_errno_defs.h
@@ -1,6 +1,10 @@
 #ifndef MIPS64_TARGET_ERRNO_DEFS_H
 #define MIPS64_TARGET_ERRNO_DEFS_H
 
-#include "../generic/target_errno_defs.h"
+/*
+ * The mips64 target uses errno definitions taken from asm-mips/errno.h
+ * so directly use the mips target errno definitions.
+ */
+#include "../mips/target_errno_defs.h"
 
 #endif
diff --git a/linux-user/mips64/target_syscall.h b/linux-user/mips64/target_syscall.h
index c54374c5a29..cd1e1b49691 100644
--- a/linux-user/mips64/target_syscall.h
+++ b/linux-user/mips64/target_syscall.h
@@ -17,217 +17,6 @@ struct target_pt_regs {
         target_ulong cp0_epc;
 };
 
-/* Target errno definitions taken from asm-mips/errno.h */
-#undef TARGET_EWOULDBLOCK
-#define TARGET_EWOULDBLOCK     TARGET_EAGAIN /* Operation would block */
-#undef TARGET_ENOMSG
-#define TARGET_ENOMSG          35      /* Identifier removed */
-#undef TARGET_EIDRM
-#define TARGET_EIDRM           36      /* Identifier removed */
-#undef TARGET_ECHRNG
-#define TARGET_ECHRNG          37      /* Channel number out of range */
-#undef TARGET_EL2NSYNC
-#define TARGET_EL2NSYNC        38      /* Level 2 not synchronized */
-#undef TARGET_EL3HLT
-#define TARGET_EL3HLT          39      /* Level 3 halted */
-#undef TARGET_EL3RST
-#define TARGET_EL3RST          40      /* Level 3 reset */
-#undef TARGET_ELNRNG
-#define TARGET_ELNRNG          41      /* Link number out of range */
-#undef TARGET_EUNATCH
-#define TARGET_EUNATCH         42      /* Protocol driver not attached */
-#undef TARGET_ENOCSI
-#define TARGET_ENOCSI          43      /* No CSI structure available */
-#undef TARGET_EL2HLT
-#define TARGET_EL2HLT          44      /* Level 2 halted */
-#undef TARGET_EDEADLK
-#define TARGET_EDEADLK         45      /* Resource deadlock would occur */
-#undef TARGET_ENOLCK
-#define TARGET_ENOLCK          46      /* No record locks available */
-#undef TARGET_EBADE
-#define TARGET_EBADE           50      /* Invalid exchange */
-#undef TARGET_EBADR
-#define TARGET_EBADR           51      /* Invalid request descriptor */
-#undef TARGET_EXFULL
-#define TARGET_EXFULL          52      /* TARGET_Exchange full */
-#undef TARGET_ENOANO
-#define TARGET_ENOANO          53      /* No anode */
-#undef TARGET_EBADRQC
-#define TARGET_EBADRQC         54      /* Invalid request code */
-#undef TARGET_EBADSLT
-#define TARGET_EBADSLT         55      /* Invalid slot */
-#undef TARGET_EDEADLOCK
-#define TARGET_EDEADLOCK       56      /* File locking deadlock error */
-#undef TARGET_EBFONT
-#define TARGET_EBFONT          59      /* Bad font file format */
-#undef TARGET_ENOSTR
-#define TARGET_ENOSTR          60      /* Device not a stream */
-#undef TARGET_ENODATA
-#define TARGET_ENODATA         61      /* No data available */
-#undef TARGET_ETIME
-#define TARGET_ETIME           62      /* Timer expired */
-#undef TARGET_ENOSR
-#define TARGET_ENOSR           63      /* Out of streams resources */
-#undef TARGET_ENONET
-#define TARGET_ENONET          64      /* Machine is not on the network */
-#undef TARGET_ENOPKG
-#define TARGET_ENOPKG          65      /* Package not installed */
-#undef TARGET_EREMOTE
-#define TARGET_EREMOTE         66      /* Object is remote */
-#undef TARGET_ENOLINK
-#define TARGET_ENOLINK         67      /* Link has been severed */
-#undef TARGET_EADV
-#define TARGET_EADV            68      /* Advertise error */
-#undef TARGET_ESRMNT
-#define TARGET_ESRMNT          69      /* Srmount error */
-#undef TARGET_ECOMM
-#define TARGET_ECOMM           70      /* Communication error on send */
-#undef TARGET_EPROTO
-#define TARGET_EPROTO          71      /* Protocol error */
-#undef TARGET_EDOTDOT
-#define TARGET_EDOTDOT         73      /* RFS specific error */
-#undef TARGET_EMULTIHOP
-#define TARGET_EMULTIHOP       74      /* Multihop attempted */
-#undef TARGET_EBADMSG
-#define TARGET_EBADMSG         77      /* Not a data message */
-#undef TARGET_ENAMETOOLONG
-#define TARGET_ENAMETOOLONG    78      /* File name too long */
-#undef TARGET_EOVERFLOW
-#define TARGET_EOVERFLOW       79      /* Value too large for defined data type */
-#undef TARGET_ENOTUNIQ
-#define TARGET_ENOTUNIQ        80      /* Name not unique on network */
-#undef TARGET_EBADFD
-#define TARGET_EBADFD          81      /* File descriptor in bad state */
-#undef TARGET_EREMCHG
-#define TARGET_EREMCHG         82      /* Remote address changed */
-#undef TARGET_ELIBACC
-#define TARGET_ELIBACC         83      /* Can not access a needed shared library */
-#undef TARGET_ELIBBAD
-#define TARGET_ELIBBAD         84      /* Accessing a corrupted shared library */
-#undef TARGET_ELIBSCN
-#define TARGET_ELIBSCN         85      /* .lib section in a.out corrupted */
-#undef TARGET_ELIBMAX
-#define TARGET_ELIBMAX         86      /* Attempting to link in too many shared libraries */
-#undef TARGET_ELIBEXEC
-#define TARGET_ELIBEXEC        87      /* Cannot exec a shared library directly */
-#undef TARGET_EILSEQ
-#define TARGET_EILSEQ          88      /* Illegal byte sequence */
-#undef TARGET_ENOSYS
-#define TARGET_ENOSYS          89      /* Function not implemented */
-#undef TARGET_ELOOP
-#define TARGET_ELOOP           90      /* Too many symbolic links encountered */
-#undef TARGET_ERESTART
-#define TARGET_ERESTART        91      /* Interrupted system call should be restarted */
-#undef TARGET_ESTRPIPE
-#define TARGET_ESTRPIPE        92      /* Streams pipe error */
-#undef TARGET_ENOTEMPTY
-#define TARGET_ENOTEMPTY       93      /* Directory not empty */
-#undef TARGET_EUSERS
-#define TARGET_EUSERS          94      /* Too many users */
-#undef TARGET_ENOTSOCK
-#define TARGET_ENOTSOCK        95      /* Socket operation on non-socket */
-#undef TARGET_EDESTADDRREQ
-#define TARGET_EDESTADDRREQ    96      /* Destination address required */
-#undef TARGET_EMSGSIZE
-#define TARGET_EMSGSIZE        97      /* Message too long */
-#undef TARGET_EPROTOTYPE
-#define TARGET_EPROTOTYPE      98      /* Protocol wrong type for socket */
-#undef TARGET_ENOPROTOOPT
-#define TARGET_ENOPROTOOPT     99      /* Protocol not available */
-#undef TARGET_EPROTONOSUPPORT
-#define TARGET_EPROTONOSUPPORT 120     /* Protocol not supported */
-#undef TARGET_ESOCKTNOSUPPORT
-#define TARGET_ESOCKTNOSUPPORT 121     /* Socket type not supported */
-#undef TARGET_EOPNOTSUPP
-#define TARGET_EOPNOTSUPP      122     /* Operation not supported on transport endpoint */
-#undef TARGET_EPFNOSUPPORT
-#define TARGET_EPFNOSUPPORT    123     /* Protocol family not supported */
-#undef TARGET_EAFNOSUPPORT
-#define TARGET_EAFNOSUPPORT    124     /* Address family not supported by protocol */
-#undef TARGET_EADDRINUSE
-#define TARGET_EADDRINUSE      125     /* Address already in use */
-#undef TARGET_EADDRNOTAVAIL
-#define TARGET_EADDRNOTAVAIL   126     /* Cannot assign requested address */
-#undef TARGET_ENETDOWN
-#define TARGET_ENETDOWN        127     /* Network is down */
-#undef TARGET_ENETUNREACH
-#define TARGET_ENETUNREACH     128     /* Network is unreachable */
-#undef TARGET_ENETRESET
-#define TARGET_ENETRESET       129     /* Network dropped connection because of reset */
-#undef TARGET_ECONNABORTED
-#define TARGET_ECONNABORTED    130     /* Software caused connection abort */
-#undef TARGET_ECONNRESET
-#define TARGET_ECONNRESET      131     /* Connection reset by peer */
-#undef TARGET_ENOBUFS
-#define TARGET_ENOBUFS         132     /* No buffer space available */
-#undef TARGET_EISCONN
-#define TARGET_EISCONN         133     /* Transport endpoint is already connected */
-#undef TARGET_ENOTCONN
-#define TARGET_ENOTCONN        134     /* Transport endpoint is not connected */
-#undef TARGET_EUCLEAN
-#define TARGET_EUCLEAN         135     /* Structure needs cleaning */
-#undef TARGET_ENOTNAM
-#define TARGET_ENOTNAM         137     /* Not a XENIX named type file */
-#undef TARGET_ENAVAIL
-#define TARGET_ENAVAIL         138     /* No XENIX semaphores available */
-#undef TARGET_EISNAM
-#define TARGET_EISNAM          139     /* Is a named type file */
-#undef TARGET_EREMOTEIO
-#define TARGET_EREMOTEIO       140     /* Remote I/O error */
-#undef TARGET_EINIT
-#define TARGET_EINIT           141     /* Reserved */
-#undef TARGET_EREMDEV
-#define TARGET_EREMDEV         142     /* TARGET_Error 142 */
-#undef TARGET_ESHUTDOWN
-#define TARGET_ESHUTDOWN       143     /* Cannot send after transport endpoint shutdown */
-#undef TARGET_ETOOMANYREFS
-#define TARGET_ETOOMANYREFS    144     /* Too many references: cannot splice */
-#undef TARGET_ETIMEDOUT
-#define TARGET_ETIMEDOUT       145     /* Connection timed out */
-#undef TARGET_ECONNREFUSED
-#define TARGET_ECONNREFUSED    146     /* Connection refused */
-#undef TARGET_EHOSTDOWN
-#define TARGET_EHOSTDOWN       147     /* Host is down */
-#undef TARGET_EHOSTUNREACH
-#define TARGET_EHOSTUNREACH    148     /* No route to host */
-#undef TARGET_EALREADY
-#define TARGET_EALREADY        149     /* Operation already in progress */
-#undef TARGET_EINPROGRESS
-#define TARGET_EINPROGRESS     150     /* Operation now in progress */
-#undef TARGET_ESTALE
-#define TARGET_ESTALE          151     /* Stale NFS file handle */
-#undef TARGET_ECANCELED
-#define TARGET_ECANCELED       158     /* AIO operation canceled */
-/*
- * These error are Linux extensions.
- */
-#undef TARGET_ENOMEDIUM
-#define TARGET_ENOMEDIUM       159     /* No medium found */
-#undef TARGET_EMEDIUMTYPE
-#define TARGET_EMEDIUMTYPE     160     /* Wrong medium type */
-#undef TARGET_ENOKEY
-#define TARGET_ENOKEY          161     /* Required key not available */
-#undef TARGET_EKEYEXPIRED
-#define TARGET_EKEYEXPIRED     162     /* Key has expired */
-#undef TARGET_EKEYREVOKED
-#define TARGET_EKEYREVOKED     163     /* Key has been revoked */
-#undef TARGET_EKEYREJECTED
-#define TARGET_EKEYREJECTED    164     /* Key was rejected by service */
-
-/* for robust mutexes */
-#undef TARGET_EOWNERDEAD
-#define TARGET_EOWNERDEAD      165     /* Owner died */
-#undef TARGET_ENOTRECOVERABLE
-#define TARGET_ENOTRECOVERABLE 166     /* State not recoverable */
-
-#undef TARGET_ERFKILL
-#define TARGET_ERFKILL         167
-#undef TARGET_EHWPOISON
-#define TARGET_EHWPOISON       168
-
-#undef TARGET_EDQUOT
-#define TARGET_EDQUOT          1133    /* Quota exceeded */
-
 #define UNAME_MACHINE "mips64"
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
-- 
2.31.1


