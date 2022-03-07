Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAE64D0695
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:31:34 +0100 (CET)
Received: from localhost ([::1]:57508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRI8r-00070P-Fj
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:31:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHuk-0001GK-Tg
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:58 -0500
Received: from [2a00:1450:4864:20::532] (port=46710
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHuf-0005OM-2P
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:58 -0500
Received: by mail-ed1-x532.google.com with SMTP id y12so1429790edc.13
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZfOpyFRoufciIywj58YNuToW8FcorvQ7w95GMuMr8Iw=;
 b=DuiOKZ/wBafdC6eTxaKfZ/L3x4BKXxd4qPPoZT310+Rf0aqL8T+BOsnHx3qXwUOt9i
 zcPlJuJyLZG7kJUebINv17/Vmzj/qItdZFbd8eSGaerb/tylud7H6fRlSkiee+F59uK9
 zyiOE+GUkAV1CbMZCdTovrgSOHwVwkMTldts6AsEivn2cnkj4BF27G1WRSXOsEVXsMW9
 FzY3hT3mPdbZnqYGYYi7ik/7jqRbyDLNRzwPQH+MiNqh5MwPI/U0AQX2UAZgUNjeyhyi
 gWwwACaZKq5OI9MaimHPJ5S8rkMwJoCovdfL3lAR8csZsygrMZrdELfsqFgI0GNwZoWF
 18mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZfOpyFRoufciIywj58YNuToW8FcorvQ7w95GMuMr8Iw=;
 b=N17fZs5ErpAmUSOEeGu7UzLW4x5z1PvPo6f95rt7rIEI6P8WoR87z73YSACw8ipBXa
 yWfJK6BRcLj8yDLLxd4Rlz1UtSMOmuzylDGfQMclTz6S/hunAQEmARfo2GKHiwo2zBsE
 ThhRMABxWqX/c7IrXR/7R6Snz0Zva/oyeZWl9whQZt//TT/FR3Rhz9ieWhE0okojEXkt
 KgGQL+BFpr6IDd2OmZvzzSNy6Fua7J26BfHXV0+NmLOvpeUwc3RefVqX1txfQPpdZvvQ
 cVhuKnzSED9dAOVfQJGDAWDVR0y49z5lxiS6V1y8OawNhXkRT+v/oasz7kcxeOwU49ru
 LCxw==
X-Gm-Message-State: AOAM531R+lg5EQ87TU2ws+D80Zx0vuV8eUe8Q+RJBxoRH5USdYZ4YkQo
 4x7YB7p42uP7oBOSsFd0wK3u3RORDJc=
X-Google-Smtp-Source: ABdhPJyuSrLX6Hr+Mm+n7wALN3Tbt5JGNZxnwqcpPFq4mmUjdf0LGCTeSUID/Z1Jw1NoRSomOApcvA==
X-Received: by 2002:aa7:cac8:0:b0:410:cc6c:6512 with SMTP id
 l8-20020aa7cac8000000b00410cc6c6512mr12407748edt.408.1646677011743; 
 Mon, 07 Mar 2022 10:16:51 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm4983382ejd.217.2022.03.07.10.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:16:51 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/23] i386: Add Icelake-Server-v6 CPU model with 5-level EPT
 support
Date: Mon,  7 Mar 2022 19:16:30 +0100
Message-Id: <20220307181633.596898-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307181633.596898-1-pbonzini@redhat.com>
References: <20220307181633.596898-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
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
2.34.1



