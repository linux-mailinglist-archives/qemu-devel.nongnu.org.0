Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C3833A733
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 18:52:32 +0100 (CET)
Received: from localhost ([::1]:55184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLUul-000623-SC
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 13:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLUsp-0004Mw-E8
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:50:31 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLUsn-0006eM-Jh
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:50:31 -0400
Received: by mail-wr1-x433.google.com with SMTP id v4so4548969wrp.13
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ROvDIv+xkeg8KzSTHDshfuJ8iLFDFQ5jv8EnC07Y4kk=;
 b=IuLkIn0JhTghdmmeUEOKjuN63ElyClgE5Yv/KkuLXa+3QJ7ODsYqF2iFaqhViw0yWv
 LgtSj9LxiZKUJe5e900cB4GoSv4N11+RNfLcaKtl51sx92bChN1suEK/BBrhSGtvOxiN
 1E1/k1zB3QMN6PKJHmdrcOjMkB4KWReaeFssEW0K4zOqdtgmPutBbtuyu8oD5E2+73R/
 0SIb297u6xaPjsU4paNV7h6MrHcHplwwRWmNk4iOxYKgI5QbJfc70wP65kO7HXPdlOuN
 OXgpLzqWJwFDE7wRLuPP6TeGqx2fcLCtqH9ZxxiKdXznU+T0Pw0wyra3G3ttdXoe3jdA
 9hUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ROvDIv+xkeg8KzSTHDshfuJ8iLFDFQ5jv8EnC07Y4kk=;
 b=TRM72kMlbScAHI+QXH1pnrwxQzrFsoGMv3LweUYGMShcS5GAqty8VoPhWQiFfXL2rQ
 gxiiJJb7pkD+43Z3SS/XkJlNmiIXIplIbjkIUJRzGuMecf4ua0FeE36AsAeqUer5W79y
 HfOVJbDb6oi4IM+AbtGmW4GY3PiFSEp+RQG7KU+3eo9GjM3MzuuVY32Jb/64wyZvFxn6
 q6veRiprISu8Sc/efE7d+J7ElyiV+iSt6D/+3wmZuFfnns6T5YrdfemKM7nHwzI6fKFz
 AsS4vjxgoxWih0NHDF1tuKc1phvW20P8vrkxJcmf+/AGT2NhDKRxeKhFXux0fMJIMChK
 n7OA==
X-Gm-Message-State: AOAM53268MeXQGweWbE7ovyuXA7dvc57wBKGKN59VjAUrv4jHBUJdDoE
 HcHEdudlY2D9lgLh8u63HgCdVU1BJIE=
X-Google-Smtp-Source: ABdhPJxcKClG/gxIDxJpj0clOI8MQcDxpWwGMQ8kOlIWWVQrDrAPNj/owwHv1HrB8tYJaPwPPYtUmQ==
X-Received: by 2002:a5d:42cb:: with SMTP id t11mr23579805wrr.280.1615744227663; 
 Sun, 14 Mar 2021 10:50:27 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a6sm11442749wmm.0.2021.03.14.10.50.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 10:50:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] hexagon: do not specify executables as inputs
Date: Sun, 14 Mar 2021 18:50:21 +0100
Message-Id: <20210314175025.114723-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210314175025.114723-1-pbonzini@redhat.com>
References: <20210314175025.114723-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
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

gen_semantics is an executable, not an input.  Meson 0.57 special cases
the first argument and @INPUT@ is not expanded there.  Fix that by
not including it in the input, only in the command.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/hexagon/meson.build | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index 15318a6fa7..5dd68907b1 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -33,8 +33,7 @@ gen_semantics = executable(
 semantics_generated = custom_target(
     'semantics_generated.pyinc',
     output: 'semantics_generated.pyinc',
-    input: gen_semantics,
-    command: ['@INPUT@', '@OUTPUT@'],
+    command: [gen_semantics, '@OUTPUT@'],
 )
 hexagon_ss.add(semantics_generated)
 
@@ -154,8 +153,7 @@ gen_dectree_import = executable(
 iset_py = custom_target(
     'iset.py',
     output: 'iset.py',
-    input: gen_dectree_import,
-    command: ['@INPUT@', '@OUTPUT@'],
+    command: [gen_dectree_import, '@OUTPUT@'],
 )
 hexagon_ss.add(iset_py)
 
-- 
2.29.2



