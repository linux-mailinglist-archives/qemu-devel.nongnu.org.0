Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C116DCAAC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:22:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plw8z-0002ky-Dm; Mon, 10 Apr 2023 14:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8q-0002hd-Lf
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:27 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8n-0000hM-NX
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:24 -0400
Received: by mail-il1-x12b.google.com with SMTP id r11so2066848ilb.9
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 11:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681150881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PMOpf2IFff5u432lAPwzHWlK1uWGL1SuLWuk1jC4DB4=;
 b=KYR/8jl8eJHKK9MeLjqa/eUE2SceIynMrom2LmeHKNzWGCmO99YXxIdme1ZbBOrBza
 Ad7CH5PDg4SQukygAXNHuIUXYWNdtxDIgSsG1f08FtxwyI8/eGx2ehs0xXP+EDs7PTWh
 eBiE7vqIGKLDxAcnOu5vFyNQarVoUXggBEb76yW/nRNNdxzQxUQrKUIc5JMOmxDHs7gL
 DVxlBXzND9mZYTTe0qlXTVMEfJ+zPz2zJUK+aAbkhAu/BGWnzWqgLTm5nmPSK42kU/Rs
 mIAOAcwf+1ksospGAsG44thxZOT4XdNPMYaRAzHZQrdsYBAo8TOWx+cv1Ij9uzmq7lwQ
 zbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681150881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PMOpf2IFff5u432lAPwzHWlK1uWGL1SuLWuk1jC4DB4=;
 b=jPKjENTKgzzCq91kSR/APKAfWrvgYjwXPKbHfKWAlgG66PUUYV0c0tNr3ji3jY7Isn
 IBb7QldyDXJ5bb75x+17te6iWjhLRvYqi1+oqaI0QjiMdN/7GLcFhaE2mt9NxT/nqkRW
 Ocz6M2yN0ZhO+neSATiRhPa/NU1CklVE6Y23h/vmLyw/1PPfo8pT9vrMNwzQ9KBsHx5N
 B2NQVTbmALZRR2ndxFJlfB9veNNIUJdK9t0bsZFbpNCFe2Rcul5+VoLWjn1vNdftxbCY
 70RO+r4pGuMBCYuOIdLomFfEYD0aWv0tjb9SmFQjFYLZVo2DbIVTBUjHN+qsHk448enU
 DVsA==
X-Gm-Message-State: AAQBX9dI49rv2PcmREUSAQRB1Nw2LUKtkQl0/s/rdF90D+rkd8fS2IGj
 XUgXvk/Aj3T0S7JvPM0pWsKBK3RcswwGAaZ1/B8=
X-Google-Smtp-Source: AKy350aqSl/ffpQkrOmN5tL5FuvB0ZkBZ2g4GWsdEkEm/JTO8IuMX6moNCuVIXV0F7kEfwQTMVSr9g==
X-Received: by 2002:a05:6e02:110:b0:326:2bb3:5f9a with SMTP id
 t16-20020a056e02011000b003262bb35f9amr7249447ilm.6.1681150880650; 
 Mon, 10 Apr 2023 11:21:20 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056e02120f00b00313b281ecd2sm3104314ilq.70.2023.04.10.11.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 11:21:20 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, reinoud@netbsd.org
Subject: [PATCH v2 17/19] bsd-user: Remove host-os.h
Date: Mon, 10 Apr 2023 12:20:54 -0600
Message-Id: <20230410182056.320-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410182056.320-1-imp@bsdimp.com>
References: <20230410182056.320-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It only defines the default system call scheme to use. However, that
feature was removed in a941a16f6f52.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/host-os.h | 25 -------------------------
 bsd-user/main.c            |  1 -
 bsd-user/netbsd/host-os.h  | 25 -------------------------
 bsd-user/openbsd/host-os.h | 25 -------------------------
 4 files changed, 76 deletions(-)
 delete mode 100644 bsd-user/freebsd/host-os.h
 delete mode 100644 bsd-user/netbsd/host-os.h
 delete mode 100644 bsd-user/openbsd/host-os.h

diff --git a/bsd-user/freebsd/host-os.h b/bsd-user/freebsd/host-os.h
deleted file mode 100644
index 40cae72ec9a..00000000000
--- a/bsd-user/freebsd/host-os.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- *  FreeBSD host dependent code and definitions
- *
- *  Copyright (c) 2013 Stacey D. Son
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef HOST_OS_H
-#define HOST_OS_H
-
-#define HOST_DEFAULT_BSD_TYPE target_freebsd
-
-#endif /* HOST_OS_H */
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 89f225dead2..ba23b74d679 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -46,7 +46,6 @@
 #include "qemu/guest-random.h"
 #include "gdbstub/user.h"
 
-#include "host-os.h"
 #include "target_arch_cpu.h"
 
 int singlestep;
diff --git a/bsd-user/netbsd/host-os.h b/bsd-user/netbsd/host-os.h
deleted file mode 100644
index 7c14b1ea780..00000000000
--- a/bsd-user/netbsd/host-os.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- *  NetBSD host dependent code and definitions
- *
- *  Copyright (c) 2013 Stacey D. Son
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef HOST_OS_H
-#define HOST_OS_H
-
-#define HOST_DEFAULT_BSD_TYPE target_netbsd
-
-#endif /* HOST_OS_H */
diff --git a/bsd-user/openbsd/host-os.h b/bsd-user/openbsd/host-os.h
deleted file mode 100644
index b9222335d46..00000000000
--- a/bsd-user/openbsd/host-os.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- *  OpenBSD host dependent code and definitions
- *
- *  Copyright (c) 2013 Stacey D. Son
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef HOST_OS_H
-#define HOST_OS_H
-
-#define HOST_DEFAULT_BSD_TYPE target_openbsd
-
-#endif /* HOST_OS_H */
-- 
2.40.0


