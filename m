Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B189E44554D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:28:02 +0100 (CET)
Received: from localhost ([::1]:57484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midij-00071F-ST
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midO3-0007fj-Sm
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:39 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:35728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midO0-00015s-Er
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:38 -0400
Received: by mail-io1-xd2a.google.com with SMTP id c206so5500409iof.2
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wZvh57AWzS8inwSMVn1OaBIlb06mOlklnUcQyFDbg60=;
 b=QivoQuAjDT9P/5pFJz0dJZ3U5XOYq+JTmo33lkUO5b1V13fUPi70xiyqwjHBqGpJcE
 ZH2Q3mJ1n9PYvxVUSEkudCmo6s1Dv5sOL3DcovRUAranNME6qfZ3zUXHdrDn15RjrMk2
 knOa4MzQ4NvjyLuXGY4OKl3Jhtj0kSCoL55KJT9yFD6jFmIBQMUyFf8TbDoxXdRkvNLc
 QfzkOuRqVWTw05dQQWFgKk0S9uHrXwoMZDK0orv/ne5TX5ustiXHEwz0K0i2xk3Pdx1B
 ZLIjxW7oL1sBZh7P8JRblvfEjC8Ra6CGFTdwJNipNzx4nUR1g3uY0JPIxTtBmhBp8K5w
 f3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wZvh57AWzS8inwSMVn1OaBIlb06mOlklnUcQyFDbg60=;
 b=P2OwwjJ5ktcKL/5WGQX6g3SwF0Kz/2ss10hAXLbMXCHM7RFydQQfJlaSS2eBRGtaKm
 GX+UWB5BxP3y71O3LJnPx5YZvrNqXAYAkWC98nQdI3XhJxCj+336RXtgSo55VnHRjgpD
 7MNEINGBBYY5863/Smw2nZd3YysjkoIfAOMl79/ll5g/F2TrApL1rstCe0atO3c1VLLQ
 o3s1THaIWb5HB/dJ4/p9lGBCPkZjjb8e2MWrjfrHuqtAdE6Ibavp6V1jK5HhayNUexPU
 L9MsguQoetvycxsDeAJYPGizd9bg0oz+gwylvdpJvw3qfSZxylDnZUyHwJzG5A+nnRSm
 066w==
X-Gm-Message-State: AOAM532VusiZJW6u0NhXUPY8036pdeqDhr3+t2/NjOlogfisOAO6pfdQ
 k6lvObR7B+Flmdr7n0UZy7ZiJ2+seZCr9Q==
X-Google-Smtp-Source: ABdhPJz+QyTtcwwCfY9rs4wgWGXAFZWopCHWcW68y1s9NNL+Sp4BcxjvGqOJ665cFAay4e7Vud4Q9A==
X-Received: by 2002:a05:6602:2089:: with SMTP id
 a9mr30952030ioa.20.1636034795036; 
 Thu, 04 Nov 2021 07:06:35 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:34 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 27/29] bsd-user/x86_64/target_arch_signal.h: Remove
 target_sigcontext
Date: Thu,  4 Nov 2021 08:05:34 -0600
Message-Id: <20211104140536.42573-28-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
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
 bsd-user/x86_64/target_arch_signal.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index 4bb753b08b..55f742b0a8 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
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


