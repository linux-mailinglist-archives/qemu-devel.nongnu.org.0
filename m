Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3B547B519
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:24:33 +0100 (CET)
Received: from localhost ([::1]:54290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQ92-0005p2-VR
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:24:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1mzL9T-0001bB-Ku
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 11:04:39 -0500
Received: from [2607:f8b0:4864:20::62b] (port=45923
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1mzL9L-0001bC-8U
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 11:04:36 -0500
Received: by mail-pl1-x62b.google.com with SMTP id w24so8448446ply.12
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 08:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ayiHIV6TGf8UWRSqRpwOyHyQq8frzSURVF8h7FcI+MQ=;
 b=EsUQxgNvCsrmoYBup+mR3YTH5cZIEnRAZ/KmIgLxSfUlwz60XGoL5eK5PjEoH5DwUk
 Xv2VtGUE4uj2H0xbQRFg0b96oZXuj1OMoEXPMg/xZ351TGXiZNxDOTAvzKaZqwiVNCxW
 0ykbXy+cWDerf8WGlNs5b8Ym0w9Z7k3Dss+8FQ/6V96ruQOClxLqH4CIhXAaTqKVcc68
 ArTczTD8UiQw63+S2DfPPfwNf9/o4x822gxN0KdfuIshQLydy3+JlBLoe2l4yaVq3TRH
 OK+x9o0pK1NGhCLfZko7Htbk9Dn1SoxANBQ3J4F9VzYM4qbnC5x0n9hnrkPTyNmES2wM
 SKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ayiHIV6TGf8UWRSqRpwOyHyQq8frzSURVF8h7FcI+MQ=;
 b=QQFi2EitYcRwID2Wh0S0CYgsFnvsFPgRB7mYSCcaz+IIyNZXsq3yN2NlUP0J3laeKj
 JKfcueRD+OWeyS7CQQ2EeMuwftit2mKVimHW0gozp9zic0qgGxgu3ZFhDiJGG+Wm41lj
 FU1nKvANShxwWLDY3fP8iRPl9sOhaZ7hCfLHFjVy9TkdSyNDaNTCtVWOlNNqWkJD2hSV
 XhQtNFzKeO+gBfBTws37ojdfyW0i9uMPQZcA8nno9GmI/j04n0Z3X7qb41BZRLlsGAja
 Mbp92MgIgsCUOZQCAR/TRNj70myXykWibox6lBTFUopemOCixNamNK9rU3oUUXjkr6S9
 IN8g==
X-Gm-Message-State: AOAM533UAAfwjHdxlV7FAk1cNUjo7yaLW3PUsGrEvRj3Azw+0/8lavLM
 e5oxw08q4zVfNbvegyJi2ayvaZRdan/dhw==
X-Google-Smtp-Source: ABdhPJzKiRdMkyuE2UFTgrvqyqKSs2bQ4JfAl+W4on1vnL1EKECS1Z7pI7ojc13rpUjlnN9oVS0MqQ==
X-Received: by 2002:a17:902:8e85:b0:142:7621:e3b3 with SMTP id
 bg5-20020a1709028e8500b001427621e3b3mr15617112plb.84.1639984890352; 
 Sun, 19 Dec 2021 23:21:30 -0800 (PST)
Received: from localhost ([2601:646:100:6be:144b:f686:1c59:8e87])
 by smtp.gmail.com with UTF8SMTPSA id o124sm17045062pfb.177.2021.12.19.23.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Dec 2021 23:21:30 -0800 (PST)
From: Tonis Tiigi <tonistiigi@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] linux-user: fixes for sched_ syscalls
Date: Sun, 19 Dec 2021 23:21:03 -0800
Message-Id: <20211220072105.48860-1-tonistiigi@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=tonistiigi@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Dec 2021 16:21:25 -0500
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

This patchset improves support for sched_* syscalls under user emulation. The first commit adds support for sched_g/setattr that was previously not implemented. There is no equivalent for these syscalls in libc, so I needed to redefine the struct from kernel. It can't be included directly because of conflict with libc sched headers.

The second commit fixes sched_g/setscheduler and sched_g/setparam, when QEMU is built with musl. Musl does not implement these due to conflict between what these functions should do in syscalls and libc https://git.musl-libc.org/cgit/musl/commit/?id=1e21e78bf7a5c24c217446d8760be7b7188711c2 . I've changed it to call syscall directly what should always be the expected behavior for the user.

Via https://github.com/tonistiigi/binfmt/pull/70 with additional tests.

Changes v1->v2:
- Locking guest addresses for sched_attr is now based on size inputs, not local struct size. Also did the same for setter where I now read only the size field of the struct first.
- Use offsetof() when checking if optional fields are supported.
- `target_sched_attr` now uses aligned types as requested. I didn't quite understand why this is needed as I don't see same in kernel headers, but as this type uses only constant width fields and is already aligned by default it can't break anything.
- Fixed formatting.
- Defined own `target_sched_param` struct as requested.

Tonis Tiigi (2):
  linux-user: add sched_getattr support
  linux-user: call set/getscheduler set/getparam directly

 linux-user/syscall.c      | 112 +++++++++++++++++++++++++++++++++-----
 linux-user/syscall_defs.h |  18 ++++++
 2 files changed, 117 insertions(+), 13 deletions(-)

-- 
2.32.0 (Apple Git-132)


