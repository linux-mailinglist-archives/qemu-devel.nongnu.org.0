Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F91C623F8A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 11:11:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4Sk-0002wO-8J; Thu, 10 Nov 2022 05:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4SG-0002sg-Ib
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:06:44 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4SE-0006Rv-BG
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:06:40 -0500
Received: by mail-pl1-x629.google.com with SMTP id l2so1015324pld.13
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 02:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iFBtDQl7Zs4QNi/rBhfhxEX7GtO3l+pZOD/IcrlUc2M=;
 b=b/uAefO6NGS2CX+2zId3rwVAZebhIvJVsMFDQ45kz6dAJSBz77pdqIfUkGxPfgLrPT
 3DByaSU1cxS6r5Wp05GTq19P8icgDrWivJJZ+8PKX49JVl9SOtKv4UNRkzcUPuTDtMGd
 MvTL5Z0eNX7hRfHF1Rp/4/2wKVFhLrqTqwV7+Jlx5CxPUhOojEmZFuCSVBNVajPHMFYj
 IVvf9fV4SLIvObNEbC1onVNqPICWu6/D3Zxnvn4zZp/DI1yhHNCR3da+ewD7rBmfyK31
 5v9KVP2SkYp+23iRkZfh3X9BON40qCxAnwCYgKtbkLMTLwM4yDFaB9hYk3w6qeXJ3lh6
 zkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iFBtDQl7Zs4QNi/rBhfhxEX7GtO3l+pZOD/IcrlUc2M=;
 b=yS8fYkahj9LPoNOMqB94Nsf8fWHvAV4m3G/Db2cZJKd8CZ19KBW7I1prztTf9ROP0/
 nu76V2hiOzu86SdXwnl1crhJ41Nxo4anxGp1+qH3arlHIUIG/ulLNGS1Kwrl2Y4zyEi8
 5gUcvXDE3g5O18OOxTC/ispzYWcSfOKJbiZVtd558ZCHGyDdj+3iT+MtLeJxHsFaxJqA
 ocfz6fSq2FjUUA4FD999bOGmRo4f30Bk5FARx0i3OBoXwbGdil/DCDVN3Nr8ZB90faRH
 pfOBbInN6eDHB3xeuCBhDCwqMALWD3Brt+kRb0pBhqJ3dBW4GL4Rf6vp4SLdjRAg+GmX
 4YNw==
X-Gm-Message-State: ACrzQf0JT16FZYpkBWocekRbfrZCDCBb9GOMM848Q/UmfHU2CqWgtU5B
 o868QXjHflZDG4CijVmEULmLd065anFrUYsx
X-Google-Smtp-Source: AMsMyM64unjCkddOtieb9mYt7wDlzu6lm9pILmZAFbHBkVYkKGyK5WCyrSpWYjbHMURDgoC/zmPl6g==
X-Received: by 2002:a17:902:b215:b0:187:204d:15ca with SMTP id
 t21-20020a170902b21500b00187204d15camr54209384plr.86.1668074796687; 
 Thu, 10 Nov 2022 02:06:36 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a1709027e4900b001714e7608fdsm10730780pln.256.2022.11.10.02.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 02:06:36 -0800 (PST)
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
Subject: [PATCH v2 00/10] util: Introduce qemu_get_runtime_dir()
Date: Thu, 10 Nov 2022 19:06:19 +0900
Message-Id: <20221110100629.61496-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
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

v2: rebased to the current master since Patchew complains.

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


