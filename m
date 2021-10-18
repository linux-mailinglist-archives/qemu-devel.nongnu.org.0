Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C37432757
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:12:52 +0200 (CEST)
Received: from localhost ([::1]:45638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcY43-0000JI-A1
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtP-00080I-5H
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:52 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:39444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtN-0001fZ-5F
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:50 -0400
Received: by mail-il1-x12c.google.com with SMTP id w11so15963307ilv.6
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g/r2gH9ObhuBG8UYqMNl21ZIK0oU8t5H0kqWj19D/1o=;
 b=o2zOtUviB1fCfdTmco3fi+/U+2wEh8r4c4vPhMn7GAqK/vxpbtHtrnL+Tb47eTLabS
 EK+dUIVSq7eyk0eZxRpM56tUSycQUnkqAeF2RqR4RnnEvDSrrsLSegXLi8luzMLfrdDU
 n8kdx/lZlOCU8KkuWrrZ8Ayg/ZRkaHnaKjoV+6tN/IaqPmHHRj1Db3zQUitROteu306i
 vOfv1KCln5EyELrYtEv+9BWBqIEtBAOU9cvzpeGfXL+GCOaBSTA475KMkPnJh6j14GdP
 pl6OXF+LCdY2dWF3VydAdLe2LTxV1dWwPoxdaW/AxDFDPp9IggK2ja6b8Dkpuab9sxnG
 e9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g/r2gH9ObhuBG8UYqMNl21ZIK0oU8t5H0kqWj19D/1o=;
 b=g9j7X/lrrFQ4vwdtPdpMWCNvpibIR5RpHBczNslhKpGzQkwSheiEpQkVz4zgdhJ4QI
 AxPS8DYiVlRkf9zJ3THA8SdIcpGQB/pVFH2Y6uqIwhyMpys/ijiRl08PO1CKTjWzMbeW
 ZSMAjZczgh5O4SdSRYrhL7rpjv2TLNgYT0psTz8cCp9/h9DzNPb/ri7i7KREwvAEt9xi
 3ljAYQ2gkZkdGIuxqjEJzbCglBp4EFq8QGSe0KH9BcivS8icHxZhOAyhQl+42l/jISjn
 lm2synF/EsOFm4tfSns81zXspNmkFvK0BRLHuQNSPG9Bt86oZqigCPYkWvIJv3fVorZz
 7D1w==
X-Gm-Message-State: AOAM532LQ25lf5CQE7nsK6lSXoYJfkg0MWA6obN5oixDzuElbanxXeC8
 wMTq1kLTnFunceQQcDVOpgcAjNkWq0hGXw==
X-Google-Smtp-Source: ABdhPJy2Z82SZgu/kmN563QSmST3riglhw+v3AKCe6H9EtDPsfSfxlY7IVg8GV3ZroxGo9iPLpmncA==
X-Received: by 2002:a05:6e02:1ba8:: with SMTP id
 n8mr14671133ili.74.1634583707854; 
 Mon, 18 Oct 2021 12:01:47 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:01:47 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 10/23] meson: *-user: only descend into *-user when
 configured
Date: Mon, 18 Oct 2021 13:01:02 -0600
Message-Id: <20211018190115.5365-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@FreeBSD.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzinni@redhat.com>, Warner Losh <wlosh@bsdimp.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To increase flexibility, only descend into *-user when that is
configured. This allows *-user to selectively include directories based
on the host OS which may not exist on all hosts. Adopt Paolo's
suggestion of checking the configuration in the directories that know
about the configuration.

Message-Id: <20210926220103.1721355-2-f4bug@amsat.org>
Message-Id: <20210926220103.1721355-3-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Warner Losh <wlosh@bsdimp.com>
Acked-by: Paolo Bonzini <pbonzinni@redhat.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/meson.build   |  4 ++++
 linux-user/meson.build |  4 ++++
 meson.build            | 12 ++++++++----
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 0369549340..5378f56f71 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -1,3 +1,7 @@
+if not have_bsd_user
+   subdir_done()
+endif
+
 bsd_user_ss.add(files(
   'bsdload.c',
   'elfload.c',
diff --git a/linux-user/meson.build b/linux-user/meson.build
index 9549f81682..bf62c13e37 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -1,3 +1,7 @@
+if not have_linux_user
+   subdir_done()
+endif
+
 linux_user_ss.add(files(
   'elfload.c',
   'exit.c',
diff --git a/meson.build b/meson.build
index 6b7487b725..5e7946776d 100644
--- a/meson.build
+++ b/meson.build
@@ -40,12 +40,15 @@ config_host_data = configuration_data()
 genh = []
 
 target_dirs = config_host['TARGET_DIRS'].split()
-have_user = false
+have_linux_user = false
+have_bsd_user = false
 have_system = false
 foreach target : target_dirs
-  have_user = have_user or target.endswith('-user')
+  have_linux_user = have_linux_user or target.endswith('linux-user')
+  have_bsd_user = have_bsd_user or target.endswith('bsd-user')
   have_system = have_system or target.endswith('-softmmu')
 endforeach
+have_user = have_linux_user or have_bsd_user
 have_tools = 'CONFIG_TOOLS' in config_host
 have_block = have_system or have_tools
 
@@ -2595,10 +2598,11 @@ subdir('bsd-user')
 subdir('linux-user')
 subdir('ebpf')
 
-bsd_user_ss.add(files('gdbstub.c'))
+common_ss.add(libbpf)
+
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
 
-linux_user_ss.add(files('gdbstub.c', 'thunk.c'))
+linux_user_ss.add(files('thunk.c'))
 specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
 
 # needed for fuzzing binaries
-- 
2.32.0


