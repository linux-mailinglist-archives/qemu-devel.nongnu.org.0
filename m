Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788CF6F2497
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:18:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjVz-00072t-IR; Sat, 29 Apr 2023 08:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVm-0006Lh-RR
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:17:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVl-0004xM-F1
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:17:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682770628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PHhT/smfyWtvGZDS7UNOSFwqaBjI/hYBfmr5J0LGzIU=;
 b=XCJO6kPWcCOudePVePA/HkD+pGy7hjp2Rxb5y4MWagPyhMgkikPYWfASzmjaV+ASywBuvs
 xxB1sGo+uxfTNnXcotrRa7N4ilfzbHHWnpgAxB2gtuNLxm6ECzNLfgmtSUKODCd+OmKlUG
 AJ6oXeVYEMUOQpgacJdufTQNmSHlv88=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-GXaMI7q_NQunFxPbf_SkNQ-1; Sat, 29 Apr 2023 08:17:07 -0400
X-MC-Unique: GXaMI7q_NQunFxPbf_SkNQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a341ee4fcso106851866b.0
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770625; x=1685362625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PHhT/smfyWtvGZDS7UNOSFwqaBjI/hYBfmr5J0LGzIU=;
 b=VGBfEYEYFaJr5TWb3Ggdn/GPppu5ykqqAqqdoFX20zAmwF5vJ/AqzLk40mCpoLYRDP
 6NLqUqIhsv+Q6/p4V0Xj2ADN5Tqz8RGm5QiJauvWRfPT1MhrxDS3O1MNGMLYQ+baXLDZ
 r3J6sKLmdj531sTrLY3QtjWbeun9ADOgmdozkw8PlVNJ7wjpFJT99DJA9xqTVa/YKU1m
 YWzofAa2B9A2TLTVeCVvEnOCSI+aMsiWq7EU8BEy2QkPJa60DOjqV9AqQMfsiV+7gA/O
 6AGj0yZmKhkN1inXECwA+dpiSm23MhFDijLYMzMRcAE8/Zvambrjkulcc6qgCKg7T4t3
 /ruA==
X-Gm-Message-State: AC+VfDxm+ZyQ78TH0C2g7BsQzS9gQ4pgQZRluK1D9VGBZKCYF3dTuhNw
 zEikbCTAGt98zGnxuymgjophsr7KjdNxWngmrPyknFe/gVVP5GSFs/ojDnVyd61MbAWezgGVu9O
 yGVIyFxSaNGLn4y27dj1xHjTAruMVUdmO7mOW04a0OLSpNRZgm8NtUuHgIz1p1CLMm1OuWQeBPv
 I=
X-Received: by 2002:a17:907:3e1a:b0:94f:19b5:bafd with SMTP id
 hp26-20020a1709073e1a00b0094f19b5bafdmr8980996ejc.42.1682770625630; 
 Sat, 29 Apr 2023 05:17:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ZKeO3hDrCuU7baQtKvFKGPRkulHqCP6bKJP6RJEztD7koh2aXxDCp7L6EMMIJNX43pprmhA==
X-Received: by 2002:a17:907:3e1a:b0:94f:19b5:bafd with SMTP id
 hp26-20020a1709073e1a00b0094f19b5bafdmr8980980ejc.42.1682770625414; 
 Sat, 29 Apr 2023 05:17:05 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a17090616d900b009534603453dsm12269893ejd.131.2023.04.29.05.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 05:17:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Taylor Simpson <tsimpson@quicinc.com>
Subject: [PULL 15/17] target/hexagon: fix = vs. == mishap
Date: Sat, 29 Apr 2023 14:16:34 +0200
Message-Id: <20230429121636.230934-16-pbonzini@redhat.com>
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

Coverity reports a parameter that is "set but never used".  This is caused
by an assignment operator being used instead of equality.

Cc: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/hexagon/idef-parser/parser-helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index 86511efb62b9..0a01ec39b75e 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -1123,7 +1123,7 @@ HexValue gen_extend_op(Context *c,
                        HexValue *value,
                        HexSignedness signedness)
 {
-    unsigned bit_width = (dst_width = 64) ? 64 : 32;
+    unsigned bit_width = (dst_width == 64) ? 64 : 32;
     HexValue value_m = *value;
     HexValue src_width_m = *src_width;
 
-- 
2.40.0


