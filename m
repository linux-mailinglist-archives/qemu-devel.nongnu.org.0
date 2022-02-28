Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77304C7768
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:16:39 +0100 (CET)
Received: from localhost ([::1]:60044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkZa-0008L8-Sr
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:16:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkUx-0008El-Iv
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:51 -0500
Received: from [2607:f8b0:4864:20::d31] (port=33747
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkUw-0006Yo-5K
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:51 -0500
Received: by mail-io1-xd31.google.com with SMTP id 195so15738656iou.0
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0W7CyGd+wltyjsV4bxtaXkJoEqxgaZms/OXr5iQpEmE=;
 b=QL+ENtqp/3MYN6XKbdICnJW+ABAbW6iCRFgjPcpwVkL1lVr1lhugLzYG+tLSwqkmbp
 MrjP0tLWXUrZfFJeGJZL55+HTQlwUYGua0YIQ14k5sFfH+yAvAK1XoOCfIeMzdeUA6hV
 e6BTf3Ce/sLHMLYgRTIExEBpxA7akEIspObvQ7KgByR17nsmRaeD88WeMFI64LVlbt/f
 ND0f6mnWG22zCrvLIGDwhK0iJkYFcjoqIXbWw56bQ5fwm6eW4+oSdO/rRdelfUCHKldN
 wXlvfj/36+F+E5Oaj/V+jZjnLZImIBs1AuFpJjuD4Zen49FTzxpMKkhWmhYDUAvNHcq6
 0yGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0W7CyGd+wltyjsV4bxtaXkJoEqxgaZms/OXr5iQpEmE=;
 b=l6544xrr6n3qydCP2xvJsN1khW7Uqv6K4GLOKsocjt2kyClu1XGcGjAAKuH90hPLSK
 nC22N3TDnArQLZQtEu2bFTrHeimKhKJkKshq6RvVqwRgTewWOBtiZL5Xa+hSdANT+4hf
 hVyUlefp/8Mx0y5yktx72iQ2CpgI4D8X1pXpKuqRBlMLBNra98A/Ys6eT5vxtYpFdXP5
 tRimVuK2+FcKIgq4PxlJfdaTvaBy44fPhYne+YtGacDm0tDGg04QqWeGs4J9JGQ48AOp
 M7uNIxV4iHr+wECVy/hHpCH+koeG7NbWBOY3Qx5Ma9sZrjUWcxohcKlGRZ/L89D2HdU0
 kEbg==
X-Gm-Message-State: AOAM533VIV/7rHrpkrRENP99bVs3eGroz+l2P/6r8XlSVI8LyqgPkhc6
 x+2kgxAZOfL4KlE3Bnf6uEUbAHna8H7QYw==
X-Google-Smtp-Source: ABdhPJwLIoyYvE9+MS8kq1AfFjMdLq5oPW73iHqdZKl7n0JdQiEcbQn5W7ceiNxX3VLCqpxI3vP0fg==
X-Received: by 2002:a05:6602:134f:b0:63c:a7ba:e8d with SMTP id
 i15-20020a056602134f00b0063ca7ba0e8dmr16402890iov.180.1646071908882; 
 Mon, 28 Feb 2022 10:11:48 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 s13-20020a6bdc0d000000b006408888551dsm6015396ioc.8.2022.02.28.10.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:11:48 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/16] bsd-user/x86_64/target_arch_thread.h: Assume a FreeBSD
 target
Date: Mon, 28 Feb 2022 11:12:05 -0700
Message-Id: <20220228181214.2602-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220228181214.2602-1-imp@bsdimp.com>
References: <20220228181214.2602-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we can't run on anything else, assume for the moment that this is
a FreeBSD target. In the future, we'll need to handle this properly via
some include file in bsd-user/*bsd/x86_64/mumble.h. There's a number of
other diffs that would be needed to make things work on OtherBSD, so it
doesn't make sense to preseve this one detail today.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/x86_64/target_arch_thread.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_thread.h b/bsd-user/x86_64/target_arch_thread.h
index d105e43fd35..b745d7ffeb7 100644
--- a/bsd-user/x86_64/target_arch_thread.h
+++ b/bsd-user/x86_64/target_arch_thread.h
@@ -32,9 +32,7 @@ static inline void target_thread_init(struct target_pt_regs *regs,
     regs->rax = 0;
     regs->rsp = infop->start_stack;
     regs->rip = infop->entry;
-    if (bsd_type == target_freebsd) {
-        regs->rdi = infop->start_stack;
-    }
+    regs->rdi = infop->start_stack;
 }
 
 #endif /* !_TARGET_ARCH_THREAD_H_ */
-- 
2.33.1


