Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F0B2AF3B1
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 15:35:57 +0100 (CET)
Received: from localhost ([::1]:44018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcrE4-000442-Hu
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 09:35:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcr4I-0008RO-S5
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:25:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcr4H-0001rt-1Z
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:25:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605104748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bn0aEtSA7/6AIa3yXVYBo0IMB9TDOyxEVD++X/cdsI4=;
 b=U8zmzBGHWZMUH/XezNwC0hETVe8zk/uhCksMY2XtH/XxiO+TIX/RjJ2h41GWylN4wGoSeC
 Qx33ii/QfZnvRgqV92lVtKTc0GTVav5FoGjGf7/FWOfOUctjqCT4hDkH1MR4AGwrldKg80
 j9s36hCVsKauUVcr7Yov90Wj144e+bo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-5QX32h0VO52VD2lSEcUpPw-1; Wed, 11 Nov 2020 09:25:43 -0500
X-MC-Unique: 5QX32h0VO52VD2lSEcUpPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2597D10054FF
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 14:25:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5D745DA74;
 Wed, 11 Nov 2020 14:25:41 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/12] qemu-option: support accept-any QemuOptsList in
 qemu_opts_absorb_qdict
Date: Wed, 11 Nov 2020 09:25:35 -0500
Message-Id: <20201111142537.1213209-11-pbonzini@redhat.com>
In-Reply-To: <20201111142537.1213209-1-pbonzini@redhat.com>
References: <20201111142537.1213209-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-option.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index 40564a12eb..afba08d92e 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -1052,7 +1052,8 @@ bool qemu_opts_absorb_qdict(QemuOpts *opts, QDict *qdict, Error **errp)
     while (entry != NULL) {
         next = qdict_next(qdict, entry);
 
-        if (find_desc_by_name(opts->list->desc, entry->key)) {
+        if (opts_accepts_any(opts->list) ||
+            find_desc_by_name(opts->list->desc, entry->key)) {
             if (!qemu_opts_from_qdict_entry(opts, entry, errp)) {
                 return false;
             }
-- 
2.26.2



