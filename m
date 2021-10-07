Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1084253F6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:24:44 +0200 (CEST)
Received: from localhost ([::1]:37716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTO7-0006MW-2a
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8d-0005US-8r
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:44 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:36493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8Y-0007mQ-7H
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:43 -0400
Received: by mail-ed1-x532.google.com with SMTP id l7so23150010edq.3
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w2oIIbjtvUUPKCkTmEjnSQ9vy3EzBjnfsD3+I2rCdbk=;
 b=GIpM0KrkvpwZzKXe3cSlgOFKh5eOXjfI0/P7s5ED5vgGX4B2GyVK+cLJmCC5UqceQ5
 2z/1zU6sW5/1Z0hEpp1u1MSTAr3EUrrAe1BKIuJXhiDqkZvNC1nkxmqMWZmSncHooQ9f
 wMSz/dNfHHMa9VMqTgE4y76q/qIvFDTSn4Lu5tAEmLbdpgHXL4t8zwWs49LvK3k/7qfM
 hI48ONelyhgn7kv/5LcnEWmbGh/Fbka0QGHvpQ5nwBm22Y6+BNq1XLDKy6uIXkqp44o+
 klM+fp89D23sqCn0SRZLnInWDFcSKcP+iQdID8P5OWpbF/t7HEA0usI+JyugSfxpkoiI
 KCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=w2oIIbjtvUUPKCkTmEjnSQ9vy3EzBjnfsD3+I2rCdbk=;
 b=TvJIlqVfUxYv+ebSi5j8UUOUMPAUT3a5/9SSrNqOAPzsCboRhXXGdeXwitPSGKNyI/
 ECIug0EB8MiOtlV2eju1OGqNXgrxZiRE/QrNOkoUpuXgBgD1c9961dyCQwMv0Jfyi4pK
 4oVo15VCejq0bBaREcpaJ4F2tKnldRZPjtBEu+Mpp+rxDztofLcLnh3D7+S/j8ah0IqG
 8AzLb7SVp80ycw0vu9tnXtBsrAjOwwmCMstodOYQzc8aXPO7Cin5O20cYvxBTXWBTXW+
 sxqida1VQa5vguOV7Z/a7btvpYg0y1Ntc5w0RvVaWPn3izZJXhDgx4o4aEW+tg3dnsjO
 yw7w==
X-Gm-Message-State: AOAM5314+cONdeCDVKPLnJLyLlEmzirimjscB8o16Hy4HDwnR9pqhqFs
 SWNYxWo+uKRzPrr0LChwI1/P63JKN80=
X-Google-Smtp-Source: ABdhPJzwguwqXXlAWM/Dxhm9dCcSXsVGw7TCIh2/6t3ugPFAuArao0T9Woqp6pyk1TADgUr/oPIQIg==
X-Received: by 2002:a50:8405:: with SMTP id 5mr6142985edp.228.1633612115061;
 Thu, 07 Oct 2021 06:08:35 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o12sm791254edw.84.2021.10.07.06.08.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:08:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/24] configure,
 meson: remove CONFIG_GCOV from config-host.mak
Date: Thu,  7 Oct 2021 15:08:17 +0200
Message-Id: <20211007130829.632254-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 3 ---
 meson.build | 1 +
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/configure b/configure
index 35e25bb960..499c84859d 100755
--- a/configure
+++ b/configure
@@ -4628,9 +4628,6 @@ echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
 echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 echo "LIBS_QGA=$libs_qga" >> $config_host_mak
-if test "$gcov" = "yes" ; then
-  echo "CONFIG_GCOV=y" >> $config_host_mak
-fi
 
 if test "$rng_none" = "yes"; then
   echo "CONFIG_RNG_NONE=y" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 9bb443387a..2962c24eb5 100644
--- a/meson.build
+++ b/meson.build
@@ -1404,6 +1404,7 @@ config_host_data.set('CONFIG_ATTR', libattr.found())
 config_host_data.set('CONFIG_BRLAPI', brlapi.found())
 config_host_data.set('CONFIG_COCOA', cocoa.found())
 config_host_data.set('CONFIG_FUZZ', get_option('fuzzing'))
+config_host_data.set('CONFIG_GCOV', get_option('b_coverage'))
 config_host_data.set('CONFIG_LIBUDEV', libudev.found())
 config_host_data.set('CONFIG_LZO', lzo.found())
 config_host_data.set('CONFIG_MPATH', mpathpersist.found())
-- 
2.31.1



