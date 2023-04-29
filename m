Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FCB6F2495
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:18:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjVU-00069Y-UL; Sat, 29 Apr 2023 08:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVS-00068o-E0
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:16:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVQ-0004sw-Rp
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682770608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YeUC/1DjrJw6AqrdGMEqztcG44rXewMs3zOdih0CUzU=;
 b=IFacNYagof8qeHMdLO3Xz6FQItVg9zM5tu2VCvwdfytyUWuEBVB0MkJaphlCjPEQfQS8rW
 gtk5c2LZvPcO+cphsFmPclcI3lVvuJIWHZxALNo2oyfPErgPZNlCcos+0swOVQw1xJXOfi
 W0Tj2k6VsBIQANUfTnKh89RnC2i4teo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-b4HksLkmOieNegfFSpz7Nw-1; Sat, 29 Apr 2023 08:16:46 -0400
X-MC-Unique: b4HksLkmOieNegfFSpz7Nw-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-506a446b97bso864430a12.1
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770604; x=1685362604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YeUC/1DjrJw6AqrdGMEqztcG44rXewMs3zOdih0CUzU=;
 b=PbIHx8Kyt2kQQgDKqKnuiUns+84VPos0g7JAOd6PoSB+xkErMvnRAkCRWP9hSNcKif
 PUuiSjdyyghVUuEaYhVVwdno+XLebDosQ9GtF4CTkkrNYk7ZQCIVrqMZj3h1MUbiN+7o
 TyeqhwjA9rC9Z5NcVnIDoc2USsJQLpV1fgZgeebyQ0+AblazqMZdEeUx+aqbYsMWzWlc
 xc4nLRe12zGANF/srBwE3ewKE72RB9f6bl7L2nFDT8wpJok3/rePBtg8lv0018lFemIB
 HP5nOL/ATAORNMpgYXXLMJdntsv7BhNxEjIhSoh4szAXZ/a7PV/Q9Vmjc1rmGs7xpdNf
 RITg==
X-Gm-Message-State: AC+VfDyR7pNu2A5FLLiHL5VxembAoMg9wibfbOuhDFCVPQVoTorr13w8
 6NVZ3Z7pKiBC8ftXkS+U/rlpqSvEZbn7Z8HMnL+1tf9naoqzI5tUQgLO+ixvNrdhq5X240IR8nm
 OnYcYvPSA3xJjQPF3bwLw1JCfkJgVbbBCeDqXZEuejUx1s6AMn4o5HmUFPHc1weC37RDVGMPaQs
 g=
X-Received: by 2002:aa7:d9da:0:b0:50a:1d85:319e with SMTP id
 v26-20020aa7d9da000000b0050a1d85319emr1292043eds.27.1682770604417; 
 Sat, 29 Apr 2023 05:16:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qqm9mxpvYUbiBnvj+XxqNKMAMguvezwsxR3AuKvqpsV8VgGvyA60QKUeXnB/iNQ5szZ5riA==
X-Received: by 2002:aa7:d9da:0:b0:50a:1d85:319e with SMTP id
 v26-20020aa7d9da000000b0050a1d85319emr1292026eds.27.1682770604074; 
 Sat, 29 Apr 2023 05:16:44 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a056402138b00b004bd6e3ed196sm10018010edv.86.2023.04.29.05.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 05:16:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 03/17] i386/sev: Update checks and information related to
 reduced-phys-bits
Date: Sat, 29 Apr 2023 14:16:22 +0200
Message-Id: <20230429121636.230934-4-pbonzini@redhat.com>
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

The value of the reduced-phys-bits parameter is propogated to the CPUID
information exposed to the guest. Update the current validation check to
account for the size of the CPUID field (6-bits), ensuring the value is
in the range of 1 to 63.

Maintain backward compatibility, to an extent, by allowing a value greater
than 1 (so that the previously documented value of 5 still works), but not
allowing anything over 63.

Fixes: d8575c6c02 ("sev/i386: add command to initialize the memory encryption context")
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <cca5341a95ac73f904e6300f10b04f9c62e4e8ff.1664550870.git.thomas.lendacky@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/sev.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 859e06f6ad77..fe2144c0388b 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -932,15 +932,26 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
     host_cpuid(0x8000001F, 0, NULL, &ebx, NULL, NULL);
     host_cbitpos = ebx & 0x3f;
 
+    /*
+     * The cbitpos value will be placed in bit positions 5:0 of the EBX
+     * register of CPUID 0x8000001F. No need to verify the range as the
+     * comparison against the host value accomplishes that.
+     */
     if (host_cbitpos != sev->cbitpos) {
         error_setg(errp, "%s: cbitpos check failed, host '%d' requested '%d'",
                    __func__, host_cbitpos, sev->cbitpos);
         goto err;
     }
 
-    if (sev->reduced_phys_bits < 1) {
-        error_setg(errp, "%s: reduced_phys_bits check failed, it should be >=1,"
-                   " requested '%d'", __func__, sev->reduced_phys_bits);
+    /*
+     * The reduced-phys-bits value will be placed in bit positions 11:6 of
+     * the EBX register of CPUID 0x8000001F, so verify the supplied value
+     * is in the range of 1 to 63.
+     */
+    if (sev->reduced_phys_bits < 1 || sev->reduced_phys_bits > 63) {
+        error_setg(errp, "%s: reduced_phys_bits check failed,"
+                   " it should be in the range of 1 to 63, requested '%d'",
+                   __func__, sev->reduced_phys_bits);
         goto err;
     }
 
-- 
2.40.0


