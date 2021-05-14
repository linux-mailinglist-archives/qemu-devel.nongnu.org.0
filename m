Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356FD380E76
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:53:48 +0200 (CEST)
Received: from localhost ([::1]:48198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhb4N-0002OZ-1L
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawK-0005Is-Je
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawG-0005mR-DF
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6O0Km14jEIjLo8db35OzkGPuk050DrgTO8J6Qmf1TQ4=;
 b=bdKGP8Jtz/dK3S9/7azfrO8vwVws+qSmGhEPizbf6ilYCgIlkKw4XA4iFvjxmd0C0Sfcqu
 SjiWJZ0nOdq2SeWo0QtBKWLKl0D91jCYIhxvKDJq5nYG6dOcvnB9SVCEU9ppzjClUhTMww
 jyFHr+42pv4zwIar4ECDhJPwGP4bJVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-Vt28qcqTO8i5t7dt_NF_gQ-1; Fri, 14 May 2021 12:45:21 -0400
X-MC-Unique: Vt28qcqTO8i5t7dt_NF_gQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C81B803621;
 Fri, 14 May 2021 16:45:20 +0000 (UTC)
Received: from localhost (ovpn-114-49.ams2.redhat.com [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3612B5D6D1;
 Fri, 14 May 2021 16:45:20 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/19] block/rbd: Add an escape-aware strchr helper
Date: Fri, 14 May 2021 18:44:57 +0200
Message-Id: <20210514164514.1057680-3-mreitz@redhat.com>
In-Reply-To: <20210514164514.1057680-1-mreitz@redhat.com>
References: <20210514164514.1057680-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Connor Kuehl <ckuehl@redhat.com>

Sometimes the parser needs to further split a token it has collected
from the token input stream. Right now, it does a cursory check to see
if the relevant characters appear in the token to determine if it should
break it down further.

However, qemu_rbd_next_tok() will escape characters as it removes tokens
from the token stream and plain strchr() won't. This can make the
initial strchr() check slightly misleading since it implies
qemu_rbd_next_tok() will find the token and split on it, except the
reality is that qemu_rbd_next_tok() will pass over it if it is escaped.

Use a custom strchr to avoid mixing escaped and unescaped string
operations. Furthermore, this code is identical to how
qemu_rbd_next_tok() seeks its next token, so incorporate this custom
strchr into the body of that function to reduce duplication.

Reported-by: Han Han <hhan@redhat.com>
Fixes: https://bugzilla.redhat.com/1873913
Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
Message-Id: <20210421212343.85524-3-ckuehl@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/rbd.c                | 32 +++++++++++++++++++++-----------
 tests/qemu-iotests/231     |  4 ++++
 tests/qemu-iotests/231.out |  3 +++
 3 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index f098a89c7b..26f64cce7c 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -113,21 +113,31 @@ static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
                             const char *keypairs, const char *secretid,
                             Error **errp);
 
+static char *qemu_rbd_strchr(char *src, char delim)
+{
+    char *p;
+
+    for (p = src; *p; ++p) {
+        if (*p == delim) {
+            return p;
+        }
+        if (*p == '\\' && p[1] != '\0') {
+            ++p;
+        }
+    }
+
+    return NULL;
+}
+
+
 static char *qemu_rbd_next_tok(char *src, char delim, char **p)
 {
     char *end;
 
     *p = NULL;
 
-    for (end = src; *end; ++end) {
-        if (*end == delim) {
-            break;
-        }
-        if (*end == '\\' && end[1] != '\0') {
-            end++;
-        }
-    }
-    if (*end == delim) {
+    end = qemu_rbd_strchr(src, delim);
+    if (end) {
         *p = end + 1;
         *end = '\0';
     }
@@ -171,7 +181,7 @@ static void qemu_rbd_parse_filename(const char *filename, QDict *options,
     qemu_rbd_unescape(found_str);
     qdict_put_str(options, "pool", found_str);
 
-    if (strchr(p, '@')) {
+    if (qemu_rbd_strchr(p, '@')) {
         image_name = qemu_rbd_next_tok(p, '@', &p);
 
         found_str = qemu_rbd_next_tok(p, ':', &p);
@@ -181,7 +191,7 @@ static void qemu_rbd_parse_filename(const char *filename, QDict *options,
         image_name = qemu_rbd_next_tok(p, ':', &p);
     }
     /* Check for namespace in the image_name */
-    if (strchr(image_name, '/')) {
+    if (qemu_rbd_strchr(image_name, '/')) {
         found_str = qemu_rbd_next_tok(image_name, '/', &image_name);
         qemu_rbd_unescape(found_str);
         qdict_put_str(options, "namespace", found_str);
diff --git a/tests/qemu-iotests/231 b/tests/qemu-iotests/231
index 0f66d0ca36..8e6c6447c1 100755
--- a/tests/qemu-iotests/231
+++ b/tests/qemu-iotests/231
@@ -55,6 +55,10 @@ _filter_conf()
 $QEMU_IMG info "json:{'file.driver':'rbd','file.filename':'rbd:rbd/bogus:conf=${BOGUS_CONF}'}" 2>&1 | _filter_conf
 $QEMU_IMG info "json:{'file.driver':'rbd','file.pool':'rbd','file.image':'bogus','file.conf':'${BOGUS_CONF}'}" 2>&1 | _filter_conf
 
+# Regression test: the qemu-img invocation is expected to fail, but it should
+# not seg fault the parser.
+$QEMU_IMG create "rbd:rbd/aa\/bb:conf=${BOGUS_CONF}" 1M 2>&1 | _filter_conf
+
 # success, all done
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/231.out b/tests/qemu-iotests/231.out
index 747dd221bb..a785a6e859 100644
--- a/tests/qemu-iotests/231.out
+++ b/tests/qemu-iotests/231.out
@@ -4,4 +4,7 @@ unable to get monitor info from DNS SRV with service name: ceph-mon
 qemu-img: Could not open 'json:{'file.driver':'rbd','file.filename':'rbd:rbd/bogus:conf=BOGUS_CONF'}': error connecting: No such file or directory
 unable to get monitor info from DNS SRV with service name: ceph-mon
 qemu-img: Could not open 'json:{'file.driver':'rbd','file.pool':'rbd','file.image':'bogus','file.conf':'BOGUS_CONF'}': error connecting: No such file or directory
+Formatting 'rbd:rbd/aa\/bb:conf=BOGUS_CONF', fmt=raw size=1048576
+unable to get monitor info from DNS SRV with service name: ceph-mon
+qemu-img: rbd:rbd/aa\/bb:conf=BOGUS_CONF: error connecting: No such file or directory
 *** done
-- 
2.31.1


