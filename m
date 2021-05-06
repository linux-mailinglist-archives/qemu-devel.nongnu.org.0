Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3858A375AE9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 20:59:24 +0200 (CEST)
Received: from localhost ([::1]:58754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lejDW-0006yR-Dy
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 14:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lejBJ-0005IM-GC
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lejBE-0005Wl-Hn
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620327419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ixZvPyfzey0N3JlNi4lsoo23i7AgQijVdVZhCMUC9XQ=;
 b=h3w1U82ODBgG/fW26eSpCrvQbuCKSF8OFEIFgjT4E480jOoUBd9rlRT01F0ZTToHrJeqHF
 6LrScm+5UsYKFFmkUdYV6OjOco9vY+O8Qc5pB2dxmtTDVUNu8v6PNGsWNIx+NJmHTB5EVh
 HWKoefyAhLbt4cMzqKWqBVTcg5U8Pqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-Bhjbx-3oNXiOVhFPGBnZpQ-1; Thu, 06 May 2021 14:56:57 -0400
X-MC-Unique: Bhjbx-3oNXiOVhFPGBnZpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A35E11922978;
 Thu,  6 May 2021 18:56:56 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-37.ams2.redhat.com
 [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D458F19C46;
 Thu,  6 May 2021 18:56:54 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, groug@kaod.org, jose.carlos.venegas.munoz@intel.com,
 ma.mandourr@gmail.com
Subject: [PULL 02/12] virtiofsd: Allow use "-o xattrmap" without "-o xattr"
Date: Thu,  6 May 2021 19:56:31 +0100
Message-Id: <20210506185641.284821-3-dgilbert@redhat.com>
In-Reply-To: <20210506185641.284821-1-dgilbert@redhat.com>
References: <20210506185641.284821-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: virtio-fs@redhat.com, vgoyal@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Carlos Venegas <jose.carlos.venegas.munoz@intel.com>

When -o xattrmap is used, it will not work unless xattr is enabled.

This patch enables xattr when -o xattrmap is used.

Signed-off-by: Carlos Venegas <jose.carlos.venegas.munoz@intel.com>
Message-Id: <20210414201207.3612432-2-jose.carlos.venegas.munoz@intel.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 6592f96f68..2c36f4ec46 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3831,6 +3831,7 @@ int main(int argc, char *argv[])
     }
 
     if (lo.xattrmap) {
+        lo.xattr = 1;
         parse_xattrmap(&lo);
     }
 
-- 
2.31.1


