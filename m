Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46027660F98
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 15:51:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE9K4-0001uR-12; Sat, 07 Jan 2023 08:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pE9Jv-0001it-8V
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 08:33:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pE9Jq-0006Ui-2U
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 08:33:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673098384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/alYy8O92DxdcA4HyUkM0DF2NwTmR7PHdUG+Enp9h6M=;
 b=h7Lq4vwsLFAikS79ajnj97ETMHV+75qJl+zHK6MVw2EuldDLKzGU3losYBrMBuZrUchIwo
 ROy3GX4fiGkK0S8NG8X6H2qYroqYxfbMBsZ2TFenGg2T4O27f4E45GD91HF9+pLpmWpiuV
 grqaoEre0VBwHpngqQk6wXJIbiQ8hdE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-369-PJ9VohAeNGqla4BCqXaL9g-1; Sat, 07 Jan 2023 08:33:03 -0500
X-MC-Unique: PJ9VohAeNGqla4BCqXaL9g-1
Received: by mail-wm1-f71.google.com with SMTP id
 w8-20020a1cf608000000b003d9bb726833so942396wmc.6
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 05:33:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/alYy8O92DxdcA4HyUkM0DF2NwTmR7PHdUG+Enp9h6M=;
 b=u3yXuRqHzLRrB199b93xzrhar2DbqJW+u07AvyOIuN8BcUU3dloBa6W5f6TZpMmILo
 wQx/JQ7+owlIYOTPz+x3twu7kj3iY2W+TNOq9xN+mJnlr4TZm/VIqnl9H2ssncmevGvb
 tz6F6JtYXMJRLSVOl72CpTH2QPBX9d71m1BpBF+aHAw55QD6PLMuN3vPgTAsXaqvr5Z9
 gjDnlHkb5i7nrcRrJ1fF3KtlI1Nkwl8u9oq4NksynZfBNLp1Q7T+HuIDgtlmbWdfX9/I
 EcvUEaDNantakMqJbHPzCP/5s/0z7ZbtrFdy3ol9i27W/D6Ursc/zYClwj+ns/95Ce9d
 9N/Q==
X-Gm-Message-State: AFqh2kptvVq1RwLlsjwbBBzarHpyczVNuc/j3KT7CfGV1Qhf2KqT2gGA
 tR2h6kbBP1JaOektV4Nk+TLP2Z2hbJO6rYFj5rM4MgW7hthklQcm4FW9RLMdMwMubdZARo/fFgS
 W+8Nn6AlNx85WVFBqo7RPh6RmJ5nM3pHNXDxu3ZbSEj1mgxjQeoWWqRy/kSsuMfjJHg4=
X-Received: by 2002:adf:f107:0:b0:284:5050:5e60 with SMTP id
 r7-20020adff107000000b0028450505e60mr27691172wro.24.1673098381991; 
 Sat, 07 Jan 2023 05:33:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuxk7bpywYIMZJBpqPceOQ2Na/gwykEfXofDwOqFdIvlfyiDhXG6bxGMDX/pjAUMWQ7D0KgZw==
X-Received: by 2002:adf:f107:0:b0:284:5050:5e60 with SMTP id
 r7-20020adff107000000b0028450505e60mr27691161wro.24.1673098381721; 
 Sat, 07 Jan 2023 05:33:01 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 q17-20020adfcd91000000b002b6bcc0b64dsm2527782wrj.4.2023.01.07.05.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 05:33:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?=D0=92=D0=B0=D0=BB=D0=B5=D0=BD=D1=82=D0=B8=D0=BD?=
 <val15032008@mail.ru>, qemu-stable@nongnu.org
Subject: [PATCH] configure: fix GLIB_VERSION for cross-compilation
Date: Sat,  7 Jan 2023 14:32:58 +0100
Message-Id: <20230107133258.110125-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

configure uses "pkg-config" directly so that GLIB_VERSION is always based
on host glib version.   To correctly handle cross-compilation it should use
"$pkg_config" and take GLIB_VERSION from the cross-compiled glib.

Reported-by: Валентин <val15032008@mail.ru>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1414
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 22818926576c..6f5e77a71361 100755
--- a/configure
+++ b/configure
@@ -2375,7 +2375,7 @@ echo "QEMU_OBJCFLAGS=$QEMU_OBJCFLAGS" >> $config_host_mak
 echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
 echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "GLIB_BINDIR=$glib_bindir" >> $config_host_mak
-echo "GLIB_VERSION=$(pkg-config --modversion glib-2.0)" >> $config_host_mak
+echo "GLIB_VERSION=$($pkg_config --modversion glib-2.0)" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 
-- 
2.38.1


