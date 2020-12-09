Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E4A2D4BC9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:29:13 +0100 (CET)
Received: from localhost ([::1]:45412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn65I-00053m-2f
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kn62V-0003YX-4V
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:26:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kn62S-0003Ak-Ph
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:26:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607545575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OKtM5gEM9yLX8atEdQGh/xnvFIVmSf+WRG6zW6kpobM=;
 b=Se8IPFEozYmufCa79GYC0cibpMScaKoYGErE+Y053ovtG9S/3MVIqs4ELVt/hu+K1RbeBh
 s074mNaYKWEiBJBa8jCI42vnJ3p5hdG6UFaaEJuARGO60PzjCllQGz9Sh9h8BTHzVf32Ug
 zm4169/RXBIb1XQQxhGZcAy7qDZAE84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-JQNTpnVBN0GW5na-Oshlsg-1; Wed, 09 Dec 2020 15:26:11 -0500
X-MC-Unique: JQNTpnVBN0GW5na-Oshlsg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 476B71005513;
 Wed,  9 Dec 2020 20:26:10 +0000 (UTC)
Received: from starship (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 487755D6BA;
 Wed,  9 Dec 2020 20:26:07 +0000 (UTC)
Message-ID: <db2d85c6191540de19ca32bbcca23b400c19d42d.camel@redhat.com>
Subject: Re: [PATCH v4 2/4] block: add bdrv_co_delete_file_noerr
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
Date: Wed, 09 Dec 2020 22:26:06 +0200
In-Reply-To: <w51pn3inasm.fsf@maestria.local.igalia.com>
References: <20201209164441.867945-1-mlevitsk@redhat.com>
 <20201209164441.867945-3-mlevitsk@redhat.com>
 <w51pn3inasm.fsf@maestria.local.igalia.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2020-12-09 at 18:34 +0100, Alberto Garcia wrote:
> On Wed 09 Dec 2020 05:44:39 PM CET, Maxim Levitsky wrote:
> > +void coroutine_fn bdrv_co_delete_file_noerr(BlockDriverState *bs)
> > +{
> > +    Error *local_err = NULL;
> > +
> > +    if (!bs) {
> > +        return;
> > +    }
> > +
> > +    int ret = bdrv_co_delete_file(bs, &local_err);
>        ^^^
> 
> According to the QEMU coding style we should not have declarations in
> the middle of a block.

Oops!

I will send next version now.

Thanks a lot for the review!

Best regards,
	Maxim Levitsky

> 
> The patch looks otherwise fine.
> 
> Reviewed-by: Alberto Garcia <berto@igalia.com>
> 
> Berto
> 



