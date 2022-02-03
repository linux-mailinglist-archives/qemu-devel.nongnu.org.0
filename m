Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7F14A8B3C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:11:33 +0100 (CET)
Received: from localhost ([::1]:57394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgZt-0004LM-Qa
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:11:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0U-0005NM-IA
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:54 -0500
Received: from [2a00:1450:4864:20::52c] (port=45846
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0L-0008J0-CL
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:54 -0500
Received: by mail-ed1-x52c.google.com with SMTP id p7so7424984edc.12
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2yfBlxIzLNwHK6wKlySeIIsbgd7e1dHiZbhfcz1udck=;
 b=CHa/QYJzEjl3OrWwYEIeNjiabHcv85KjT7sftMNwdQ06OPpudi2wVlQKOCc6VdM4q+
 2ljoNy7cNVoJ/NStKp0Xet7JhpO0a/BHDGo27ni782ydRyirmDI9S1ZXISmYKzoVJvwF
 vVwFe8eFmDH+Bu/mTdvSXmd8bb1KLNauVcak5Ut1i1hVZnPP90EGWnHr2wNbaPbfSfq/
 EgSwLUwPiG0ANUpqiCtIw///MN1OW08/0V8B2VFzE5x31w1noGVOj9J2DFS/UhNnT5uG
 WDT2QIjUVaLdHIM+dUTxHgzPfFDAbALqSEmt6Ax1t2Omtmk7G5CNVgYJl9/J/AqBLAHE
 3Z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2yfBlxIzLNwHK6wKlySeIIsbgd7e1dHiZbhfcz1udck=;
 b=vC9q9uGQuvHkjqrh0SwXJ+17mRdYSd3FfBaKpsUeomOdqu2Eg3KHvbSWPDMrbCG3C6
 Sknz8PRJCnFYliidudhxLhVzQxyMcIz4WBbQ0pzB+bi3a0diaMubQToOU8eOhNiCROKP
 1/n4RqeRBbM3iP1Qk8YXfA4uy+dCS3u/683E79Zei8xb7OsavowsGjEDQ5vOi4ZDl8nZ
 8wGEbTDWwEv6QDjDVGikW5SnMdVeZzZfrBcZSxkJ/QHnOENr1q+XFwwyx+3Be+qrJruE
 dcD+usZCUSQKJhYhhXqPK3yMpNW++rPZocJHqnGlRbYrg5hcFYfJHou3w49kKdjET2gw
 d/sg==
X-Gm-Message-State: AOAM533Ou3jTvS82gjr5tqbhGjh2DC0QIVxInbF1oK7IGx5TKpX69Ru/
 u4BZGXS35dtD2QV4QC95OhfdcGL+VFw=
X-Google-Smtp-Source: ABdhPJzO0SvRti1Nhh7YMFiNklusb3fBoXHquZ+kkUgtBg4hGEFbO6otrv/sByr4I6co3dbAcgvQRA==
X-Received: by 2002:aa7:d3c3:: with SMTP id o3mr36143846edr.201.1643909656198; 
 Thu, 03 Feb 2022 09:34:16 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/27] qga/vss-win32: use widl if available
Date: Thu,  3 Feb 2022 18:33:52 +0100
Message-Id: <20220203173359.292068-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

widl from mingw64-tools and wine can compile a TLB file.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/vss-win32/meson.build | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
index 78bdf5e74a..8f3aff5fe3 100644
--- a/qga/vss-win32/meson.build
+++ b/qga/vss-win32/meson.build
@@ -18,15 +18,18 @@ if add_languages('cpp', required: false)
   all_qga += qga_vss
 endif
 
-# rules to build qga-vss.tlb
-# Currently, only native build is supported because building .tlb
-# (TypeLibrary) from .idl requires WindowsSDK and MIDL (and cl.exe in VC++).
 midl = find_program('midl', required: false)
+widl = find_program('widl', required: false)
 if midl.found()
   gen_tlb = custom_target('gen-tlb',
                           input: 'qga-vss.idl',
                           output: 'qga-vss.tlb',
                           command: [midl, '@INPUT@', '/tlb', '@OUTPUT@'])
+elif widl.found()
+  gen_tlb = custom_target('gen-tlb',
+                          input: 'qga-vss.idl',
+                          output: 'qga-vss.tlb',
+                          command: [widl, '-t', '@INPUT@', '-o', '@OUTPUT@'])
 else
   gen_tlb = custom_target('gen-tlb',
                           input: 'qga-vss.tlb',
-- 
2.34.1



