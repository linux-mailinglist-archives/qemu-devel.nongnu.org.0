Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA2C2CA053
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:50:38 +0100 (CET)
Received: from localhost ([::1]:35182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3Ez-00054y-Ly
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:50:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk305-0002LS-FL
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk301-0003os-40
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606818908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQMQmygVLLo56KizHbgMm/0357/uoLkrergt4oaKiKI=;
 b=BcLiDwi8ioyJvgIiO7sjIkk4XwJW6uilNCHt4ozI3RTfiadu5Pa3mPlYeYwqMEL1dzJ+/k
 v/v5vtpMCv3/Cu7/Y0p1pE+N3wbETe+YcbjU0yo9Zf4dkR+S/UzRmG4QvMWkQezqsCM6kB
 UY8o5nnNPewLXIRue9FhJnMqM2AZzA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-QrzqBSW4Ov63hf8cappePA-1; Tue, 01 Dec 2020 05:35:04 -0500
X-MC-Unique: QrzqBSW4Ov63hf8cappePA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85351190A7B4;
 Tue,  1 Dec 2020 10:35:03 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F54410023B1;
 Tue,  1 Dec 2020 10:35:03 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/32] kernel-doc: fix processing nested structs with
 attributes
Date: Tue,  1 Dec 2020 05:34:32 -0500
Message-Id: <20201201103502.4024573-3-pbonzini@redhat.com>
In-Reply-To: <20201201103502.4024573-1-pbonzini@redhat.com>
References: <20201201103502.4024573-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
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
Message-Id: <20201117165312.118257-2-pbonzini@redhat.com>
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
2.26.2



