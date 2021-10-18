Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A56432746
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:11:32 +0200 (CEST)
Received: from localhost ([::1]:40932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcY2l-0005Xd-Rt
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtN-0007zX-Mh
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:50 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:38712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtM-0001eF-46
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:49 -0400
Received: by mail-il1-x134.google.com with SMTP id h27so10217715ila.5
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9sPvBFZ/l7G/BxNY+/vUQPWPx/ls2ZmbDpMNIy8JAO0=;
 b=MgE3d1m5NNxniAj+ir5O6wR6FmlBWE980ILqOh1c1HNf956SoupLs2GuACYRVsT4VE
 xm2HJVFGTAShXX8Pc9dOnYTY4EvxZhPvhCvgzC2HMto/p3qYeo2f5eeABtVGnROYnPu8
 dk5MxTDOWWvsxADxpLUb1P7/Vz5vRQvWMrcapxsdG9ylzL67zXJOC0xhmnVRiBF+HXTA
 YGpQKCW1229MQKQHfudn0apYtpo5msUowQi+qu+HqSmqjdhHsDgp3ogfGIsGzwrM2jYC
 24iWWhI96br10KU2tTZzpf2QcyOgl/qpLtFdwNOQFpytv1GfJDT+jJqMQ9ASwoaFm7/s
 +pFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9sPvBFZ/l7G/BxNY+/vUQPWPx/ls2ZmbDpMNIy8JAO0=;
 b=XzJm8/NsvSKmxzdd/ErwgOBPRuEiJm0S3wPr8RNl27vEChFUz/4vxgX/S59fZ7uaxL
 3YeYeRn00xX8wSXWOyl8MdEVwNiGaw3JA77HOsMwLn83RGo4WC6iv+rSJPRUHuDhiInu
 plHN6estaDbEdS6bvwfnlp5rVRoE6KX1VTQ5qnRnEU81T+1TBb6liSvzgp6bP+PVLUeh
 IdiG/dJ7VnPXapNbOGrKUJjFWTuREoMnhUjWg6HfDK3VAAqytiQx66m30ZPM8OEqdPls
 L8HR4YV5Jr+2hBr2V/CYp+5HqgHo4K2t4RKV4MHp9UXiRtxD8+MYxTmNb7/sjcEaYMOg
 1zjQ==
X-Gm-Message-State: AOAM532ogtLJOO1RHP/YeuJmU8ZEKYzP1suFf2D6R7IYyc9N1AB6cLEt
 yfPt+ybIALjYKTOhgj1QWERTDDsnTXvA4Q==
X-Google-Smtp-Source: ABdhPJxx9BYXhGUbv+AeE/5J6rSySwFbLsfZaMp+scEb26XNBm1Wrn02DUHpwptPM4ueswO/yLTWlg==
X-Received: by 2002:a05:6e02:144a:: with SMTP id
 p10mr15568130ilo.313.1634583705979; 
 Mon, 18 Oct 2021 12:01:45 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:01:44 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 09/23] bsd-user/mmap.c: assert that target_mprotect cannot
 fail
Date: Mon, 18 Oct 2021 13:01:01 -0600
Message-Id: <20211018190115.5365-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to the equivalent linux-user change 86abac06c14. All error
conditions that target_mprotect checks are also checked by target_mmap.
EACCESS cannot happen because we are just removing PROT_WRITE.  ENOMEM
should not happen because we are modifying a whole VMA (and we have
bigger problems anyway if it happens).

Fixes a Coverity false positive, where Coverity complains about
target_mprotect's return value being passed to tb_invalidate_phys_range.

Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/mmap.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 5b6ed5eed1..13cb32dba1 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -604,10 +604,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
             }
             if (!(prot & PROT_WRITE)) {
                 ret = target_mprotect(start, len, prot);
-                if (ret != 0) {
-                    start = ret;
-                    goto the_end;
-                }
+                assert(ret == 0);
             }
             goto the_end;
         }
-- 
2.32.0


