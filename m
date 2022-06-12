Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3D6547C1D
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 22:56:20 +0200 (CEST)
Received: from localhost ([::1]:36888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0Ud9-0003Zt-5j
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 16:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVp-0005YE-63
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:45 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:42691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVk-00006a-TR
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:44 -0400
Received: by mail-io1-xd32.google.com with SMTP id a10so4284625ioe.9
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 13:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QdcIADX5VLvUVgdW1vPjBuOySak1uBz7CU5WoX+7xF4=;
 b=O3ka+tKWN9pj0zpvKgiSQUj6gpjbVnuEPYQ+Q0inKO7xs7+CKXc1YHZmw81X3deQ4v
 VQ2g4p9guIXq1UYu6369frwhDRmTZ0CBZfHt2hF2pdB6ysNRmyZHfmQ1Dm8TTOhEDfOC
 cO9Frpw/PCYuPVJN0CJJDbkY2k1NaH5pSubS8gog00TWAMmjqDz6N0vJKNqZhollXn7q
 veg6ZVgmRzaI6Kae2iq4aMhMd05VBJ7+YF6qJG5pksKRRx5KCWS3KJ3VoJjMtQLxI3Li
 PmJ/NGFARQkaG+0sAOpwIDXAwLRXV8TimjQmz9Lnbz9W7L5uYojAPTqF1YROtoKuPppN
 yuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QdcIADX5VLvUVgdW1vPjBuOySak1uBz7CU5WoX+7xF4=;
 b=ZXptXxey1wSGBn4fuEdo7JLWSAcxkWx0IawFe9ON/wC/RW5vcE3+KokZrzEDMY1omc
 //+ozV9xVtf80toROEnfpXL/qAbJ4M8qjuS+fbiwMa9YH3pju19Hr9GWJlzS9A3aaiOn
 OCd9UOssJQKdBX+nhUoYGOiyifHtiqca6XZFrUnBp3eUlyCvfPHGKtwwLPu14VBRyxU0
 QzKbcXvWTnxXCosHtFptvp/NDA0WyMryGeVi3eqrEe6jnpFOeIcl89u7pYw6FnoWunSV
 XrD7NYg4wyXO5O5SoyKsn+fKgk55qitgfCePgECHjUu1Wzur7OgUYp2rE/DxgE6yuB8t
 Ya4g==
X-Gm-Message-State: AOAM53333woziYvjP5bRhMD+dBnXtvDkTjEibt4tk5wRaSCAz/NTWizR
 /vPVuYJo/aXnlWipiSmrxzRCCF4W+k+nqw==
X-Google-Smtp-Source: ABdhPJxk/Sl7U+FAFL9ZhWyzooly0eUBLjZGDqFbaSBe10hZp0VoB6J1etUb/iDWCHWtv8DVKE9Z7Q==
X-Received: by 2002:a05:6638:1483:b0:333:ea5c:f500 with SMTP id
 j3-20020a056638148300b00333ea5cf500mr1942538jak.61.1655066918459; 
 Sun, 12 Jun 2022 13:48:38 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 j2-20020a056e02124200b002d1d8de99e7sm2911612ilq.40.2022.06.12.13.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 13:48:38 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 00/11] bsd-user: Next round of syscalls
Date: Sun, 12 Jun 2022 14:48:40 -0600
Message-Id: <20220612204851.19914-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the next round of system calls. These are open, openat, close,
fdatasync, fsync, close_from, revoke, access, eacccess, facccessat, chdir,
fchdir, rename, renameat, mkdir, mkdirat, rmdir, _getcwd, dup, dup2, truncate,
ftruncate, acct and sync. In addition, the helper functions needed for these to
work are included. With the helper functions, all of these system calls are the
'obvious' wrapper...

I've tried to lump these together with related functions in the same change, all
less than 100 lines per change (most less than 40). This represents a little
over 1/3 of the remaining system calls related to files (we have quite a few
more cagegories to go through). I think the lumping represents a good trade-off
between 'small enough to review' and 'few enough parts to not add too much
overhead' vs 'one commit per system call' which would have bloated this series
to 35 pieces. I hope to do the remaining system calls at this chunk granularity
and maybe twice as many parts to get through the ~15k backlog I still have to go
through.

Warner Losh (11):
  bsd-user: Implement open, openat and close
  bsd-user: Implement fdatasync, fsync and close_from
  bsd-user: Implement revoke, access, eaccess and faccessat
  bsd-user: Implement chdir and fchdir
  bsd-user: Implement rename and renameat
  bsd-user: Implement link, linkat, unlink and unlinkat
  bsd-user: Implement mkdir and mkdirat
  bsd-user: Implement rmdir and undocumented -_getcwd
  bsd-user: Implement dup and dup2
  bsd-user: Implement trunctate and ftruncate
  bsd-user: Implement acct and sync

 bsd-user/bsd-file.h           | 369 ++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 116 +++++++++++
 bsd-user/syscall_defs.h       |   4 +
 3 files changed, 489 insertions(+)

-- 
2.33.1


