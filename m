Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BC76F2492
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:17:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjVV-0006A6-Ri; Sat, 29 Apr 2023 08:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVT-00069C-ON
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:16:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVS-0004tD-9D
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682770609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y6n25tAvKjm/CgHaYE2Nh9DWMy5VIM9DHEAD/A734ys=;
 b=gvfQFNM9BlxoH1+G/3+WIdLUAdy4xoxgaHvELIYoScpQTvKiewkyFHzjgNN4v7ZfeLPRiZ
 vCwLa1nasoqRPSK+c2v8v1vptPlpiaFHxu7Qqb9mI/D+cAoxLMEa6eK4qa/x/BAxppdCCY
 suZAUmxTD6nl2izKcOBQMzr68DC3Dzc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-W3_Xpf0vM8uZBjDZeIGDtw-1; Sat, 29 Apr 2023 08:16:48 -0400
X-MC-Unique: W3_Xpf0vM8uZBjDZeIGDtw-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5067ce9bf7bso840316a12.2
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770606; x=1685362606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y6n25tAvKjm/CgHaYE2Nh9DWMy5VIM9DHEAD/A734ys=;
 b=Et/HqHXpSbbr4bP6190JU/48pSj3AuKXmLQZ3V4H8AF7fzYfXwbf6ansjIfo3Pi+OF
 5bGvubbgGDJPIXHLVOPPQEYobEP615cEvHpYkb0wrkVrvDjsI73QSj/Pwlpj5Jw0GfsD
 ZWV/nGDF/dnBFThSYVrKdBp2R0wrLA5yinsDP6YpBPiVRd6ccgXmhx+EVAAeZqfizvBY
 fpWTam8AnR6JDVMVSJUtWAQU+KSWtPjxZT2tUaBrRKP+B9HC1OFKBubqVmP3IR3gf4i8
 N730i1BpffnKz90DWuPIHMy42d3WZv9K/wjWw1nMGMhXLsJq2iWHsyS8/ASociipqvZV
 W7Gg==
X-Gm-Message-State: AC+VfDx84ebs2HR3QuwGBiod02uk/IehunUatd223TVR/iW3JWStshno
 i/zVEocVcDXJndOb+A2Fstz2uJ2TgS78Wm3KRL9XHDPv549qcBpkMiJYDCp5OolBOl7wJwhi6sT
 iCsk+6oanjIsJ0JqQpDFfFHD86Dvw2PXJ0tB9KywOGVskFzAo/Z/6bljzMA+4FkdrmHAuxyRAEt
 w=
X-Received: by 2002:aa7:c2ca:0:b0:506:a48e:6af1 with SMTP id
 m10-20020aa7c2ca000000b00506a48e6af1mr1232521edp.38.1682770606208; 
 Sat, 29 Apr 2023 05:16:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6EpE84ck5Zrv6ZlludpThDEZ4dGbJIjOzuvMoMNAHnxlVXC9qthTquYhBvCQ3uQ7SmV/EWpA==
X-Received: by 2002:aa7:c2ca:0:b0:506:a48e:6af1 with SMTP id
 m10-20020aa7c2ca000000b00506a48e6af1mr1232507edp.38.1682770605888; 
 Sat, 29 Apr 2023 05:16:45 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 i21-20020a05640200d500b00501d73cfc86sm10483196edu.9.2023.04.29.05.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 05:16:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 04/17] i386/cpu: Update how the EBX register of CPUID
 0x8000001F is set
Date: Sat, 29 Apr 2023 14:16:23 +0200
Message-Id: <20230429121636.230934-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230429121636.230934-1-pbonzini@redhat.com>
References: <20230429121636.230934-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Tom Lendacky <thomas.lendacky@amd.com>

Update the setting of CPUID 0x8000001F EBX to clearly document the ranges
associated with fields being set.

Fixes: 6cb8f2a663 ("cpu/i386: populate CPUID 0x8000_001F when SEV is active")
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <5822fd7d02b575121380e1f493a8f6d9eba2b11a.1664550870.git.thomas.lendacky@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 2e30e348a176..73dd99374abe 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6000,8 +6000,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         if (sev_enabled()) {
             *eax = 0x2;
             *eax |= sev_es_enabled() ? 0x8 : 0;
-            *ebx = sev_get_cbit_position();
-            *ebx |= sev_get_reduced_phys_bits() << 6;
+            *ebx = sev_get_cbit_position() & 0x3f; /* EBX[5:0] */
+            *ebx |= (sev_get_reduced_phys_bits() & 0x3f) << 6; /* EBX[11:6] */
         }
         break;
     default:
-- 
2.40.0


