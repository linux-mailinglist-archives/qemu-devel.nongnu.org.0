Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1237B4D0651
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:21:37 +0100 (CET)
Received: from localhost ([::1]:52832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRHzE-0001dg-51
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:21:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHug-0000yz-A6
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:54 -0500
Received: from [2a00:1450:4864:20::533] (port=41669
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHud-0005Mo-34
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:53 -0500
Received: by mail-ed1-x533.google.com with SMTP id c20so2720192edr.8
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4VLoIpmcWh/bwRoXTyuG+imMilJf3xfJ/t7uUrTUILo=;
 b=AS8U6PKQQy515cGKMPgByuGO6At0c+h5fcFl4BrYLVRiuX8lD58Bbm71ecU+aizNv2
 X6aZFGv36crYGQBXbp2BKrU+BDNsnVnlYgs5mWo2QB5kKE+ptf2r8j661xk1BTa2Osn3
 uZHPZ3vHHZAv/uRO2uRoN4KBNZo7RiPhPuQkOhnmVcYZWFguTKZbUXKsG/nPBG36pnMP
 +sfPAxSmi2DY4oUv0gzrsr/4Vf92aiprp/l9j2jOX09nvc0naY2fBeDpgyXoRK9FllTW
 QMAzggtELGtv4MRkRI7qTWHX2MJ7eEu47KL76yqa/EPgIMtVvaxxCA6b7UfybZdrBBgm
 Y4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4VLoIpmcWh/bwRoXTyuG+imMilJf3xfJ/t7uUrTUILo=;
 b=4nkJY21l7jkMZrqVtEithFVNxNA0IiC7ukGEk88UOTinF1sdHtQejTYIr8qrYECJTu
 lm1Ww5RjEDGoYjGDhuDHGiSAugeWC12gBSJme1uwFTqRcQYna5hZL4O36hJL2ie4q47L
 jJr+v+o+3x/dz5HKiTsQ8vRC+2iFBF1L+rMl+bgiupgIb767RHViSdW4yf8YLCbyxGUj
 xzsFY07KDHmGGsRj8LwRs9f56UxfB7nX1CM8VRcsUAiodQxk2n88Chuiwb7YEhH2sgMu
 XB2ed4jxsW42NTtjA7T+m/FVHCu9tnw/3dAV6zj1y6HSvzEg8V18TMdAwoy6uHMpvOY6
 o5+w==
X-Gm-Message-State: AOAM531sbyrout8oJkgisN+qEtlsuy4Y5uWJu0x7ytkLZHT3mdoVVpOH
 zP37A8EZBBR/hxfWkH2OdGzS3cELVhw=
X-Google-Smtp-Source: ABdhPJw/I/ID12EcoaaQIik9AMuEfWz8hut/y6CBYZzBfW+2P+mI/VHdINeW37NTFgkjfFQKzu7UkA==
X-Received: by 2002:a50:baaa:0:b0:410:a098:2a7f with SMTP id
 x39-20020a50baaa000000b00410a0982a7fmr12584760ede.53.1646676998825; 
 Mon, 07 Mar 2022 10:16:38 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm4983382ejd.217.2022.03.07.10.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:16:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/23] meson: fix generic location of vss headers
Date: Mon,  7 Mar 2022 19:16:14 +0100
Message-Id: <20220307181633.596898-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307181633.596898-1-pbonzini@redhat.com>
References: <20220307181633.596898-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This is a left-over, despite requesting the change before the merge.

Fixes: commit 8821a389 ("configure, meson: replace VSS SDK checks and options with --enable-vss-sdk")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220222194008.610377-2-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 8df40bfac4..b871098dbb 100644
--- a/meson.build
+++ b/meson.build
@@ -1936,7 +1936,7 @@ have_vss = false
 if targetos == 'windows' and link_language == 'cpp'
   have_vss = cxx.compiles('''
     #define __MIDL_user_allocate_free_DEFINED__
-    #include <inc/win2003/vss.h>
+    #include <vss.h>
     int main(void) { return VSS_CTX_BACKUP; }''')
 endif
 
-- 
2.34.1



