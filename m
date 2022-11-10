Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAAE623BC1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 07:25:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0zy-00015a-F6; Thu, 10 Nov 2022 01:25:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot0zv-000120-VX
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:25:12 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot0zu-0007Ap-BY
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:25:11 -0500
Received: by mail-pf1-x42b.google.com with SMTP id g62so1000558pfb.10
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 22:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z3a+uika0IuKJSzenVXCbwEeRP8jHQz1XjaRHlAccWc=;
 b=3J0mI99k88V6+rgMqq+qNiEIY4rKvJtS40pQb3MeWVpaW8r81XOqhs8EhH8U7K7U7B
 XIfXtE8bDSu8m+B5vAQcgCwmNjHzud4bFze8yP0rk+7HWnMMM9kzu84AtQ+xoX+8awFh
 rFswlS+eGrpSJ8cYUn9Mal0EetquY5+7LdJFAsD806Y91fQTyIIuCXlzjyXgPDlWVB/X
 M48TMYMVMAZRbD5LWbtp2Hx981Zfx128Tw+RSl2BHC28v2oY3hFBEFgX+/z5KcTen0n6
 ObmYKd5Z7JeJaj5jk6PbxbIqGigrh1dnl2UX0bITtOsJW2CX2Djj+UiKT3R56ovTsRvh
 unvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z3a+uika0IuKJSzenVXCbwEeRP8jHQz1XjaRHlAccWc=;
 b=mbLOICwhUQ7MgS2F++DOo5iw/G7OVYBJMTPYDJEV4zYW0OpgpzlAsmYbLRn4LLqBRU
 giNkXoEjxK2jDvDasrmSdyFg6z2KmSF1XKPUkO9SAidwWKqXPLsA0S47NGSRQgitsDcf
 yBZKup+IvF6ENDNEdgdJ92Y6OAbs8t6twFeBgu4sOPbR3T8qi8RTQZ3XPNlr5PijbMkO
 Oq8o7ZVy76o8fMmQ64iHOVgIEspuSl5HdnjkuaiovEVijD0S7GPaf8uJ53+V47u4b98G
 CagiAAlSHhFGU9slsmChy6rOYui7Ftri+gScqkbQag4VBIClajCjAPO4kKfs+fiWi8Sy
 xDFw==
X-Gm-Message-State: ANoB5pnuDl5cs9NzK3tftv/G3KIG6UOsqwt6/7nazWQ9g00Ga+zMTeU9
 YGHAkYgMmdD3pf6365Fbf5gXQxuU0Jl8f95n
X-Google-Smtp-Source: AA0mqf7zMy46AlnIqz6UVZ1c7JeK3Hq03jHcdyI70dF4sTe6/t0blrfzFFq+wSp1qxBLYYeQg1RjnA==
X-Received: by 2002:a63:2352:0:b0:470:537b:9d23 with SMTP id
 u18-20020a632352000000b00470537b9d23mr1396201pgm.185.1668061503549; 
 Wed, 09 Nov 2022 22:25:03 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a17090ade0400b002108cabbe31sm2289003pjv.9.2022.11.09.22.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 22:25:02 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, virtio-fs@redhat.com,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Yan Vugenfirer <yan@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 00/10] util: Introduce qemu_get_runtime_dir()
Date: Thu, 10 Nov 2022 15:23:19 +0900
Message-Id: <20221110062329.13363-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

qemu_get_runtime_dir() returns a dynamically allocated directory path
that is appropriate for storing runtime files. It corresponds to "run"
directory in Unix.

With a tree-wide search, it was found that there are several cases
where such a functionality is implemented so let's have one as a common
utlity function.

A notable feature of qemu_get_runtime_dir() is that it uses
$XDG_RUNTIME_DIR if available. While the function is often called by
executables which requires root privileges, it is still possible that
they are called from a user without privilege to write the system
runtime directory. In fact, I decided to write this patch when I ran
virtiofsd in a Linux namespace created by a normal user and realized
it tries to write the system runtime directory, not writable in this
case. $XDG_RUNTIME_DIR should provide a writable directory in such
cases.

This function does not use qemu_get_local_state_dir() or its logic
for Windows. Actually the implementation of qemu_get_local_state_dir()
for Windows seems not right as it calls g_get_system_data_dirs(),
which refers to $XDG_DATA_DIRS. In Unix terminology, it is basically
"/usr/share", not "/var", which qemu_get_local_state_dir() is intended
to provide. Instead, this function try to use the following in order:
- $XDG_RUNTIME_DIR
- LocalAppData folder
- get_relocated_path(CONFIG_QEMU_LOCALSTATEDIR "/run")

This function does not use g_get_user_runtime_dir() either as it
falls back to g_get_user_cache_dir() when $XDG_DATA_DIRS is not
available. In the case, we rather use:
get_relocated_path(CONFIG_QEMU_LOCALSTATEDIR "/run")

Akihiko Odaki (10):
  qga: Remove platform GUID definitions
  util: Introduce qemu_get_runtime_dir()
  ivshmem-server: Use qemu_get_runtime_dir()
  contrib/rdmacm-mux: Use qemu_get_runtime_dir()
  qga: Use qemu_get_runtime_dir()
  scsi: Use qemu_get_runtime_dir()
  virtiofsd: Use qemu_get_runtime_dir()
  module: Use qemu_get_runtime_dir()
  util: Remove qemu_get_local_state_dir()
  spice-app: Use qemu_get_runtime_dir()

 include/qemu/osdep.h           | 10 +++++++---
 contrib/ivshmem-server/main.c  | 20 ++++++++++++++++----
 contrib/rdmacm-mux/main.c      | 22 ++++++++++++++--------
 qga/commands-win32.c           |  7 -------
 qga/main.c                     |  9 ++++-----
 scsi/qemu-pr-helper.c          |  6 +++---
 tools/virtiofsd/fuse_virtio.c  |  6 +++---
 ui/spice-app.c                 |  4 ++--
 util/module.c                  |  3 ++-
 util/oslib-posix.c             |  9 +++++++--
 util/oslib-win32.c             | 24 ++++++++++++++++++++----
 contrib/rdmacm-mux/meson.build |  2 +-
 12 files changed, 79 insertions(+), 43 deletions(-)

-- 
2.38.1


