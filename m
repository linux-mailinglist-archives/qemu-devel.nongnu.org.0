Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A1147E554
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 16:04:55 +0100 (CET)
Received: from localhost ([::1]:54994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0PeI-0006qL-IZ
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 10:04:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1n0HtA-0006k4-4M
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 01:47:45 -0500
Received: from [2607:f8b0:4864:20::52e] (port=35475
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1n0Ht8-0005HC-B8
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 01:47:43 -0500
Received: by mail-pg1-x52e.google.com with SMTP id v25so4139761pge.2
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 22:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nuK5ni6SPoO45Nbx3zlI9WlWEe/hlceeKwt3qfOlWTM=;
 b=JbJAquiaLdk13AVYo6UyGTKGd4N3pZi7fjFpEKd1HQbitwWsCxogc3iqEGujyVSyw1
 hCno0obZqXcs9QaDqPpaKEiv2FPRrq4CCeX3VQKArVzUSE81qnO+D5m6xVHA4q5D0CYF
 rSYJLtp7oyFfR054RIydmGO2io5biNh+5TKqOlOWQuidTvkzeVYF7yfsNM4GtTGKO5+z
 ubKi1L3pwIy2IfBLg2IxRP1Awz8j3AwzUmG8bTTtoYSfH7cSrn9B6Krx+8NGdyCneL3E
 Wyf1CHhdmRAIv9G56aRu/uLf4tsNz4kGLqibXkFR3IcB2fFk+I7fZK0cEwWJX/I3YIA8
 6PCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nuK5ni6SPoO45Nbx3zlI9WlWEe/hlceeKwt3qfOlWTM=;
 b=JbnBvzcB5v1NOXBHqBwMqostYIqV9WxFcQilVRjxMV0V2k5IDp+TaEboPihKRmDKl8
 +rGssuLrxuU733w4RU9BGEbVQXvbGDfvOn92HogZX9+DJU7pD8Amg1qiTk5KJLXZqQhS
 XbADHIMxfHQuvczex1WpSjvxkF/W/5SlrLnWUisI36vMmCXdxJdKpT6Px+qZBtR0Dj1P
 Z7jFSsvFwczogK0xyAhepVJj9VzdDdXyxv+1Bb94hd9iqo+d99JqasNsB3IQgeLrxxQ5
 tZvJcFMlvHW8pt31UkQutmLCf9+Td150gXlRFD2iQazX16tienXR6neusIfLG+G6e8n/
 U5tg==
X-Gm-Message-State: AOAM531WdN8F6A1TYJgmR8Ccb2EzXXxjPL9wl06D4R/WBFHjlmaXp9X7
 sNv1t1bewlLPWO76oGfEM49jPiMxBxmnPuvC
X-Google-Smtp-Source: ABdhPJy517gPT7O0SqlzTW4I2JwRzNX4WyhzD1ELQ8/kC8Ybh1u4EpFFDI6BJg4f6a8r15PRbIT3wg==
X-Received: by 2002:a05:6a00:ac6:b029:374:a33b:a74 with SMTP id
 c6-20020a056a000ac6b0290374a33b0a74mr1208110pfl.51.1640242059777; 
 Wed, 22 Dec 2021 22:47:39 -0800 (PST)
Received: from localhost ([2601:646:100:6be:5d75:3e6f:544f:655e])
 by smtp.gmail.com with UTF8SMTPSA id f10sm3700318pge.33.2021.12.22.22.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 22:47:39 -0800 (PST)
From: Tonis Tiigi <tonistiigi@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] linux-user: fixes for sched_ syscalls
Date: Wed, 22 Dec 2021 22:47:26 -0800
Message-Id: <20211223064728.18048-1-tonistiigi@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=tonistiigi@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 23 Dec 2021 10:02:09 -0500
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
Cc: Tonis Tiigi <tonistiigi@gmail.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset improves support for sched_* syscalls under user emulation. The 
first commit adds support for sched_g/setattr that was previously not 
implemented. There is no equivalent for these syscalls in libc, so I needed to 
redefine the struct from kernel. It can't be included directly because of 
conflict with libc sched headers.

The second commit fixes sched_g/setscheduler and sched_g/setparam, when QEMU is 
built with musl. Musl does not implement these due to conflict between what 
these functions should do in syscalls and libc 
https://git.musl-libc.org/cgit/musl/commit/?id=1e21e78bf7a5c24c217446d8760be7b7188711c2
 . I've changed it to call syscall directly what should always be the expected 
behavior for the user.

Via https://github.com/tonistiigi/binfmt/pull/70 with additional tests.

Changes v3->v2:
- Fix wrong property name for sched_flags
- Validate size parameter and handle E2BIG errors same way as kernel does. There
is one case where it can't be done completely correctly but clients should still
be able to handle it: when client sends a bigger non-zero structure than current
kernel definition we will send E2BIG with the struct size known to qemu. If now
the client sends structure with this size it may still get another E2BIG error
from the kernel if kernel is old and doesn't implement util_min/util_max. I don't
think this can be handled without making additional syscalls to kernel.

Changes v1->v2:
- Locking guest addresses for sched_attr is now based on size inputs, not local 
struct size. Also did the same for setter where I now read only the size field 
of the struct first.
- Use offsetof() when checking if optional fields are supported.
- `target_sched_attr` now uses aligned types as requested. I didn't quite 
understand why this is needed as I don't see same in kernel headers, but as 
this type uses only constant width fields and is already aligned by default it 
can't break anything.
- Fixed formatting.
- Defined own `target_sched_param` struct as requested.


Tonis Tiigi (2):
  linux-user: add sched_getattr support
  linux-user: call set/getscheduler set/getparam directly

 linux-user/syscall.c      | 134 ++++++++++++++++++++++++++++++++++----
 linux-user/syscall_defs.h |  18 +++++
 2 files changed, 139 insertions(+), 13 deletions(-)

-- 
2.32.0 (Apple Git-132)


