Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750DB2C6A69
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 18:10:14 +0100 (CET)
Received: from localhost ([::1]:33258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kihG9-0003JZ-8F
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 12:10:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kihEw-0002RS-Gt
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:08:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kihEv-0000QX-2L
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:08:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606496936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h3SgGN2/86nTX51Dntpci07gsSpDSFDOc01L2Ala9Tc=;
 b=UPrOnjxNmzre1WMO5vJ85zg8d34ymxrItjxkn+GOttEJbIXA2/yJUSKiLGoXRZcFeXeHyq
 U9Sv1Dqm2whjsOlzhCAWfruIOuU4t8kr9e+sCis5rg9B6tphXmzD0wn/TlT7pF/1eravij
 n2wY9wmj3IiLbtiCSlwzYBcApRGh5F8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-id3WKd7aNouPEDeRcP5CJw-1; Fri, 27 Nov 2020 12:08:54 -0500
X-MC-Unique: id3WKd7aNouPEDeRcP5CJw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1378A1E7E0;
 Fri, 27 Nov 2020 17:08:53 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 810C75D6D1;
 Fri, 27 Nov 2020 17:08:48 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] slirp: update to fix CVE-2020-29129 CVE-2020-29130
Date: Fri, 27 Nov 2020 21:08:36 +0400
Message-Id: <20201127170836.687073-2-marcandre.lureau@redhat.com>
In-Reply-To: <20201127170836.687073-1-marcandre.lureau@redhat.com>
References: <20201127170836.687073-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

An out-of-bounds access issue was found in the SLIRP user networking
implementation of QEMU. It could occur while processing ARP/NCSI
packets, if the packet length was shorter than required to accommodate
respective protocol headers and payload. A privileged guest user may use
this flaw to potentially leak host information bytes.

Marc-André Lureau (1):
      Merge branch 'stable-4.2' into 'stable-4.2'

Prasad J Pandit (1):
      slirp: check pkt_len before reading protocol header

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 slirp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/slirp b/slirp
index ce94eba204..8f43a99191 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit ce94eba2042d52a0ba3d9e252ebce86715e94275
+Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
-- 
2.29.0


