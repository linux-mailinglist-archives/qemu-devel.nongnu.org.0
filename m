Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA31351657
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 17:53:34 +0200 (CEST)
Received: from localhost ([::1]:34092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRzdV-0005qd-DE
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 11:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lRzcJ-0004wP-Rh
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:52:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lRzcH-0007mT-7F
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617292336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8hJliMhByCo9Bbq9sOssJubAEcDpWWt97l41J858uQ0=;
 b=eMZ7IExOaVXvtYyF1SAOjL9K2vRVseDcY4Z8IPi/mNPa5j7J8w7Bs8co0ba3vB3NY+vcxD
 7Bufz+5+i9kfcIofucYs8Wg8ONnM6sdCaiku4t5JqMSEndsToSAzP+m1HRWl90FIH2uqA4
 j7w7jaalmofRt1f+xU8Swr9852BtgCM=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-BBX_q6RKPEGzo4ssYqLSFA-1; Thu, 01 Apr 2021 11:52:15 -0400
X-MC-Unique: BBX_q6RKPEGzo4ssYqLSFA-1
Received: by mail-ot1-f72.google.com with SMTP id 45so2712533otg.10
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 08:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8hJliMhByCo9Bbq9sOssJubAEcDpWWt97l41J858uQ0=;
 b=Y5kuOXfCYCipDlOTidjd9hBzybYnPM7zoUJRVVXSf5WhfSyEtO67XkypjdLDHxP1Ii
 vI+vqALdY/wq2FE+9Ra3iKg1n4T054r4DwMb3UNSgt7K2H2CUGGxeyCVqTSfOaveDbmK
 j5ku9O3RcVreDM/YeXAZtKYcIH1CLg1O9OUsLPrumZdk38eyTMcXuXHngZ2Y8IkWPQTD
 81hFMsUsACDut6TdBLk+4iP+6VKZ/obKU+kOSGewg5+oVh3NMKnB+teMzxBbt3yTH3fp
 hgTiLlTNHvjl1sxwtHk4XqU9S8n7KrIvwO190lTFpDOkpqJH1wPJO5xsf8MZ/fyMC5NN
 qAhg==
X-Gm-Message-State: AOAM5329Z9HQ8AsZ2lfMjHSLkJko6+bTSwaApJPiXnH7mlneT/PtgZRw
 Qb/+YOPhJaFCZW3/h/ZjknXjHQ7AYtlUXx3CppBm2tA9o4r3q2RAU7aqckwpmqayIWgbGTdJ3fK
 QiZ8v0t9XOSruTVM=
X-Received: by 2002:a9d:8d5:: with SMTP id 79mr7515915otf.345.1617292334317;
 Thu, 01 Apr 2021 08:52:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIy1/8yHRqPnvrVf/iRfQ83oEQDRDpUnrUpV2ZddSdkMBcf/NjrYf86MuDw7vWg8VCF2nxFg==
X-Received: by 2002:a9d:8d5:: with SMTP id 79mr7515907otf.345.1617292334134;
 Thu, 01 Apr 2021 08:52:14 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id d21sm1093357oic.54.2021.04.01.08.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:52:13 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] block/rbd: Don't unescape in qemu_rbd_next_tok()
Date: Thu,  1 Apr 2021 10:52:11 -0500
Message-Id: <20210401155211.2093139-3-ckuehl@redhat.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401155211.2093139-1-ckuehl@redhat.com>
References: <20210401155211.2093139-1-ckuehl@redhat.com>
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
Cc: kwolf@redhat.com, dillaman@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That's qemu_rbd_unescape()'s job! No need to duplicate the labor.

Furthermore, this was causing some confusion in the parsing logic to
where the caller might test for the presence of a character to split on
like so:

if (strchr(image_name, '/')) {
        found_str = qemu_rbd_next_tok(image_name, '/', &image_name);
	[..]

When qemu_rbd_next_tok() performs unescaping as a side effect, the
parser can get confused thinking that it can split this string, but
really the delimiter '/' gets unescaped and so qemu_rbd_next_tok() never
"finds" the delimiter and consumes the rest of the token input stream.

This is problematic because qemu_rbd_next_tok() also steals the input
pointer to the token stream and sets it to NULL. This causes a segfault
where the parser expects to split one string into two.

In this case, the parser is determining if a string is a
namespace/image_name pair like so:

	"foo/bar"

And clearly it's looking to split it like so:

	namespace:  foo
	image_name: bar

but if the input is "foo\/bar", it *should* split into

	namespace:  foo\
	image_name: bar

and its subordinate parts can be unescaped after tokenization.

So, instead of tokenizing *and* escaping all at once, do one before the
other to avoid stumbling into a segfault by confusing the parsing logic.

Reported-by: Han Han <hhan@redhat.com>
Fixes: https://bugzilla.redhat.com/1873913
Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
---
 block/rbd.c                | 3 ---
 tests/qemu-iotests/231     | 4 ++++
 tests/qemu-iotests/231.out | 3 +++
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 9071a00e3f..9bed0863e5 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -123,9 +123,6 @@ static char *qemu_rbd_next_tok(char *src, char delim, char **p)
         if (*end == delim) {
             break;
         }
-        if (*end == '\\' && end[1] != '\0') {
-            end++;
-        }
     }
     if (*end == delim) {
         *p = end + 1;
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


