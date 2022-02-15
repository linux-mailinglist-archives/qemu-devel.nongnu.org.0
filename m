Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1534B68BF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 11:05:00 +0100 (CET)
Received: from localhost ([::1]:47382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuhf-0000rI-8K
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 05:04:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCU-0004cA-RT
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:46 -0500
Received: from [2a00:1450:4864:20::632] (port=37675
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCS-0008UX-Oc
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:46 -0500
Received: by mail-ej1-x632.google.com with SMTP id h8so16384008ejy.4
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bv7+RSXKAk+/P8xmsmdOzIGcRi8dXXMcCuzdHmmHF5c=;
 b=EXoOyhBgb/DvfnigH5JFDWDANQExbVqQLZu8JLYN3s6EVb7SVsVkrvxaKg//DbrSaw
 irODQEVsSTnt7ueHCyDZHw/JmaSBTQTew4Th95mGtFeSdPneJC9q37E6XfQ9+NRLdAsw
 MPzVz6ADRamOIiCUQq1/MAEmIvekb+F1lwttrixArI0OC/KkreB6VqQE4Cx89ItEFV33
 ClLiftoPnLVQqUZ1pIHK8O9vcN4zKAIbMqNy5ybWvYCCGj4YjsfTgSNwak8P6+hypyfS
 7Ek5OKu2tyqdew49ZFv4evGR/PqNLvN/arAX2KQhb5qlT6hdCJoSZtkhJ5e/T4nMwH+l
 PWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Bv7+RSXKAk+/P8xmsmdOzIGcRi8dXXMcCuzdHmmHF5c=;
 b=X+FwYiV/AXBIbVMbU9/9+F/pfcCzQhIGruQ9vjry96ZFOyVj6Dt0bAqvhP04AMP8wk
 9ob2NTzcyHwSC9OSrQ/DmStQ09Rs292tDk/JE5ruB3m6CJi6a3Io7C2tiLAW1fRpbv53
 C4fK0CFAYnIBFjWyPMCtJ2TaTNrNT4dQmUGeRkKZu0QrH3DjBUDcDbucUnbV5Nvh2hf3
 i1rNKsny6lh6NpA1Uum5cayUgASmHP/m4IQ1STgzktfjqe2xYXYaXTvTd5IDvo1cYGdy
 81K8g7G0DHaCtmQ3AtRBni8urvG+txi+aFspipTVZdMT6KM3V4Ja2gaUePIcKUaCKPLs
 vZsQ==
X-Gm-Message-State: AOAM533/5d3ePCKTAnGgLsJ1SqmAZK3WEnEQ3aYaVMaZK30XM27jy5Lr
 X+viqbsy9TnPOMgcfa6OtwL1kMMsCAI=
X-Google-Smtp-Source: ABdhPJy7wlLWTMV084EViwieku5m5sGnhSFd1qXGs2ozhQv/jGxlZxzVry6YhxUuqh/lAhqb6maf0w==
X-Received: by 2002:a17:906:190d:: with SMTP id
 a13mr2170751eje.339.1644917563290; 
 Tue, 15 Feb 2022 01:32:43 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/30] qga/vss-win32: require widl/midl,
 remove pre-built TLB file
Date: Tue, 15 Feb 2022 10:32:20 +0100
Message-Id: <20220215093223.110827-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

There are no good reason anymore to keep a pre-built file in the repository.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build               |   4 ++++
 qga/meson.build           |   2 ++
 qga/vss-win32/meson.build |   9 +--------
 qga/vss-win32/qga-vss.tlb | Bin 1528 -> 0 bytes
 4 files changed, 7 insertions(+), 8 deletions(-)
 delete mode 100644 qga/vss-win32/qga-vss.tlb

diff --git a/meson.build b/meson.build
index 39126d1cc6..730e622417 100644
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
index a32c141dd0..4ac781cb33 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -20,6 +20,8 @@ have_qga_vss = get_option('qga_vss') \
     $ scripts/extract-vsssdk-headers setup.exe
     The headers are extracted in the directory 'inc/win2003'.
     Then run configure with: --extra-cxxflags="-isystem /path/to/vss/inc/win2003"''') \
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



