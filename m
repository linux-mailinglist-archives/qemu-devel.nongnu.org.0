Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE06844395A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:08:56 +0100 (CET)
Received: from localhost ([::1]:37606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi2tj-0007Qj-Q9
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2er-0006lb-HX
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:33 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:36831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2en-0002nF-JD
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:33 -0400
Received: by mail-io1-xd31.google.com with SMTP id e144so596385iof.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OWk7jgZj/MHyj5WnW05WLTLrlZ4T/i5ovr49MB5ozuI=;
 b=u+k0FlXwN3UBJDubPLSZYDWuSnoaXqUmWKX0o3cxu8JSvcvNU2eaDQOdL1dKvAPNy4
 RoFq0MH2c+Lksl1TGjlqaQczv7mN+rVT/7ClCOS9ZcvlH+aPDRop1gRvKgX/Q2YWhBOH
 N9oUY0dQNRgfNg0sIDcdV+5nSUClHFN30g42GYzY3itPlWUekwIhzUOhYE58moZIUSo9
 iwODhHwzAOSRxJ+pldKXRl5DFmycgS7fP4fJUfjRlSleNFvgEZP1oZTsZ1qhcwyG4XQo
 ULExiPjmLeLZKJHFH9w1murND3JC+r/zAKg7zH2w7dh32KDRZy126Qnk++UPgKMIE3Ml
 AWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OWk7jgZj/MHyj5WnW05WLTLrlZ4T/i5ovr49MB5ozuI=;
 b=JFmWOmuVIGqPzq+Yt6bSuX0Pw/KXJuMSWn4gBiW/9BnDlbDzTF6gf/5MMNG1ouVBzy
 iZh/XTA9Uh2SbrXSNdFnElhSjravArGlwqYbB8vWYZuTiPfdjnAa3Q+nkLoRYxpM6/P/
 2o7PAgPmx/Y7iUm0qLmYyR8A/OjJGUw3n5emKz8KAhk+fwBW0oBNRNFyap4zWLaWU6oQ
 6cyuLu9iUpzMfr6niHj9emgvCCbJPK/iIVR+2ZWNpaRtThMpzHNWvD5jSk317Wth2OKu
 ZEX7C2a5DTpyyfeA6fWnPCgJsNYNcPI4uUnf2dT3BJpTzDTD6/o+21RD+kaqT4Sy3GSf
 sPwQ==
X-Gm-Message-State: AOAM531QiBX6LvfQQ7KBnHeEEKw4IYYtAZSVqEtw9R/cu8qOnPfpbRJ5
 B+8QvBAZipB8JYq2DxHhU8LsfYJGTgEnnQ==
X-Google-Smtp-Source: ABdhPJwFbeVxJrdV7whbdOQg9rJFIaLVXeUe7OWWuGNDFXuq+ykGlmw9sUS5LvUbXszKbBxmnU7eMA==
X-Received: by 2002:a05:6602:2b0b:: with SMTP id
 p11mr28960325iov.62.1635893608383; 
 Tue, 02 Nov 2021 15:53:28 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:28 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/30] bsd-user/arm/target_arch_cpu.h: Implement data abort
 exceptions
Date: Tue,  2 Nov 2021 16:52:27 -0600
Message-Id: <20211102225248.52999-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Olivier Houchard <cognet@ci0.org>,
 Warner Losh <imp@bsdimp.com>
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
index 609b78b4e2..cdb9440a65 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -90,6 +90,17 @@ static inline void target_cpu_loop(CPUARMState *env)
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


