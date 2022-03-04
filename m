Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E475D4CCBF6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 03:47:53 +0100 (CET)
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPxyz-0007NN-1J
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 21:47:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPxxv-0006RX-Hv
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 21:46:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPxxt-0005qF-Rr
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 21:46:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646362005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RNguPHJ6e4d4Ej4IouYiL3LZAYkkylIukm8raQoJREc=;
 b=EbdvP9aZkZdqoTX9vuc2Yn+PQdX/Kt9SrAcC8dHC5XTnxGbMMR8xdnzSDo1vPhcP6koFmU
 Npv40rgNfRx7pBkdhvXXYoRE4OIQ20xZO+mH6WghWUSWk737HfwpSlVBLNWAmbxPrQk8DU
 GeTDvj/nf8Qp4c0i3p87OjG5pKK5ADc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-mUkcTK3fP1u_vZj03xOCcA-1; Thu, 03 Mar 2022 21:46:44 -0500
X-MC-Unique: mUkcTK3fP1u_vZj03xOCcA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBA9D8145F7;
 Fri,  4 Mar 2022 02:46:42 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C50F8305B1;
 Fri,  4 Mar 2022 02:46:41 +0000 (UTC)
Date: Thu, 3 Mar 2022 20:46:39 -0600
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 4/5] iotests: make qemu_img raise on non-zero rc by default
Message-ID: <20220304024639.q6x5y7d6zb5bv6pz@redhat.com>
References: <20220303205902.4106779-1-jsnow@redhat.com>
 <20220303205902.4106779-5-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303205902.4106779-5-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-378-f757a4
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 03, 2022 at 03:59:01PM -0500, John Snow wrote:
> re-write qemu_img() as a function that will by default raise a
> VerboseProcessException (extended from CalledProcessException) on
> non-zero return codes. This will produce a stack trace that will show
> the command line arguments and return code from the failed process run.
> 
> Users that want something more flexible (there appears to be only one)
> can use check=False and manage the return themselves. However, when the
> return code is negative, the Exception will be raised no matter what.
> This is done under the belief that there's no legitimate reason, even in
> negative tests, to see a crash from qemu-img.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/257        |  8 ++++--
>  tests/qemu-iotests/iotests.py | 54 +++++++++++++++++++++++++++++++----
>  2 files changed, 53 insertions(+), 9 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


