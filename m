Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B472E34FB
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 09:17:05 +0100 (CET)
Received: from localhost ([::1]:41146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktniC-00019y-IW
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 03:17:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1ktngB-00005z-Uy; Mon, 28 Dec 2020 03:14:59 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1ktngA-0004kz-Bb; Mon, 28 Dec 2020 03:14:59 -0500
Received: by mail-ej1-x62c.google.com with SMTP id x16so13212662ejj.7;
 Mon, 28 Dec 2020 00:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=BjB2kfCb9GFsRopJ/P6iE8ClJI9dh3lRoLxLzjvEO4w=;
 b=FHZlb45CN2lfXuRbxst3YZcZb5KlsLRTHxuM+6fdNq0koLLaLlTl5mh/b99QmVN0Ui
 7x/Cllc6wfdMcxO6dLDK3ANkX6PvC04c5Dp58xCLdO6f0pyWmo3UsczGJpCQt3Zg+SMo
 S/y3KOwvYze96ST+SPqNsBmhnvVbyaVhdeT31wi3ABfMCGfSde21X456K8Faz6+XzobM
 XsIL6zjyBNz29S//fNlQ99cSRU8dlZgPfbJ85nPwI1Bqr4LG4jZbtFOoCCLx6t1mtMTp
 pvpwg3h05fZS8pHoj7F7EkmGJ4CRJeub6sW0SxNE6li2bQQ87CD0UDVNdc40KfEObE9c
 HrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=BjB2kfCb9GFsRopJ/P6iE8ClJI9dh3lRoLxLzjvEO4w=;
 b=gjHtFpABLEhRsDsLLFUxlvCgJQB4oWbU1y0PEuQoAKz3dkUxSL3vjBZrNijofem4OH
 w7ZtwM62/2lxvHmK/eUqGyddnF6vguYSKri5YivVlBVcrEfMcRC7LaX5G5lEgSKAS5Ac
 xF/g+x44UBRL40N1xolyQWJ3M3KhR682ugCj0LgfTOWJ+L2WqillmniivS1/B921VIQF
 w03wVWnV+lRvQbh8UIbw53K+OLLPw6NK4juxniDdNre5BWmdu4Nbul5qL9DYhcEC13gJ
 m39FDN+Ip6jOt4/EWqf0+JP/CqnFRsZEnHICvEohs1wBZJpuCbExbPS2Q/yCPAZqHKCF
 6pbw==
X-Gm-Message-State: AOAM530BTgv8XN9IFRaTZzlIzFvn1xfKN+ztAkRP4wbiRJ9l0krWKsMZ
 DpqLcuXWodXFA9Jzwmp4wq4i1OaJdVRL1jbTgigo9E8aEj03jg==
X-Google-Smtp-Source: ABdhPJw7ybnaySpCZMCh873Se1j4xpPvw8u1ye4zjxWQ5gofi5XUlwqVwpdU41ucbrLKPpPSRLv15Kc/XHt7UzkrQzE=
X-Received: by 2002:a17:906:d10f:: with SMTP id
 b15mr40294469ejz.268.1609143295795; 
 Mon, 28 Dec 2020 00:14:55 -0800 (PST)
MIME-Version: 1.0
From: David CARLIER <devnexen@gmail.com>
Date: Mon, 28 Dec 2020 08:14:44 +0000
Message-ID: <CA+XhMqwAwa4S8FbZ5sOT152w8ystdGdndru4sTY7jUQmJ-=muw@mail.gmail.com>
Subject: [PATCH 2/2] bsd-user,
 Adding more strace support for a handful of syscalls.
To: qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=devnexen@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

---
 bsd-user/freebsd/strace.list | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/bsd-user/freebsd/strace.list b/bsd-user/freebsd/strace.list
index 2800a2d4eb..136d2c42d7 100644
--- a/bsd-user/freebsd/strace.list
+++ b/bsd-user/freebsd/strace.list
@@ -38,6 +38,13 @@
 { TARGET_FREEBSD_NR_adjtime, "adjtime", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_bind, "bind", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_break, "break", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_cap_enter, "cap_enter", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_cap_fcntls_get, "cap_fcntls_get", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_cap_fcntls_limit, "cap_fcntls_limit", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_cap_getmode, "cap_getmode", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_cap_ioctls_get, "cap_ioctls_get", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_cap_ioctls_limit, "cap_ioctls_limit", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_cap_rights_limit, "cap_rights_limit", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_chdir, "chdir", "%s(\"%s\")", NULL, NULL },
 { TARGET_FREEBSD_NR_chflags, "chflags", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_chmod, "chmod", "%s(\"%s\",%#o)", NULL, NULL },
@@ -48,6 +55,8 @@
 { TARGET_FREEBSD_NR_clock_settime, "clock_settime", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_close, "close", "%s(%d)", NULL, NULL },
 { TARGET_FREEBSD_NR_connect, "connect", "%s(%d,%#x,%d)", NULL, NULL },
+{ TARGET_FREEBSD_NR_cpuset_getdomain, "cpuset_getdomain", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_cpuset_setdomain, "cpuset_setdomain", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_dup, "dup", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_dup2, "dup2", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_eaccess, "eaccess", "%s(\"%s\",%#x)", NULL, NULL },
@@ -148,6 +157,8 @@
 { TARGET_FREEBSD_NR_pathconf, "pathconf", "%s(\"%s\", %d)", NULL, NULL },
 { TARGET_FREEBSD_NR_pipe, "pipe", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_poll, "poll", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_posix_fallocate, "posix_fallocate", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_posix_openpt, "posix_openpt", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_pread, "pread", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_preadv, "preadv", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_profil, "profil", NULL, NULL, NULL },
@@ -227,5 +238,6 @@
 { TARGET_FREEBSD_NR_utimes, "utimes", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_vfork, "vfork", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_wait4, "wait4", NULL, NULL, NULL },
+{ TARGET_FREEBSD_NR_wait4, "wait6", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_write, "write", "%s(%d,%#x,%d)", NULL, NULL },
 { TARGET_FREEBSD_NR_writev, "writev", "%s(%d,%p,%#x)", NULL, NULL },
-- 
2.30.0.rc2

