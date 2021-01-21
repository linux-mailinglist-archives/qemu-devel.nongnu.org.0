Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B19F2FE6F0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 11:01:04 +0100 (CET)
Received: from localhost ([::1]:44778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Wlz-0006xN-Fs
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 05:01:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2Whf-00029v-H1
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:56:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2Whd-0007cZ-Cp
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:56:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611222992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SjsHBumFOzDTtSGmwqxy73OZ0MrE7P1Szrnp+qipcy8=;
 b=AOfqvq7TBCGQcr/m2E6OQxNOzpqZr9rhFczknJrN37Rhu6k3cxqiJjiIxk+5RITiLSrP9R
 2nwhs7c4IA/QjuP1xQ2VQZyf5FsXbNBQv5SLShLksddN4ZILP06yAMJyIgM1E5LqG1nOsm
 eRoJT5cR0D+kke6mAlZnpXjpcbtAFwA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-_SoWm6vcPEiSYPgWC7xfwQ-1; Thu, 21 Jan 2021 04:56:30 -0500
X-MC-Unique: _SoWm6vcPEiSYPgWC7xfwQ-1
Received: by mail-ej1-f71.google.com with SMTP id rl8so546242ejb.8
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 01:56:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SjsHBumFOzDTtSGmwqxy73OZ0MrE7P1Szrnp+qipcy8=;
 b=Ney4xmmqJm0WhSW/FYeof9UZrSJOsB76kiOueCywHOSlwmkb/V9IZ3keGwIuDmSNed
 qw6po/zhzAaS2KPOohYQbjv2hrT2nyy6NVty7A3SbudLG1gftX15185m1kWK4pLniM80
 9p/FwFZEmcdcSHHV+fJomcTl8XKjmE8rq2la1gLD7JmE2/DK9EnLteoGJG0mfMjU2G7W
 o9u6a1yeBsW+V0agQu2KOqQCN1w58bnS5uygShB2j5vh2r+mGpmokE0I6poNJZpyCm6i
 3kse/WqiovKFehv3AbhoI/OdeZRzG0UFoLK9AQ+HIL1bj/hBf9RfYbdHg/wz5U3eXHLA
 Dajg==
X-Gm-Message-State: AOAM530oXuMcMVCfoE9z1ilYOiu0L0XE/8s9snTp5BLUqX8RPe3zF1WS
 W0Hd59bNJjg4zEIHt3O5r5UBXZVuOMIP2xunAKY7pg820bRgBRv72nqhPNXhWGAC6szhmPY+CJW
 wO7fSmeNoPoW8yxlOiadmCNty/KQZer3CgYi3EZ/jZ2NCDDHsF7eC9hW46kh2FshC
X-Received: by 2002:a50:85c4:: with SMTP id q4mr1695349edh.7.1611222989355;
 Thu, 21 Jan 2021 01:56:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJqTJeqLX6eSaxv8dSNnAwYDjbLc/HkFtM/mgTHMq+ox3KcYuusP8hJxPGuca44FJvB+0dnQ==
X-Received: by 2002:a50:85c4:: with SMTP id q4mr1695336edh.7.1611222989157;
 Thu, 21 Jan 2021 01:56:29 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id j18sm2006332ejv.18.2021.01.21.01.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 01:56:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] meson: Display host binaries information altogether
Date: Thu, 21 Jan 2021 10:56:10 +0100
Message-Id: <20210121095616.1471869-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210121095616.1471869-1-philmd@redhat.com>
References: <20210121095616.1471869-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/meson.build b/meson.build
index a47c5f8ab9d..614eef82c37 100644
--- a/meson.build
+++ b/meson.build
@@ -2305,8 +2305,22 @@
 summary_info += {'GIT submodules':    config_host['GIT_SUBMODULES']}
 summary(summary_info, bool_yn: true, section: 'Directories')
 
+# Host binaries
+summary_info = {}
+summary_info += {'git':               config_host['GIT']}
+summary_info += {'make':              config_host['MAKE']}
+summary_info += {'python':            '@0@ (version: @1@)'.format(python.full_path(), python.language_version())}
+summary_info += {'sphinx-build':      sphinx_build.found()}
+if config_host.has_key('HAVE_GDB_BIN')
+  summary_info += {'gdb':             config_host['HAVE_GDB_BIN']}
+endif
+summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
+if slirp_opt != 'disabled'
+  summary_info += {'smbd':            config_host['CONFIG_SMBD_COMMAND']}
+endif
+summary(summary_info, bool_yn: true, section: 'Host binaries')
+
 summary_info = {}
-summary_info += {'GIT binary':        config_host['GIT']}
 summary_info += {'C compiler':        meson.get_compiler('c').cmd_array()[0]}
 summary_info += {'Host C compiler':   meson.get_compiler('c', native: true).cmd_array()[0]}
 if link_language == 'cpp'
@@ -2332,15 +2346,8 @@
 endif
 summary_info += {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
 summary_info += {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
-summary_info += {'make':              config_host['MAKE']}
-summary_info += {'python':            '@0@ (version: @1@)'.format(python.full_path(), python.language_version())}
-summary_info += {'sphinx-build':      sphinx_build.found()}
-summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
 # TODO: add back version
 summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
-if slirp_opt != 'disabled'
-  summary_info += {'smbd':            config_host['CONFIG_SMBD_COMMAND']}
-endif
 summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
 if config_host.has_key('CONFIG_MODULES')
   summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
@@ -2506,9 +2513,6 @@
 summary_info += {'default devices':   get_option('default_devices')}
 summary_info += {'plugin support':    config_host.has_key('CONFIG_PLUGIN')}
 summary_info += {'fuzzing support':   config_host.has_key('CONFIG_FUZZ')}
-if config_host.has_key('HAVE_GDB_BIN')
-  summary_info += {'gdb':             config_host['HAVE_GDB_BIN']}
-endif
 summary_info += {'thread sanitizer':  config_host.has_key('CONFIG_TSAN')}
 summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
-- 
2.26.2


