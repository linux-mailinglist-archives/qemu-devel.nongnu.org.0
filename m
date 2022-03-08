Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C2C4D16BD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:57:42 +0100 (CET)
Received: from localhost ([::1]:49914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYTF-0007Xu-BN
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:57:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7k-0007rZ-I5
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:28 -0500
Received: from [2a00:1450:4864:20::62b] (port=35547
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7g-000618-F2
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:25 -0500
Received: by mail-ej1-x62b.google.com with SMTP id yy13so29694046ejb.2
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=46kJxzwhtB5sYrVu9en8jJZ3NOT8V7R9NqmfwJS7c8c=;
 b=SLTZqf8eZDt8w+pzzMjQef7Q2SZxBOIFzunZvTTZ8oCRZPrjO3uK/eoibyhGUwGokq
 VV6iziE3p2ki1FFlSeh5RoCWrEASd7GrzmjnSNo7kNExaBLP6G6HUOX1EMgpxFxRBXMd
 NW+5uUiODVacwysXEZF0zDEsL3xjuWu1/hMj0vAkRAQD/CDvLCD8ExBUGiTjXy+Ota1A
 eGVldHRjGPXgXphOAIvM327+6V8sFB5PKwGud2zihBfgtBsuVW6IR09qqzi9k8CmGgsc
 S5oDV8Sed4b9xOVGZ8h3RAb6EPwl75TI9RRio1lpmStnM5DfxQEdKv3DQr3fp5/60k7t
 7ROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=46kJxzwhtB5sYrVu9en8jJZ3NOT8V7R9NqmfwJS7c8c=;
 b=mgd1bLORmpfMtcnCJl1fwfJOmMfh/mgLJhY7Yu0HaDl8aare8oyoK44FCo6tH/rvcs
 TJMeMJed72d8wICz4M6qtV7wpiMjhFbqA8r9343tE/w2CiCmhsgnnqQ/sNcamjkBKCjf
 i1UP2D9xkflr4Tml77ZfedXUQcSa1op2rymoFplyYrKtksRZuXg6beESEVaidpDSB6o3
 RImRfpHFRiZMkMj4lIxi0ZLIyLTf4eQOB5Hsl+5x594vizIN1lU7NGhLwrKs6E5xph0y
 bPVz/OwPMbfgLeBBOBYeE4GUGH2i+PuxRdb4OptEGzSl1br5NoyToNOuARGEUOc3gsk7
 /kXg==
X-Gm-Message-State: AOAM53124Xs9CzcN0U8kiQI/wDwsOovKPCdzWVOEXEX0T28XX4ixEL3L
 7j9XR+g5BLQJ517aqEwGIC26wMEM/F8=
X-Google-Smtp-Source: ABdhPJxfJalGi249+kakoHfDT+eAUMK0j7Zc5VaksCmBFddMujulzzL/kDXs5+yp6/IpdIGmDwWr8Q==
X-Received: by 2002:a17:907:97c1:b0:6da:bd15:cca0 with SMTP id
 js1-20020a17090797c100b006dabd15cca0mr12662834ejc.327.1646739321463; 
 Tue, 08 Mar 2022 03:35:21 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:35:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/22] i386: Add Icelake-Server-v6 CPU model with 5-level EPT
 support
Date: Tue,  8 Mar 2022 12:34:43 +0100
Message-Id: <20220308113445.859669-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

Windows 11 with WSL2 enabled (Hyper-V) fails to boot with Icelake-Server
{-v5} CPU model but boots well with '-cpu host'. Apparently, it expects
5-level paging and 5-level EPT support to come in pair but QEMU's
Icelake-Server CPU model lacks the later. Introduce 'Icelake-Server-v6'
CPU model with 'vmx-page-walk-5' enabled by default.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20220221145316.576138-1-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 351a1e4f2a..916d3354fe 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3526,6 +3526,14 @@ static const X86CPUDefinition builtin_x86_defs[] = {
                     { /* end of list */ }
                 },
             },
+            {
+                .version = 6,
+                .note = "5-level EPT",
+                .props = (PropValue[]) {
+                    { "vmx-page-walk-5", "on" },
+                    { /* end of list */ }
+                },
+            },
             { /* end of list */ }
         }
     },
-- 
2.35.1



