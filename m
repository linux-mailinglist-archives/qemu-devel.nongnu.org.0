Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECE933A27B
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 04:25:02 +0100 (CET)
Received: from localhost ([::1]:37574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLHNE-0006qu-Pd
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 22:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLHLw-0006EE-42
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 22:23:40 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLHLt-0004Hm-GR
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 22:23:39 -0500
Received: by mail-wr1-x431.google.com with SMTP id f12so6879855wrx.8
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 19:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CBNImSpDHE8KaprwUFH5s6Zi6Md7oSal1HO9J8tv+rc=;
 b=PiuBNQZ7vgOWbp7Z+7GUAT7Z2hWvMNnQsdhwLwv1lMY+WVR2C5M47AkG99YzihQsY0
 7+i6lyVnMexkBuaj/ekPcmYbxJS0hvdDMTTKRWk64DMaZ9yJP7YFQ7Rz30AGopRV8Fyw
 QFWUrty8MAqAG2wxUsFG9b47Yy3XIUzSMdG1+c6Us6tWm9b4gj/KFvod08P4xM5e9Rpq
 QWPAqF0Q8AVKE+vycJW40zVRHeGqUrBhzL0L//CL/vIH61bsf2i43as/gL3xL1zhbSZO
 AYCryH55qbKma0WLN3yMmGpRZRVQBRDLuEJJF8Ko6Nblxk6MHG1gDWaw796zXW4Din+g
 4MBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CBNImSpDHE8KaprwUFH5s6Zi6Md7oSal1HO9J8tv+rc=;
 b=rY6Sz9VrUdF6Wh9aJ5cmtOFmqYOk9eS7gSsa8BAkeZHrwOVAposztIlGu5U0/khv4e
 1m8waMIy6MmUln1raaT0mYG3cvY5DbBtCfNzSAyH8madH9+UusQOpjvrxZKIrW2JW50W
 aT+buBSXwWCNV6A5v6RofJsxuthrWFKqJm1ybUlLcxOHaAbstFCcGUddMABjO767ruJm
 /EzrcxVSm/XAPb/OIQJ38yZJS+jwvSil3K+af6I4ybNp50qk+qyKLNa1ti/i6FKqgrqZ
 yZ8gYowLFK7uJvxqWapuINz/Kg2U2LuoyupPREHNCmP7C0GkT/E5EngNO+KJRgAoQB/O
 R9aA==
X-Gm-Message-State: AOAM5329WkS/rPX9lyNOLBJAQMFH0sAcGvVXmMZlOnqQStMl7rtlsFIj
 XtydlsqS6ZUVngs7M77BPCR4HS7nzFk=
X-Google-Smtp-Source: ABdhPJxBD2qlXCSj2Rdu/avQbNP68SZJK7MQyRF0/gXw0SQVHOwYhJ+NSQP37YPqwblveqjvSKO5cg==
X-Received: by 2002:adf:bac8:: with SMTP id w8mr21724884wrg.68.1615692215654; 
 Sat, 13 Mar 2021 19:23:35 -0800 (PST)
Received: from localhost.localdomain ([197.61.164.30])
 by smtp.googlemail.com with ESMTPSA id e1sm14922249wrd.44.2021.03.13.19.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 19:23:35 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] Replacing malloc and the like with GLib's variants 
Date: Sun, 14 Mar 2021 05:23:16 +0200
Message-Id: <20210314032324.45142-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inspired by the task in the Bite-sized tasks page, I've tried to change
some of the occurrences of malloc(), calloc(), and realloc() calls and
their respective free() calls. I also included some minor style
improvements that caused errors and warnings when supplied to the 
checkpatch.pl script.

At numerous places, the change is quite obvious. However, some other 
malloc() and the like have no immediately visible free() calls. Analysis
was done to trace the roots of each free() call to match each GLib function
with a g_free(), and every malloc(), realloc(), or calloc() call with a
call to free().

This series was resent due to some previous problems that are hopefully
resolved in this series.

Mahmoud Mandour (8):
  bsd-user/elfload.c: Replaced calls to malloc/free with GLib variants
  hw/audio/fmopl.c: Fixing some style errors
  hw/audio/fmopl.c: Replaced calls to malloc with GLib's variants
  target/xtensa: Replaced malloc/free with GLib's variants
  util/compatfd.c: Replaced a malloc with GLib's variant
  tools/virtiofsd/buffer.c: replaced a calloc call with GLib's
    g_try_new0
  tools/virtiofsd/fuse_opt.c: Replaced a malloc with GLib's g_try_malloc
  tools/virtiofsd: Replacing malloc-like calls with GLib's variants

 bsd-user/elfload.c               | 74 ++++++++++++++++----------------
 hw/audio/fmopl.c                 | 68 +++++++++++++++++------------
 target/xtensa/xtensa-isa.c       | 53 +++++++++--------------
 tools/virtiofsd/buffer.c         |  4 +-
 tools/virtiofsd/fuse_lowlevel.c  | 30 ++++++-------
 tools/virtiofsd/fuse_opt.c       |  4 +-
 tools/virtiofsd/fuse_virtio.c    | 34 +++++++--------
 tools/virtiofsd/passthrough_ll.c | 32 +++++++-------
 util/compatfd.c                  | 10 ++---
 9 files changed, 156 insertions(+), 153 deletions(-)

-- 
2.25.1


