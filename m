Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE993674C9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 23:26:15 +0200 (CEST)
Received: from localhost ([::1]:51922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZKMR-0007jH-1p
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 17:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lZKKJ-0006UZ-Ak
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 17:24:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lZKKH-0008LZ-5k
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 17:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619040239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cBricITajURSYy0dfQnRiPFC/QX/3iQn7kT3AzvdW0o=;
 b=Ko7nQm8VebbI7bE63yJuIIQpVNISEAel/boyLUt4rAQjAX6vdxKlkd5dDRUmjd2AlFFVVW
 G4SusTLNUjEDYSpUUqY5ejMirm9Rd7ZeXm1x4qAEFjZhVoc+fcwdy6U03iGC6EZQRitmmK
 pONIk42rWMxDH7q2EAOSRs65RBc/YCo=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-LpGdXE6YNrO3HVx_aA8WXQ-1; Wed, 21 Apr 2021 17:23:48 -0400
X-MC-Unique: LpGdXE6YNrO3HVx_aA8WXQ-1
Received: by mail-oi1-f197.google.com with SMTP id
 b21-20020a0568080115b029018764f93fdcso1939157oie.12
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 14:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cBricITajURSYy0dfQnRiPFC/QX/3iQn7kT3AzvdW0o=;
 b=oVAWSfbxXd+HEo0tD3RRTIH6VjAOP7DQ1Fb5E7T4MJsfxHY2r1yvtQnzz1MAT+jDGt
 K2yT3D/bTaLH/xiPHSU+mCCFc0dq+5GrMMFgaDXUtpBQSLBdPRLKU9uwPGtGk4gWVPz1
 antOtnJGXC4v4jonN+bPJWD5+YBgvOIrjuKA0U1/vrQ6HtK2/x9uVVHaVupJobdkUuW4
 /bscL7RkK9LFvQmp9kl4+vuHVcPLxUtjeZW1/SecHAwf5+1aRrZTSugdk4fhMyN0X8X9
 rnrh1D8eYz353pGpzS0Q85d98ansh4G/BI7XNIkNZ5VWVjvI7x9lnJZlsQDOxkNjCCzn
 Xh2A==
X-Gm-Message-State: AOAM531gscji33YMy38UHaFoAzQZzWwR35/kZoT9/TH68BCj3Pq9NZ9D
 tTaB5qiRLKkO3adDx282VIGRiClqqjxB839wF9G4FvpU+Jgb7DFxCM2FmHSsSrd5r1dq5TRRgRj
 QY1Gj+354iWcTLgs=
X-Received: by 2002:a54:4484:: with SMTP id v4mr4019536oiv.70.1619040227392;
 Wed, 21 Apr 2021 14:23:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx42MPYGf1EVoqO1zF9KqHr4mlzNnwfeG/vztL7IE+3FzyvdOHLzgeza+SgGXhcxlMl8rvKMg==
X-Received: by 2002:a54:4484:: with SMTP id v4mr4019527oiv.70.1619040227193;
 Wed, 21 Apr 2021 14:23:47 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id n13sm141031otk.61.2021.04.21.14.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 14:23:46 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 2/2] block/rbd: Add an escape-aware strchr helper
Date: Wed, 21 Apr 2021 16:23:43 -0500
Message-Id: <20210421212343.85524-3-ckuehl@redhat.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210421212343.85524-1-ckuehl@redhat.com>
References: <20210421212343.85524-1-ckuehl@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, sgarzare@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
v3 -> v4:
  * Replace qemu_rbd_next_tok() seek loop with qemu_rbd_strchr() since
    they're identical

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
2.30.2


