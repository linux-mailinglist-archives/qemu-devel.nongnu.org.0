Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E20045CD90
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 20:56:11 +0100 (CET)
Received: from localhost ([::1]:45538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpyNG-0005Fy-LK
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 14:56:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxvL-0004B0-OC
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxvK-0007k4-9J
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637782037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yON4DkVybRlJ8QrAOwHh2Nzza9xYE+03aFOFuEjoQoQ=;
 b=bwZOcisosHVVJlAGAiaR+Z1Grty3b0WJHz/7dr4EAUPV2D3c0/FTtzXeoeAi9AwN1yvKbQ
 c65efVgkSbHcqeCrRgCAYcelkBWVl2ftXpLRc90TUjDxGqJhvXDOpknh29Vop2sFHSxTJU
 P5Bv1eUmenEtpaolG4cL2yqvYbt+mDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-BfF4uI93OQGocHwy_7Zqqw-1; Wed, 24 Nov 2021 14:27:14 -0500
X-MC-Unique: BfF4uI93OQGocHwy_7Zqqw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A3541054F90;
 Wed, 24 Nov 2021 19:27:13 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 970762B179;
 Wed, 24 Nov 2021 19:27:12 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/23] python: re-enable pylint duplicate-code warnings
Date: Wed, 24 Nov 2021 14:26:17 -0500
Message-Id: <20211124192617.3396403-24-jsnow@redhat.com>
In-Reply-To: <20211124192617.3396403-1-jsnow@redhat.com>
References: <20211124192617.3396403-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the old library gone, there's nothing duplicated in the tree, so
the warning suppression can be removed.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/setup.cfg | 1 -
 1 file changed, 1 deletion(-)

diff --git a/python/setup.cfg b/python/setup.cfg
index 5140a5b322..c341e922c2 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -114,7 +114,6 @@ ignore_missing_imports = True
 disable=consider-using-f-string,
         too-many-function-args,  # mypy handles this with less false positives.
         no-member,  # mypy also handles this better.
-        duplicate-code,  # To be removed by the end of this patch series.
 
 [pylint.basic]
 # Good variable names which should always be accepted, separated by a comma.
-- 
2.31.1


