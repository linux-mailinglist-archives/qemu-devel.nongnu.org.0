Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F275432AA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:36:02 +0200 (CEST)
Received: from localhost ([::1]:40756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywmv-0001HE-2F
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nywBl-0007KK-EG
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:57:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nywBj-000542-7w
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:57:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=31CY+EoQN84K6MYiaS3e0Hb93woU91yLJOsjheLuUnQ=;
 b=bQJTV4CglfmAv18c6VlNLtwR/VUbb7W+AUA+IdB2hQIjyGOt2Ch6HpAfgPDCxYSzuBL56s
 9CTg1pJd7BaUNDHTFV1/4jDuNSsaY3KJ/s9/BAVR0Jkqt0daw3b4N/CFO2XoqCEc7uRgkk
 6II7QgQN0cQi9S0vjCyzCZ2kt7605kY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-eFrzikTSO0-94fdQQn3o-Q-1; Wed, 08 Jun 2022 09:57:32 -0400
X-MC-Unique: eFrzikTSO0-94fdQQn3o-Q-1
Received: by mail-ej1-f71.google.com with SMTP id
 a9-20020a17090682c900b0070b513b9dc4so7711224ejy.4
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 06:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=31CY+EoQN84K6MYiaS3e0Hb93woU91yLJOsjheLuUnQ=;
 b=z4Ux/CXKhIk/Y9oyqLJG2YIFprqm/BCYMJRzl3Cyo2LtFHcOQSNJMXgHNB8xz/j0k7
 C8Z/j20L86TZHdwwn0PMpncnRuJrvGVxLMLz3c68OIIBKe/nuZbxLoD/Bp0Q8MczrhO1
 9yi4gqzfJTindzKtBgMZh1LLShjMEVY4Vuq4Z4qO691TpaGzMZB35TdqzSkiVeFrBmVW
 5g0D+uVbFvQ01R8xoFu+UGfXZgJu97Jj7aSj8uswh7u7PoYDGDpI2psJWSnlZmKTlmaM
 f4EJO4Hv7vieQypulyrI34A2bZj0XmRETZQ4kPdqEBT0ninHfaOOuzqeXOXcby6nkeBz
 LU2A==
X-Gm-Message-State: AOAM530yfbWZWWk3uOKlCNvli31U85EkD4/QjcWU0UNCkCBpn0GtLSmK
 +TVIXD2FaoXc2yAXS1Wx/bWoCocYhHgyHPYD3+fB5Ap6ZfuYucVm5vIbDEKCrkQPZAXdArglazd
 lbgScF+Bkz3WPt/ZOv4f6efKCL2uszJkPXye7O0Zhl387CZROISvsvorQX2NjFkh4cfw=
X-Received: by 2002:a17:906:b881:b0:709:80e9:8c0b with SMTP id
 hb1-20020a170906b88100b0070980e98c0bmr30921752ejb.110.1654696650631; 
 Wed, 08 Jun 2022 06:57:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykXYwVFuFpIG466Rb+k5dYxK5tnjJQA8wgPdR/6RibjXtPfae5lZkLuIj9F0HMoeXjwc0ntw==
X-Received: by 2002:a17:906:b881:b0:709:80e9:8c0b with SMTP id
 hb1-20020a170906b88100b0070980e98c0bmr30921730ejb.110.1654696650322; 
 Wed, 08 Jun 2022 06:57:30 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 rn13-20020a170906d92d00b006f3ef214df2sm9101771ejb.88.2022.06.08.06.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 06:57:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH untested] tests/tcg: disable xtensa-linux-user again
Date: Wed,  8 Jun 2022 15:57:27 +0200
Message-Id: <20220608135727.1341946-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The move from tests/tcg/configure.sh started enabling the container image
for xtensa-linux-user, which fails because the compiler does not have
the full set of headers.  The cause is the "xtensa*-softmmu)" case
in tests/tcg/configure.sh which became just "xtensa*)" in the new
probe_target_compiler shell function.  Look out for xtensa*-linux-user
and do not configure it.

Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 7d021a4014..e9822ff56c 100755
--- a/configure
+++ b/configure
@@ -1923,7 +1923,6 @@ probe_target_compiler() {
         container_cross_prefix=x86_64-linux-gnu-
         ;;
       xtensa*)
-        # FIXME: xtensa-linux-user?
         container_hosts=x86_64
         container_image=debian-xtensa-cross
 
@@ -2352,6 +2351,10 @@ for target in $target_list; do
   probe_target_compiler ${arch}
 
   case $target in
+    xtensa*-linux-user)
+      # the toolchain is not complete with headers, only build softmmu tests
+      continue
+      ;;
     *-softmmu)
       test -f $source_path/tests/tcg/$arch/Makefile.softmmu-target || continue
       qemu="qemu-system-$arch"
-- 
2.36.1


