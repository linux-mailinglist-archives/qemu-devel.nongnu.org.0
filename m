Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117CB4478FB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 04:54:21 +0100 (CET)
Received: from [::1] (port=37722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjvjg-0000aq-6t
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 22:54:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhg-00061h-DL
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:16 -0500
Received: from [2607:f8b0:4864:20::d29] (port=41559
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhe-0002oW-M8
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:16 -0500
Received: by mail-io1-xd29.google.com with SMTP id p193so17419359iod.8
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rOISPYYKecMk71RBzznUZbzYo3FGryyldBKKzRc7muU=;
 b=4ULHoJ3ykdpdMFRGZq/Sz+CSGGZLQ5nyPEbJkKgIYEsI3Txr4+mxkYQ66lgur9hgU+
 Fxl11zOK1S2eMNl5Luxpc8XXeHMPqSJWaAyqjoBvS7NFDpd7L0HcN/62osQxQ8pLTHs/
 Cw8UI93IamYSyuFtykjozq9uNBWaXABR617xtHu9SwP2PQJ+uEOZhuwSavHH/40w2Eu5
 XiUDykBLJi82mv5YW62HWSw+shijLSTVEXLSBYpnmRotjO9x0vUxC+5OVCunX7rT+s23
 iN7AvRE61uwXg2gU4sTmyaJqQfQzk2kqqQ/1OB3Vz80akjyODjIYF3por7H5Hhy9yMKq
 vQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rOISPYYKecMk71RBzznUZbzYo3FGryyldBKKzRc7muU=;
 b=uRXQNr/zXug2rxaGDNnmbVQnBMuOlGj4TT2LWSYTVIGCbZq3TC8iiEI46/bB633+7U
 hWguWWh/b5d+equZkFf8mfM7unIposARrv7PCXy35JVgl+j5bKNIjYR1dYZExikEK1SE
 COeMpXmaEUSlFzWvd2STIBU6hsI8t+OwYNmWMhMFCRxH4YaCkQZfu332QsCNxwB4Sp+N
 kGEJuNzOK8NbDAXWScwjrTZQ1oqE8u8fKujdGQL2OfX4VfvpyGJZrsBwKlaXeu9jdDkW
 gsU80LV08z4TDlrhRmSzenRdgFpcc1FL4tBnenPnRnH7D3ksK5RRbXT+hPydOyYH3f8S
 L+gQ==
X-Gm-Message-State: AOAM532cX7xauq8TUBUTwyhqGq0zNHIDgBXYveDY9COLJLGhqW/BwDyG
 JzxRf1IXcOYblwIyrz3yBi/mqsOcGvuRXQ==
X-Google-Smtp-Source: ABdhPJwh5gDOtmdq3GBnEIXd6tHKW2vKNQXjA7q4HvbKwY2LAsrS3QbwMk3Uqkzr3Ew+AE7N9uitWw==
X-Received: by 2002:a05:6638:2186:: with SMTP id
 s6mr22138665jaj.138.1636343533517; 
 Sun, 07 Nov 2021 19:52:13 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:13 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/37] bsd-user/i386/target_arch_signal.h: Remove
 target_sigcontext
Date: Sun,  7 Nov 2021 20:51:03 -0700
Message-Id: <20211108035136.43687-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In FreeBSD, sigcontext was retired in favor of ucontext/mcontext.
Remove vestigial target_sigcontext.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/i386/target_arch_signal.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/bsd-user/i386/target_arch_signal.h b/bsd-user/i386/target_arch_signal.h
index a90750d602..e262667bda 100644
--- a/bsd-user/i386/target_arch_signal.h
+++ b/bsd-user/i386/target_arch_signal.h
@@ -27,10 +27,6 @@
 #define TARGET_MINSIGSTKSZ  (512 * 4)               /* min sig stack size */
 #define TARGET_SIGSTKSZ     (MINSIGSTKSZ + 32768)   /* recommended size */
 
-struct target_sigcontext {
-    /* to be added */
-};
-
 typedef struct target_mcontext {
 } target_mcontext_t;
 
-- 
2.33.0


