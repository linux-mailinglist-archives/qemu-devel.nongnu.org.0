Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0F54B6840
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:55:49 +0100 (CET)
Received: from localhost ([::1]:55900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuYn-0005kE-2r
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:55:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCQ-0004OJ-Et
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:42 -0500
Received: from [2a00:1450:4864:20::636] (port=43849
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCO-0008Sg-LE
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:42 -0500
Received: by mail-ej1-x636.google.com with SMTP id d10so42877184eje.10
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iwKrw8tO5y25zYOksvfVojKXZjXfywa7yUC+Id68b80=;
 b=SukyXIponDfC/9oCJ3lLJ2oX9SM4FI/v66qY+ij6harXLYGwI467t+Bwv1OsV2xBtd
 U/LOc+dsRn7P4nZldW0Ny8d3GLPs9oplb2tYc5vho/P4Wnc2mq4w9ydWrNzh9dsSl+Jt
 NH39+9B9Bc3la4UGu7lN5RZ4f+Y0Z+aooPSZDh63yedb24p6oeMcKWy2qEbXLhGlojSj
 1whU6sry8zbPgjdSR+b57s0tt6qdQ92jKb7I2rEg3KDnUdNPu21OaFgiuBeAFe1eLn9q
 Cl0tm4sDJ403ShacTsWrYvX+j1TmJv9UtWo/1JSazQNOy0hya4aLNS+uFB8QwOvAR36l
 uEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iwKrw8tO5y25zYOksvfVojKXZjXfywa7yUC+Id68b80=;
 b=kAea2KjUplAZvudA8BOFyD7jqptdfGsEnaWywp4Tq9n31gTvE/+A5mGSlJ3FZV7Rtz
 XFmWnpg4imLnt/m5dOTaQL2BgNY7VuTsHfr8Wk2MkjnhQPZOYof6Sor0a5s2fwtO+Mq9
 Y7medsu7miTMF3yfVNeBoBoIDNFy+rq/XCOfxp+0z16PWM1AFnYDaRGBnwi7p/tmMsnM
 dr3GyjTrdu+YcSAiVBmHyBokd8cp2CKXiU24dUDbLAFXbm6yu3axC6U2U9Mr31tBi9Yj
 FDmpfwv3kKtVHFfO14rPft/cKexYNMeup0+M5D3HVp54ylVhUtlKjE5QCuMC8ojiJ2V0
 xKig==
X-Gm-Message-State: AOAM531sUJL/JYsfVsdLACM2bkRWBRWkLBq338SbXGS+HMZHGNiXorez
 RUgAHnUQ7TeScZ3y8Ep1GWyAm69Pjl0=
X-Google-Smtp-Source: ABdhPJzX6e8OIyPrlMUxkJDndvoAozpweUKk3uQ3WNTHBTueQ4x2GClnJcV7lDt1nVU93ERMxhjk+w==
X-Received: by 2002:a17:907:1c87:: with SMTP id
 nb7mr2212163ejc.279.1644917559115; 
 Tue, 15 Feb 2022 01:32:39 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/30] qga/vss-win32: fix midl arguments
Date: Tue, 15 Feb 2022 10:32:14 +0100
Message-Id: <20220215093223.110827-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Microsoft midl compiler doesn't take "-options" form, nor does it take
OUTPUT filename. The -I option seems needless as well (at least with
VS15).

It's not clear what was actually used when it was introduced in commit
b39297aedfabe9.

strings says "Created by MIDL version 7.00.0555 at Fri Dec 21 13:36:39
2012".

I doubt the makefile rule actually ever worked.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/vss-win32/meson.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
index 90825edef3..78bdf5e74a 100644
--- a/qga/vss-win32/meson.build
+++ b/qga/vss-win32/meson.build
@@ -26,8 +26,7 @@ if midl.found()
   gen_tlb = custom_target('gen-tlb',
                           input: 'qga-vss.idl',
                           output: 'qga-vss.tlb',
-                          command: [midl, '-tlb', '-I' + config_host['WIN_SDK'],
-                                     '@INPUT@', '@OUTPUT@'])
+                          command: [midl, '@INPUT@', '/tlb', '@OUTPUT@'])
 else
   gen_tlb = custom_target('gen-tlb',
                           input: 'qga-vss.tlb',
-- 
2.34.1



