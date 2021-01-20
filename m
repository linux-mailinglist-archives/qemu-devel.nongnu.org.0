Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540952FD6DF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:28:07 +0100 (CET)
Received: from localhost ([::1]:35524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HH4-000372-22
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:28:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l2HCZ-0008Ej-R2
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:23:27 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:33437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l2HCY-0000ff-7X
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:23:27 -0500
Received: by mail-ej1-x635.google.com with SMTP id by1so28198291ejc.0
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 09:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Msz1sMB4bTwqcsO5WO2Wr43HiWqezo87K418fFIMcvU=;
 b=UgHuNZRRROEZvBHu2IjvDG8ieBXQFoZfLP4imDJHWA2nTcwdKeBqfYjnwDJ6hm1U3K
 oNHMCKzLOfNUqWuWwQvAaRNArDEHehAaIygevU59wAEcAK8CPtsDU1uKhltxMV0vQH//
 3fnJbjujFJ9EXcsuDNIyHVotNLNUWshD89U9kjk0J3Rrg/u1RlBjkfcwtLZLNt4hqd//
 OXx9g7dl9sIpKcqbO1vpR2jXacPNzSSRKK+uJmXfbC9WhPgqyXdGBiI3bvrxqidi7jXB
 JFGcfajZ0ineM3gdJZtUl1vwe/5+BLE0RsruvF7RFaQ5hmYXw2N9eGwVN69ActDwWmSj
 wbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Msz1sMB4bTwqcsO5WO2Wr43HiWqezo87K418fFIMcvU=;
 b=OWOBMYdND5GRiyhoOOuH+5W9z75rbudl/SjVuResl3+LojszMESnWrzyPSz9laVgiu
 FGKvySFBJG6UqG7IcRe2ughuJAddrUIlOJVog/wL7aFQFlocpjXIUosGsOkWClV0WZKD
 Jd+ZJmaafHKCa/4Of1HqUr3Z8X/XCRj3+c9y02zQN9pOdKrSx/3Ny+k3TOMNHOExxy6V
 Wk+c8fbOk749Jm66Ahv2Ct3otfD+3deI2nfrEHe7jvVGttlMHmU9w49PJnY2G/RN2rKc
 AKQ9DSuohuHpoX5BLVxW5Q8OHCZu85kmysxTXl/X8LoPFxlHxEjEFpMauibMmbYXZzSq
 BHyg==
X-Gm-Message-State: AOAM532B/vIRUoMye1Ppmv+vLY7SeO4qCkT/B61+/fLBKrCgwU1tZy8N
 mfBzFLEP95YhPYZIY/sW5YQhVe5/yRlkCg==
X-Google-Smtp-Source: ABdhPJx+nUEyyaLIGELajDA6BOA12qRuao9UmJn/kl6w9ICDWySnGWDbDSvIoKtjZcp1WVtYlMgAig==
X-Received: by 2002:a17:906:1701:: with SMTP id
 c1mr6688398eje.395.1611163404267; 
 Wed, 20 Jan 2021 09:23:24 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zk10sm1184007ejb.10.2021.01.20.09.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 09:23:23 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] meson: split the summary in multiple sections
Date: Wed, 20 Jan 2021 18:23:20 +0100
Message-Id: <20210120172320.26742-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120172320.26742-1-pbonzini@redhat.com>
References: <20210120172320.26742-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 75ce835d48..3d2ac1a399 100644
--- a/meson.build
+++ b/meson.build
@@ -2238,9 +2238,8 @@ endif
 # Configuration summary #
 #########################
 
-summary_info = {}
-
 # Generic information
+summary_info = {}
 summary_info += {'Install prefix':    get_option('prefix')}
 summary_info += {'BIOS directory':    qemu_datadir}
 summary_info += {'firmware path':     get_option('qemu_firmwarepath')}
@@ -2263,8 +2262,10 @@ summary_info += {'GIT binary':        config_host['GIT']}
 summary_info += {'GIT submodules':    config_host['GIT_SUBMODULES']}
 summary_info += {'Documentation':     build_docs}
 summary_info += {'Install blobs':     get_option('install_blobs')}
+summary(summary_info, bool_yn: true)
 
 # Compilation information
+summary_info = {}
 summary_info += {'host CPU':          cpu}
 summary_info += {'host endianness':   build_machine.endian()}
 summary_info += {'C compiler':        meson.get_compiler('c').cmd_array()[0]}
@@ -2322,8 +2323,10 @@ if targetos == 'windows'
     summary_info += {'Windows SDK':       config_host['WIN_SDK']}
   endif
 endif
+summary(summary_info, bool_yn: true, section: 'Compilation')
 
 # Host binaries
+summary_info = {}
 summary_info += {'make':              config_host['MAKE']}
 summary_info += {'python':            '@0@ (version: @1@)'.format(python.full_path(), python.language_version())}
 summary_info += {'sphinx-build':      sphinx_build.found()}
@@ -2337,8 +2340,10 @@ if slirp_opt != 'disabled'
   summary_info += {'smbd':            config_host['CONFIG_SMBD_COMMAND']}
 endif
 summary_info += {'sparse enabled':    sparse.found()}
+summary(summary_info, bool_yn: true, section: 'Host binaries')
 
 # Targets and accelerators
+summary_info = {}
 summary_info += {'target list':       ' '.join(target_dirs)}
 
 if have_system
@@ -2356,8 +2361,10 @@ if config_all.has_key('CONFIG_TCG')
   summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
   summary_info += {'TCG interpreter':   tcg_arch == 'tci'}
 endif
+summary(summary_info, bool_yn: true, section: 'Targets')
 
 # Block layer
+summary_info = {}
 summary_info += {'block layer':       have_block}
 if have_block
   summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
@@ -2374,6 +2381,7 @@ if have_block
   summary_info += {'parallels support': config_host.has_key('CONFIG_PARALLELS')}
   summary_info += {'sheepdog support':  config_host.has_key('CONFIG_SHEEPDOG')}
 endif
+summary(summary_info, bool_yn: true, section: 'Block device support')
 
 # Features
 summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
@@ -2411,8 +2419,10 @@ summary_info += {'Trace backends':    config_host['TRACE_BACKENDS']}
 if config_host['TRACE_BACKENDS'].split().contains('simple')
   summary_info += {'Trace output file': config_host['CONFIG_TRACE_FILE'] + '-<pid>'}
 endif
+summary(summary_info, bool_yn: true, section: 'Configurable features')
 
 # Libraries
+summary_info = {}
 if targetos == 'darwin'
   summary_info += {'Cocoa support':   cocoa.found()}
 endif
@@ -2492,7 +2502,7 @@ summary_info += {'libudev':           libudev.found()}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
 summary_info += {'FUSE exports':      fuse.found()}
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
-summary(summary_info, bool_yn: true)
+summary(summary_info, bool_yn: true, section: 'Dependencies')
 
 if not supported_cpus.contains(cpu)
   message()
-- 
2.29.2


