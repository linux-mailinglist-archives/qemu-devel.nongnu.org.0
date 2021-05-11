Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE63637A24C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:37:57 +0200 (CEST)
Received: from localhost ([::1]:33640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNts-0004dd-SK
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNXH-0002Gd-4a
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWq-0000p4-KK
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=niDzH7Z9FhD+NjMo3uH/iqmL93VSD1+pHNt26Miilak=;
 b=R6aNMTdb/J0RllwmxT78hdC5t2fnEpzA5QgIkaC9kKhSq9XLXYFF3auU3xj1adGJoEllkX
 LekUfSJyaDjEcgkFIQjqXyoPVH9J2zEH1G1QTDzo/D8Gp7LfrjUobBUXng5SGcs75VFJ5y
 77wepjCDZfpkA9Nvk1rVgSV/9TORnhk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-NG50l3FHOwGZwLldWFsA6g-1; Tue, 11 May 2021 04:14:06 -0400
X-MC-Unique: NG50l3FHOwGZwLldWFsA6g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 857A8107ACCA
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:14:05 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54ACF62499
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:14:05 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/33] qemu-option: support accept-any QemuOptsList in
 qemu_opts_absorb_qdict
Date: Tue, 11 May 2021 04:13:48 -0400
Message-Id: <20210511081350.419428-32-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-option.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index 9678d5b682..4944015a25 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -1056,7 +1056,8 @@ bool qemu_opts_absorb_qdict(QemuOpts *opts, QDict *qdict, Error **errp)
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



