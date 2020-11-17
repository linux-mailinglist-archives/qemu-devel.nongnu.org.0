Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39782B6B15
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:08:31 +0100 (CET)
Received: from localhost ([::1]:43346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4T0-00007J-RZ
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:08:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4En-0002zN-Sl
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:51 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:38822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4El-0007E5-Ho
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:49 -0500
Received: by mail-ej1-x644.google.com with SMTP id a16so2630045ejj.5
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xnRU/+C+RBHC9xmiriPbBDTgdYPtBV1fZ8ucza31GT8=;
 b=CXaMqqJbNs7MYvub9e5YFZvQlA8kMlRG+bbcNaQZvS9B1tjxY8lQJjAtRnvhkb+NoL
 ypBjWZwrgUZ6WnxdM5tU60tvePdfhKM3w8tXv+qmFafb/4k41peS1XRkWcG7VfgKP++w
 8qvgGRvQRTl1C4iz1MU2bhvoHLVj59FnKq1WZ+Ael42gUCKNrEx12Moj+diRxJ20P8JM
 u/OB2cBV9omThG4nDoLOWCJzXJvOp7alt/PcmZUlJIeR0a/PzV0SlmN6A8P+b3TdjC/1
 u2asfR86R2g+/AY9zhFpqx+RrsS8lbgZvDiimryoDnStlJc4CifmHpbkvABV5/NSSi6Q
 bklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xnRU/+C+RBHC9xmiriPbBDTgdYPtBV1fZ8ucza31GT8=;
 b=YJ245nPMQ4y4ZfmN6USpak4ZBKtXtAol4Wn3Wt2OGOFmhvAnabaEdgLsZvsw1/03qh
 Ifh2gIwzIJNDrxpcFoV4TyfAvwABwiCvPCaUlTcX9QzuVzs6A7bPlrperPjzkbC7jCIU
 D+EmfYK1jM8LVlVQdSoHQZLsUC13wt1nnUjebbwOLv7+AD6tWEstH4JvgjI1x5hJxw74
 DRAGzK95XiNhHhBy4psTNwkwYPOQOVYG1U7K64BNZLmLhP8H+VQGaXrklpwnzb4/moxm
 WBQDyhjJVvsm1FWClK3NgpNDGpF/qeHXwOzn6NhCaFvNEe0oBR6YiQXQb/QiyPglSkbJ
 jh/w==
X-Gm-Message-State: AOAM533aQu3CoFoNOH7mwfdmMGsE1+bbLnK95JmKSXXcJnS1fgbhcpyB
 rrIAFu8ZURm/dvf/rplIn7St4ASjSn4=
X-Google-Smtp-Source: ABdhPJyNS7EZg3c6d5ESGbW9WgaEOKmhp5SPefGU/iFMtMki/JYUyESguQBYAxCmvDPdLDsLIGwvGA==
X-Received: by 2002:a17:906:2886:: with SMTP id
 o6mr21110581ejd.259.1605632025877; 
 Tue, 17 Nov 2020 08:53:45 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/29] scripts: kernel-doc: fix typedef identification
Date: Tue, 17 Nov 2020 17:53:03 +0100
Message-Id: <20201117165312.118257-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x644.google.com
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

Some typedef expressions are output as normal functions.

As we need to be clearer about the type with Sphinx 3.x,
detect such cases.

While here, fix a wrongly-indented block.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 64 +++++++++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 23 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 35d60af834..0c31e9ad66 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1748,30 +1748,48 @@ sub dump_function($$) {
 	return;
     }
 
-	my $prms = join " ", @parameterlist;
-	check_sections($file, $declaration_name, "function", $sectcheck, $prms);
-
-        # This check emits a lot of warnings at the moment, because many
-        # functions don't have a 'Return' doc section. So until the number
-        # of warnings goes sufficiently down, the check is only performed in
-        # verbose mode.
-        # TODO: always perform the check.
-        if ($verbose && !$noret) {
-                check_return_section($file, $declaration_name, $return_type);
-        }
+    my $prms = join " ", @parameterlist;
+    check_sections($file, $declaration_name, "function", $sectcheck, $prms);
+
+    # This check emits a lot of warnings at the moment, because many
+    # functions don't have a 'Return' doc section. So until the number
+    # of warnings goes sufficiently down, the check is only performed in
+    # verbose mode.
+    # TODO: always perform the check.
+    if ($verbose && !$noret) {
+	    check_return_section($file, $declaration_name, $return_type);
+    }
 
-    output_declaration($declaration_name,
-		       'function',
-		       {'function' => $declaration_name,
-			'module' => $modulename,
-			'functiontype' => $return_type,
-			'parameterlist' => \@parameterlist,
-			'parameterdescs' => \%parameterdescs,
-			'parametertypes' => \%parametertypes,
-			'sectionlist' => \@sectionlist,
-			'sections' => \%sections,
-			'purpose' => $declaration_purpose
-		       });
+    # The function parser can be called with a typedef parameter.
+    # Handle it.
+    if ($return_type =~ /typedef/) {
+	output_declaration($declaration_name,
+			   'function',
+			   {'function' => $declaration_name,
+			    'typedef' => 1,
+			    'module' => $modulename,
+			    'functiontype' => $return_type,
+			    'parameterlist' => \@parameterlist,
+			    'parameterdescs' => \%parameterdescs,
+			    'parametertypes' => \%parametertypes,
+			    'sectionlist' => \@sectionlist,
+			    'sections' => \%sections,
+			    'purpose' => $declaration_purpose
+			   });
+    } else {
+	output_declaration($declaration_name,
+			   'function',
+			   {'function' => $declaration_name,
+			    'module' => $modulename,
+			    'functiontype' => $return_type,
+			    'parameterlist' => \@parameterlist,
+			    'parameterdescs' => \%parameterdescs,
+			    'parametertypes' => \%parametertypes,
+			    'sectionlist' => \@sectionlist,
+			    'sections' => \%sections,
+			    'purpose' => $declaration_purpose
+			   });
+    }
 }
 
 sub reset_state {
-- 
2.28.0



