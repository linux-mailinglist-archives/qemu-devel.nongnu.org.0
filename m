Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB95B2AF05C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:17:01 +0100 (CET)
Received: from localhost ([::1]:32898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcp3c-0008Tf-OL
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:17:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcowY-0001oq-6E
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:09:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcowU-0006tO-Gi
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605096577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jbCKVEnSHecoxttJIqXX+fojEN4XVd8UbDYUk4BjIvY=;
 b=V88hZucc1XkTu448CqpM17uugPoIFbGCY9lEq/doHfqBi96xVvKBWDbw6YghZ/9kq6WQ2s
 HJ7RtO6suIDANwkI4TlOYZmgt0LlhoueE4aXu763E2Jdv3yO/eS/kn5fgSoadasiJd+7S+
 a6vvb3eynZa6aMZHimD4RjyAOrV64w4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-5W7Xh25MO3m06jzoI2ARPA-1; Wed, 11 Nov 2020 07:09:35 -0500
X-MC-Unique: 5W7Xh25MO3m06jzoI2ARPA-1
Received: by mail-wm1-f70.google.com with SMTP id y26so688253wmj.7
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 04:09:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jbCKVEnSHecoxttJIqXX+fojEN4XVd8UbDYUk4BjIvY=;
 b=gz2zUzO+qIHcaPvG+BncHJHPqGY1Y6tYGuDiwA7ezEd0c3JsDQmr+/E8e2zNW5szMq
 4h4kK1hrZ6qWkIZoFU+4DOApXGP8Gf71sojQisG1RmkE7jLePqamzSX/otPfxBQxv8ND
 fO7BrkJue9hSrvjgilL2mUE9ZFpA0/RBw0Rz645dfjrTqTM0LRIqh7+M3NdorEUihycM
 LJTXAW+BXEFaRZN8cWcBL3XIPlSfiCWY0nH6aX1AqqD+awTf7uGuHHfRBcrTTtSiLt7Y
 j0HAi2IzBc+7ACRzbMz/hk2jLEBSWPyJK1O/X6+qYduMdAieGFqiZQGDn6Jm6RYg2X0D
 nEqQ==
X-Gm-Message-State: AOAM531MPY+H8ju4DjvCIC7Ucpcvu58lJ60p/Psr67Qn+SVpk4iUScqB
 ARUsjlnXkkuR99cT5+6ZTR+xiesh4vpXZ0XdwDpu72qA/U/j4H8J6LqpDEG6ZTUJnPGpf+DFwjd
 XiKExQrrB87JtxD8LQ0LiZUtmq3nAAwUHwhFA1YULirOs0Wz5paatT6DdWaYuDlKB
X-Received: by 2002:adf:f888:: with SMTP id u8mr19155915wrp.381.1605096574237; 
 Wed, 11 Nov 2020 04:09:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQy0ISXAUNmYX31jd/nnG8+LXeh6kiFVyAF+Y451htCjF1E3ll157jLvbY6zHmwDZaD6wZtg==
X-Received: by 2002:adf:f888:: with SMTP id u8mr19155894wrp.381.1605096574064; 
 Wed, 11 Nov 2020 04:09:34 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id l24sm2401649wmi.7.2020.11.11.04.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 04:09:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 v2 4/4] configure: mark vhost-user Linux-only
Date: Wed, 11 Nov 2020 13:09:12 +0100
Message-Id: <20201111120912.3245574-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201111120912.3245574-1-philmd@redhat.com>
References: <20201111120912.3245574-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

The vhost-user protocol uses the Linux eventfd feature and is typically
connected to Linux kvm.ko ioeventfd and irqfd file descriptors. The
protocol specification in docs/interop/vhost-user.rst does not describe
how platforms without eventfd support work.

The QEMU vhost-user devices compile on other POSIX host operating
systems because eventfd usage is abstracted in QEMU. The libvhost-user
programs in contrib/ do not compile but we failed to notice since they
are not built by default.

Make it clear that vhost-user is only supported on Linux for the time
being. If someone wishes to support it on other platforms then the
details can be added to vhost-user.rst and CI jobs can test the feature
to prevent bitrot.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201110171121.1265142-4-stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index 516f28a0888..3fbc2a0c68c 100755
--- a/configure
+++ b/configure
@@ -328,7 +328,7 @@ vhost_net=""
 vhost_crypto=""
 vhost_scsi=""
 vhost_vsock=""
-vhost_user=""
+vhost_user="no"
 vhost_user_blk_server="auto"
 vhost_user_fs=""
 kvm="auto"
@@ -718,7 +718,6 @@ fi
 case $targetos in
 MINGW32*)
   mingw32="yes"
-  vhost_user="no"
   audio_possible_drivers="dsound sdl"
   if check_include dsound.h; then
     audio_drv_list="dsound"
@@ -797,6 +796,7 @@ Linux)
   audio_possible_drivers="oss alsa sdl pa"
   linux="yes"
   linux_user="yes"
+  vhost_user="yes"
 ;;
 esac
 
@@ -2341,9 +2341,8 @@ fi
 # vhost interdependencies and host support
 
 # vhost backends
-test "$vhost_user" = "" && vhost_user=yes
-if test "$vhost_user" = "yes" && test "$mingw32" = "yes"; then
-  error_exit "vhost-user isn't available on win32"
+if test "$vhost_user" = "yes" && test "$linux" != "yes"; then
+  error_exit "vhost-user is only available on Linux"
 fi
 test "$vhost_vdpa" = "" && vhost_vdpa=$linux
 if test "$vhost_vdpa" = "yes" && test "$linux" != "yes"; then
-- 
2.26.2


