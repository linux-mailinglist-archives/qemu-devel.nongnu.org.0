Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321972575D1
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 10:50:41 +0200 (CEST)
Received: from localhost ([::1]:42606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCfWR-0002qx-VB
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 04:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kCfVa-0001yp-C9
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 04:49:46 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55932
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kCfVY-0000CF-LG
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 04:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598863783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6AfCTZkAlImt99whZ9IZJOo1J3GLh0vFe+BPTC3iH1E=;
 b=cxkiIfg5dBj4fAktwP1bmHbugC4wWeQ8wxM2FazOyQwFYpyosGYcvUMygHC9VlLbjRoJtC
 tu0ms3vY9TYKZyPtRbvJg5GwcsqCGo4hK4Ubup37BZ2zRlQ+ZrsYDbqAqwXQV5RZeJRgQD
 1RrDs+XFd2cQq+JVt6GzVWLTNxTWaWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-HgOBBwDRORScohTmuNihlw-1; Mon, 31 Aug 2020 04:49:41 -0400
X-MC-Unique: HgOBBwDRORScohTmuNihlw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D06C656B2C
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 08:49:40 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9DEA60C04;
 Mon, 31 Aug 2020 08:49:37 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: do not include ${prefix} in firmwarepath
Date: Mon, 31 Aug 2020 04:49:37 -0400
Message-Id: <20200831084937.8298-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 03:06:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Left out in commit 22a87800e6 ("configure: expand path variables for
meson configure", 2020-08-21), do it now.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 56ceca2f68..d15ecbee46 100755
--- a/configure
+++ b/configure
@@ -473,7 +473,6 @@ LDFLAGS_SHARED="-shared"
 modules="no"
 module_upgrades="no"
 prefix="/usr/local"
-firmwarepath="\${prefix}/share/qemu-firmware"
 qemu_suffix="qemu"
 slirp=""
 oss_lib=""
@@ -1672,6 +1671,7 @@ for opt do
   esac
 done
 
+firmwarepath="${firmwarepath:-$prefix/share/qemu-firmware}"
 libdir="${libdir:-$prefix/lib}"
 libexecdir="${libexecdir:-$prefix/libexec}"
 includedir="${includedir:-$prefix/include}"
-- 
2.26.2


