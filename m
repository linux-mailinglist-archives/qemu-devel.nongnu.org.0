Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847024CDD5E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:38:42 +0100 (CET)
Received: from localhost ([::1]:46516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDlB-0002Jt-KN
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:38:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDft-00007J-LT
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:33:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDfo-0003gI-Fw
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646422387;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VlIfPTOfWeKa73lc6PcX09qkT0A5aqtl/GeeofyQUhc=;
 b=Ir40P60Cgv7OCFPHKRktAoT7ci/oyQxWLSe1eX7Um6bQa+Nd0sJMOf0VQ10DBb/oAMfwrv
 wcwtTSsUvnkIJfqI+0iVFiiw+czqwZp6yS4PogzNA11FmsRWX4a1jundk2uMNWRIP69yiT
 M5JJZdj7skYW53CUvD3mf3iaq9M8p64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-16g7Xr7vNKSuUq0Li7D89w-1; Fri, 04 Mar 2022 14:33:04 -0500
X-MC-Unique: 16g7Xr7vNKSuUq0Li7D89w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 713371006AA6;
 Fri,  4 Mar 2022 19:33:02 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B20C71B42C;
 Fri,  4 Mar 2022 19:32:54 +0000 (UTC)
Date: Fri, 4 Mar 2022 19:32:51 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 08/12] tests/qemu-iotests: introduce filter for qemu-nbd
 export list
Message-ID: <YiJpY6ZGPBo/BS19@redhat.com>
References: <20220303160330.2979753-1-berrange@redhat.com>
 <20220303160330.2979753-9-berrange@redhat.com>
 <20220304164345.6432hewpxo5ncwia@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304164345.6432hewpxo5ncwia@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 10:43:45AM -0600, Eric Blake wrote:
> On Thu, Mar 03, 2022 at 04:03:26PM +0000, Daniel P. Berrangé wrote:
> > Introduce a filter for the output of qemu-nbd export list so it can be
> > reused in multiple tests.
> > 
> > The filter is a bit more permissive that what test 241 currently uses,
> > as its allows printing of the export count, along with any possible
> > error messages that might be emitted.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  tests/qemu-iotests/241           | 6 +++---
> >  tests/qemu-iotests/241.out       | 3 +++
> >  tests/qemu-iotests/common.filter | 5 +++++
> >  3 files changed, 11 insertions(+), 3 deletions(-)
> >
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>

I'm going to post a v2 with a slight tweak to expose one more
interesting piece of (stable) info in the output:

diff --git a/tests/qemu-iotests/241.out b/tests/qemu-iotests/241.out
index db2d71ab9d..88e8cfcd7e 100644
--- a/tests/qemu-iotests/241.out
+++ b/tests/qemu-iotests/241.out
@@ -3,6 +3,7 @@ QA output created by 241
 === Exporting unaligned raw image, natural alignment ===
 
 exports available: 1
+ export: ''
   size:  1024
   min block: 1
 [{ "start": 0, "length": 1000, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
@@ -12,6 +13,7 @@ exports available: 1
 === Exporting unaligned raw image, forced server sector alignment ===
 
 exports available: 1
+ export: ''
   size:  1024
   min block: 512
 [{ "start": 0, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET}]
@@ -23,6 +25,7 @@ WARNING: Image format was not specified for 'TEST_DIR/t.raw' and probing guessed
 === Exporting unaligned raw image, forced client sector alignment ===
 
 exports available: 1
+ export: ''
   size:  1024
   min block: 1
 [{ "start": 0, "length": 1000, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index 940c9884bd..14b6f80dcb 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -310,7 +310,7 @@ _filter_nbd()
 
 _filter_qemu_nbd_exports()
 {
-    grep '\(exports available\|size\|min block\|qemu-nbd\):'
+    grep '\(exports available\|export\|size\|min block\|qemu-nbd\):'
 }
 
 _filter_qmp_empty_return()


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


