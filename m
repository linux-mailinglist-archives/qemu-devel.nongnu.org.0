Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 210AD432385
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:11:52 +0200 (CEST)
Received: from localhost ([::1]:46814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVEs-0001Oy-TM
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8s-0007hS-EQ
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:40 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:36671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8f-0007wz-7Y
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:37 -0400
Received: by mail-io1-xd2e.google.com with SMTP id e144so16916801iof.3
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9sPvBFZ/l7G/BxNY+/vUQPWPx/ls2ZmbDpMNIy8JAO0=;
 b=ZDGhRqnB5UV9mlGsKlyrRrb+tlO8YkuFns0n/gA9WplsEn4Nh2zNJPPSGDT/eMHPhe
 aytzgxf5IvqmMg02Ko9IcKxmUXZ+xXswyZez36DK33tRdYeqP3pBNHAqCQs668B5xKwm
 1j2h/NbgXgRWBztrD0uA8ho7jHMGyM/Z7Ejk0OXlV5lB4/PrKzUSg533sk0DgEXc+Ay8
 vJFBO9uPUFH1mtFTmfRdZ6Vec1/0u9OQJYjDIINaa/JcLdWfdZ5NiMH+1rgD7SqsKZaa
 Y4ejg8BpR81tqZPthgstIReL/ma5X6VMKyJHaIzNddENqS7oba3lQzfuZJHXyouXnwLO
 yUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9sPvBFZ/l7G/BxNY+/vUQPWPx/ls2ZmbDpMNIy8JAO0=;
 b=p+JQEBcqGX2l0KiQ0/CrhZpINdakz0URyIbQfgv2GE8UHCYmTDiZhBvDenwEf9ZwlW
 FfAc5Xne9DEQphsgZyLg2ta+ZbciG10ErWn9k1b8JFNbhgEOtfD4PB+9pzMqS2SP8CVq
 So0NY3fAtzzjNFQBJz1+DjxyXgW9kVymt8NAat34HkbfzbWbywNT9qiZpM+AfzTs09FM
 qA4i70ExiKnscVCHoZyUWRzrU+1SRaxjEPMW+idPikRfdGUMPEovfP3YgImw54nl9yDf
 96B1y+7YQPbHk7OCFS04h2rEq9wv3d+htlF7J8JJNhP9muK2fiAEwawO42qsxLaWDNcl
 Xpew==
X-Gm-Message-State: AOAM533a8zTuesYzOAbFpJQtBbFTaQnWCiNtNfRJyjxidcYAtN3yjJ++
 drr4O0yuDKZ+sX5/RH4oegisTU8qJrO8qA==
X-Google-Smtp-Source: ABdhPJyeuBcCPhjX3rQ5VJ7UqwOBBfE/VqFUH4I4XrCV9RnxQuXkAA5xPH+4VHaM63BTaHCi+HKNSQ==
X-Received: by 2002:a05:6602:1651:: with SMTP id
 y17mr15139026iow.114.1634573123848; 
 Mon, 18 Oct 2021 09:05:23 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:23 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/23] bsd-user/mmap.c: assert that target_mprotect cannot fail
Date: Mon, 18 Oct 2021 10:04:44 -0600
Message-Id: <20211018160458.1976-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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


