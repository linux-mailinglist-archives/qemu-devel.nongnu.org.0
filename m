Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EF4352149
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 23:05:55 +0200 (CEST)
Received: from localhost ([::1]:41580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS4Vm-0001Gq-Vc
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 17:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lS4S0-0007Ft-TA
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 17:02:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lS4Rx-0003Bk-07
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 17:02:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617310916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X91HzjMdIQRC4bFzuA9M8SwZIl0hk0KOPCfh8VRtOKw=;
 b=T2b1ZrajK7xDEwQflXc+tB7yuiKLe6d7+HQPT76Cr5TfjYMvjjcbmNw0AqNFxyI6GLFcqT
 9oWfoDlRm4fkA7lRCjRaKPNEnkZexnnFToxau6rctad+aH6o5veYWUugQWG2Bv104QDcxd
 T2JoPKEImnYodUW+QIqjSEo7yTa1xhk=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-7r8WrhOaPu2TPidUA8-1wA-1; Thu, 01 Apr 2021 17:01:55 -0400
X-MC-Unique: 7r8WrhOaPu2TPidUA8-1wA-1
Received: by mail-ot1-f69.google.com with SMTP id x68so3069792ota.2
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 14:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X91HzjMdIQRC4bFzuA9M8SwZIl0hk0KOPCfh8VRtOKw=;
 b=nMRJu9/u/O1TfxpLC8vnoy8uFTcjJYghoKuhuH1JDZnWZvCr2AlMmsB7avvDGgRLQZ
 n7GZyvctc/7ow6KLZe6dqso/QKERwTe+PbF3BhwoVoKz9XXupcmQ5Jfni40ZD+WNkfiD
 WdcOp0tgKF5QPgf04/20PCvD5yasQE9QLqKQ0jWddwza+tBYjHArMa9x/q9+mVOigP+X
 JtZ9LC/eVosfGypt99RfV4jXMFPuT2C+6wcPqTn6cYRcZogsChm3vbpmzrWQmBIFySED
 lS0tPkFllgBwrN4rTu9TNWY8NshP3wbt3uwoiR+5Jf7RCgD+eb0hd8bnEmwHbvlKfOnG
 SAiA==
X-Gm-Message-State: AOAM533xWly0xal35w2Vq88yE5gTRXlfgDo/kd7TcbV2R0Kf4BsqWAEw
 ZJdN21yqbPHgh/2fWYiQuyWhMO2QzD/q+gMWWCrvkeqjWZFnkuBWTr6I7p8JFd1JJhXgRW7TqyK
 852yMLLgipprpfpY=
X-Received: by 2002:a9d:4d8f:: with SMTP id u15mr8585324otk.296.1617310914230; 
 Thu, 01 Apr 2021 14:01:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOK+BZS1JYunOZ/K04nXecEAA50gg39Nh0Z81yTmYThiAuDyJ+zIJsck3paEYw8O4lLDD6jA==
X-Received: by 2002:a9d:4d8f:: with SMTP id u15mr8585308otk.296.1617310914017; 
 Thu, 01 Apr 2021 14:01:54 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id g2sm1377891otn.32.2021.04.01.14.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 14:01:53 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/2] block/rbd: Add an escape-aware strchr helper
Date: Thu,  1 Apr 2021 16:01:50 -0500
Message-Id: <20210401210150.2127670-3-ckuehl@redhat.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401210150.2127670-1-ckuehl@redhat.com>
References: <20210401210150.2127670-1-ckuehl@redhat.com>
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
Cc: kwolf@redhat.com, dillaman@redhat.com, qemu-devel@nongnu.org,
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
operations.

Reported-by: Han Han <hhan@redhat.com>
Fixes: https://bugzilla.redhat.com/1873913
Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
---
 block/rbd.c                | 20 ++++++++++++++++++--
 tests/qemu-iotests/231     |  4 ++++
 tests/qemu-iotests/231.out |  3 +++
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 9071a00e3f..c0e4d4a952 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -134,6 +134,22 @@ static char *qemu_rbd_next_tok(char *src, char delim, char **p)
     return src;
 }
 
+static char *qemu_rbd_strchr(char *src, char delim)
+{
+    char *p;
+
+    for (p = src; *p; ++p) {
+        if (*p == delim) {
+            return p;
+        }
+        if (*p == '\\') {
+            ++p;
+        }
+    }
+
+    return NULL;
+}
+
 static void qemu_rbd_unescape(char *src)
 {
     char *p;
@@ -171,7 +187,7 @@ static void qemu_rbd_parse_filename(const char *filename, QDict *options,
     qemu_rbd_unescape(found_str);
     qdict_put_str(options, "pool", found_str);
 
-    if (strchr(p, '@')) {
+    if (qemu_rbd_strchr(p, '@')) {
         image_name = qemu_rbd_next_tok(p, '@', &p);
 
         found_str = qemu_rbd_next_tok(p, ':', &p);
@@ -181,7 +197,7 @@ static void qemu_rbd_parse_filename(const char *filename, QDict *options,
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


