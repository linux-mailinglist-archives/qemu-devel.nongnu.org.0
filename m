Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D394A8B61
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:17:27 +0100 (CET)
Received: from localhost ([::1]:40834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgfe-0004KN-Av
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:17:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0g-0005cM-5b
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:35:07 -0500
Received: from [2a00:1450:4864:20::535] (port=45855
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0L-0008JY-I1
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:35:05 -0500
Received: by mail-ed1-x535.google.com with SMTP id p7so7425273edc.12
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iEhYSBkOYhendqusH7DeS60mROqrbT8HCNyP36jgtjQ=;
 b=FuYDmkxCz3E75nCXKoLh3jFOY50ivk+AAUsQ45gS+9pu7CHgH0ycuB1sEWcvgXher/
 qzK1bajH/ej0cCC+QLP4myD8UMwi4XmuSS9Zl45UxH+05DLbPE6pbLo/hWNvRyDZcU2h
 NPYzFCFdLCfUau1rzQgwW3uiKPZyVfOdtY/nXfcMaKbkgzTR0qdcn834ogseuAPTewem
 PbtGMlTpaPJXv/PCx2cb6FWe3NyEwcxs0gg2cOIDibncQQhJxCqgC4qJ48hwzeZP9tVB
 oyFqS/dXx2s6ZbQgZVmcXrY1umUGf9ZWoz30q68Uu3cUh7yxWl70luOI9YWy7KXqkJiw
 NNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iEhYSBkOYhendqusH7DeS60mROqrbT8HCNyP36jgtjQ=;
 b=AgRgllcxPnJE4uOBpjuaG/cTTESUChaJCvFomiu/hAfSnOxvITmXARi6VhjNx7XH3t
 fkUT1AKAtGNGk8bRV3iY1oDjsjdoYYwlp60V2DZs2NVL9gjN6AWLXpIvbuo+JgnLRAjr
 2UBJQQguG1KA4U6zQb60zEvc1J9YohnulaDwWj/TkEazKLgt2aUg9FKk5X/IJ84LsG4C
 9SRad021uh+lBZF7X0VaGkyiX81VyyoyvrEGdXY+UgdYfVZYn8eDBV3OaViubehmaJ0P
 yl0REauZitDGpKj+Aodu4qAjtt66MkSHMuSCrzb0GZQknK/7ChjXnYit3pS/u9R75vDh
 eNwg==
X-Gm-Message-State: AOAM530902+oxFmr4YTI35DykeWCu9i61udalJzRPG1HhvblmWH/oVfP
 78TyBI0cKc4jpHN/xWZeHv5/6e5pd7E=
X-Google-Smtp-Source: ABdhPJwrvsmhiOzOR3yH2oLTqZ8PuZdqL+GJcGBf3rHyUvU/iz6CW0aU1JYBafHFR+MJbsTXVcy95Q==
X-Received: by 2002:a50:ed8e:: with SMTP id h14mr36423158edr.398.1643909659000; 
 Thu, 03 Feb 2022 09:34:19 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:18 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/27] qga/vss-win32: require widl/midl,
 remove pre-built TLB file
Date: Thu,  3 Feb 2022 18:33:56 +0100
Message-Id: <20220203173359.292068-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

There are no good reason anymore to keep a pre-built file in the repository.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build               |   4 ++++
 qga/meson.build           |   2 ++
 qga/vss-win32/meson.build |   9 +--------
 qga/vss-win32/qga-vss.tlb | Bin 1528 -> 0 bytes
 4 files changed, 7 insertions(+), 8 deletions(-)
 delete mode 100644 qga/vss-win32/qga-vss.tlb

diff --git a/meson.build b/meson.build
index e3499a7e9a..999d2c8bd1 100644
--- a/meson.build
+++ b/meson.build
@@ -307,8 +307,12 @@ iokit = []
 emulator_link_args = []
 nvmm =not_found
 hvf = not_found
+midl = not_found
+widl = not_found
 host_dsosuf = '.so'
 if targetos == 'windows'
+  midl = find_program('midl', required: false)
+  widl = find_program('widl', required: false)
   socket = cc.find_library('ws2_32')
   winmm = cc.find_library('winmm')
 
diff --git a/qga/meson.build b/qga/meson.build
index ca795f44fb..804cc842dc 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -20,6 +20,8 @@ have_qga_vss = get_option('qga_vss') \
     $ scripts/extract-vsssdk-headers setup.exe
     The headers are extracted in the directory \`inc'.
     Then run configure with: --extra-cxxflags="-isystem /path/to/vss/inc"''') \
+  .require(midl.found() or widl.found(),
+           error_message: 'VSS support requires midl or widl') \
   .allowed()
 
 all_qga = []
diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
index 8d4c5708d8..c064a4e245 100644
--- a/qga/vss-win32/meson.build
+++ b/qga/vss-win32/meson.build
@@ -25,21 +25,14 @@ qga_vss = shared_module(
 
 all_qga += qga_vss
 
-midl = find_program('midl', required: false)
-widl = find_program('widl', required: false)
 if midl.found()
   gen_tlb = custom_target('gen-tlb',
                           input: 'qga-vss.idl',
                           output: 'qga-vss.tlb',
                           command: [midl, '@INPUT@', '/tlb', '@OUTPUT@'])
-elif widl.found()
+else
   gen_tlb = custom_target('gen-tlb',
                           input: 'qga-vss.idl',
                           output: 'qga-vss.tlb',
                           command: [widl, '-t', '@INPUT@', '-o', '@OUTPUT@'])
-else
-  gen_tlb = custom_target('gen-tlb',
-                          input: 'qga-vss.tlb',
-                          output: 'qga-vss.tlb',
-                          command: ['cp', '@INPUT@', '@OUTPUT@'])
 endif
diff --git a/qga/vss-win32/qga-vss.tlb b/qga/vss-win32/qga-vss.tlb
deleted file mode 100644
index 226452a1861371ffe0cad1019cf90fdfdcd5ef49..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 1528
zcmeYbb_-!*U}OLRP8Kl5;0UB3A_y8H!@$4<WGF*9|A9aP$W{R21|SCUVfs9Pj1;IC
zKahR`)X0Ox{{ZC6An~sN`2tA%H9-9hNPHcj{0byK4>OPh6a(1_GM|T)fx!kz-UG<D
zK;nbc0l9GX===tt`Vb`fD?q*q5+7YXI$u?Zf#C;G4-9~uhYKVCC4f!`hZ{(Z0*HVD
zkhwswGqAt}ki;hd*$F@lQbP%-z+r|5P#hGW*vvKniaRx03p~wP?y>h_rLW<nKOg@=
z6{hYgzgH7@QE<^MU>KC!yoBjb#vz`9Lwu4+R-SJ!kIOX4xLBUUGN9-NyTyP76j}@n
z2f!qQ8-xepfXD+7rW+{SKz4&@7#qX~^1#sn3O|tFK>%ciE<<riN`6kNkzPqoQh0bc
zNbM*XJ|Un0jALSb15^rEE6h+Y8tCpA798vm9#E8DmYI@T<dc~c4pSpwQKEn@FU<fE
zfvHyrsVqoU0O~4AEUE;iEfI8i=bXgi;_z?|20Ng!&PAz-C8;S2NtFt|o-RHLWvNBQ
znfZAN=6VJOdIqMZrV5EA3T{Q23NES13Py$shQ?OLW>&_Q3PuKoMqI)S5zj9Ngog_=
gXfrXehlhjmFbIJB4$8MKU>*YlD1Z9^F{m5{03Vre%>V!Z

-- 
2.34.1



