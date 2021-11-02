Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F105F4439C0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:31:54 +0100 (CET)
Received: from localhost ([::1]:41266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi3Fy-0006am-4r
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2fA-0007sV-1h
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:52 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:34560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f6-0002uX-3s
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:51 -0400
Received: by mail-io1-xd31.google.com with SMTP id b203so610138iof.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qscs9QmnQjITLDaFiEf4Oo6T7Y3KGHp4Rky0uLwfUp8=;
 b=KJekdd+GfjIYcouCPvv36UZHH7c0W95GcU4321gQkVaCPvcev9Y1o0mzCWS20zgt4D
 8nwapjj62/AlfJqTHCb5uP5IoMD8z+8oUqHP0a6FdV9m+Z8OHLyy2Lzic9ZuOhTUTiH3
 DD1elde+2GE51hkXjcpyTXoidBnncR6kbt08ir07bId3F5KFOAzpgpp8EKt2GKdeqZ94
 9f8qpiBswc0fJJ7pj4AIOUoYF6e/gPj5/kVA6cMbVrAbZWozCgdTNP+WSCQXjq/NdZkJ
 R4SzFSTQXt75vq25bhVreaUiDgyy5zcFz6HQ/K1pVAp00B1ElT6+IKVhritPhK9IRCUf
 y5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qscs9QmnQjITLDaFiEf4Oo6T7Y3KGHp4Rky0uLwfUp8=;
 b=4jFO9YPc/eHsMvqBq3zdKZ0KL7WYu577WiYV5YWqzBQ/U8POpYxcvzz0QI3TSQuzNo
 WYLpXNayNjwSPoTdjTheQ66G/9a0u6ea3ACigG4yWlWnqjKji7JIvFAw5LkDyoevK4Gi
 xKd3oIV8amy1LD4sqtdHd+/iURmoW26nmlpDCLgHqsfZoN9hjasB0tOP5N/gHLXoZ0S+
 XlixfNsqg4Fip8Wz3kYQEEjybMG6nyToTkV08fuO/vdfzy/4KQIlr3ybO02ru6RBPOJp
 VXURcGl7OXu9WaJYIV9apGUDot8UubRpRNnmxJQ7qnb72Dt5jXW38kq5KCMpwKDMJoeH
 gHGw==
X-Gm-Message-State: AOAM5301ldp7VgGTS5ABfzQYGW7zsmu+HW96740dxD8dyG1QG/QVKVyU
 qGi9zRUe//uaRG3qjaZiTJOZU+XjieKxCA==
X-Google-Smtp-Source: ABdhPJy3qU6YeuD1ekeCrOU4G90YuWMTkq7fCzQATCjHa0Wo9NLcsQuAxsxgGwIOExpgsNBNWShN8w==
X-Received: by 2002:a05:6638:258e:: with SMTP id
 s14mr14958830jat.111.1635893626997; 
 Tue, 02 Nov 2021 15:53:46 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:46 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/30] bsd-user/i386/target_arch_signal.h: Remove
 target_sigcontext
Date: Tue,  2 Nov 2021 16:52:45 -0600
Message-Id: <20211102225248.52999-28-imp@bsdimp.com>
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In FreeBSD, sigcontext was retired in favor of ucontext/mcontext.
Remove vestigial target_sigcontext.

Signed-off-by: Warner Losh <imp@bsdimp.com>
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


