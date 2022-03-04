Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E3D4CDDBC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 21:14:16 +0100 (CET)
Received: from localhost ([::1]:35956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQEJb-0001Mp-Gh
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 15:14:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1nQEIG-0000dq-LF
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:12:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1nQEIC-0007Y5-U8
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:12:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646424767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yae9tcyRRIcMMdXZij4r2aPFClIS/AdEq2K919VwPEI=;
 b=aZHEVHZWsBdIYZShinJy9b9frkvlJqVSZIRWnQIZEHZ0g+m8rTUWNhIXHytVAP+QKW1jXu
 ASUazSBhr33Vjsp4m9OVKdAD/futUbsP86PY6y8GwSCUsWxLs3Jz4giRlog3TwlDJlJUGN
 65YbA80wo6Bgbvi4Zc/KOG/zaI2xThY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-9h3JOzNcMLy4VT_WyjMMBw-1; Fri, 04 Mar 2022 15:12:44 -0500
X-MC-Unique: 9h3JOzNcMLy4VT_WyjMMBw-1
Received: by mail-qk1-f199.google.com with SMTP id
 s12-20020a05620a030c00b0064971887744so6414335qkm.8
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 12:12:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yae9tcyRRIcMMdXZij4r2aPFClIS/AdEq2K919VwPEI=;
 b=hiisw2AmwLHOkCsQOlLQjBgJVWt7EAjE9We3CCj6kobjUaTs6/BDupAgscG2Qr7PTW
 SuEckbufFpQcw5TGTI9gYbjTt+ADtt7twjldFoY/7JSHfvJ17iMTQqHmNshnBZK6P7/D
 mCpSKX5NahuktKNkwdlsIgH/onrPGcZloCXkp2gvATHzcRPKJwovLL7hg0jKrg7bciyv
 rOPdrfWEUTgDfobxDS7ejTfKrf7KxToIgxn6E57Fn63453sv55Uo2AnLsqjnkj6YNWGC
 w2eJKarV00bdoYHu3+lVy3UKVph9hZd/TVQN4tpXvJyRWC+IYIHNFcbi22iAGxSd050x
 uZJg==
X-Gm-Message-State: AOAM531D/NtJtJZKuD4NzrTFVCwpGm6OmkbSzbM5HatOE9mW2xR+EKGG
 Qly3Hw1qZClL9imrf+qN0q0P/PdE0lmiU+bXEtz4otx0wma1ZESlwSweo+HNCQ72oZnuCSU4lzv
 7y8c75VRWFL8uxrmSBs/NjDiCdB6+xqNe8nh+PU4zi6RlGN0Q96j8NHehgw50eVH9Lu0=
X-Received: by 2002:a37:cc6:0:b0:47e:b863:a65c with SMTP id
 189-20020a370cc6000000b0047eb863a65cmr247551qkm.202.1646424763349; 
 Fri, 04 Mar 2022 12:12:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSOrAecTFY+QApqcPd6vP/Bk7IrTPHDRJ+re0Dhz97JEsBzgunhI1q8ZrPiTiPuBJCOWK4dA==
X-Received: by 2002:a37:cc6:0:b0:47e:b863:a65c with SMTP id
 189-20020a370cc6000000b0047eb863a65cmr247533qkm.202.1646424763049; 
 Fri, 04 Mar 2022 12:12:43 -0800 (PST)
Received: from fedora.redhat.com (pool-71-175-3-221.phlapa.fios.verizon.net.
 [71.175.3.221]) by smtp.gmail.com with ESMTPSA id
 v26-20020a05620a0a9a00b00605c6dbe40asm2762997qkg.87.2022.03.04.12.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 12:12:42 -0800 (PST)
From: Tyler Fanelli <tfanelli@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] i386/sev: Ensure attestation report length is valid before
 retrieving
Date: Fri,  4 Mar 2022 15:11:43 -0500
Message-Id: <20220304201141.509492-1-tfanelli@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=tfanelli@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=tfanelli@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, mtosatti@redhat.com, berrange@redhat.com,
 kvm@vger.kernel.org, Tyler Fanelli <tfanelli@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The length of the attestation report buffer is never checked to be
valid before allocation is made. If the length of the report is returned
to be 0, the buffer to retrieve the attestation buffer is allocated with
length 0 and passed to the kernel to fill with contents of the attestation
report. Leaving this unchecked is dangerous and could lead to undefined
behavior.

Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
---
 target/i386/sev.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 025ff7a6f8..e82be3e350 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -616,6 +616,8 @@ static SevAttestationReport *sev_get_attestation_report(const char *mnonce,
         return NULL;
     }
 
+    input.len = 0;
+
     /* Query the report length */
     ret = sev_ioctl(sev->sev_fd, KVM_SEV_GET_ATTESTATION_REPORT,
             &input, &err);
@@ -626,6 +628,11 @@ static SevAttestationReport *sev_get_attestation_report(const char *mnonce,
                        ret, err, fw_error_to_str(err));
             return NULL;
         }
+    } else if (input.len == 0) {
+        error_setg(errp, "SEV: Failed to query attestation report:"
+                         " length returned=%u",
+                   input.len);
+        return NULL;
     }
 
     data = g_malloc(input.len);
-- 
2.31.1


