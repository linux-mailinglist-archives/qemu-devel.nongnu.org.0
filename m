Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D3E3088D4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:06:03 +0100 (CET)
Received: from localhost ([::1]:50428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SXK-00077y-DH
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnR-0004fW-GI
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:37 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:36503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnQ-000622-0w
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:37 -0500
Received: by mail-ej1-x636.google.com with SMTP id l9so12455779ejx.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pjDunBhovqdCvUb8BrsFl/4RcBvBG2dqU8XujtA0f5w=;
 b=Iu5gMfg6PShWvcQJxh/BYqTCDg4RI+5ivnl8/bgNNQtJZiWf2uthVDesxaWEqu5j7m
 TQ12XS8SZjmiR0IWkSpFFTsWKxpiApQ1SuCFBaA+Mn/v58eW3W3j6Fm4ScbcsYYja7gg
 PCbz7k3ZaUM4nX6IL4T0xlg2P9euVjqrLfIfu1Y1G6mdbacKEyc497XS53Z/f2WAhjc9
 OAHItbL7lwEsRS4+IDWjE8KB+9RtkRtTUJk8ZszirrQYyTP4SSwwTyWo3Wk/pWlefe0b
 Ij76DYWVWybXpcTMmrUSuDcdkSFp28cjjFaYK3HfmZdUBwl6K/TPxShtQoSN6KsnBZQk
 zNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pjDunBhovqdCvUb8BrsFl/4RcBvBG2dqU8XujtA0f5w=;
 b=WMw0NCTv/aKyeF4aRUT6UB/5ZmEEjyai5BePgbyXUreK3rmrqx78xFd8j1sg1WNMNE
 Kn0H3bbH0bRcuS9GD75MD7SCjV2gD8nTs3AGZ6zGADmdOZJunVjxqvDOy28FtSp21Jn5
 Edblm3zg3/PclNWXj5lfr4rhisF4/3pl+w8aFDC5B0rrxx/pu52MC8EMyhknN7yoQ35G
 ANDjLNCcWCOVFWW2akU9EN4R+QJbFVL3U2rE18SHUlaUHleFP4YYrS9p1pTzteOCi4Wj
 KuCw+GBoJqhsQKu7Ae4cQq8DuRqrcvRotRAZjpLa0OnDc4O97dyMLGgoJ7lMtgaIPX5d
 aP7A==
X-Gm-Message-State: AOAM532Npw6wh0SQBQjK6xjpapRIr+PnvBMN0xpSp/5Lk9q+9mDvUWsu
 7JoueSL9dyR1VOfDP0ap3FbobwSu2nlxDw==
X-Google-Smtp-Source: ABdhPJwSGZ+qm8b5D+bIneJWI6ejyDO6lcewaEl5tNxThYAzoISUnlWtSc+rTeQ4sg07AyQfGMvBqg==
X-Received: by 2002:a17:906:ada:: with SMTP id
 z26mr4043713ejf.127.1611919114705; 
 Fri, 29 Jan 2021 03:18:34 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:34 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/36] meson: Explicit TCG backend used
Date: Fri, 29 Jan 2021 12:17:59 +0100
Message-Id: <20210129111814.566629-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210125144530.2837481-4-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 14e4cb35df..21bc9f1b2c 100644
--- a/meson.build
+++ b/meson.build
@@ -227,7 +227,7 @@ tcg_arch = config_host['ARCH']
 if not get_option('tcg').disabled()
   if cpu not in supported_cpus
     if get_option('tcg_interpreter')
-      warning('Unsupported CPU @0@, will use TCG with TCI (experimental)'.format(cpu))
+      warning('Unsupported CPU @0@, will use TCG with TCI (experimental and slow)'.format(cpu))
     else
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
@@ -2459,8 +2459,12 @@ if have_system
 endif
 summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
 if config_all.has_key('CONFIG_TCG')
+  if get_option('tcg_interpreter')
+    summary_info += {'TCG backend':   'TCI (TCG with bytecode interpreter, experimental and slow)'}
+  else
+    summary_info += {'TCG backend':   'native (@0@)'.format(cpu)}
+  endif
   summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
-  summary_info += {'TCG interpreter':   tcg_arch == 'tci'}
 endif
 summary_info += {'target list':       ' '.join(target_dirs)}
 if have_system
-- 
2.29.2



