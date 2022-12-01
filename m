Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C48263EBBB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 09:59:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0fLL-0002fo-Fo; Thu, 01 Dec 2022 03:54:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0fLC-0002dY-1i
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:54:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p0fKt-0003f5-Vt
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:54:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669884867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tW86kQAl/mD7xeEeaZttAb+GxpvwXAcNlfgGDQU1u1w=;
 b=dMBfumpQ7pNx/8+YDnuZHl06s99KHOF2g9/eiVmhWbjE6AUW2z4QeMpxBBhglY0ovElDMk
 yCSZ07MnBZdEgY4HRnHJoYghbLKf0G4pTZMGEu+NQYFn7EwVMbXqUCO/MBpScjC3pEg29U
 oPNG9NnlqwRVJzwtZW8NcnleQweSjUM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-5EZ_oiLAMfOr84PPO9E2mg-1; Thu, 01 Dec 2022 03:54:25 -0500
X-MC-Unique: 5EZ_oiLAMfOr84PPO9E2mg-1
Received: by mail-ej1-f69.google.com with SMTP id
 hc41-20020a17090716a900b007c07a5fc017so912800ejc.9
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 00:54:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tW86kQAl/mD7xeEeaZttAb+GxpvwXAcNlfgGDQU1u1w=;
 b=pJSTznk2PRkrUI/+UdYWFrvE1DL6jp1bskAo/VBkwc9itjfItIrPc2kR7hJ2o53E+i
 h2w0bhKfJFL3KxfPRU2iT0ha9U6CQsHMJZIIjMwOlC8qP9hGFB1VVnqMIl8meZFEpW+8
 Ju14mvBPiizk5i8ss2iLL73k61RC+LTeERPR2eJypBaYtqzlb/RFQsUBbTBXXqVbcjIM
 UYRw6uJzYXISmxjQPvx9RqLF9PvsSN7uY5aFiolKVtQhhsUJ9USwDnMYgAxhcclMKr5V
 Fq5GPXrv6/yxMbCROQIwxeg3igO5pVddC46lNqthqC8kWTajmsJ9MXIVO8YKZyZ0TxDs
 Wd9g==
X-Gm-Message-State: ANoB5pkKypiFCtaR9/Ewz/X8kymZRyZIBVbxdJ9cGrpMzdtC6N89fPdV
 L6aVwpsjpStQjACRAn9T5pfN1URkdURcm+LXEvAt2N5G4nqzMBk+rGDJwuawr52sa7VO+/9w6fS
 QnpmJx0qiMAFaDbS1HcNM9kv/3YtVogYpsgTMCEVpu3HrHUJLqz23s3yNBrafL1Spvxk=
X-Received: by 2002:a17:906:395:b0:7a0:b505:e8fb with SMTP id
 b21-20020a170906039500b007a0b505e8fbmr10013490eja.281.1669884864240; 
 Thu, 01 Dec 2022 00:54:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7IjWlvSe/H1RGQ/a+knOAjC8ovYecQ7p+r2szlP/wvh5DCg6x9TcdLOTB0rsgRUTuo04mnaQ==
X-Received: by 2002:a17:906:395:b0:7a0:b505:e8fb with SMTP id
 b21-20020a170906039500b007a0b505e8fbmr10013466eja.281.1669884863897; 
 Thu, 01 Dec 2022 00:54:23 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 sb25-20020a1709076d9900b007ae4717bef1sm1553775ejc.15.2022.12.01.00.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 00:54:23 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 1/2] target/i386: allow MMX instructions with CR4.OSFXSR=0
Date: Thu,  1 Dec 2022 09:54:18 +0100
Message-Id: <20221201085419.146789-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201085419.146789-1-pbonzini@redhat.com>
References: <20221201085419.146789-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

MMX state is saved/restored by FSAVE/FRSTOR so the instructions are
not illegal opcodes even if CR4.OSFXSR=0.  Make sure that validate_vex
takes into account the prefix and only checks HF_OSFXSR_MASK in the
presence of an SSE instruction.

Fixes: 20581aadec5e ("target/i386: validate VEX prefixes via the instructions' exception classes", 2022-10-18)
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1350
Reported-by: Helge Konetzka (@hejko on gitlab.com)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index e4878b967f0e..80c579164ff2 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -1488,7 +1488,8 @@ static bool validate_vex(DisasContext *s, X86DecodedInsn *decode)
             if (!(s->flags & HF_AVX_EN_MASK)) {
                 goto illegal;
             }
-        } else {
+        } else if (e->special != X86_SPECIAL_MMX ||
+                   (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ | PREFIX_DATA))) {
             if (!(s->flags & HF_OSFXSR_MASK)) {
                 goto illegal;
             }
-- 
2.38.1


