Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA267447934
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 05:14:19 +0100 (CET)
Received: from localhost ([::1]:45512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjw2z-0002H4-Kv
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 23:14:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhw-0006kl-Uu
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:34 -0500
Received: from [2607:f8b0:4864:20::129] (port=35435
 helo=mail-il1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhv-0002tv-6l
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:32 -0500
Received: by mail-il1-x129.google.com with SMTP id w15so15558361ill.2
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IfRWeGYD+0hbc23c7Edg1M5XjxcHd+iZ98b19hdHbHg=;
 b=h+lyCx3528JpeKv4Yln6Sy72OPZoCCxKjmTZXnrCALhSmdp992bgleJT+hCPqX/sz9
 MYl78Ke1RwfdsixnA+UCmUU5kT5O6MufbwlbH9IqZZ/z16Wmuz/YuWLzCVfSm5NrNPyE
 2mk4+cU5NjXFy4uexRJ+jS33UPnFwyBo8rKvm5WiJ4hqMw0I15RETcE+vijStdgrmX76
 EjZ68O0172zpD/hWW0tkvOliS2hYbfo0exzuGjA1cLmV5vh5rA5ow2tviQxG4zp+tCdG
 zQraX6cJY7hcRuDOyPdCGi9X9C3pVoSDPkgpGMHbdZ1sjyCENDsAUff1IM73mpQVwrjw
 rw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IfRWeGYD+0hbc23c7Edg1M5XjxcHd+iZ98b19hdHbHg=;
 b=1n5t4GG6f6+KoRPsmiHzuFB0aTTg3lnRNHuhfZAq+N8g0pLTlateb9pm0brY9HBnOr
 VV/qNQEtArQVinE1IX+V2IQASWeWVDYMGy+BYfb4mXP6UG6J4WcSEjCN+/aVuO4OPQ9W
 gpDJeWeb9pQ1tGVqMCGujMcqQR4MtW0F/J8OXlyL1c+eh79ozj4qJpxjhIwoXAsxZUz+
 00Bfw6v7d/SAHVGDpYdI9LXAHwkwBsuavIp7unH69A/Xz8/tY0Fuo7upkRnJKlD9Sric
 IHGvsiFyupy5Pmhmh+OggwSk7A8KPiex88qH4DlwJSBmTN9QOFyfJqrNZ4Lzf0dORAGS
 uyjQ==
X-Gm-Message-State: AOAM531kFFbeFdl3VSBPxG+XwoWNHXKxJ/HzsBEOW9ZS7PQS2pvk+Z4o
 MBh6b8y01jvjCgdHJ4M1BGqqlSuXO/F+5A==
X-Google-Smtp-Source: ABdhPJxLWqXcPZTsil6T1YcFNMubGoXM1Re1az4U8UfOiudO6PY3fIHS1zEVPBj/s3NBD+SLninLNA==
X-Received: by 2002:a92:c80d:: with SMTP id v13mr54571731iln.175.1636343548913; 
 Sun, 07 Nov 2021 19:52:28 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:28 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 20/37] bsd-user/arm/target_arch_cpu.h: Implement data abort
 exceptions
Date: Sun,  7 Nov 2021 20:51:19 -0700
Message-Id: <20211108035136.43687-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::129
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Olivier Houchard <cognet@ci0.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement EXCP_PREFETCH_ABORT AND EXCP_DATA_ABORT. Both of these data
exceptions cause a SIGSEGV.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Olivier Houchard <cognet@ci0.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 9f9b380b13..905a5ffaff 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -65,6 +65,17 @@ static inline void target_cpu_loop(CPUARMState *env)
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
+        case EXCP_PREFETCH_ABORT:
+            /* See arm/arm/trap.c prefetch_abort_handler() */
+        case EXCP_DATA_ABORT:
+            /* See arm/arm/trap.c data_abort_handler() */
+            info.si_signo = TARGET_SIGSEGV;
+            info.si_errno = 0;
+            /* XXX: check env->error_code */
+            info.si_code = 0;
+            info.si_addr = env->exception.vaddress;
+            queue_signal(env, info.si_signo, &info);
+            break;
         case EXCP_DEBUG:
             {
 
-- 
2.33.0


