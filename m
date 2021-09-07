Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764CF4029EC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:41:07 +0200 (CEST)
Received: from localhost ([::1]:41130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbLW-0006no-Gv
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNawQ-00037l-3b
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNawO-0002J5-MV
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631020508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=92eyOB5Uo2QNQSlgVUBo0CzXNg/TVspDu1k/Apuos2c=;
 b=WKaVj02C5cnHiw024YTdkuNmoJxKa4kW6WH/Rl2RcZL01QXKFBYUOt1NXM5JeC8KPiKjhv
 iJiXUIfe9fPnuXZxny7tZu4rEt7VeHhgUOjIu4ZdgWDjFphfjCFrmULfwQkJpxlxfazl9+
 N/nfxyOMol/ZiU9PgWc6N33wQ0b2onw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-J03p1ZMxNyqIg84QPlKlmg-1; Tue, 07 Sep 2021 09:15:04 -0400
X-MC-Unique: J03p1ZMxNyqIg84QPlKlmg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 283F5802935;
 Tue,  7 Sep 2021 13:15:03 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 885555C1B4;
 Tue,  7 Sep 2021 13:14:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 02/20] css: fix actl handling for unit exceptions
Date: Tue,  7 Sep 2021 15:14:31 +0200
Message-Id: <20210907131449.493875-3-thuth@redhat.com>
In-Reply-To: <20210907131449.493875-1-thuth@redhat.com>
References: <20210907131449.493875-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Jared Rossi <jrossi@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cornelia Huck <cohuck@redhat.com>

When a subchannel becomes pending with unit exception, start
pending (and for that matter, halt or clear pending) are not
removed in the actl. Device active and subchannel active,
however, are (due to the subchannel becoming status pending
with primary respectively secondary status).

The other conditions in the actl are only cleared when the
guest executes tsch on the subchannel.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>
Tested-by: Jared Rossi <jrossi@linux.ibm.com>
Message-Id: <20210705163952.736020-3-cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/s390x/css.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/s390x/css.h b/include/hw/s390x/css.h
index 10ed1df1bb..75e5381613 100644
--- a/include/hw/s390x/css.h
+++ b/include/hw/s390x/css.h
@@ -146,7 +146,8 @@ struct SubchDev {
 
 static inline void sch_gen_unit_exception(SubchDev *sch)
 {
-    sch->curr_status.scsw.ctrl &= ~SCSW_ACTL_START_PEND;
+    sch->curr_status.scsw.ctrl &= ~(SCSW_ACTL_DEVICE_ACTIVE |
+                                    SCSW_ACTL_SUBCH_ACTIVE);
     sch->curr_status.scsw.ctrl |= SCSW_STCTL_PRIMARY |
                                   SCSW_STCTL_SECONDARY |
                                   SCSW_STCTL_ALERT |
-- 
2.27.0


