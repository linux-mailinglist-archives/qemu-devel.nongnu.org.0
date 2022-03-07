Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E06C94D0657
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:22:04 +0100 (CET)
Received: from localhost ([::1]:54554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRHzf-0002lm-Ve
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:22:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHug-0000zA-FN
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:54 -0500
Received: from [2a00:1450:4864:20::52c] (port=33287
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHud-0005N2-2e
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:54 -0500
Received: by mail-ed1-x52c.google.com with SMTP id m21so15656535edc.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5jubMeLfMS6DO/0PCPGI57Go6LtnBr0CArY5PUrgsRY=;
 b=V1o+of6JosL1iyVdmwLrRXN3uymfNudvXEQ5h/HOt2JETYUx6lUcNsnwFiPGanuBbd
 3VZozjrMWisU96KKgQLQiGJaKlUz1Gw5LIT4fmt3RN4OR9+fbYFqQ8ia4MdF+hqzU5Tf
 P1TR709oFzg6aLqyR4+iYccxApSHqjeQVx1wTVjjy4BR/MfCHeoaEuqPJHiD/nXWtw0S
 q7Nvy5tlr+EgNaLA1BYs7XmB0/zIMWCSdfga+xm5od4DxLRRh+fy+yHRTkUe5zC+FErs
 /TSOkq5O/0kelessGZf0RmDJfCjSvNhCqLb7wdv0O36myLso8knb4bCVGxDD3Grl3qrL
 pF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5jubMeLfMS6DO/0PCPGI57Go6LtnBr0CArY5PUrgsRY=;
 b=W4z5mGpPMAzO0asRmiYOncQ7+NDHX25v5C0gqvlPmnEXcDayhIy2lF1MRi/Tk4G5ks
 qiPQe6qTbXYDqavNYgd2Kw4Ea2nn1hDN/5apFxnX+Q0lnvMTHvCqB2jLTkLwkYEujxew
 XVmipHYyGb8IXlnGFZAtbEPIs/Ro01I1nutnD8eAIPXm7hAUZB2J8xD1AhW/YClNn309
 o8yR4WLrpWIw3QiaJ4eaA6aF+5fJIvUJV+SGcdMf3VZf3lHczH2LDVHwK2533oWY0Gzi
 xsbEhBXEP3p9eZ+S8qgh2ljXp99hmQ2/RlHLvqZBK+sJ8gL5Lhr+w2Tk9iUmdevmDehp
 WnjA==
X-Gm-Message-State: AOAM533oxhegWH3GnNxXkTqT5DqI7INYfa03FdYa/F0R5bapY9KnrOqj
 VtgdcCBNUgfM/dqILcX9sXpxyHm3OzE=
X-Google-Smtp-Source: ABdhPJy15tTVn4a58v03Vm1NzbeGN+rVqqhkNN8zFe1+tLJeGBLL2+aTJjrnGJWbTE2zp7OMJ+tZuw==
X-Received: by 2002:a05:6402:1385:b0:413:2bc6:4400 with SMTP id
 b5-20020a056402138500b004132bc64400mr12504809edv.94.1646677000427; 
 Mon, 07 Mar 2022 10:16:40 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm4983382ejd.217.2022.03.07.10.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:16:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/23] qga/vss: update informative message about MinGW
Date: Mon,  7 Mar 2022 19:16:16 +0100
Message-Id: <20220307181633.596898-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307181633.596898-1-pbonzini@redhat.com>
References: <20220307181633.596898-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
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

The headers are now all available in MinGW master branch.
(commit 13390dbbf885f and earlier) aiming for 10.0.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220222194008.610377-4-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/meson.build b/qga/meson.build
index 54f2da5b07..62472747f1 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -15,7 +15,7 @@ have_qga_vss = get_option('qga_vss') \
     If your Visual Studio installation doesn't have the VSS headers,
     Please download and install Microsoft VSS SDK:
     http://www.microsoft.com/en-us/download/details.aspx?id=23490
-    On POSIX-systems, MinGW doesn't yet provide working headers.
+    On POSIX-systems, MinGW should provide headers in >=10.0 releases.
     you can extract the SDK headers by:
     $ scripts/extract-vsssdk-headers setup.exe
     The headers are extracted in the directory 'inc/win2003'.
-- 
2.34.1



