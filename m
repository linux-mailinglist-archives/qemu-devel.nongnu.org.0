Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D05AF4B6846
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:57:20 +0100 (CET)
Received: from localhost ([::1]:58934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuaF-0001M0-Uz
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:57:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCR-0004Qj-GK
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:43 -0500
Received: from [2a00:1450:4864:20::62d] (port=43841
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCP-0008TF-SG
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:43 -0500
Received: by mail-ej1-x62d.google.com with SMTP id d10so42877298eje.10
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZKtQehfgqTqCYFHTsewHfFExtlaTkKJvLPbIHbRQpHw=;
 b=T6MaMBRtVVb3EW6imJEW1QG8pRo6r8DSh2e2k04Q/2FhUvW3tZWyN7g/DNVdXMV931
 nOR0Dj0xczzwXp1QALmBnWjHVgrEQ2MgeUOtf9zjFjX+wEBkDGL3X9eLlcJWTYJ6zZ91
 GHptLEVDeaAp91j4YNObRzZc16kTEe+DsmiALVHzD60W8D44uiQ9KfsKV6l5mK6nYoWB
 VXc4bfIQtgLkeg6OHl/uRGmsSgr3iQJwDMhZoy252ZM2D4xaZA/ZsCZ1ro89tZ/i0WaG
 2tjLIxHnVEM9D46GewLPAPjmSmNiuAvxRUpRnTbv3n1J6FOqdceySOdy7E8y14gTeyJK
 o34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZKtQehfgqTqCYFHTsewHfFExtlaTkKJvLPbIHbRQpHw=;
 b=LAzTfkVgQ09IZPrH/wtCyZIdCWGlctuQCE1YUUSGv86R8f/EPHnXx0qVZxXySn+XTG
 Ky3SA5zMwMyAAhuljSSvoqbNJ2zVvM0aRV7HOhUf8lX3oCmXDvSLPFIZTYf8MMUPyOqA
 ZUM1it0yazRMcN/8yqw0USr3g7vyGLGLDD29MqzijpEmi/dw4PC8Pt/AxAWr0cf8QZKi
 Sa5p5uok9Pl0U0KnQ5iDaqZsG6Vn6LpXA75A5dvl02QsoEVGfNzZJjqOfLJOR1IoBudB
 uHGkhDDVD4xnz15+/MkB2geolRM2Ee5O2L9n6RKBaoeJoSlrz+5CtrNtaaS7hCHtFKYz
 9x0g==
X-Gm-Message-State: AOAM533XYoSs98MlM1ebR1WRzeDIQuMGdDL+HVlkVsxDJKv07FG2wT+/
 Ka4c4x0qjDk/V4Z8dMD4aideKsB42c4=
X-Google-Smtp-Source: ABdhPJz4ccNRPf4tazENg5cSGPnTNg7KtaW9AtonO4bTNAsQJFuif2xYwB1sILZj2gl24yV8g4wQjw==
X-Received: by 2002:a17:907:7286:: with SMTP id
 dt6mr2209984ejc.285.1644917560525; 
 Tue, 15 Feb 2022 01:32:40 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/30] qga/vss-win32: use widl if available
Date: Tue, 15 Feb 2022 10:32:16 +0100
Message-Id: <20220215093223.110827-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

widl from mingw64-tools and wine can compile a TLB file.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
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



