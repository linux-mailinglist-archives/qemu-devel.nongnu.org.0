Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0901B3BC15F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:08:10 +0200 (CEST)
Received: from localhost ([::1]:39726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0R8i-0004o5-UF
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1J-0001IF-Io
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:29 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1H-0003d2-V8
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:29 -0400
Received: by mail-wr1-x435.google.com with SMTP id t6so12727596wrm.9
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fDz5tkFjEMWh1jGsn5Uv286sF3P/RJ6lk3yQfzYfsNw=;
 b=mrJbchMfqHFi46ClnHhABEfAY9MzibNznPdIKtoPgJr3VnD7WdK33E8WfcpmkBjtHB
 n3x3TR30k84pbZ+kxhcrhjv5MgtyzgbZGDOctttgMjcdVznwDkljydifgdmZ59I9QOpz
 a1CppqjuL20ae7m8ezuUprIqZlsymBscIjaTYnhW7YzyrtlsIDK6nN6x5zIz4l8LPOnm
 N2qUs2NnAJjBiLTtYlwQ9Oa4LQx7hLzwZHh3uTRutIjds91UnbgR0SCAk5ebDtg+63RL
 MeKtd2YPQzEY6tGC2M8iMBzE3N5HHEIdIUIhBDNKBhg2AY+O83mYvkb8HEWwy8ddzndy
 1stw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fDz5tkFjEMWh1jGsn5Uv286sF3P/RJ6lk3yQfzYfsNw=;
 b=XbSHPKc1wu9NqtoG2a7p2YQix/6Oi/FE2Dy/4iTCalHkWVH2z1GVk0M2vqTILkBwBw
 6l/p/Rvz6Jtu7NuDIExpeRxy7mq10B9D8IAambJbcON3lfsh8pYkxaMBt7SqiddxfRJL
 Gs+cdsi8l+lKycRf4WGPl53ptDAE5FzryRfORy2RrTfikEtZRXzISortudGCOOrBinWX
 wJVC7pI3CUfiOiSZWgQOYn52Nl8YiYahZEbiqj7W+s211PtnBBq5yubvLJWAmgamK/em
 RBNnXgWsZGdJVSh/fFxfyZr5wvcfEloif2ynhXw5hD0cnmyThhWthikxr2C+BcZKUzvu
 Hv9A==
X-Gm-Message-State: AOAM530Lq3WCFcB46md1DRu4bhDIGarTcJgdxJ4OI1cxhXdOVpnd3gdW
 vnz6ytdmwQaW9leHcwbslurX01ku3eI=
X-Google-Smtp-Source: ABdhPJziSe0rQ0Ijvnob/3IGxQVeLivjhXDExd8p7lD7o593qs/Q2IpenYdSHxwnkSV8hFDbQBWa2w==
X-Received: by 2002:a5d:6d0b:: with SMTP id e11mr3718248wrq.50.1625500826578; 
 Mon, 05 Jul 2021 09:00:26 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b12sm1217063wrt.78.2021.07.05.09.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 09:00:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/17] meson: store dependency('threads') in a variable
Date: Mon,  5 Jul 2021 18:00:10 +0200
Message-Id: <20210705160018.241397-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705160018.241397-1-pbonzini@redhat.com>
References: <20210705160018.241397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It can be useful for has_function checks.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build      | 3 ++-
 util/meson.build | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 53dfc2b4c6..e288e4c21c 100644
--- a/meson.build
+++ b/meson.build
@@ -164,6 +164,7 @@ endif
 multiprocess_allowed = targetos == 'linux' and not get_option('multiprocess').disabled()
 
 libm = cc.find_library('m', required: false)
+threads = dependency('threads')
 util = cc.find_library('util', required: false)
 winmm = []
 socket = []
@@ -1999,7 +2000,7 @@ util_ss.add_all(trace_ss)
 util_ss = util_ss.apply(config_all, strict: false)
 libqemuutil = static_library('qemuutil',
                              sources: util_ss.sources() + stub_ss.sources() + genh,
-                             dependencies: [util_ss.dependencies(), libm, glib, socket, malloc, pixman])
+                             dependencies: [util_ss.dependencies(), libm, threads, glib, socket, malloc, pixman])
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)
 
diff --git a/util/meson.build b/util/meson.build
index 97fad44105..6af05a5716 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -1,4 +1,3 @@
-util_ss.add(dependency('threads'))
 util_ss.add(files('osdep.c', 'cutils.c', 'unicode.c', 'qemu-timer-common.c'))
 util_ss.add(when: 'CONFIG_ATOMIC64', if_false: files('atomic64.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('aio-posix.c'))
-- 
2.31.1



