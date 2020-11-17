Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8177F2B6AC4
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:56:49 +0100 (CET)
Received: from localhost ([::1]:55804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4Hg-0007Kg-JH
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EX-0002Jv-05
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:33 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:40279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EV-00076l-8w
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:32 -0500
Received: by mail-ej1-x644.google.com with SMTP id oq3so30378826ejb.7
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9bAK10h4yUsf8f9+DOkJIuR133Dwl6yX38CfWUvQZ4Y=;
 b=k8Pn5fm+jcck3SIQWMCz6JVzvkZLpaUmYo21gBjUD+tcVkNKMKPfRxrdMN0YHmw9Tp
 1sQy9uNkfDG6hR517zuifs1dTnTCAB9uOi2VYiNVWmy6IcnU/goZ/yzT0y5+A8FzIa6/
 icOArDbLItJ8d/7yNM10lIxLlL4TdtnH3YZWMq8+pptSA+8aTrJ9shTIudKSVHoGyrCL
 2bYYI6DYiYLeCv790RnFwr3S5txWdn02Z55uKQg2kt+pyMPnUhZB2V/Ugu4NYThG+Rgp
 7xCGOPWjLkRGLP6Yl+S2vNP0NmRnoO31uGe+ajka/vuYIea6P2le0yUnlWsMIdXZOWIV
 D8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9bAK10h4yUsf8f9+DOkJIuR133Dwl6yX38CfWUvQZ4Y=;
 b=OH8w4adJ7xLVTLOUTH9ywXY/IZGoqYiR6kqBCH1Tne/IwgnCR2yKqDs1Fzx0DDGbIh
 MyX4+nxChXHXPEdjBt7C3lE3iVOXEpznrf0LctWJpae7MTtMdfQSZnDu8fxPchX735od
 BbiQJdGcs1AHTh6KDybMDqM/Z7sAYuslornXagkCIlqw2yAMrr4oPlku0VCBwk4J+3gX
 SWYxV2z+0QaGDp9A6RgzyC0PBBnWfjuXZzWqnYcVl2lzrcUdtcGFuVrtGCTYA24tVc6f
 VWkkra6OgKbigPEKr/iBpIP8BiMFy51+1p1OK2sZP2sXs461OlC+lfmPZilsfjtTccxG
 MM6Q==
X-Gm-Message-State: AOAM533/lZ94O/khXqnLmujlvZcJW4Ln0Yf8WNJinmymtOGCEgjEWCil
 UAgnEDUDoNcOi6nt4T9V5BKBQnSaHzQ=
X-Google-Smtp-Source: ABdhPJxeFkU0KWf8AxlypjJzCgGFjPz/Utsdc+/EkIIdk49ZbqVP0ZLQXefhPP3ohSIpKyclbmQA7g==
X-Received: by 2002:a17:906:a186:: with SMTP id
 s6mr20808631ejy.193.1605632009279; 
 Tue, 17 Nov 2020 08:53:29 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:28 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/29] scripts: kernel-doc: add support for typedef enum
Date: Tue, 17 Nov 2020 17:52:56 +0100
Message-Id: <20201117165312.118257-14-pbonzini@redhat.com>
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

The PHY kernel-doc markup has gained support for documenting
a typedef enum.

However, right now the parser was not prepared for it.

So, add support for parsing it.

Fixes: 4069a572d423 ("net: phy: Document core PHY structures")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index c4c5640ded..073f72c7da 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1295,14 +1295,22 @@ sub show_warnings($$) {
 sub dump_enum($$) {
     my $x = shift;
     my $file = shift;
+    my $members;
+
 
     $x =~ s@/\*.*?\*/@@gos;	# strip comments.
     # strip #define macros inside enums
     $x =~ s@#\s*((define|ifdef)\s+|endif)[^;]*;@@gos;
 
-    if ($x =~ /enum\s+(\w*)\s*\{(.*)\}/) {
+    if ($x =~ /typedef\s+enum\s*\{(.*)\}\s*(\w*)\s*;/) {
+	$declaration_name = $2;
+	$members = $1;
+    } elsif ($x =~ /enum\s+(\w*)\s*\{(.*)\}/) {
 	$declaration_name = $1;
-	my $members = $2;
+	$members = $2;
+    }
+
+    if ($declaration_name) {
 	my %_members;
 
 	$members =~ s/\s+$//;
@@ -1337,8 +1345,7 @@ sub dump_enum($$) {
 			    'sections' => \%sections,
 			    'purpose' => $declaration_purpose
 			   });
-    }
-    else {
+    } else {
 	print STDERR "${file}:$.: error: Cannot parse enum!\n";
 	++$errors;
     }
-- 
2.28.0



