Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FBD3C1506
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:19:29 +0200 (CEST)
Received: from localhost ([::1]:38318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1UsD-0005OU-1W
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1Ukw-0000tL-Rj
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:11:58 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1Ukq-0002cQ-Ny
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:11:55 -0400
Received: by mail-wm1-x336.google.com with SMTP id k32so981347wms.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TRMx4f2lE8zUR9/ZkD2gmMwoklxX7JRnD36JRrJ1OuI=;
 b=tv6FNXeWGS0bc/RZia2VLhHs2OG2XNQhj0VVlKu+wq1woi/pyRB/+9KgsKFmG6fi5q
 f57ckeNU6n4Uug3uCRD2Ojwee71chZZWNhO34ykwtR90vOSitTpTkN+5bxj8f+0xAMSk
 9vWyUzzStWm/GyjPuUAu3YhxtWhZSzuVRT/uBYJtkfmrnpExnqYxQMtqnoj5RHnCO6ka
 xKPSlPkQhean6S7sFPwWsu8jV7HpQgDUN6Be6ptsLUfiCamCrtTuZn7HLEZJRGbBtyYz
 zb0tKCEZsZpE6WSMq/c0urI9v1dOgAQDgl785v/GIJkwL9sTST0sIGpNlb1IdtWyBOQF
 9jow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TRMx4f2lE8zUR9/ZkD2gmMwoklxX7JRnD36JRrJ1OuI=;
 b=fNCpabblVAqJ3MVgw4FyfhWLQpWabB4AXE7xSi9hHbbtBhIjri/SATNYZfwHrO3urD
 WIf8Z6ljRlacDWrz9RVh8XXZtWNyH6xhSPi0ALB2M08giRzNl9vAOiwEJYBAEXKOObO0
 wpkSHjh2yw6jb1cBtRQjGDauxa1lObnk3F7j6Uv3xZdPcn2k3UWfUOOjI50qm7PxF+JH
 QY7OFqP9gCgKEHD6eMVafoKpHM/03thHWkHwzLSAmM7RD0W6k4o/lYwtwbkim1gNMed1
 Jz7TjT8LwlatwGvOc11iYOeH1SqF9D6V3xq2EyLW67DvCgeVOtC2ve6j1nKJnV5TwIY1
 4TFA==
X-Gm-Message-State: AOAM533JXVSSt5taZ5AojVAM1EdYSgMFwVBkQ5wBjMQQLmAoa2ok8Jn+
 elfJMbFDYPV/V/CcXlc1rzIsrSU7Prg=
X-Google-Smtp-Source: ABdhPJz8err8UPJdXDwDZm6HcM2aSOsgIr54aY1b/elzCGEblCAprSBwJrezBOMlw0WKA5Ardn9MJw==
X-Received: by 2002:a05:600c:4fd3:: with SMTP id
 o19mr5642250wmq.31.1625753511043; 
 Thu, 08 Jul 2021 07:11:51 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z9sm1474560wmf.34.2021.07.08.07.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 07:11:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] linux-user/mips: Move errno definitions to
 'target_errno_defs.h'
Date: Thu,  8 Jul 2021 16:11:19 +0200
Message-Id: <20210708141121.1731691-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708141121.1731691-1-f4bug@amsat.org>
References: <20210708141121.1731691-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/mips/target_errno_defs.h   | 211 ++++++++++++++++++++++++++
 linux-user/mips/target_syscall.h      | 211 --------------------------
 linux-user/mips64/target_errno_defs.h | 211 ++++++++++++++++++++++++++
 linux-user/mips64/target_syscall.h    | 211 --------------------------
 4 files changed, 422 insertions(+), 422 deletions(-)

diff --git a/linux-user/mips/target_errno_defs.h b/linux-user/mips/target_errno_defs.h
index daef95ea703..e4490768d07 100644
--- a/linux-user/mips/target_errno_defs.h
+++ b/linux-user/mips/target_errno_defs.h
@@ -3,4 +3,215 @@
 
 #include "../generic/target_errno_defs.h"
 
+/* Target errno definitions taken from asm-mips/errno.h */
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
index 82b0a704f62..8192cee3321 100644
--- a/linux-user/mips64/target_errno_defs.h
+++ b/linux-user/mips64/target_errno_defs.h
@@ -3,4 +3,215 @@
 
 #include "../generic/target_errno_defs.h"
 
+/* Target errno definitions taken from asm-mips/errno.h */
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


