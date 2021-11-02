Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F52E443960
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:14:02 +0100 (CET)
Received: from localhost ([::1]:48102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi2yf-0006IO-O8
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f5-0007XE-B7
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:47 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:39631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f0-0002s8-SX
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:46 -0400
Received: by mail-io1-xd2b.google.com with SMTP id h81so582152iof.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FEuU61Uh+4EG3ZU8JoveHONnvV/xarjms4F54HGX8Uo=;
 b=C8zF1FxZcfPL5gs6X+o6Ch6SRVNM+soRDtSVqQmH9TSWmZfzClag66Ose5MpFUtxWy
 VnAHbBj/0g6LsBTGim+NJBDE6DvkKgVeLR2d7/2Cc4sydX2YmhGfoTrZ2ScnOSpauN/H
 PIYV8JI3H4A0s1mRlr3jE6ZeP/0CTjroMPDFxGdvTKtI5VmekmNji/rXUwntzBtcH6fp
 v9zlx7x10owydZVoi/ANn+j3BoFncj2dT2Kr1rAADISM77IxozaPc1Hl/bM41Qq72zzd
 LE3RmwKx70FthA1Q+3p8ZfqQCzdHa0GmMjTSwUKsH7koy99DQMBB2y3xq+XP156JUGTf
 RL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FEuU61Uh+4EG3ZU8JoveHONnvV/xarjms4F54HGX8Uo=;
 b=6Trze0LbBAkR6Q3P4zAj40YX1p0mC/wfKI3r0Py4/JiTV6N5Dj49gU47NzTZS7V6bk
 +jzMaWe78ryJ4J/gkqg5WPmb72WYBDTNgNYIePM08h0bIlAX6EJagcEsAopuF4qJugBS
 Eio5zGfmwIXnQf66pSpol5JM191eTsZl8ySosLZB/5yDq2koeNOK+gQuEXi90nZ/2rss
 ef5Mrnt4LUdVF+HsGKWbJ5Qp8hfBTP1dxFTQh6yKyKu2Qb3wDNpfhjZWyPvhvEkQSlHz
 ca3uWai1RCWF3kzGpWZEUuF43prcZtk4kBpy3hEMAufcyrlBupCuQ2NdJBxUlrhfkFGn
 5SpQ==
X-Gm-Message-State: AOAM530/Lyu/2fIF+cgIAZjMm6bsE6QfW5wA+QS2BhO7v6VDP+GMZS+M
 kzyKJ4TFvy0bZZV6cwEQDcCsiVFTY4Dtzg==
X-Google-Smtp-Source: ABdhPJyR1CMVeZvbTfwS3TaVEje4oR+EdfxM3Vxd9z5Av7/vwk9Xf4erDKsDMEy8s6ZDVhMWu8cCtA==
X-Received: by 2002:a6b:6b08:: with SMTP id g8mr4204941ioc.150.1635893621720; 
 Tue, 02 Nov 2021 15:53:41 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:41 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/30] bsd-user/arm/target_arch_signal.h: arm user context
 and trapframe for signals
Date: Tue,  2 Nov 2021 16:52:39 -0600
Message-Id: <20211102225248.52999-22-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Arm specific user context structures for signal handling and the closely
related trap frame.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 3aaced474b..4bdfcbb8d7 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -74,4 +74,12 @@ typedef struct target_mcontext {
     abi_int     mc_spare[33];
 } target_mcontext_t;
 
+#include "target_os_ucontext.h"
+
+struct target_sigframe {
+    target_siginfo_t    sf_si;  /* saved siginfo */
+    target_ucontext_t   sf_uc;  /* saved ucontext */
+    target_mcontext_vfp_t sf_vfp; /* actual saved VFP context */
+};
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


