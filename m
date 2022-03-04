Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECBB4CDB24
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:42:17 +0100 (CET)
Received: from localhost ([::1]:47980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBwW-0006oe-GQ
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:42:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nQB7M-0007mP-Kh
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:49:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nQB7L-0000HA-4f
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:49:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bs4VsyO5PsT+7VQNBipLuHMRyMeSUQ6on4TQDwPuwh8=;
 b=a6cQaugnFit6THvODBs+CmWrWk2yJLEE9ssoX0QqCYh84m9gfMOEcqLNZKYs92Ft5RtkFV
 qqYKJpNgS90KTuiR23IAS1/29X3T+L0oEWsIQiZyynclAGDq0Pw3VHzJ7W2INLps6Xfxp2
 ETC/lAh1XyyuiNVFC8Teq1j2EYPuYNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-PLEZAj6sNbmFhrEsfR2QRQ-1; Fri, 04 Mar 2022 11:49:19 -0500
X-MC-Unique: PLEZAj6sNbmFhrEsfR2QRQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5CAE180FD71;
 Fri,  4 Mar 2022 16:49:18 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E35A7C03D;
 Fri,  4 Mar 2022 16:49:02 +0000 (UTC)
Date: Fri, 4 Mar 2022 10:49:01 -0600
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 10/12] tests/qemu-iotests: validate NBD TLS with hostname
 mismatch
Message-ID: <20220304164901.y6fi7tedawukei7f@redhat.com>
References: <20220303160330.2979753-1-berrange@redhat.com>
 <20220303160330.2979753-11-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303160330.2979753-11-berrange@redhat.com>
User-Agent: NeoMutt/20211029-378-f757a4
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 03, 2022 at 04:03:28PM +0000, Daniel P. Berrangé wrote:
> This validates that connections to an NBD server where the certificate
> hostname does not match will fail. It further validates that using the
> new 'tls-hostname' override option can solve the failure.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/qemu-iotests/233        | 18 ++++++++++++++++++
>  tests/qemu-iotests/233.out    | 15 +++++++++++++++
>  tests/qemu-iotests/common.tls |  7 ++++---
>  3 files changed, 37 insertions(+), 3 deletions(-)

> 
> diff --git a/tests/qemu-iotests/233 b/tests/qemu-iotests/233
> index 050267298d..09cfb7039b 100755
> --- a/tests/qemu-iotests/233
> +++ b/tests/qemu-iotests/233
> @@ -106,6 +106,24 @@ $QEMU_IMG info --image-opts --object $obj2 \
>  $QEMU_NBD_PROG -L -b $nbd_tcp_addr -p $nbd_tcp_port --object $obj1 \
>      --tls-creds=tls0 2>&1 | _filter_qemu_nbd_exports
>  
> +echo
> +echo "== check TLS fail over TCP with mismatch hostname =="

Maybe s/mismatch/mismatched/, with corresponding .out tweaks.

> +obj1=tls-creds-x509,dir=${tls_dir}/client1,endpoint=client,id=tls0
> +$QEMU_IMG info --image-opts --object $obj1 \
> +    driver=nbd,host=localhost,port=$nbd_tcp_port,tls-creds=tls0 \
> +    2>&1 | _filter_nbd
> +$QEMU_NBD_PROG -L -b localhost -p $nbd_tcp_port --object $obj1 \
> +    --tls-creds=tls0 | _filter_qemu_nbd_exports
> +
> +echo
> +echo "== check TLS works over TCP with mismatch hostname and override =="
> +obj1=tls-creds-x509,dir=${tls_dir}/client1,endpoint=client,id=tls0
> +$QEMU_IMG info --image-opts --object $obj1 \
> +    driver=nbd,host=localhost,port=$nbd_tcp_port,tls-creds=tls0,tls-hostname=127.0.0.1 \

And hence your need to filter both 127.0.0.1 and localhost.  Cute way
to force hostname mismatch without needing two hosts.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


