Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C89A3D26FF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:46:43 +0200 (CEST)
Received: from localhost ([::1]:54146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6auI-0007QQ-Gf
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akL-0000e2-IZ
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:26 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akJ-0002lc-5b
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:25 -0400
Received: by mail-ed1-x52d.google.com with SMTP id dj21so7359307edb.0
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=icIrCY10oRJsa1u+U1hGlXQsA/dthD4WgJ12w3rkyTQ=;
 b=uLb2fL2uPFVDdl/+awOT56PFy9g8OOE82sMf0HLoidG4cxW5ZhyuntvXA//oGzbpd0
 Kyf2SrDa6bWV/Wpe6MAvv1uKtbScLnbBB1ATcsDe/bxo2v6fZHAOM0dmwlIHjWFTVUZ2
 97i/xQd+jpMF61B1OXp91L5TMbkA38Qwk1fJtOCEMZHvHAW3/hr5BAS4qYdHLcnb7Ewa
 Z8VnjucFsNTM84EuryFz2gkWDIHHNj16tVBw1JuM7lsTrV2miBeaIe0zz51I93rQN2Lu
 DUAJAENO+zbBx400VEmE1z8cQiBt/FoczH2Pv7IwHcMV0IdhvF9SlR8lacOwot0O9cXA
 vzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=icIrCY10oRJsa1u+U1hGlXQsA/dthD4WgJ12w3rkyTQ=;
 b=VqoaeTax2/JFU/U8bQqqYUds8oftr8ty1GrjJDXrq8Wcd7ozkfKACgvgA+4Hf1tsCp
 rQBqiHeox3fjyG0nPsKYMgybWf3wfDy70YVXwZUK8NjhzwMIyhDTLNyVPYhhUxWHZZ7Y
 PBX1pHXCssKN9rMMwOMQXX+1HGAKYCtdJpQxlLnbWB5ynczu5+a/OlsoiBawM5qexZlb
 3AvLQvUQRTV1EEuzmIj1Q2bz1RTfoQCISRxhF4O8Icx+/w8Oq7KnwCjvX+9iU/j06h4c
 KI1JRi2o8xS0uls51dvSdYVgEFa+22YmtPyV3TOYt7BXt1zXLdwDmh8JP9kah9U4IMZ6
 kmVQ==
X-Gm-Message-State: AOAM530rG19pCnLHmxmPw//jm7oPcwwAvY4oWtf3XJdTtVzEyGxY8q3M
 h2BddVGCfE3pNy5zc78/jvnS6R94N12IxQ==
X-Google-Smtp-Source: ABdhPJwysIbkSd5yC6TT03UrYjEM9v9imjZKvWXwRSP/e+LtZ6c3Sd87cq9RTgctcG4NDQcCI6hqaw==
X-Received: by 2002:a05:6402:30af:: with SMTP id
 df15mr254566edb.19.1626968181601; 
 Thu, 22 Jul 2021 08:36:21 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id qo6sm9638628ejb.122.2021.07.22.08.36.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:36:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/15] meson: fix dependencies for modinfo
Date: Thu, 22 Jul 2021 17:36:08 +0200
Message-Id: <20210722153612.955537-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722153612.955537-1-pbonzini@redhat.com>
References: <20210722153612.955537-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

modinfo runs the preprocessor and therefore needs all generated input files
to be there.  The "depends" clause does not work in Meson 0.55.3, so for
now use "input".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 6e4d2d8034..eb85fe8e44 100644
--- a/meson.build
+++ b/meson.build
@@ -2335,9 +2335,9 @@ foreach d, list : modules
         # https://github.com/mesonbuild/meson/pull/8900
         modinfo_files += custom_target(d + '-' + m + '.modinfo',
                                        output: d + '-' + m + '.modinfo',
-                                       input: module_ss.sources(),
+                                       input: module_ss.sources() + genh,
                                        capture: true,
-                                       command: [modinfo_collect, '@INPUT@'])
+                                       command: [modinfo_collect, module_ss.sources()])
       endif
     else
       if d == 'block'
-- 
2.31.1



