Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEC66F063E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:56:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps1Aw-0004kt-HL; Thu, 27 Apr 2023 08:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ps1At-0004ae-Iy
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:56:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ps1As-0004pK-6D
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682600197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PHhT/smfyWtvGZDS7UNOSFwqaBjI/hYBfmr5J0LGzIU=;
 b=TnyH4xt9moLajRvlSV3tkowec9TSSr3FdxG4LTPbsN71pFsoEl3jnDO9mSEgb+3OMcl+UT
 aPqfPuWQ6icBfQRz24E8srKBWCH02PCBRaBkS7bHkJtbgEPXwRPuDNESbEHwW2wVtGoZkr
 IYzb+cN2fxFmu0K10lJTpg1yx8+uk1o=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-ZjeC4tm5MxWK0zlTQh626w-1; Thu, 27 Apr 2023 08:56:36 -0400
X-MC-Unique: ZjeC4tm5MxWK0zlTQh626w-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-94ec76d7a26so817391266b.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 05:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682600194; x=1685192194;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PHhT/smfyWtvGZDS7UNOSFwqaBjI/hYBfmr5J0LGzIU=;
 b=TOaYIarBwX9Fs/acNKJBo1iwq4qBhtUUpok3yhIzIlUwVCpQV5i/pfVOhgAOY3LSci
 b6BFc+5Y884YPkW1+XDiC+k58SvTIzbq7um6eaJgdcePniHNBl+7uCjTfA5FIqcoX4Jz
 3BGXEUjlo5fbec0ZDekeQBhsXQu9xLbokUCBfxYJfkx81+aggy0C+Hcwy8TsrsT4+SL8
 Z6N5p4gcUv7wBKradRoitCxUrTsByARpjhdwszIzJ4448Coilo2Di7Pc5/EQ1Fcv3Hs+
 sQiGmlgi9Bopk0QtRIAEcui989JLBCcgSVzdrFnB8o1ZYUiz8UwdW5bAsa+n+nmmCgdB
 hRTw==
X-Gm-Message-State: AC+VfDyOhTwcTy2L4GAyzuZGhhJ4cwVNKDyCdjrCe7Gwi75K88W1P2ev
 plpTy4S0YcYQ3n3xvnH93P3zfLETa97iFDPTlNWTvQ9fxjErhzXUDTp7PgNj7nfWxmKL1vG9CfP
 L3MeedDQVZmT/CBN68wR7VJG2NoxoQQSwzxrpKQyklFGOAsV4nc2LmfSss6uAv/D5PNjd021NUk
 EUeg==
X-Received: by 2002:a17:907:7da9:b0:953:4481:3301 with SMTP id
 oz41-20020a1709077da900b0095344813301mr1769652ejc.59.1682600194392; 
 Thu, 27 Apr 2023 05:56:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5C6m/c+ARIMtcq3u80lgyXOIAqWu1LFgWOkgZVqJegzXZSKSFDiEZHMU01xMhGZkQ9tNndsA==
X-Received: by 2002:a17:907:7da9:b0:953:4481:3301 with SMTP id
 oz41-20020a1709077da900b0095344813301mr1769630ejc.59.1682600194023; 
 Thu, 27 Apr 2023 05:56:34 -0700 (PDT)
Received: from [10.168.80.215] ([131.175.147.17])
 by smtp.gmail.com with ESMTPSA id
 vh7-20020a170907d38700b0094f31208918sm9517149ejc.108.2023.04.27.05.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 05:56:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Taylor Simpson <tsimpson@quicinc.com>
Subject: [PATCH] target/hexagon: fix = vs. == mishap
Date: Thu, 27 Apr 2023 14:56:32 +0200
Message-Id: <20230427125632.104034-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
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


