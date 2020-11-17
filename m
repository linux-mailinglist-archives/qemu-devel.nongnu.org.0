Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB44C2B6AD7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:01:26 +0100 (CET)
Received: from localhost ([::1]:43924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4M9-0005Yj-Qj
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EW-0002HZ-18
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:32 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:39450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4ET-00076d-TW
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:31 -0500
Received: by mail-ej1-x642.google.com with SMTP id s25so30383549ejy.6
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wUVMLQ8eQPnh20+/yBYy2nKewA9e95/iKRnIwP+C0hM=;
 b=pCbkNqLad5XaHa015uAN1ZpUAdwjYX1zA26wNG/ajvcL2vovmfOY3g3JuA4J1eee1x
 jZ8W6Hvr58ALDKt0in8eLqkD+kguH4iKe+zCXF+6q7BD3MUKKlF9k6bcukKLk2LkAXCY
 H+t5C1Jms7AKMxq3VNsiV+ys0b4UhknUylOjEd6XNy7kbfefI8nM7RWNIukO9gyL5L34
 iL91Lg8iRLfcUOvX1pkX5XpdrQoS5PkzXESD8YM62p6BYaBjQzQaSVwoTaMAYVPmab+C
 5FzUa8cwgWmEHFbDMIZiTbto9EkSRm7YfFKQjbRxKKcQZjKL2joCHjMNWcP6IN9K/W2X
 jOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wUVMLQ8eQPnh20+/yBYy2nKewA9e95/iKRnIwP+C0hM=;
 b=FEgGZeD+beciN5rPV6YW3UritPfR3EJYs93hVttrGJZeaRQ4pgnQTpTuCHy0nH0UIP
 z66zE83qvlLpFFHVKciuiOCPtR6WiRV6LfNPpt2SrerHUOZkPxLS27qzwVhb2iknbOTR
 rfFDiCkEjuQa/hK9IYd932NsqMt8rXoO8RMlpxQ7JC5enH5xoXKyJpj+mTYEeyJ7IHx7
 NR8TEmEOVuxWn4Xjo4VlgSMHHrWiEZfnNEXiwij8AGHbgS6hZhZOpsXGNeAlLagw6pVi
 yGORK9nj/H3Sc3tNJwOWgN4TNcI9jselbcxabKuF9V/Ppu7JEhWjA9VZRNlY4n3k+FeN
 VJYA==
X-Gm-Message-State: AOAM532p87VC6PJ6xHaZFCIhmHZA8frhk1VhpHKmQEuldPymyxyrAaP5
 XEdgQ9X0aIvX9M7qWck7IjjYp7NH0og=
X-Google-Smtp-Source: ABdhPJzMfTqT3ocGGKFxR/cKGyLcrFnw9qonMoGcCdBWHjEixOFM1247DvB8oupntDEsiybbkezwXQ==
X-Received: by 2002:a17:906:f0c3:: with SMTP id
 dk3mr10413471ejb.366.1605632008288; 
 Tue, 17 Nov 2020 08:53:28 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/29] kernel-doc: add support for ____cacheline_aligned
 attribute
Date: Tue, 17 Nov 2020 17:52:55 +0100
Message-Id: <20201117165312.118257-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x642.google.com
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Subroutine dump_struct uses type attributes to check if the struct
syntax is valid. Then, it removes all attributes before using it for
output. `____cacheline_aligned` is an attribute that is
not included in both steps. Add it, since it is used by kernel structs.

Based on previous patch to add ____cacheline_aligned_in_smp.
Motivated by patches to reorder this attribute to before the
variable name.   Whilst we could do that in all cases, that would
be a massive change and it is more common in the kernel to place
this particular attribute after the variable name. A quick grep
suggests approximately 400 instances of which 341 have this
attribute just before a semicolon and hence after the variable name.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Lee Jones <lee.jones@linaro.org>
Link: https://lore.kernel.org/r/20200910185415.653139-1-jic23@kernel.org
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 3fd6f3925e..c4c5640ded 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1113,7 +1113,7 @@ sub dump_struct($$) {
     my $x = shift;
     my $file = shift;
 
-    if ($x =~ /(struct|union)\s+(\w+)\s*\{(.*)\}(\s*(__packed|__aligned|____cacheline_aligned_in_smp|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*/) {
+    if ($x =~ /(struct|union)\s+(\w+)\s*\{(.*)\}(\s*(__packed|__aligned|____cacheline_aligned_in_smp|____cacheline_aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*/) {
 	my $decl_type = $1;
 	$declaration_name = $2;
 	my $members = $3;
@@ -1129,6 +1129,7 @@ sub dump_struct($$) {
 	$members =~ s/\s*__packed\s*/ /gos;
 	$members =~ s/\s*CRYPTO_MINALIGN_ATTR/ /gos;
 	$members =~ s/\s*____cacheline_aligned_in_smp/ /gos;
+	$members =~ s/\s*____cacheline_aligned/ /gos;
 
 	# replace DECLARE_BITMAP
 	$members =~ s/__ETHTOOL_DECLARE_LINK_MODE_MASK\s*\(([^\)]+)\)/DECLARE_BITMAP($1, __ETHTOOL_LINK_MODE_MASK_NBITS)/gos;
-- 
2.28.0



