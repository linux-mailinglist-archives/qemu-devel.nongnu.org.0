Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56456700F54
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 21:36:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxYXc-0005vs-FM; Fri, 12 May 2023 15:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxYXa-0005vY-0d
 for qemu-devel@nongnu.org; Fri, 12 May 2023 15:34:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxYXY-0008GA-6e
 for qemu-devel@nongnu.org; Fri, 12 May 2023 15:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683920094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fT3VuZF8hBAQ6x41QtfxSmG1U7NeGMxQKiywOplPh3o=;
 b=OpMEnPRv2z40ML1f4qe6+8LaIWcj/3dzSI+JBKY2LgeyWZuvt7dEsf5HcOh2aV/cX8AtWi
 HrJofoBZP8Rx8I+ck3snajPAqVUag0GVZwYU9MHkoaZJKGPzNqEn+8Yo3yU3QYaZbvEKtq
 9gxa4V9JMI924RGTjVTG5GXAhGC2w28=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-MiwzyZ10NduvVovB6xWnEQ-1; Fri, 12 May 2023 15:34:53 -0400
X-MC-Unique: MiwzyZ10NduvVovB6xWnEQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D680E8533AE;
 Fri, 12 May 2023 19:34:52 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6949440C2076;
 Fri, 12 May 2023 19:34:52 +0000 (UTC)
Date: Fri, 12 May 2023 14:34:50 -0500
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com, armbru@redhat.com, richard.henderson@linaro.org
Subject: Re: [PATCH v2 17/19] cutils: Use parse_uint in qemu_strtosz for
 negative rejection
Message-ID: <7rcpd5t42niowmel4cxzs2xb7qxw42jmumr4e2r6y2tsmf3r5w@dhkruvghfjlx>
References: <20230512021033.1378730-1-eblake@redhat.com>
 <20230512021033.1378730-18-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512021033.1378730-18-eblake@redhat.com>
User-Agent: NeoMutt/20230512
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On Thu, May 11, 2023 at 09:10:31PM -0500, Eric Blake wrote:
> 
> Rather than open-coding two different ways to check for an unwanted
> negative sign, reuse the same code in both functions.  That way, if we
> decide down the road to accept "-0" instead of rejecting it, we have
> fewer places to change.  Also, it means we now get ERANGE instead of
> EINVAL for negative values in qemu_strtosz, which is reasonable for
> what it represents.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  tests/unit/test-cutils.c | 7 +++----
>  util/cutils.c            | 8 ++------
>  2 files changed, 5 insertions(+), 10 deletions(-)

Returning ERANGE instead of EINVAL changes the expected output for
iotests 49 and 178; this needs to be squashed in:

diff --git i/tests/qemu-iotests/049.out w/tests/qemu-iotests/049.out
index 8719c91b483..34e1b452e6e 100644
--- i/tests/qemu-iotests/049.out
+++ w/tests/qemu-iotests/049.out
@@ -92,13 +92,10 @@ Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off comp
 == 3. Invalid sizes ==

 qemu-img create -f qcow2 TEST_DIR/t.qcow2 -- -1024
-qemu-img: Invalid image size specified. You may use k, M, G, T, P or E suffixes for
-qemu-img: kilobytes, megabytes, gigabytes, terabytes, petabytes and exabytes.
+qemu-img: Invalid image size specified. Must be between 0 and 9223372036854775807.

 qemu-img create -f qcow2 -o size=-1024 TEST_DIR/t.qcow2
-qemu-img: TEST_DIR/t.qcow2: Parameter 'size' expects a non-negative number below 2^64
-Optional suffix k, M, G, T, P or E means kilo-, mega-, giga-, tera-, peta-
-and exabytes, respectively.
+qemu-img: TEST_DIR/t.qcow2: Value '-1024' is out of range for parameter 'size'

 qemu-img create -f qcow2 TEST_DIR/t.qcow2 -- -1k
 qemu-img: Invalid image size specified. You may use k, M, G, T, P or E suffixes for
diff --git i/tests/qemu-iotests/178.out.qcow2 w/tests/qemu-iotests/178.out.qcow2
index 0d51fe401ec..fe193fd5f4f 100644
--- i/tests/qemu-iotests/178.out.qcow2
+++ w/tests/qemu-iotests/178.out.qcow2
@@ -13,8 +13,7 @@ qemu-img: Invalid option list: ,
 qemu-img: Invalid parameter 'snapshot.foo'
 qemu-img: Failed in parsing snapshot param 'snapshot.foo=bar'
 qemu-img: --output must be used with human or json as argument.
-qemu-img: Invalid image size specified. You may use k, M, G, T, P or E suffixes for
-qemu-img: kilobytes, megabytes, gigabytes, terabytes, petabytes and exabytes.
+qemu-img: Invalid image size specified. Must be between 0 and 9223372036854775807.
 qemu-img: Unknown file format 'foo'

 == Size calculation for a new file (human) ==
diff --git i/tests/qemu-iotests/178.out.raw w/tests/qemu-iotests/178.out.raw
index 116241ddef2..445e460fad9 100644
--- i/tests/qemu-iotests/178.out.raw
+++ w/tests/qemu-iotests/178.out.raw
@@ -13,8 +13,7 @@ qemu-img: Invalid option list: ,
 qemu-img: Invalid parameter 'snapshot.foo'
 qemu-img: Failed in parsing snapshot param 'snapshot.foo=bar'
 qemu-img: --output must be used with human or json as argument.
-qemu-img: Invalid image size specified. You may use k, M, G, T, P or E suffixes for
-qemu-img: kilobytes, megabytes, gigabytes, terabytes, petabytes and exabytes.
+qemu-img: Invalid image size specified. Must be between 0 and 9223372036854775807.
 qemu-img: Unknown file format 'foo'

 == Size calculation for a new file (human) ==


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


