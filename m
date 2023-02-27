Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B038F6A48C4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:58:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhix-0003NW-Nf; Mon, 27 Feb 2023 12:55:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhiv-0003M9-VD
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhit-0004MR-Mi
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677520539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gIwbMgGg/z0qrtSGDWN73PZ/Y2ln53R9IcwfzKwA/y8=;
 b=KxLhcl1cMAYzGSpwCsB5WnMbROM4PFfyrpHvyCtTiILfKpupPl3nHTDdwAUpDufekmaa80
 0hHDNEu7EG8ZOnMO6A+AxjC7fFoMvW/IIDX2rPG/9cf3CpW0LBtYBiWZmNrjnT3N3oZIAL
 7gOQoBPNjAGbOoq5+uu4zBq89blt/1U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-124-YOFPKcXeNHKlLCtIgb1JTA-1; Mon, 27 Feb 2023 12:55:37 -0500
X-MC-Unique: YOFPKcXeNHKlLCtIgb1JTA-1
Received: by mail-ed1-f69.google.com with SMTP id
 ee6-20020a056402290600b004ad51f8fc36so9827806edb.22
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 09:55:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gIwbMgGg/z0qrtSGDWN73PZ/Y2ln53R9IcwfzKwA/y8=;
 b=ZsCPar5si6qbH7rljEe/Dien6+/US6kHpI2vdSZuj9W2TeZ2p8HX1sLll8WPAX9WTC
 MkbrLXTt4e9XBOjburrEWpQyCHoBWO6/Ca4Th+drPUawj0T8mGK/shoHFtB/LYJLIPuF
 jnL4GBeQkN5wLXUgIfc81Rt0ik1ju6I1NLSbY+QC/80PnGIsd5DgBGGt0FpWQeblBQgc
 c5B1u3n+88NPRIUh/YW65+jh8I0DuGsMG3lPrQSXckV8x+UGFCfgyzEYHS5bxYzCRiFT
 VbIpt4Iin0K2PU7Gwmih5jFhil6FsGaQMO8j3IAZ2x0fzXSOzd4gBLmrT+E5T3PwCNRb
 bK/g==
X-Gm-Message-State: AO0yUKWuq/guGZYKXM6x8Z05LTvXmEnh54uEQN0B/WaaY1KQym+7Nith
 6fMVkbpAVGWSuT/gw5FPktCzCvSYaiB8et8itl7YhNTLb3Mkrz8BQt+CIQU3qO751kJyTZGFJjG
 HwCqp+EoIqf6TPXEXMaSCfjtLERaM2wWXz0RNL17TMFIaAYeeQKtIVSt8/c0E7kFXujI08TGv
X-Received: by 2002:a17:906:d8c9:b0:878:7cf3:a9e7 with SMTP id
 re9-20020a170906d8c900b008787cf3a9e7mr33794438ejb.65.1677520535712; 
 Mon, 27 Feb 2023 09:55:35 -0800 (PST)
X-Google-Smtp-Source: AK7set9sK2olTUqg77TRstKqf6fdE9QjGCd9PdF1+uruxTRIUe+WC6MbR7ufiw5cvT/amwc/O1B3Xg==
X-Received: by 2002:a17:906:d8c9:b0:878:7cf3:a9e7 with SMTP id
 re9-20020a170906d8c900b008787cf3a9e7mr33794418ejb.65.1677520535301; 
 Mon, 27 Feb 2023 09:55:35 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170906230d00b008d1dc5f5692sm3484038eja.76.2023.02.27.09.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:55:34 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>
Subject: [PULL 03/13] meson: stop looking for 'sphinx-build-3'
Date: Mon, 27 Feb 2023 18:55:14 +0100
Message-Id: <20230227175524.710880-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227175524.710880-1-pbonzini@redhat.com>
References: <20230227175524.710880-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: John Snow <jsnow@redhat.com>

Once upon a time, "sphinx-build" on certain RPM platforms invoked
specifically a Python 2.x version, while "sphinx-build-3" was a distro
shim for the Python 3.x version.

These days, none of our supported platforms utilize a 2.x version, and
those that still have 'sphinx-build-3' make it a symbolic link to
'sphinx-build'.  Not searching for 'sphinx-build-3' will prefer
pip/venv installed versions of sphinx if they're available.

This adds an extremely convenient ability to test document building
ability in QEMU across multiple versions of Sphinx for the purposes of
compatibility testing.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20230221012456.2607692-6-jsnow@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/meson.build              | 9 ++-------
 meson_options.txt             | 2 +-
 scripts/meson-buildoptions.sh | 1 +
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/docs/meson.build b/docs/meson.build
index bbcdccce68a8..bb72c10ea8c5 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -1,10 +1,5 @@
-if get_option('sphinx_build') == ''
-  sphinx_build = find_program(['sphinx-build-3', 'sphinx-build'],
-                              required: get_option('docs'))
-else
-  sphinx_build = find_program(get_option('sphinx_build'),
-                              required: get_option('docs'))
-endif
+sphinx_build = find_program(get_option('sphinx_build'),
+                            required: get_option('docs'))
 
 # Check if tools are available to build documentation.
 build_docs = false
diff --git a/meson_options.txt b/meson_options.txt
index 6b0900205ea7..fc9447d267bf 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -12,7 +12,7 @@ option('pkgversion', type : 'string', value : '',
        description: 'use specified string as sub-version of the package')
 option('smbd', type : 'string', value : '',
        description: 'Path to smbd for slirp networking')
-option('sphinx_build', type : 'string', value : '',
+option('sphinx_build', type : 'string', value : 'sphinx-build',
        description: 'Use specified sphinx-build for building document')
 option('iasl', type : 'string', value : '',
        description: 'Path to ACPI disassembler')
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 5d969a94c08e..009fab151571 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -55,6 +55,7 @@ meson_options_help() {
   printf "%s\n" '  --localstatedir=VALUE    Localstate data directory [/var/local]'
   printf "%s\n" '  --mandir=VALUE           Manual page directory [share/man]'
   printf "%s\n" '  --sphinx-build=VALUE     Use specified sphinx-build for building document'
+  printf "%s\n" '                           [sphinx-build]'
   printf "%s\n" '  --sysconfdir=VALUE       Sysconf data directory [etc]'
   printf "%s\n" '  --tls-priority=VALUE     Default TLS protocol/cipher priority string'
   printf "%s\n" '                           [NORMAL]'
-- 
2.39.1


