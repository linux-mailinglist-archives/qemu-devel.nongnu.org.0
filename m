Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC552F3734
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:32:30 +0100 (CET)
Received: from localhost ([::1]:58924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNWv-000644-I0
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:32:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNFy-0003Y6-GM
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:00 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNFw-0004qE-Ad
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:14:57 -0500
Received: by mail-ej1-x630.google.com with SMTP id n26so4579969eju.6
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wVXYg+2R3sIE2qWqVeW5gb+1ADs6d2UuCntMLONV+OQ=;
 b=SHQcnkM5UGwjnWHmN2SW0gDKN19od/mWagFh+KXkjt7JH6xBUcZFuX/9mML5eU+7bS
 9ZNeg9QXxlDohWNOKQVLsuE+u12+01qGDS6qhv9lv+2UJy8OQAXJbhUUk5Y7JddAX66y
 I/owzbg7P9BZhQMEyRt+MfxC0OmrygcvlNDUAvuWES9W1yL0ptXAXc3uEiwUaGawc1NM
 P90E+gYhYRjLr4LUwGM+me7Ol3TvU7DgZTuUZB1kj1pU25E6JvSO44kqaFCLb2O7VIxP
 aJydgH1lh4wwF0oe4moF3Kd4IJLK8IYqTYRyWFUBkF6k/5rBFZXOPx+riJrS7lJgIi+D
 eIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wVXYg+2R3sIE2qWqVeW5gb+1ADs6d2UuCntMLONV+OQ=;
 b=uBbZ5ffRWWAPxtuMNu2hg13Cu32qta59Sj/JdlgRTy818cPKuboXNQWV/pYbCQXfH8
 L0Rn6n75gIQyZbx0Mb2v8mGrVGxSQwMXj9hzj1eIKn4aM2Je+UDCXBRhIiTSVWVOcCne
 KLNRi3AklymzwDRgk2e5A630unlMyqfuyoUPBcGCINyTSYpbdfl19VTIow3gATwDVw4T
 mFfgjLQB26afDLNc2QNLkQQXVSoN42w+bGGVdC+BWgVRovuYnybUfV6n3bwwVzSyb+u5
 ixKv2G+HyNjrEs/+T07WwnJQeBZH7KQ1l6NGZqOpeE8sV0+oG8jdfAfv+5Ft7wTjN5MA
 l7Tg==
X-Gm-Message-State: AOAM5304VEd8qTjWDB7rpvdOvwA8ANTzyCxfFVvvuVWNgwN2jnuVha73
 5FlA2n67CoP1C70SgfjhqIz+i78yCnMmcA==
X-Google-Smtp-Source: ABdhPJw630uLwKfsH98FxTFxqlsdk/ULGvDCuVAArsUatfl2zamWvAnIdjYACReGlJnIumcpDYM9aQ==
X-Received: by 2002:a17:906:495b:: with SMTP id
 f27mr3922843ejt.338.1610471693414; 
 Tue, 12 Jan 2021 09:14:53 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.14.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:14:52 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/20] meson: do not use CONFIG_VIRTFS
Date: Tue, 12 Jan 2021 18:14:31 +0100
Message-Id: <20210112171450.791427-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

CONFIG_VIRTFS is not anymore part of the config_host dictionary.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 fsdev/meson.build       | 2 +-
 tests/qtest/meson.build | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/fsdev/meson.build b/fsdev/meson.build
index 7dd1cc9bfb..65455a179e 100644
--- a/fsdev/meson.build
+++ b/fsdev/meson.build
@@ -8,7 +8,7 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
 ), if_false: files('qemu-fsdev-dummy.c'))
 softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
 
-have_virtfs_proxy_helper = have_tools and libattr.found() and libcap_ng.found() and 'CONFIG_VIRTFS' in config_host
+have_virtfs_proxy_helper = have_tools and libattr.found() and libcap_ng.found() and have_virtfs
 if have_virtfs_proxy_helper
   executable('virtfs-proxy-helper',
              files('virtfs-proxy-helper.c', '9p-marshal.c', '9p-iov-marshal.c'),
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 6a67c538be..6ec09821d7 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -199,7 +199,9 @@ qos_test_ss.add(
   'virtio-serial-test.c',
   'vmxnet3-test.c',
 )
-qos_test_ss.add(when: 'CONFIG_VIRTFS', if_true: files('virtio-9p-test.c'))
+if have_virtfs
+  qos_test_ss.add(files('virtio-9p-test.c'))
+endif
 qos_test_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user-test.c'))
 
 tpmemu_files = ['tpm-emu.c', 'tpm-util.c', 'tpm-tests.c']
-- 
2.29.2



