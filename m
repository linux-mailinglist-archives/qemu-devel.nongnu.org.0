Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C641585ADD
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 16:52:41 +0200 (CEST)
Received: from localhost ([::1]:45038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHnpY-0007Kf-9g
	for lists+qemu-devel@lfdr.de; Sat, 30 Jul 2022 10:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oHnng-0004Y0-Tm
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 10:50:44 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:38867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oHnnf-0007ZJ-AI
 for qemu-devel@nongnu.org; Sat, 30 Jul 2022 10:50:44 -0400
Received: by mail-pl1-x62d.google.com with SMTP id o3so6919424ple.5
 for <qemu-devel@nongnu.org>; Sat, 30 Jul 2022 07:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=scpOONBlO/op/jp9R/m/ziVwF3W+LamRdLFwD6uTZOQ=;
 b=G8xWIXY3/+tfk5D8Q2KgVRXD/DPiRPr6Hvks/y0HQiuI6PBxce7IOf0a3TsOeyx9Z+
 B75JBUeISoPgaiLGjXtTkXQ78+zmEJ3qWuWDS/uwpydJCCHgqFGYwJS9RotEdP9/vL+j
 ae+cRdgLhosgr0mecCEn0SjX0JBdzxP48jQvCJwrAWA7GVtwLrnPrufFkVydYQAiuW3s
 bJnGginReGqBdOvst0tpD4YqQli2jbL80UZYbRoxf9PX1Mz78jpZRUlIbNDK6FWkNMuL
 qZaw6t+GN6YWeHnUBWRGj6R4R2HA5lRo1HOUv3nfeMPQ+HHPGqFJz6TyF54IWUchKNtq
 N78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=scpOONBlO/op/jp9R/m/ziVwF3W+LamRdLFwD6uTZOQ=;
 b=DD2I6OGvhGCeVJH63PEhJ7MrS4JgTcRcbR8GP6brgUqINYNL6s1iardZgrXtFYl1Ft
 3K/tJlbsQiCqcPBFKeIzk+GOzZKhAYUnjo+IKj9lZUHp2zki8pMtXC/nYk6PgzG7vEK5
 pb/Py3hVdPHGBeT4Uh3gb43RhiLcstS9DBBY+2s8L0qDOXwiTISlq8E8kQZdXKps9PA+
 cYXJl/8R0gNdAsGZzt5bKu5KO2s/s6IpnRF34Sa0ixBgz2nr3VundBaiSEdi0ixLbwur
 2zN8mRoDmBo/raz90VthfjapFVrU8P62hIyFkomOjD/B/T2FDBiuUxe1qvkOS2jIeHi/
 lehA==
X-Gm-Message-State: ACgBeo3TLtNBNCcNzCxGpeYXzLlaJ4TSlAacvD3tQwMOrTEneG0Ks0uw
 wn7cG2M+FajCaTkM8y643Nr0spVdSsY=
X-Google-Smtp-Source: AA6agR6twWMWh2m5fK/FvLPqiZEjFUIxabLBg92eFSRrkWHlgGL+GKnA86n8FL6if724ND6drYdWvQ==
X-Received: by 2002:a17:90b:1805:b0:1f4:e294:d328 with SMTP id
 lw5-20020a17090b180500b001f4e294d328mr1312439pjb.25.1659192641409; 
 Sat, 30 Jul 2022 07:50:41 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 x11-20020aa78f0b000000b00525343b5047sm4882499pfr.76.2022.07.30.07.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jul 2022 07:50:40 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>
Subject: [PATCH v3 0/4] Enable unix socket support on Windows
Date: Sat, 30 Jul 2022 22:50:32 +0800
Message-Id: <20220730145036.865854-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Support for the unix socket has existed both in BSD and Linux for the
longest time, but not on Windows. Since Windows 10 build 17063 [1],
the native support for the unix socket has come to Windows. Starting
this build, two Win32 processes can use the AF_UNIX address family
over Winsock API to communicate with each other.

[1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/

Changes in v3:
- drop patch "util/oslib-win32: Add a helper to get the Windows version"
- drop patch "qga/commands-win32: Use os_get_win_version()"
- drop the run-time check afunix_available()

Changes in v2:
- move #include <afunix.h> to os-win32.h
- define WIN_BUILD_AF_UNIX only when CONFIG_WIN32
- drop #include <afunix.h> as it is now already included in osdep.h
- new patch: tests/unit: Update test-io-channel-socket.c for Windows

Bin Meng (4):
  util/qemu-sockets: Replace the call to close a socket with
    closesocket()
  util/qemu-sockets: Enable unix socket support on Windows
  chardev/char-socket: Update AF_UNIX for Windows
  tests/unit: Update test-io-channel-socket.c for Windows

 meson.build                         |  6 ++++++
 include/sysemu/os-win32.h           |  4 ++++
 chardev/char-socket.c               |  4 +++-
 tests/unit/test-io-channel-socket.c | 16 ++++++++++++++--
 util/qemu-sockets.c                 | 18 +++++++++---------
 5 files changed, 36 insertions(+), 12 deletions(-)

-- 
2.34.1


