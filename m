Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA9C40966B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:54:53 +0200 (CEST)
Received: from localhost ([::1]:59868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPnMC-0007bW-Ok
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mPnKy-0006I1-MN
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mPnKx-0002Aa-4c
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631544814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TOY+vTr8EcCUL07tHti9orWr1grhDQkCiQg2LDaEsvo=;
 b=EcuK86J60HYpaFxeM01we/LaPMniJ8iWIctjqg2u6bsm/zW6Uy0RxgNKwDuissuuqQD+68
 Epls9KbZIg2FB6M9AdKoJK/99+9CvLmnXoyxriQ7heDBb4kwIWmrQuCtxsLdORIRBxdPjH
 X+iRr+AZ91pssQyEqXQsUccnYikjzpo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-gS_w76QMO52zAS02_snxfQ-1; Mon, 13 Sep 2021 10:53:23 -0400
X-MC-Unique: gS_w76QMO52zAS02_snxfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAE4218D6A2C
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 14:53:22 +0000 (UTC)
Received: from redhat.com (ovpn-113-222.phx2.redhat.com [10.3.113.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 727E55C25A;
 Mon, 13 Sep 2021 14:53:18 +0000 (UTC)
Date: Mon, 13 Sep 2021 09:53:16 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 10/22] qapi: Convert simple union TransactionAction to
 flat one
Message-ID: <20210913145316.y73zmxsxifhdkplr@redhat.com>
References: <20210913123932.3306639-1-armbru@redhat.com>
 <20210913123932.3306639-11-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210913123932.3306639-11-armbru@redhat.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, marcandre.lureau@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 02:39:20PM +0200, Markus Armbruster wrote:
> Simple unions predate flat unions.  Having both complicates the QAPI
> schema language and the QAPI generator.  We haven't been using simple
> unions in new code for a long time, because they are less flexible and
> somewhat awkward on the wire.
> 
> To prepare for their removal, convert simple union TransactionAction
> to an equivalent flat one.  Adds some boilerplate to the schema, which
> is a bit ugly, but a lot easier to maintain than the simple union
> feature.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/transaction.json | 111 +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 99 insertions(+), 12 deletions(-)

Same comments for each of 5-10 as for 4; the conversion is sane, and
the only question is on documentation, whether you want...

> 
> diff --git a/qapi/transaction.json b/qapi/transaction.json
> index 894258d9e2..d7fc73d7df 100644
> --- a/qapi/transaction.json
> +++ b/qapi/transaction.json
> @@ -38,6 +38,91 @@
>  { 'enum': 'ActionCompletionMode',
>    'data': [ 'individual', 'grouped' ] }
>  
> +##
> +# @TransactionActionKind:
> +#
> +# Since: 6.1

... 6.2 here, or to preserve the implicit...

>  ##
>  # @TransactionAction:
>  #
> @@ -60,19 +145,21 @@
>  # Since: 1.1

...1.1 matching when the simple union was first formed (actually, this
simple union has grown over time, which makes it trickier to decide
which historical Since: to use on each Wrapper, so I'd lean towards
6.2 on all of them as being less work).

For patches 5-10:
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


