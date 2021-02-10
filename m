Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF343162C8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 10:54:04 +0100 (CET)
Received: from localhost ([::1]:40552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9mCB-0002wB-7y
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 04:54:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9m9p-0000ee-Sr
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 04:51:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9m9m-0001Vq-H2
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 04:51:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612950692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eENynDJNps9kDCIJFPnyq/XCtSPyPmheRK5nRG4nsSE=;
 b=AM4jfRKZEgcdYqIJFuTBKeAR9i0tN1CV1F7amf/+WEa3EFNKd67rvH00CJX6fYdiZ7J2cA
 b8N7eA3qiA8hcmIZ6UK9P9kNxlVWtw1Li0M3fivWdXy8f6nDJ1iCE22a5KbmMWKkC11D8E
 KjTEAFVtcXOpviWYyW8Cd617DcjGyTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-czISM5FXN4WpngEoPoVZVg-1; Wed, 10 Feb 2021 04:51:31 -0500
X-MC-Unique: czISM5FXN4WpngEoPoVZVg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54F29193578B;
 Wed, 10 Feb 2021 09:51:30 +0000 (UTC)
Received: from localhost (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E786B5D9CD;
 Wed, 10 Feb 2021 09:51:29 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests: Consistent $IMGOPTS boundary matching
Date: Wed, 10 Feb 2021 10:51:28 +0100
Message-Id: <20210210095128.22732-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To disallow certain refcount_bits values, some _unsupported_imgopts
invocations look like "refcount_bits=1[^0-9]", i.e. they match an
integer boundary with [^0-9].  This expression does not match the end of
the string, though, so it breaks down when refcount_bits is the last
option (which it tends to be after the rewrite of the check script in
Python).

Those invocations could use \b or \> instead, but those are not
portable.  They could use something like \([^0-9]\|$\), but that would
be cumbersome.  To make it simple and keep the existing invocations
working, just let _unsupported_imgopts match the regex against $IMGOPTS
plus a trailing space.

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
Supersedes "iotests: Fix unsupported_imgopts for refcount_bits", and can
be reproduced in the same way:

$ ./check -qcow2 -o refcount_bits=1 7 15 29 58 62 66 68 80

(those tests should be skipped)
---
 tests/qemu-iotests/common.rc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 77c37e8312..65cdba5723 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -885,7 +885,9 @@ _unsupported_imgopts()
 {
     for bad_opt
     do
-        if echo "$IMGOPTS" | grep -q 2>/dev/null "$bad_opt"
+        # Add a space so tests can match for whitespace that marks the
+        # end of an option (\b or \> are not portable)
+        if echo "$IMGOPTS " | grep -q 2>/dev/null "$bad_opt"
         then
             _notrun "not suitable for image option: $bad_opt"
         fi
-- 
2.29.2


