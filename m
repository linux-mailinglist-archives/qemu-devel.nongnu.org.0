Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA68414105
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 07:02:31 +0200 (CEST)
Received: from localhost ([::1]:57150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSuOs-0006ml-Lv
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 01:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJS-0006fs-BY
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:54 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:46855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJQ-0007oY-RG
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:54 -0400
Received: by mail-il1-x130.google.com with SMTP id h20so1325226ilj.13
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 21:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j/SZajdj1q4GBzUgoYeNuK9i6EevpvYpkOKU5eddA5M=;
 b=PdCadxxVB9ZgYS2Qvtkcd98GiTg19qWVhucKwUQ4az4nzjzc+KP6xOADCN3nBYx4bw
 822PRBhfzlmyvkT8XDlhw9MCLMHczbRxAseqd54WYJHImXBvWiICxvF9QRsQmGQJ3V8X
 1I+eK10fy2ZpdpstrNmTtoqEbhTFKZP73b//g3V7fli3WYa4IlhFIJ6CM7iqgLzwgQwy
 dZrQ4H1gxxeb7gOJfi0qSaCsMtqh1pSBdyQvN6oYPgp4LS2qAay69AZ/ex6IAkl1qwy2
 XQYoZm2kBb2Zvze40RXGYLvUuTWJmY1N4DegmxF5bU/g8JYMLDjyC4lomm0yNFHl/wNN
 pwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j/SZajdj1q4GBzUgoYeNuK9i6EevpvYpkOKU5eddA5M=;
 b=f4i9vnZtvYdoa1Sf+PgqLrAp7kj6XNpasPCRn6xOg8IOCPJvMa4wfLSbIBXU/7tg3t
 2EpRHMgXr/DmKmgMXMkTPwgIO38SnSR3WmuVJHE73umGTm6o0DM7z2GMuZ2gqLbMtA9A
 9iDBHub8t1DS/nW3aGuBaN/K5LARZGKnE9X8HlHLV3d6hgFwdc6U4qxWRQIfAlyiWBS/
 4NC6M7r3gyxfS5AjmoRg3zA7Lv9ETHiGnsVQehc7zeUmXEJJYJTa9KmIRLpfF7Qt5yhb
 0pzAgKoA5ivt/oBWPlP5S3giHSUjKBy14Nq3lAdS4YVYjUeUJD6GO4ss4LyhizvxSHsI
 WBvA==
X-Gm-Message-State: AOAM531FPrmMBykS8U2HBt2+KMNANkWHafmKlaPEKc0qt2YGHIvHTorQ
 7t2spRYZrBGKl6k6u7DVU0UTbit3gQOYvyvytbE=
X-Google-Smtp-Source: ABdhPJwUOAU3qzH2qx7D6VBr4s+eLcgG9WmP9DNX+PqvCOyuM1MZXSsb3FqqeyWj4fMxxb42TVeR5w==
X-Received: by 2002:a05:6e02:1a84:: with SMTP id
 k4mr16745287ilv.146.1632286611527; 
 Tue, 21 Sep 2021 21:56:51 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j5sm512833ilk.58.2021.09.21.21.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 21:56:51 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 9/9] bsd-user/mmap.c: assert that target_mprotect cannot
 fail
Date: Tue, 21 Sep 2021 22:56:36 -0600
Message-Id: <20210922045636.25206-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922045636.25206-1-imp@bsdimp.com>
References: <20210922045636.25206-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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
---
 bsd-user/mmap.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 792ff00548..4ddbd50b62 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -591,10 +591,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
                 goto fail;
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


