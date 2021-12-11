Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422FF471323
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 10:26:41 +0100 (CET)
Received: from localhost ([::1]:35682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvyeN-0002zD-RP
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 04:26:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1mvs9t-0003u4-3Q
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 21:30:45 -0500
Received: from [2607:f8b0:4864:20::42c] (port=42731
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1mvs9r-0000oH-5z
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 21:30:44 -0500
Received: by mail-pf1-x42c.google.com with SMTP id u80so10017912pfc.9
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 18:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/71B6QnyiHlTY/4Cl7705W7gCkopAwJZ9Cx97YiarKQ=;
 b=pySj7k53FZ1FENpPg5UksI+vTNGKChwvUHAIu12sMvCi9K2M+dpdA0gH+0GFUt/Y4U
 82RTmbhGGICrknd34EAyjiHNBu4wtMFge5iq/mHDAc+nB6ObJByB5OT6pK4AULQ8UYPd
 nzN07peoNmQfhdHD3aR4q43DrpbfN+7gOGvfrRw5oMcyZguYnJg0CCAQ98csPwjyKbEs
 1GKlYIXj72Fa1neKpUFR+ylT/wA2pe//WLG48Y73U/2IojTfZJzOWaNaAgipbrpwssm0
 S5NBoHcio112Kh/8RREHrGMbAKZYqQgLfHbbcxdlZROjIqaNmPG/lgvz6QkS32xEf5Jn
 fuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/71B6QnyiHlTY/4Cl7705W7gCkopAwJZ9Cx97YiarKQ=;
 b=3xT9GaQOh5qIF3YbqhBY/Sx5CLH1EP54j+y1coc8g1bWQIuxly8qSMV0AKdzua3nej
 Mjbax4jvbGIK1+Tm+XanVgWuZ/j99DMVIGiyfkPYW3g6xG4J7/PvkraVRrnfhtz3/j35
 GphBtmp2kyZiQWgrfjQU8bA2AeTZ8BcqoAmbjYbu859J27IdbVtpY4YOIhHmhrT9NxpE
 cx87dx1IyVMYlvgXWXVf6sNGwnNWVDyqhdqotWkQQ8vpa4vX330RjY4cDRZp6SgH3Hvb
 eDpYw4+m90QHudLt3cMP0+JIkUKwicslXQAL6uXVZHBHDsiAJozGlfQyXL4w+t+LVqui
 p/VA==
X-Gm-Message-State: AOAM531OrDZUai0xotIGPs21X0nvhVAAuNh1QAG630Fnl3O+GAyFxFS8
 nv8IC1DnDoVK3nsTiWczrIzZssgX1ek=
X-Google-Smtp-Source: ABdhPJzlZji6Dnn4UxsUJHeWTJaHdZjgIAu/lJfuGR6R7PfW9Ot/IRuOnBug/iQEmpu1owEl1yxhcA==
X-Received: by 2002:a63:7804:: with SMTP id t4mr35612396pgc.569.1639189840801; 
 Fri, 10 Dec 2021 18:30:40 -0800 (PST)
Received: from localhost ([2601:646:100:6be:6177:c6b7:1b7d:7a95])
 by smtp.gmail.com with UTF8SMTPSA id a6sm275776pjd.40.2021.12.10.18.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 18:30:40 -0800 (PST)
From: Tonis Tiigi <tonistiigi@gmail.com>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 0/2] linux-user: fixes for sched_ syscalls
Date: Fri, 10 Dec 2021 18:27:48 -0800
Message-Id: <20211211022749.95384-1-tonistiigi@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=tonistiigi@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 11 Dec 2021 04:25:14 -0500
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
Cc: Tonis Tiigi <tonistiigi@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset improves support for sched_* syscalls under user emulation. The first commit adds support for sched_g/setattr that was previously not implemented. There is no equivalent for these syscalls in libc, so I needed to redefine the struct from kernel. It can't be included directly because of conflict with libc sched headers.

The second commit fixes sched_g/setscheduler and sched_g/setparam, when QEMU is built with musl. Musl does not implement these due to conflict between what these functions should do in syscalls and libc https://git.musl-libc.org/cgit/musl/commit/?id=1e21e78bf7a5c24c217446d8760be7b7188711c2 . I've changed it to call syscall directly what should always be the expected behavior for the user.

Via https://github.com/tonistiigi/binfmt/pull/70 with additional tests.

Tonis Tiigi (2):
  linux-user: add sched_getattr support
  linux-user: call set/getscheduler set/getparam directly

 linux-user/syscall.c      | 71 ++++++++++++++++++++++++++++++++++++---
 linux-user/syscall_defs.h | 15 +++++++++
 2 files changed, 82 insertions(+), 4 deletions(-)

-- 
2.30.1 (Apple Git-130)


