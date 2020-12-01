Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0127C2CA027
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:44:59 +0100 (CET)
Received: from localhost ([::1]:43498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk39V-0005DC-UD
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:44:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk30I-0002Nw-IN
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk304-0003py-TA
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606818912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9hSD6aXz202BRQxQakOz7bqCncJQ7SCRZireavH59k=;
 b=AgGOa0vtjVnpTYUv8llUM4QLZTGeXfA/71Ta5DpzS2r+Z6/jTu7rojXqxEssQzG9fz3GIV
 iRiVXFaHV7UaoJk28VjWRDiVfTvYC1UyFhPlSJDNqAwSG42a8y3JkELFjUU+eSMMJkC8f7
 Db9LZCP0dw9CXxixPZzVJDLd6TGh82g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-EkQUPawBOuOJDCgTxL20oA-1; Tue, 01 Dec 2020 05:35:08 -0500
X-MC-Unique: EkQUPawBOuOJDCgTxL20oA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CAA9190A7A6;
 Tue,  1 Dec 2020 10:35:07 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0AD810013C1;
 Tue,  1 Dec 2020 10:35:06 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/32] scripts/kernel-doc: handle function pointer
 prototypes
Date: Tue,  1 Dec 2020 05:34:40 -0500
Message-Id: <20201201103502.4024573-11-pbonzini@redhat.com>
In-Reply-To: <20201201103502.4024573-1-pbonzini@redhat.com>
References: <20201201103502.4024573-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

There are some function pointer prototypes inside the net
includes, like this one:

	int (*pcs_config)(struct phylink_config *config, unsigned int mode,
			  phy_interface_t interface, const unsigned long *advertising);

There's nothing wrong using it with kernel-doc, but we need to
add a rule for it to parse such kind of prototype.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/fec520dd731a273013ae06b7653a19c7d15b9562.1592895969.git.mchehab+huawei@kernel.org
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201117165312.118257-10-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index e8fff6a525..1cdece23fb 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1801,6 +1801,11 @@ sub process_proto_function($$) {
 	$prototype =~ s@/\*.*?\*/@@gos;	# strip comments.
 	$prototype =~ s@[\r\n]+@ @gos; # strip newlines/cr's.
 	$prototype =~ s@^\s+@@gos; # strip leading spaces
+
+	 # Handle prototypes for function pointers like:
+	 # int (*pcs_config)(struct foo)
+	$prototype =~ s@^(\S+\s+)\(\s*\*(\S+)\)@$1$2@gos;
+
 	if ($prototype =~ /SYSCALL_DEFINE/) {
 		syscall_munge();
 	}
-- 
2.26.2



