Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B242CBAA8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:38:46 +0100 (CET)
Received: from localhost ([::1]:57222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPX3-0005jz-TG
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:38:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO48-00045r-ER
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3o-0004iq-FT
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bn0aEtSA7/6AIa3yXVYBo0IMB9TDOyxEVD++X/cdsI4=;
 b=BWcl4YcklQoDxHRCLnwL30yo5vOFQxk9FbF/xwFGxnBty2fn+AtgFEETxvpe4x+z1sSOKZ
 ScOfXp3wAKyuPUpqc/IsH0JKCbntBh6GB39K4H29u2wnybXpIOjwRE1WTYCy/3dalxX3D1
 QqK4dXG15mFNdEr6OS1X3NFRmNolX3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-t-713KDtOVa0eNeZC8F3rQ-1; Wed, 02 Dec 2020 04:04:22 -0500
X-MC-Unique: t-713KDtOVa0eNeZC8F3rQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0B4DC73DC;
 Wed,  2 Dec 2020 09:03:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 430746085A;
 Wed,  2 Dec 2020 09:03:46 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/28] qemu-option: support accept-any QemuOptsList in
 qemu_opts_absorb_qdict
Date: Wed,  2 Dec 2020 04:02:52 -0500
Message-Id: <20201202090305.4129317-16-pbonzini@redhat.com>
In-Reply-To: <20201202090305.4129317-1-pbonzini@redhat.com>
References: <20201202090305.4129317-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org
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



