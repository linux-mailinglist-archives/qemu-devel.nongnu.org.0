Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6256FE29E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:37:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmoI-0005VJ-ID; Wed, 10 May 2023 12:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwmoC-0005Uk-RS
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:36:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwmoB-0005KR-GQ
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:36:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683736613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s3Rv+ESo7WNW5A9ZevmKZ3JyG2kyStdtRscAL+/MXEo=;
 b=BssLc13JbCbZgs/qp4onhsJzIPJ+yt7F2dQqJcOGJ2CfmsXfjBCtauK1rByWiEMUXXzkk2
 mBl/Kva1D5zCOv9JyiQgwnTQupchCG+eLANyxu0Mve7TPXPrGC+4QhVHnDe6kb8R4ylhNN
 FRpVeaIT9tVOeB4m7ib23pX9n3o3eb4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-yvUp02GZNRiVzrQLI2MFLQ-1; Wed, 10 May 2023 12:36:52 -0400
X-MC-Unique: yvUp02GZNRiVzrQLI2MFLQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9532170e883so936406566b.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683736611; x=1686328611;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s3Rv+ESo7WNW5A9ZevmKZ3JyG2kyStdtRscAL+/MXEo=;
 b=DDV+JH/hqSGBJysTPjZZ+rS83AWaF+JCRGgf6DI6W2O/dZ3NPKAddNE35lXbj/JbQe
 ZOC5+tyZ2HsGf6BsdMKy6AoXCmbtuMuTrgkOOyQf8DZmwiJZRfxekEv7q6574ypPXJP8
 Otsb0E28+ndOCaN6VBYwH7SFe0unigBc9rFYVkdXkojZN11YNSiMVy3PSfr4Bu2vCBaG
 +G+UzvtO3qv6bJwhSgPOfGI0A5kqEXzBtcGfqEVOxuTVm7bkONj/mkQHM07sePEd3Red
 2w+CdurlQsjDiQyY/Fu1HO+aPS1ED5NaU8fOG8Bzx2UCBGXAbQKggQ+J7Q3r962DB0uS
 Ajrw==
X-Gm-Message-State: AC+VfDxqqjnqgbQE8kHYBaBTJxx89UZyxnMbQYOc1ehjqi9EjjVm+mTa
 zc1fR1i9FXSIlaO5NKzrFhllv6qzFdX4Sjyw2NEi8RiBzrY62ucvghiQyqJZvtl61ZF5DdFbpzM
 lHDGVkHD6lI80m+FGwQ8wNBD5IResmdhHisuz8yRNQKhI5w1WetlCAH7Y7tQHMmphDXUiYeDOsU
 8=
X-Received: by 2002:a17:907:2d09:b0:966:4d75:4a44 with SMTP id
 gs9-20020a1709072d0900b009664d754a44mr11656069ejc.24.1683736610848; 
 Wed, 10 May 2023 09:36:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4RSfh/jo7L81j5Wv61xo+MNBGts+v8EsyTnBrb9sXU9E4BzZ5ncEiWUrCkYBmuso6M+jZZGQ==
X-Received: by 2002:a17:907:2d09:b0:966:4d75:4a44 with SMTP id
 gs9-20020a1709072d0900b009664d754a44mr11656049ejc.24.1683736610448; 
 Wed, 10 May 2023 09:36:50 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 hf15-20020a1709072c4f00b0094f58a85bc5sm2846244ejc.180.2023.05.10.09.36.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 09:36:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/tcg/i386: correct mask for VPERM2F128/VPERM2I128
Date: Wed, 10 May 2023 18:36:49 +0200
Message-Id: <20230510163649.1273943-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The instructions also use bits 3 and 7 of their 8-byte immediate.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/i386/test-avx.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/i386/test-avx.py b/tests/tcg/i386/test-avx.py
index d9ca00a49e6c..641a2ef69ebc 100755
--- a/tests/tcg/i386/test-avx.py
+++ b/tests/tcg/i386/test-avx.py
@@ -49,7 +49,7 @@
     'VEXTRACT[FI]128': 0x01,
     'VINSERT[FI]128': 0x01,
     'VPBLENDD': 0xff,
-    'VPERM2[FI]128': 0x33,
+    'VPERM2[FI]128': 0xbb,
     'VPERMPD': 0xff,
     'VPERMQ': 0xff,
     'VPERMILPS': 0xff,
-- 
2.40.1


