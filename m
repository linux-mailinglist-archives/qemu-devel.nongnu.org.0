Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181CE207195
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 12:55:19 +0200 (CEST)
Received: from localhost ([::1]:36912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo33m-0000HV-1q
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 06:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jo2zm-0001AB-Th
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:51:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40599
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jo2zl-0001Jl-0x
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592995868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ecq6ZUkpsnc040JueViIsqBMjrtp9srwbm9A9vdokPs=;
 b=bhGfB2IFQTFI5VjH2PN5Nl+uUtlZXYtyul6YjEVT71aSK0v5OjOM4idxp5BXT0c96uMwS2
 8o5IjxOTuq0DVmsHe8q/q1StJLKiTN0Mg+24VZRi9cjLC5F/+MkEBPaFpJR8LYIbptkYes
 YdAxsBNx34fRyW5RuDvJnLNkela7YPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-9TZ4YbDgMi-QZGCg9v8bpg-1; Wed, 24 Jun 2020 06:51:03 -0400
X-MC-Unique: 9TZ4YbDgMi-QZGCg9v8bpg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EE5B879512;
 Wed, 24 Jun 2020 10:51:02 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C59271695;
 Wed, 24 Jun 2020 10:51:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/31] docs/nvdimm: add description of alignment requirement of
 device dax
Date: Wed, 24 Jun 2020 06:50:27 -0400
Message-Id: <20200624105048.375353-10-pbonzini@redhat.com>
In-Reply-To: <20200624104917.375143-1-pbonzini@redhat.com>
References: <20200624104917.375143-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jingqi Liu <jingqi.liu@intel.com>, Joao Martins <joao.m.martins@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jingqi Liu <jingqi.liu@intel.com>

For device dax (e.g., /dev/dax0.0), the NUM of 'align=NUM' option
needs to match the alignment requirement of the device dax.
It must be larger than or equal to the 'align' of device dax.

Reviewed-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
Message-Id: <20200429085011.63752-3-jingqi.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/nvdimm.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
index 362e99109e..c2c6e441b3 100644
--- a/docs/nvdimm.txt
+++ b/docs/nvdimm.txt
@@ -132,6 +132,16 @@ address to the page size (getpagesize(2)) by default. However, some
 types of backends may require an alignment different than the page
 size. In that case, QEMU v2.12.0 and later provide 'align' option to
 memory-backend-file to allow users to specify the proper alignment.
+For device dax (e.g., /dev/dax0.0), this alignment needs to match the
+alignment requirement of the device dax. The NUM of 'align=NUM' option
+must be larger than or equal to the 'align' of device dax.
+We can use one of the following commands to show the 'align' of device dax.
+
+    ndctl list -X
+    daxctl list -R
+
+In order to get the proper 'align' of device dax, you need to install
+the library 'libdaxctl'.
 
 For example, device dax require the 2 MB alignment, so we can use
 following QEMU command line options to use it (/dev/dax0.0) as the
-- 
2.26.2



