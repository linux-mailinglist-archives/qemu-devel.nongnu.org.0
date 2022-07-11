Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E171256D770
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 10:11:39 +0200 (CEST)
Received: from localhost ([::1]:59388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAoW2-0000KJ-Nk
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 04:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oAoS1-0006nC-Ji
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 04:07:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oAoRy-0000yP-TN
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 04:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657526845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IEBtrhHOZoW2IpVmQ2emXJdx/NNh7WPD0iaL+UDhKTg=;
 b=EriMOxDWrDKraQBTtFMNahO8HTW3rRXkxYLH2fJdSnYKA+XDLlvFW1mei+K2ZWGHlUL2H5
 kLbWp6t81sD//M2C27DGfKbT8JYMNaY29EpQ2jvgv6h+7784yXBmt8pXpY6h9/pMtettlc
 z58KjGZuVqaQI/zf4zHcv/3D+3IlkYU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-UopzXhBwN6OuWHu4_1Uyyw-1; Mon, 11 Jul 2022 04:07:22 -0400
X-MC-Unique: UopzXhBwN6OuWHu4_1Uyyw-1
Received: by mail-ed1-f72.google.com with SMTP id
 x21-20020a05640226d500b0043abb7ac086so3650629edd.14
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 01:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IEBtrhHOZoW2IpVmQ2emXJdx/NNh7WPD0iaL+UDhKTg=;
 b=MQfB6wnzAkQbuNn0IXd6S249h2HA6hBSl7juhZ19S0H46I/3AENfy2CFnypX2iI1I/
 5/EyHBZjV7MkApRQ1kci9ZQgDJvCvf2c5yksGjUalBVBU1nhUjUl1cCPsKgkmK73MEuz
 SWifzzOwOy6CGxRxa0seqdcia0/bLEmatn30+gwSMjcHAyHpq5JDaJUB+Ue3sgeVeFI7
 us4hOqMB2sCxZeTdeW020aCg9mEylU1yvrfqeXWhlpZFFqjGgE4m9rx2J49OSuIWPiiO
 e97WCg1133LkWEW2UFrW0rA1z6uFtF3dmQenSgPyiYM3z2BLbw3WlLk8k0MlEQb3jAGO
 WhSg==
X-Gm-Message-State: AJIora8mKJOWKAPK6OVu4pg2GXIURUpbJ089EDOS3Tnvo7Z1y0LqnBHC
 awiyGyrza+2OTuqy7oO7BB8lLF9v2g14iivrKhnI3gGYNmY7NoSGravQidc9OTh7IcdtTIJ8RRn
 8dQe0xFD5euW9Latv6uS+0oXcFqkCHXQBgHNIqYuQ86MjigMJa/kykicgbyZioyAbcIk=
X-Received: by 2002:aa7:c40b:0:b0:43a:c617:7fff with SMTP id
 j11-20020aa7c40b000000b0043ac6177fffmr11949617edq.20.1657526840591; 
 Mon, 11 Jul 2022 01:07:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tmypU9J5bcHxpaE5TphHhQaVd7vHLFG/w23/NAdZBb3CSHMa6qa9rqbhFv+1d7DrBYCytzaQ==
X-Received: by 2002:aa7:c40b:0:b0:43a:c617:7fff with SMTP id
 j11-20020aa7c40b000000b0043ac6177fffmr11949579edq.20.1657526840211; 
 Mon, 11 Jul 2022 01:07:20 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 za20-20020a170906879400b00721d8e5bf0bsm2424812ejb.6.2022.07.11.01.07.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 01:07:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: place default firmware path under .../share
Date: Mon, 11 Jul 2022 10:07:18 +0200
Message-Id: <20220711080718.13593-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: c09c1ce7e9 ("configure: switch directory options to automatic parsing", 2022-05-07)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson_options.txt             | 2 +-
 scripts/meson-buildoptions.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson_options.txt b/meson_options.txt
index 97c38109b1..9a034f875b 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -6,7 +6,7 @@ option('qemu_suffix', type : 'string', value: 'qemu',
        description: 'Suffix for QEMU data/modules/config directories (can be empty)')
 option('docdir', type : 'string', value : 'share/doc',
        description: 'Base directory for documentation installation (can be empty)')
-option('qemu_firmwarepath', type : 'string', value : 'qemu-firmware',
+option('qemu_firmwarepath', type : 'string', value : 'share/qemu-firmware',
        description: 'search PATH for firmware files')
 option('pkgversion', type : 'string', value : '',
        description: 'use specified string as sub-version of the package')
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index d0e14fd6de..4b7b8ffaa2 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -42,7 +42,7 @@ meson_options_help() {
   printf "%s\n" '  --enable-trace-backends=CHOICES'
   printf "%s\n" '                           Set available tracing backends [log] (choices:'
   printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
-  printf "%s\n" '  --firmwarepath=VALUE     search PATH for firmware files [qemu-firmware]'
+  printf "%s\n" '  --firmwarepath=VALUE     search PATH for firmware files [share/qemu-firmware]'
   printf "%s\n" '  --iasl=VALUE             Path to ACPI disassembler'
   printf "%s\n" '  --includedir=VALUE       Header file directory [include]'
   printf "%s\n" '  --interp-prefix=VALUE    where to find shared libraries etc., use %M for'
-- 
2.36.1


