Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5524B2B6ACE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:58:38 +0100 (CET)
Received: from localhost ([::1]:35154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4JR-00022x-A9
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:58:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4ER-00026r-Ms
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:27 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:36746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EP-000759-NG
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:27 -0500
Received: by mail-ej1-x643.google.com with SMTP id o21so30406228ejb.3
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XQrna4rwZXMJJQSjXOwFxD8k5atGx5lFfFM7NcFB024=;
 b=DhdjDQMovt9sIrNXiQvZkjKPY8RBi7bHVLsPiRaVY3u7MxGZuzr2mk9obJTMLiljZz
 H09o+Yg6NSwbko8r+bMcGcBCK7qybAwQHc4WS0GZpi2VGMXvy9hmqCrxV0Iv6p/pwFmY
 vpmuKs15L4uLGpmYFLXjWZlSS2wMh008u335oBlp2KwMSUZVtrWGgBBOSEWWakRjfYcP
 JjflxIZ4Dsa00Ba1oxO1f/fAsAIZ8HW+qwcRNHnwgA/xD4W8uv2Uvx0oy3A/MUa/zC5T
 sCTJxAq2jeH3DpDv5LCO8vRao2xJZTy/3yJDlHQQUxNvC69Auh0CyG/0wupf+k5wML0w
 +r9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XQrna4rwZXMJJQSjXOwFxD8k5atGx5lFfFM7NcFB024=;
 b=XTS0a6U0Bn2rZMxvPIXLVBgamERMeA4/9b0yvzXGiGXIuJ+w0rYnul89bowzItgRHy
 XEtoPyfFeseu57738nR2RyL0qU8Vzba6WW3T8y7amwEkUgFd9H3aSe/zlk5kG8vx0KtR
 fIuBqZ04LXU7rICba/yOCL6NVgienMqZOkl0XBCCsh8fvtTYodvVWwsldy5Cr07sk7yJ
 VMEtdioJXZg2wqC4M5sa921LhTb+CSrXyrf+MFkROgiYYEdekR4MRzzXLFsLAOAoutDh
 yT4e/K/b1xdRygh8dgDghh+hGyibfxwdG+fgxIUVFM6Lm/tc5KzNRa9qDGTs7eL6+y7p
 vZqA==
X-Gm-Message-State: AOAM5335J7YjmtNYvkiCYPJEUFpMihUJlHYUvOGOeoFUZ7uOzLJjpJPc
 XF/59rUpI9sQ0jTsmGbNcaW7zXm4rKk=
X-Google-Smtp-Source: ABdhPJys5lE9HPclkauEdGIHncXm1/HdsGkNVAQytc/3AOGdW/d9u1qlgH8Cp9VkC8LGKVFAnXnI8Q==
X-Received: by 2002:a17:907:411b:: with SMTP id
 nw19mr19690576ejb.150.1605632004064; 
 Tue, 17 Nov 2020 08:53:24 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:23 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/29] scripts/kernel-doc: parse
 __ETHTOOL_DECLARE_LINK_MODE_MASK
Date: Tue, 17 Nov 2020 17:52:51 +0100
Message-Id: <20201117165312.118257-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The __ETHTOOL_DECLARE_LINK_MODE_MASK macro is a variant of
DECLARE_BITMAP(), used by phylink.h. As we have already a
parser for DECLARE_BITMAP(), let's add one for this macro,
in order to avoid such warnings:

	./include/linux/phylink.h:54: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising' not described in 'phylink_link_state'
	./include/linux/phylink.h:54: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(lp_advertising' not described in 'phylink_link_state'

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/d1d1dea67a28117c0b0c33271b139c4455fef287.1592895969.git.mchehab+huawei@kernel.org
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index fadc2f5b86..e8fff6a525 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1113,7 +1113,9 @@ sub dump_struct($$) {
 	$members =~ s/\s*__packed\s*/ /gos;
 	$members =~ s/\s*CRYPTO_MINALIGN_ATTR/ /gos;
 	$members =~ s/\s*____cacheline_aligned_in_smp/ /gos;
+
 	# replace DECLARE_BITMAP
+	$members =~ s/__ETHTOOL_DECLARE_LINK_MODE_MASK\s*\(([^\)]+)\)/DECLARE_BITMAP($1, __ETHTOOL_LINK_MODE_MASK_NBITS)/gos;
 	$members =~ s/DECLARE_BITMAP\s*\(([^,)]+),\s*([^,)]+)\)/unsigned long $1\[BITS_TO_LONGS($2)\]/gos;
 	# replace DECLARE_HASHTABLE
 	$members =~ s/DECLARE_HASHTABLE\s*\(([^,)]+),\s*([^,)]+)\)/unsigned long $1\[1 << (($2) - 1)\]/gos;
-- 
2.28.0



