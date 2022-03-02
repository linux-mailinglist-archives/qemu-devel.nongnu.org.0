Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F3D4CAD59
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:18:46 +0100 (CET)
Received: from localhost ([::1]:59110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTYj-00023i-PG
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:18:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTRx-0006kC-Sm
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:47 -0500
Received: from [2a00:1450:4864:20::329] (port=44616
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTRu-0008Oi-Px
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:44 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so1772232wmb.3
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 10:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4VLoIpmcWh/bwRoXTyuG+imMilJf3xfJ/t7uUrTUILo=;
 b=oPxxP+VSDlvThvo+KMn8Bmj2Zzki4TGOmjJUz90+zK12i8KmBEYjmWbVVLOCH1WDnP
 2f5kBX2mm59WG959N0PBU2k8VIboNmQobQamDvU03aaVF/LLjyopXuUTZL8uc4aotgk2
 SG8vGx2kqyiQoS/arf9CUcAmggwQsJdYnylihKmNNKiunP0e2CMtlz2Hk9W/o/WFerUb
 q04dSM4L1Woge2WkjFM2sQ+ZJ/SS1VfjGw7kIqjFyZGVm6FvKp2Za3BYmyyvER9iFqak
 Ama5U/QSugpj+JVYFFhPtAG5oktBaFxzcC2Sah0C2Ng/CPolvoteQSAJvyPfyNAgKkBt
 HCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4VLoIpmcWh/bwRoXTyuG+imMilJf3xfJ/t7uUrTUILo=;
 b=LHcxAhcg7VGBBFH3oT/Q41/wsQGTfk9h5QNVubYg2VhtqiowQa7csbwAGhTMy1iM/B
 M+6jhJIfKporYTec+TJJEzHzWkVdW9TJUlRK+M3Z/CGbT6MrhfgjhBxZT1Ou/JX+SJNF
 AEN7c7JpAttvbelxMJPkMsQ0ccOqoPaWv3qWL18fHgqes5Yvg2qwqbnB9LFDZyWgUfoJ
 sKgtilMXfLBtMEAeGEERpIAWX/mI8DBl3113+l3Uq7ipfoiT10YJyswbKlCufAXK1Fy0
 ZqxgPO5+vlBAVCC/0mYlCDpeUxmvFYzoO2N+cVen36gUz+md9M0Z7jYI4MXOBVqeBGre
 IXSg==
X-Gm-Message-State: AOAM530WbBI6li/BpKQp46AFxVZhoD6vYt+G5FDPDc4UaP8rZODldCnC
 Dgvcs/ntBPXGgpcrX6E7Npy5MCp68HA=
X-Google-Smtp-Source: ABdhPJwhphMTNT9l/Dhm5EqOgLdCsav0g1RI2ZKW33+IR9PbFdrhXEXUBdGsI8iPJtFWsBT9yGqVOg==
X-Received: by 2002:a05:600c:384b:b0:381:10bc:9e43 with SMTP id
 s11-20020a05600c384b00b0038110bc9e43mr817848wmr.181.1646244701068; 
 Wed, 02 Mar 2022 10:11:41 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm7720811wmb.48.2022.03.02.10.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 10:11:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/11] meson: fix generic location of vss headers
Date: Wed,  2 Mar 2022 19:11:27 +0100
Message-Id: <20220302181134.285107-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302181134.285107-1-pbonzini@redhat.com>
References: <20220302181134.285107-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
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



