Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8F6427319
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 23:32:26 +0200 (CEST)
Received: from localhost ([::1]:38192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYxTd-0007e8-ED
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 17:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLf-0003Ox-1H
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:11 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:38583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLd-0007i9-DJ
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:10 -0400
Received: by mail-il1-x131.google.com with SMTP id r9so11330260ile.5
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 14:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KX/YI8ttwHulmDkzNb2DvIlZKfdvjYqr0a8Bt5W1x6I=;
 b=fHYeDFYJA2hfDEE6kZ2JPd60+a1iN7MaRq6MSQDTRmQDc5x2FBu8cvYLgh1R4DtKZu
 J/rhee+gO1MXv/i/5qPSsXrU6BE5GwowPriW6WyHXbdxGLo7dnwu8wV6PxxXoCJorU2N
 6/YDmONvUNJNIMIpBiapoea172Dx33uajSUmRgDYy/lwKX0lxGNIkMEcP+iLxdH+7vYE
 /UyeeNIIULVbduy41zaBmT5dNRir+h7jzmRuFXqyX+Qa7vHx+vKTjc8G8eZMY4pTRW81
 nBFIcUncAoMqaeN4PHgSEqHFDqL1MFJfckeMTuYoGjfAGprHOCGSz/rMgQCijnHYJZLO
 PRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KX/YI8ttwHulmDkzNb2DvIlZKfdvjYqr0a8Bt5W1x6I=;
 b=AUyM5+m5w82l+NT30zRwRepingSQobqof4tDNiVYrSTi1N6OCoiiomNFedvEHhvM8i
 lUw+hx8tcy9+6KQqANO3c2GnhgREuzxn4yAgxS72e7scXa/7MlbSeyjOU4zhgeEsHAS0
 bE5BL95rlkEK81e7p5K6VQaIn/SJey1RYEVlRDXoNfPb1amFDNW8JLTKxNrZ/nkNx1Ke
 GrcexPjF8vrsr47miUKcHXE1QGWObRM0DGQfulAB3BsEcdKZdjbasrY42jKyip3+BQqp
 netCgIzFiLt8hmp4pttELCzRuTJITpEPhHbvKKvVcu7LAbc4JDgjfyk3qSdPh2q4wL7M
 shew==
X-Gm-Message-State: AOAM533CX83C5nvSQvDfXCKqpwMj4+7GOPfoNae8WLhyQfdC2k6Por1p
 6+NsUHgEXHWIPEHcj6vEEshpK2B1+nFgMA==
X-Google-Smtp-Source: ABdhPJyWlz7Tk1jlwNA2yUAyKCrcz97Ko4utEjrxxJ4d/zxMAxz5Xla2zPQpJzy2S0q0lyf7+LjFgw==
X-Received: by 2002:a05:6e02:c0d:: with SMTP id
 d13mr10093188ile.163.1633728248025; 
 Fri, 08 Oct 2021 14:24:08 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm186620ild.52.2021.10.08.14.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 14:24:07 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 9/9] bsd-user/mmap.c: assert that target_mprotect cannot
 fail
Date: Fri,  8 Oct 2021 15:23:44 -0600
Message-Id: <20211008212344.95537-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008212344.95537-1-imp@bsdimp.com>
References: <20211008212344.95537-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
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
Cc: kevans@freebsd.org,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 richard.henderson@linaro.org, f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
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
---
 bsd-user/mmap.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 066d9c10ff..4586ad27d0 100644
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


