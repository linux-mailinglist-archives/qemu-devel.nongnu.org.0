Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5E63B2D14
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:56:49 +0200 (CEST)
Received: from localhost ([::1]:52308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwN2O-0006GU-Ab
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMnd-0004pp-Jm
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:41:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMnb-0008Ug-EO
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624531290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DGr4faTSM2mag8KxYNheAXSiHdisAoqcnaOHmS9tkPk=;
 b=XJW09qfvo6D7HP3+B6N5YdOgJlScZUYtd+N66PZQgEcfQK6LztbnkLiiSj5X65Dbrk/0D1
 7qKOagOOkXrWJUJGJ5t6k1cDn0g7HhkG1rmwTSzgRhWrllOOuRHiv09DhvInF6WsCwp5J8
 btn+saK3KYM+/AGkIM1i8UZ0kBf+Vd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-83Vgh_XLNlOvbCJH-zRHxA-1; Thu, 24 Jun 2021 06:41:29 -0400
X-MC-Unique: 83Vgh_XLNlOvbCJH-zRHxA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDE38106B7E1;
 Thu, 24 Jun 2021 10:41:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47F31E2C4;
 Thu, 24 Jun 2021 10:41:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2520E180354E; Thu, 24 Jun 2021 12:38:38 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/34] modules: hook up modules.h to docs build
Date: Thu, 24 Jun 2021 12:38:26 +0200
Message-Id: <20210624103836.2382472-25-kraxel@redhat.com>
In-Reply-To: <20210624103836.2382472-1-kraxel@redhat.com>
References: <20210624103836.2382472-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Lieven <pl@kamp.de>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/index.rst   | 1 +
 docs/devel/modules.rst | 5 +++++
 2 files changed, 6 insertions(+)
 create mode 100644 docs/devel/modules.rst

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 977c3893bdaf..ba90badbbd6d 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -41,6 +41,7 @@ Contents:
    s390-dasd-ipl
    clocks
    qom
+   modules
    block-coroutine-wrapper
    multi-process
    ebpf_rss
diff --git a/docs/devel/modules.rst b/docs/devel/modules.rst
new file mode 100644
index 000000000000..066f347b89ba
--- /dev/null
+++ b/docs/devel/modules.rst
@@ -0,0 +1,5 @@
+============
+Qemu modules
+============
+
+.. kernel-doc:: include/qemu/module.h
-- 
2.31.1


