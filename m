Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFDF4A68A6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 00:42:08 +0100 (CET)
Received: from localhost ([::1]:33662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF2ml-0008LD-8m
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 18:42:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nEyXD-0008Mp-N4; Tue, 01 Feb 2022 14:09:48 -0500
Received: from [2a00:1450:4864:20::530] (port=34556
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nEyXC-0007dr-77; Tue, 01 Feb 2022 14:09:47 -0500
Received: by mail-ed1-x530.google.com with SMTP id r10so36715301edt.1;
 Tue, 01 Feb 2022 11:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WIvNSbN30GMagDEehAj/m2/rYx/ycqM3CvtIFk9cIeQ=;
 b=YA4NyNwOuCIwkC5qTZReHTpUhfsJdMzlariCHnHkAO3q5hFBzDKsoHEfIthVgduREs
 wtpwFEf3gAvYLjhnToGqg3TqNRcvIDkQZpFzQpZRe8moA3ehz+NP8QzSGTUqMUBI0C/n
 ZLbkHHQYpNJ2RBma+2y8L3qukgmpB1HEGr5EechnCTKukWVOWUNrdcpkk+I7D/TWgV/I
 Mo2Sj9Z5TvU1egDH2S+UZv5fSGKByKGf/HDMZ8j8qdEO275NsOfAZJlW73jETIFZQWWm
 khL4TXprTshMk34CGbIli+MZA/e+RZakwi4w/tiJKqEV60ZTt7Lwdhj+chE49DYPutxN
 n3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=WIvNSbN30GMagDEehAj/m2/rYx/ycqM3CvtIFk9cIeQ=;
 b=CWuPNwXRknEzNXlz69A09sdnogmw/VuV33/k/y9UVYFHpT/hemuwRC3Jbi4cGpyxo4
 XzZS7r8QBoc4t4pSdY3Ji9FK18fh6tU7cAOk8f1US1TQQXb0JJxNE8itweXIADzzL+dA
 2AldYiKTujNLTD6MCI118DD9aG8yUwOBgqgePW6gvtkjJ3utrtRAcL4YdrJDzyJCSqUh
 JaIknnkPQ+p+gGuEM4ZE5hSZ1Atu6Oh8KzEFho3yTUNyUHrBrmT9hN7tGRS5xqZLBV5Z
 poaatRmiaEZYNy2ZIH9u70IMV35dmdrAhuA9YfO8Sfhdw0Vgc924klvdv6qb1MHNJa9h
 t8fQ==
X-Gm-Message-State: AOAM532THSn/FORc8tcUuidxqu1QZc8hpM/grZnkgsV/2QKZp9f1qus1
 J3yIfraRG0RfFE2dVZopY9zwpkFx/as=
X-Google-Smtp-Source: ABdhPJwaNk3KnTZAHS4IMDNYI+lLhgkSwnm3mBY3GsVITIUty5xSLw6MKZG1VuYkP5DqbrZDiLBjCA==
X-Received: by 2002:aa7:cc08:: with SMTP id q8mr5139026edt.418.1643742583666; 
 Tue, 01 Feb 2022 11:09:43 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 o11sm19681204edq.5.2022.02.01.11.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 11:09:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: the sgx_epc_get_section stub is reachable
Date: Tue,  1 Feb 2022 20:09:41 +0100
Message-Id: <20220201190941.106001-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: qemu-stable@nongnu.org,
 =?UTF-8?q?Vladim=C3=ADr=20Bene=C5=A1?= <vbenes@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sgx_epc_get_section stub is reachable from cpu_x86_cpuid.  It
should not assert, instead it should just return true just like
the "real" sgx_epc_get_section does when SGX is disabled.

Reported-by: Vladimír Beneš <vbenes@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/sgx-stub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/sgx-stub.c b/hw/i386/sgx-stub.c
index 26833eb233..16b1dfd90b 100644
--- a/hw/i386/sgx-stub.c
+++ b/hw/i386/sgx-stub.c
@@ -34,5 +34,5 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
 
 bool sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
 {
-    g_assert_not_reached();
+    return true;
 }
-- 
2.34.1


