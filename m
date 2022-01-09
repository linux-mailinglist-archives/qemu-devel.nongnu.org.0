Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B164488A80
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:22:36 +0100 (CET)
Received: from localhost ([::1]:54574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6axn-0008DN-B4
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:22:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6aup-0005Ln-MY
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:32 -0500
Received: from [2607:f8b0:4864:20::d33] (port=38774
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6auo-00075K-0l
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:31 -0500
Received: by mail-io1-xd33.google.com with SMTP id u8so14396296iol.5
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=99bS4MtDz1+z8o/MYw3wovNzM4oigqAnsWI545u6azU=;
 b=BDwXzvhJZEIApEPOUaqjj8iv/wZdmlBT8TcBUu0tEDfBd65eJALozPWbCm/E7Jv9bS
 t1ifaGFBh0a4lJMzCYkAYZ+XaxbjRT/7GPgxYG+L55okcGJXohgebLeWrAe2ZLkitJVN
 fKRnht2e71V45lCmy6iZPwcB2UbwwvpK44nI18D1Wh6GJUNoqsA6LGd6xu2SWVye9f6p
 XsNCBKA/ZKzLb5DgclsFVUxyj6+Dcjbs4Mdr5qHVpn07il29UYI+YzLKrRhBjsZDnHof
 FpZaKP5VkcZjBBht3WaWcLfxfESkLPOLRb7/0+ghV8sECjqBpwCBpyrJ60e4qlBeSH/f
 9LgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=99bS4MtDz1+z8o/MYw3wovNzM4oigqAnsWI545u6azU=;
 b=y1Rn24sb8slXF2XHCr5C5YKE3LVVeoteMJynU4ntTHxC53D2PGXM5NYrVxfDUUje8q
 YkDWO98iZkKt2G5IE28agdTZ6XtSvb2vw2tuaA5w990vtDKVqpsJSQPlzEPafwdY9lG5
 Dkjcs+cVuRx5wkgD+CADxXW8ek8JqDVUaAVZdI7tIDoqGUUTFg+WbsY1tvyBJy3e4V7p
 0dWcdoxg7X0C0zlNXcEj5tDvLIPQc51h+KFxxVPwjAY4JCDJJJNOLOplQ11oYxTv6QLH
 LOLY9SnO7AVAidNJiPhsMs0oF2cCtrt4n4fHwmpY6mb80cjSTQ9E6N7IvjYS10CyasKo
 9d1w==
X-Gm-Message-State: AOAM533+ekgxJZUrt6LnPLaG2rMVA4kwV7YjelUW4HcDkS+KA2eHXVMz
 4TvC1NAhXaRNZ6fRixYfIDQu1vJAzuDVoiwb
X-Google-Smtp-Source: ABdhPJxLcjoI3x+pI+pCc0FmdfvbG/f8kU11oQPbIQChYeTgvBAN9mu1qpyj8rmsxQyuMmfIQ6mHJw==
X-Received: by 2002:a02:b054:: with SMTP id q20mr28869036jah.247.1641745168427; 
 Sun, 09 Jan 2022 08:19:28 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:27 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/30] bsd-user/arm/target_arch_cpu.h: Move EXCP_ATOMIC to
 match linux-user
Date: Sun,  9 Jan 2022 09:18:54 -0700
Message-Id: <20220109161923.85683-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the EXCP_ATOMIC case to match linux-user/arm/cpu_loop.c:cpu_loop
ordering.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index c675419c30a..c526fc73502 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -180,12 +180,12 @@ static inline void target_cpu_loop(CPUARMState *env)
                 queue_signal(env, info.si_signo, &info);
             }
             break;
-        case EXCP_ATOMIC:
-            cpu_exec_step_atomic(cs);
-            break;
         case EXCP_YIELD:
             /* nothing to do here for user-mode, just resume guest code */
             break;
+        case EXCP_ATOMIC:
+            cpu_exec_step_atomic(cs);
+            break;
         default:
             fprintf(stderr, "qemu: unhandled CPU exception 0x%x - aborting\n",
                     trapnr);
-- 
2.33.1


