Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EF02B6AB6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:54:45 +0100 (CET)
Received: from localhost ([::1]:46812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4Fg-0003aF-Oc
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:54:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EJ-0001tV-PT
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:19 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:33627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EI-00071i-4N
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:19 -0500
Received: by mail-ej1-x642.google.com with SMTP id 7so30389307ejm.0
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oYPzWMFrHNuaSUUxoAwHWUxCwjgdcly0qE/fwm5druY=;
 b=PX6+m+yP+Ln/RXfQy7QG61hTZLYoD17p9cyp2APDhJly39gYPyQpakftiD1zGZTsaa
 xe/nBeaZXdcu/MQlM9iLy6Aj90bM9KM0cCYmBvSNRg+lBlG+Snf1JafbMUvMCW9bgPVX
 OGo53rey+irxAqQ6fvSvMnwUWsaU39DLY+21xLCVZFdMhku2C5rECClEuHfNECdjXDoq
 gkkBWH7YgfI+fg0JJJA0Oa8qTBHDhTcDXtArIgc1PuR8t4rrcpunWsN359kdnUfjuHpr
 Wmfq/s8+0aL4PUrtIIbdHKgeuHdoul2Ot95pleD+Fy1wXh6qeyrl5Ogq0SUFgmTVBMph
 8SZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oYPzWMFrHNuaSUUxoAwHWUxCwjgdcly0qE/fwm5druY=;
 b=i/los89WttC+xD/zoT/9s8m41xYp6Yj0F3XIvCueJjqaZFYhqgYNj0bOFY750SU57O
 211V3xvaFKvJ9qDm8aup/cCIlkkSTo+QqD3pNQ68a1Hl/8O1cg6a7bQz5poR2xnSukKB
 voG2tkOjuDOteDxsfe42wOZNwe3e5ahhbOJUB30UNsKQbsC9pv1qtpfaXt8c8CsB35VC
 fqJ+aYyeiLdzEoDDIx85Nbmr7aASgf3tNHuIrnwTjz/LPH/okfC1HW2sbhNrrrY+51vs
 VPH+CAMOHcp9ZYXo3jtEM3jirxpFrLN64z3HLIEw/PdUBhgT9FWa4dRoW2h5iRGOEOPF
 2MRQ==
X-Gm-Message-State: AOAM530kmd9IRP5fmK3hE6xR70aipp+IjEYNfdJneQoBZ+6hy3bT1HQz
 36A3247BLcUfjVwNlXMbbheAhKK7u8g=
X-Google-Smtp-Source: ABdhPJyCSKaBM3LZZBZNFLz09qmJ3XGnMK+2Lx/3zEQ1457fZRAJ9Kmpg7mdAJB3NWWensedsE0bOA==
X-Received: by 2002:a17:906:604e:: with SMTP id
 p14mr21221026ejj.515.1605631996293; 
 Tue, 17 Nov 2020 08:53:16 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/29] kernel-doc: fix processing nested structs with
 attributes
Date: Tue, 17 Nov 2020 17:52:44 +0100
Message-Id: <20201117165312.118257-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: André Almeida <andrealmeid@collabora.com>

The current regular expression for strip attributes of structs (and
for nested ones as well) also removes all whitespaces that may
surround the attribute. After that, the code will split structs and
iterate for each symbol separated by comma at the end of struct
definition (e.g. "} alias1, alias2;"). However, if the nested struct
does not have any alias and has an attribute, it will result in a
empty string at the closing bracket (e.g "};"). This will make the
split return nothing and $newmember will keep uninitialized. Fix
that, by ensuring that the attribute substitution will leave at least
one whitespace.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 4fbaaa05e3..d6bdb77ceb 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1103,10 +1103,10 @@ sub dump_struct($$) {
 	# strip comments:
 	$members =~ s/\/\*.*?\*\///gos;
 	# strip attributes
-	$members =~ s/\s*__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)//gi;
-	$members =~ s/\s*__aligned\s*\([^;]*\)//gos;
-	$members =~ s/\s*__packed\s*//gos;
-	$members =~ s/\s*CRYPTO_MINALIGN_ATTR//gos;
+	$members =~ s/\s*__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)/ /gi;
+	$members =~ s/\s*__aligned\s*\([^;]*\)/ /gos;
+	$members =~ s/\s*__packed\s*/ /gos;
+	$members =~ s/\s*CRYPTO_MINALIGN_ATTR/ /gos;
 	# replace DECLARE_BITMAP
 	$members =~ s/DECLARE_BITMAP\s*\(([^,)]+),\s*([^,)]+)\)/unsigned long $1\[BITS_TO_LONGS($2)\]/gos;
 	# replace DECLARE_HASHTABLE
-- 
2.28.0



