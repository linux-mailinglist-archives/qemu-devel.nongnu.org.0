Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752532B6B00
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:04:05 +0100 (CET)
Received: from localhost ([::1]:52790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4Oi-0000uh-Cw
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:04:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Eu-00036O-Oz
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:56 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:38265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Es-0007H9-L7
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:56 -0500
Received: by mail-ed1-x542.google.com with SMTP id y4so17364967edy.5
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0hpNhB+71NE6300hqz+D0elj2q3QPE1W5PnnI+BNNPw=;
 b=W+7WnU7jvKgxvRXF8ksUHmp3hWjLQf1xnuWrGyTMKVIJTRXCIJbNqY4uWhB51U9BBd
 jeE9TmBfOWjlMmg1TPw09EhJG+DyTFHIFm1RB2PiarWL2lUPTz9MWGGKvg3F1mCzI7gD
 PiqRksLlOEkCy9P/f1E19CPur6aEWlipDadt3TKy/DdRWH4A5xqgVsMU9enKRbjCQSXU
 8fpKN0Yu+LON7fR+cgPkwzMWA/xt/y5fEeOXcPRlyY+0FTXdSIZ3IakX096aeMwbWw2f
 wR3y6Rh+9RiZsBU3zW0qyu9PROlnoXYKPb8xKceVU4hM2dZBoTH+JVjwgqAerYVd3IxR
 GUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0hpNhB+71NE6300hqz+D0elj2q3QPE1W5PnnI+BNNPw=;
 b=qwP/C/GVZ9VEcNbMFOTgz6WK+WCDqg8IzJyfWP4e4XQ/TUQtaI1oTv/2irJxNARl28
 AjFEe7zafsgwdL3XtHypwAMNIQt0eaQcIgOTXwlJUjDhBufYOkBIqRCL9xLrDTRRC4fx
 PUgjz1pE50m1WgV6yB571DkUh8pnjbuxCINgcu0nFLOBrLiWVMA707XitAFug2JvvEuQ
 DY/fY0kvK9JjECZqflvWR/WFzpX+4pgwh+GcxTPwkemHR0VAuPy3sTLeG5jqCF+A7rUJ
 GgewQTmlooqhIjTSIItBIBDuERy9GTkeaYuTAmN/HsjyqT8QPpSFiWNlnkPbVeCddVhD
 GQsQ==
X-Gm-Message-State: AOAM530Ln16tHQzqsOHz9E9Ty1YSFzmjM7u23/C7IzS1QbRQPsJSZ6gS
 vpsgJIbqjVWy7Ke/Q8eOLT4EuSbf3ws=
X-Google-Smtp-Source: ABdhPJyy75BWfKEy9/G9uQDhf4fG/QNQXeG0yhcgVKyHlqeuspHz8Ts/0E4PtaWnRPnhyMlv4YBKaA==
X-Received: by 2002:a05:6402:a51:: with SMTP id
 bt17mr20774118edb.328.1605632032876; 
 Tue, 17 Nov 2020 08:53:52 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:52 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/29] scripts: kernel-doc: fix typedef parsing
Date: Tue, 17 Nov 2020 17:53:10 +0100
Message-Id: <20201117165312.118257-28-pbonzini@redhat.com>
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

The include/linux/genalloc.h file defined this typedef:

	typedef unsigned long (*genpool_algo_t)(unsigned long *map,unsigned long size,unsigned long start,unsigned int nr,void *data, struct gen_pool *pool, unsigned long start_addr);

Because it has a type composite of two words (unsigned long),
the parser gets the typedef name wrong:

.. c:macro:: long

   **Typedef**: Allocation callback function type definition

Fix the regex in order to accept composite types when
defining a typedef for a function pointer.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/328e8018041cc44f7a1684e57f8d111230761c4f.1603792384.git.mchehab+huawei@kernel.org
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index d3a289628c..862b77686e 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1434,13 +1434,14 @@ sub dump_typedef($$) {
     $x =~ s@/\*.*?\*/@@gos;	# strip comments.
 
     # Parse function prototypes
-    if ($x =~ /typedef\s+(\w+)\s*\(\*\s*(\w\S+)\s*\)\s*\((.*)\);/ ||
-	$x =~ /typedef\s+(\w+)\s*(\w\S+)\s*\s*\((.*)\);/) {
+    if ($x =~ /typedef((?:\s+[\w\*]+){1,8})\s*\(\*?\s*(\w\S+)\s*\)\s*\((.*)\);/ ||
+	$x =~ /typedef((?:\s+[\w\*]+\s+){1,8})\s*\*?(\w\S+)\s*\s*\((.*)\);/) {
 
 	# Function typedefs
 	$return_type = $1;
 	$declaration_name = $2;
 	my $args = $3;
+	$return_type =~ s/^\s+//;
 
 	create_parameterlist($args, ',', $file, $declaration_name);
 
-- 
2.28.0



