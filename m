Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D78212232
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 13:26:03 +0200 (CEST)
Received: from localhost ([::1]:36514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqxLu-0001OQ-Bb
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 07:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqx6M-00076w-63
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:09:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46399
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqx69-00012U-Tx
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593688185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BkOgvLG5t8mGkrvuFRAmq6oLyRCLu82G6LXUz3O7dFU=;
 b=Ub/rQ7/VKW1FxvJtMEPNZoSNymKfsF/iSLEezIcG9VMzDSllx5oTfysV1XFC8hWHwxBGZM
 xtzP3uABF/dFm+51ddSJSJvC41EEKqG4J9fL3borYSxHTbEpEy2oiS/tNzN483nBS3zi2s
 2u2bPStjjswrZ/6PxLSo4YUj90Updms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-y48yAovSMY2H84TWJLbtRQ-1; Thu, 02 Jul 2020 07:09:41 -0400
X-MC-Unique: y48yAovSMY2H84TWJLbtRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9050EBFC1;
 Thu,  2 Jul 2020 11:09:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AAC8E6111F;
 Thu,  2 Jul 2020 11:09:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B75D01138475; Thu,  2 Jul 2020 13:09:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/28] spapr: Plug minor memory leak in spapr_machine_init()
Date: Thu,  2 Jul 2020 13:09:12 +0200
Message-Id: <20200702110931.2953148-10-armbru@redhat.com>
In-Reply-To: <20200702110931.2953148-1-armbru@redhat.com>
References: <20200702110931.2953148-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:23:40
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
Cc: David Gibson <dgibson@redhat.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

spapr_machine_init() leaks an Error object when
kvmppc_check_papr_resize_hpt() fails and spapr->resize_hpt is
SPAPR_RESIZE_HPT_DISABLED, i.e. when the host doesn't support hash
page table resizing, and the user didn't ask for it.  As harmless as
memory leaks can possibly be.  Plug it.

Fixes: 30f4b05bd090564181554d0890605eb2c143e4ea
Cc: David Gibson <dgibson@redhat.com>
Cc: qemu-ppc@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20200630090351.1247703-8-armbru@redhat.com>
---
 hw/ppc/spapr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4c185bcc13..44fd578ea9 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2731,6 +2731,7 @@ static void spapr_machine_init(MachineState *machine)
         error_report_err(resize_hpt_err);
         exit(1);
     }
+    error_free(resize_hpt_err);
 
     spapr->rma_size = spapr_rma_size(spapr, &error_fatal);
 
-- 
2.26.2


