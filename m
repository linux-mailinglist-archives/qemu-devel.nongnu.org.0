Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CB528168C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 17:26:46 +0200 (CEST)
Received: from localhost ([::1]:57756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOMxJ-0001NL-6Q
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 11:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMIj-0002ov-Ek
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMId-0004gs-F0
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601649882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pcCecavnptdcRPSZqyqN3yryY7IPYbXokhfsLwz8AnA=;
 b=bsBZ4VKF/remm65mb9V/TT1bwWQG8RUO+Ak7J8LE/9az6YGpfCyuJ8Y5efadRG1qqH/m7W
 A7hhoYD/N2KlF1NeLXmGRlTC85ymJ6cdk+4Sz/VDvncfpTumOtETHiELRjHRZDZQD2b1wb
 niEvM4vYctaDXMF/ft2Htd/UPQkuUWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-boh5HegPMI-Tc0nrw0lO_g-1; Fri, 02 Oct 2020 10:44:40 -0400
X-MC-Unique: boh5HegPMI-Tc0nrw0lO_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79591803F50;
 Fri,  2 Oct 2020 14:44:39 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-112-139.ams2.redhat.com
 [10.36.112.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E3805D9D3;
 Fri,  2 Oct 2020 14:44:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 34/37] iotests: Allow supported and unsupported formats at the
 same time
Date: Fri,  2 Oct 2020 16:43:42 +0200
Message-Id: <20201002144345.253865-35-kwolf@redhat.com>
In-Reply-To: <20201002144345.253865-1-kwolf@redhat.com>
References: <20201002144345.253865-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 01:13:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is useful for specifying 'generic' as supported (which includes
only writable image formats), but still excluding some incompatible
writable formats.

It also removes more lines than it adds.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200924152717.287415-31-kwolf@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/iotests.py | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 9695c917e4..f212cec446 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1062,16 +1062,12 @@ def case_notrun(reason):
 
 def _verify_image_format(supported_fmts: Sequence[str] = (),
                          unsupported_fmts: Sequence[str] = ()) -> None:
-    assert not (supported_fmts and unsupported_fmts)
-
     if 'generic' in supported_fmts and \
             os.environ.get('IMGFMT_GENERIC', 'true') == 'true':
         # similar to
         #   _supported_fmt generic
         # for bash tests
-        if imgfmt == 'luks':
-            verify_working_luks()
-        return
+        supported_fmts = ()
 
     not_sup = supported_fmts and (imgfmt not in supported_fmts)
     if not_sup or (imgfmt in unsupported_fmts):
-- 
2.25.4


