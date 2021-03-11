Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A24D337EC1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 21:10:36 +0100 (CET)
Received: from localhost ([::1]:42392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKRdj-0002L4-4O
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 15:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lKRaZ-0000WD-Vk
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 15:07:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lKRaT-0000RV-Ij
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 15:07:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615493231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=05azV5Bd1mGh9WjLTiND9BuiQ7RvEdhPVXzl2I02Kzs=;
 b=ELrdQfL/pVPe1ZiDYI0CHypQCZ5gA1ZwGbrzD+6YFH25pYAfSywLtz1SQXuq15OJJ7f4pQ
 6/bTJEhHMLgsF9BSqyF74dISW1/bNCZs/nRnWqX+CPhqAKV1jHQhTxy5iFE0qplWS5/Gx8
 FMawV4X0w4qWFyKUjBPyio1OB5HKmx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-mK17ONFaMKmJKrtTMTF3Sw-1; Thu, 11 Mar 2021 15:07:09 -0500
X-MC-Unique: mK17ONFaMKmJKrtTMTF3Sw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C645418460E0;
 Thu, 11 Mar 2021 20:07:08 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72BA960853;
 Thu, 11 Mar 2021 20:07:08 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] utils: Reduce chance of rounding inaccuracy in qemu_strtosz.
Date: Thu, 11 Mar 2021 14:07:02 -0600
Message-Id: <20210311200702.1302855-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not all floating point fractions are precise.  For example, the two
nearest 32-bit IEEE float values for 0.345 are 0.344999998808 and
0.34500002861, with the lower one being closer.  When our scaling unit
is 1000, that in turn can produce instances of double rounding (our
first when truncating to get the floating point fraction compared to
what the user typed, the second in converting the result of the
multiplication back to an integer), resulting in a final result 1 byte
smaller than the intuitive integer.

For the actual test failure encountered on gitlab cross-i386-user, we
can clean things up by adding in DBL_EPSILON (with IEEE double, that
is 2^-53) for all values on a scale smaller than Petabytes (that is
2^50), where our introduced error is not enough to add a full byte,
but will be enough to cause the subsequent multiplication to overshoot
rather than undershoot the nearest integer.  And ultimately, we've
already documented that fractional values are for human convenience:
if a user is worried about byte-level precision when specifying more
than 50 bits of sizing, they should already be specifying things in
bytes rather than fractions.

Fixes: cf923b783efd5 (utils: Improve qemu_strtosz() to have 64 bits of precision)
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Eric Blake <eblake@redhat.com>
---

I'm not actually sure how to kick off a gitlab CI run of this to see if
it fixes the failure originally reported at
https://gitlab.com/qemu-project/qemu/-/jobs/1090685134
Pointers welcome!

An alternative patch might be writing (uint64_t)(fraction * mul + 0.5)
(that is, introduce the fudge factor after the multiplication instead
of before).  Preferences?

 util/cutils.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/util/cutils.c b/util/cutils.c
index d89a40a8c325..c124d8165f57 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include <math.h>
+#include <float.h>

 #include "qemu-common.h"
 #include "qemu/sockets.h"
@@ -329,6 +330,15 @@ static int do_strtosz(const char *nptr, const char **end,
                         "is deprecated: %s", nptr);
         }
         endptr++;
+        /*
+         * Add in a fudge-factor (2^53 when double is IEEE format) for
+         * all scales less than P (2^50), so that things like
+         * 12.345M with unit 1000 produce 12345000 instead of
+         * 12344999.
+         */
+        if (mul > 1e49) {
+            fraction += DBL_EPSILON;
+        }
     } else {
         mul = suffix_mul(default_suffix, unit);
         assert(mul > 0);
-- 
2.30.1


