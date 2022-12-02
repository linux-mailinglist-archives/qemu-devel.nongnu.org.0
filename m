Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB546400B7
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 07:55:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0zu5-0007YP-0o; Fri, 02 Dec 2022 01:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu2-0007Xt-I8
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:06 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu0-0003d6-S4
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:06 -0500
Received: by mail-pf1-x432.google.com with SMTP id w129so4088644pfb.5
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 22:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y1yM5mXsbiOAwVrMBteKZuN2nW1fuu61MzMy6WDuAvY=;
 b=VY8uXVBzZs93qlP3xgZH9PuaPnqMC6lZOHiO0VqsXZKRQI9a01nctNO5CWoXrAxDgu
 ATSuqLw0BiUceH3l/X2FSH8HKBMlWXqrcKMHjHXWGyGxND/wG8AB5ncmY4kuEIIcOm3p
 JLSqfkDyYoVWTO9vNfZubX/ekSs6zBXbL/MgBEori7G+l/qT7g7f5j0edPS3yQ+jIVaA
 ghkbSQqtIJEXO9IBBrjW8CQxRZx1TAcCmvUY+znIhZ6/VjnupkowUYjqNfIPenx9Mhgh
 QTzR8BGVdC7wkXTlnYkp6FYc8JeAeuxg0UR8ovwbPr3FuH3J6Giy/H1G+i7niL8B2c0A
 pHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y1yM5mXsbiOAwVrMBteKZuN2nW1fuu61MzMy6WDuAvY=;
 b=wQj73lSDE0CAfgRjK+WnzQIzNO9FzA4x+waDOBcUfHTpP3aLIyIPm5WbmwaGlM/Kv+
 wcih+gHKMBMfO/FkpN+2TsavNxuyC9xKzMSMkF8P5UmkiNVkgSSBk2ASaQV1Fd1J3FoE
 Yio6mwnLnoQ+KRKZzGMm5o2uJSXm6dGJ28LHSMynqGxmJliaUF3v+t0lRVOjfyA+KvLR
 q0obKFL3D/T9jprTYFQxybf3wmT1gfH7ruxgw2ytqKh4ChCbX+3noQZvI5BN45KX1Ifj
 aZy75Jkw8u0d61Xd+6q2PocDUpcc6vG5RA3mLoQRk29EWOTBYe61FtKaFiHEg6Rp7yjG
 qVhg==
X-Gm-Message-State: ANoB5pnFEUttdyZViq98PvRMFLmtN5Ktc/Yv2ItiuGWhAOx75fEtXif5
 J4lw5SWPzPq1E0zJszZ7Z7gpLTTyr7rMFSiz
X-Google-Smtp-Source: AA0mqf6q4ezECaI1iP/uM0POfOYUr+K54tjw9o814ApQnccOiG/vEZJD3BV/6c5kwfI+dMEBCIPvmQ==
X-Received: by 2002:a63:565e:0:b0:46e:bcc1:a28f with SMTP id
 g30-20020a63565e000000b0046ebcc1a28fmr44199565pgm.408.1669963921623; 
 Thu, 01 Dec 2022 22:52:01 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 q61-20020a17090a17c300b00218d894fac3sm6056649pja.3.2022.12.01.22.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 22:52:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v3 00/13] tcg/s390x: misc patches
Date: Thu,  1 Dec 2022 22:51:47 -0800
Message-Id: <20221202065200.224537-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Based-on: 20221202053958.223890-1-richard.henderson@linaro.org
("[PATCH for-8.0 v3 00/34] tcg misc patches")

This contains two patches that exercise the register pair patches
within the "tcg misc patches" patch set.  Then a couple of misc
cleanups, then support for the MIE2, MIE3, and POPCOUNT features.

One thing to play with: the middle-end can expand ctz based on
either clz or ctpop, and for z16 we now have both.  I've got an
idea that for s390x the most general case of the expansion would
be better with clz.  Which leads me to wonder if there's a better
way to manage such expansions, but I haven't thought about it
too much yet.


r~


Richard Henderson (13):
  tcg/s390x: Use register pair allocation for div and mulu2
  tcg/s390x: Remove TCG_REG_TB
  tcg/s390x: Use LARL+AGHI for odd addresses
  tcg/s390x: Distinguish RRF-a and RRF-c formats
  tcg/s390x: Distinguish RIE formats
  tcg/s390x: Support MIE2 multiply single instructions
  tcg/s390x: Support MIE2 MGRK instruction
  tcg/s390x: Support MIE3 logical operations
  tcg/s390x: Create tgen_cmp2 to simplify movcond
  tcg/s390x: Generalize movcond implementation
  tcg/s390x: Support SELGR instruction in movcond
  tcg/s390x: Use tgen_movcond_int in tgen_clz
  tcg/s390x: Implement ctpop operation

 tcg/s390x/tcg-target-con-set.h |  11 +-
 tcg/s390x/tcg-target-con-str.h |   8 +-
 tcg/s390x/tcg-target.h         |  35 +-
 tcg/s390x/tcg-target.c.inc     | 663 ++++++++++++++++++++-------------
 4 files changed, 430 insertions(+), 287 deletions(-)

-- 
2.34.1


