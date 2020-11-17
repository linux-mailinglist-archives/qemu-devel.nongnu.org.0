Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2529A2B6B0D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:06:21 +0100 (CET)
Received: from localhost ([::1]:32952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4Qu-0004HZ-5H
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:06:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Ey-0003BP-6r
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:54:00 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:35455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Et-0007Hh-Rk
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:59 -0500
Received: by mail-ed1-x542.google.com with SMTP id ay21so23235873edb.2
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R47RebFwpB3UEbuBQ1d7o5hCrsXuVfaPA/oJ9sZEmas=;
 b=uF7RfRNf1GzkYoPY8pdmN1kz89FV3XNtfswSJKZQJaCWqtP1EC7nI/+Or1wsZJ2ydQ
 27Sjql3nI0lg/wXssWba3J8k2TTSNjc9+3hFvHDtvXvhRyzFOw+iTaUyGx2pXH3c7bgc
 Jv9anAN8NcCODhUxaeEcDoZH5NeLjCgI2ZAjPt+cJYy+BLdBWCC/ez9nxm9iZYQxA06L
 C6xnx5uCpCydJE/VCTrYR9PZZoSa4BgNIgfcA+XnPDHqLMkcRW1kcPnoklVYRpgCgVuJ
 l28dgzuKeWdPM6/HQEAwCsd39IgAWAL7tcUPJl//owCHj/v+74FGG4SmImZ7jp6gtBQA
 VfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R47RebFwpB3UEbuBQ1d7o5hCrsXuVfaPA/oJ9sZEmas=;
 b=a2tAqVS5Sh1dosE4ni8tb140rSQfDbSWTq6H3V+q2Oh9isIepIcnVk97gWaAqbRcFW
 rfmsCBrjpq5jKFNFuzmfTKWxZgNeuuDSyzcKoPN+NgKXOElxWHEbeLl/Rg6u/Nu2IJOq
 /FFrXJh7gapjkZp88Wj5TDkQgG3pcKpMZ+ZsgYwJ6m1d+niBEx7c6gWEVLJqvTYrRrq2
 1h3VKJc6GPr+WwmUCpdm8vzyuH7hwXimWwOmARA2h7lCbW3gfWb3CAPgraCH1pm75Xe+
 eY+oj2FQa8v4YBOqeSOF6q5X3n0KkyW+O+09f4R9M6dJIrd7xE3x6HEmw/6KWe2adLtu
 hS6w==
X-Gm-Message-State: AOAM531qTap+Hb05aGQ0dBQSbzRLxeXcc6YAfbnmfJZa0KXH3lrGpZI/
 V/8nzKwC6XQTWWDZJE8xpSV/KPqRNxw=
X-Google-Smtp-Source: ABdhPJzp1qwegibNoNzvP/K13GXwzJ2FWPHg47A88LzFiPeK/wPua8aYrsi9AMMNY0Zd+4n5p/Csnw==
X-Received: by 2002:a05:6402:c83:: with SMTP id
 cm3mr21534049edb.189.1605632034114; 
 Tue, 17 Nov 2020 08:53:54 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/29] scripts: kernel-doc: split typedef complex regex
Date: Tue, 17 Nov 2020 17:53:11 +0100
Message-Id: <20201117165312.118257-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x542.google.com
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

The typedef regex for function prototypes are very complex.
Split them into 3 separate regex and then join them using
qr.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/3a4af999a0d62d4ab9dfae1cdefdfcad93383356.1603792384.git.mchehab+huawei@kernel.org
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 862b77686e..524fc626ed 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1427,17 +1427,21 @@ sub dump_enum($$) {
     }
 }
 
+my $typedef_type = qr { ((?:\s+[\w\*]+){1,8})\s* }x;
+my $typedef_ident = qr { \*?\s*(\w\S+)\s* }x;
+my $typedef_args = qr { \s*\((.*)\); }x;
+
+my $typedef1 = qr { typedef$typedef_type\($typedef_ident\)$typedef_args }x;
+my $typedef2 = qr { typedef$typedef_type$typedef_ident$typedef_args }x;
+
 sub dump_typedef($$) {
     my $x = shift;
     my $file = shift;
 
     $x =~ s@/\*.*?\*/@@gos;	# strip comments.
 
-    # Parse function prototypes
-    if ($x =~ /typedef((?:\s+[\w\*]+){1,8})\s*\(\*?\s*(\w\S+)\s*\)\s*\((.*)\);/ ||
-	$x =~ /typedef((?:\s+[\w\*]+\s+){1,8})\s*\*?(\w\S+)\s*\s*\((.*)\);/) {
-
-	# Function typedefs
+    # Parse function typedef prototypes
+    if ($x =~ $typedef1 || $x =~ $typedef2) {
 	$return_type = $1;
 	$declaration_name = $2;
 	my $args = $3;
-- 
2.28.0



