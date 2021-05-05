Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C088F373869
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:12:17 +0200 (CEST)
Received: from localhost ([::1]:49990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEVs-0000fa-Ka
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leEU9-0007zc-57
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:10:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leEU5-0008MP-TP
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620209424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oSf4yioq3zFRpsYhyU3m/JCGdXOZqnA3E1JieKihQWw=;
 b=AzD5dNMkENoeXHf4Kr7bvxdRs8QfZP1mz6UkWl5IyU8Xv9+Nb7CvfBO0k8da+w3l7MLc4M
 kpPLWIymDC6WhHKiqPH5fYTp1jWFPYak+J6lwriUXZTuywK6N6ZwMjUWY8ZrXQQIgIfkop
 LJRglej3nkobxbbyF4UDVzIi+eGHoGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-U37IasDpOrqW56TbMz-nMg-1; Wed, 05 May 2021 06:10:22 -0400
X-MC-Unique: U37IasDpOrqW56TbMz-nMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4E8C1800D41;
 Wed,  5 May 2021 10:10:21 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 916255D6D1;
 Wed,  5 May 2021 10:10:20 +0000 (UTC)
Date: Wed, 5 May 2021 11:10:19 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] block: simplify write-threshold and drop write notifiers
Message-ID: <YJJvC3OsOj9Z3+4G@stefanha-x1.localdomain>
References: <20210421220950.105017-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210421220950.105017-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RqR3UCEfjpt1sdRo"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 eesposit@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--RqR3UCEfjpt1sdRo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 22, 2021 at 01:09:50AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> @@ -1981,8 +1985,15 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, int64_t bytes,
>          } else {
>              assert(child->perm & BLK_PERM_WRITE);
>          }
> -        return notifier_with_return_list_notify(&bs->before_write_notifiers,
> -                                                req);
> +        write_threshold = qatomic_read(&bs->write_threshold_offset);
> +        if (write_threshold > 0 && offset + bytes > write_threshold) {
> +            qapi_event_send_block_write_threshold(
> +                bs->node_name,
> +                offset + bytes - write_threshold,
> +                write_threshold);
> +            qatomic_set(&bs->write_threshold_offset, 0);

It's safer to reset the threshold before emitting the event. That way
there is no race with the QMP client setting a new threshold via
bdrv_write_threshold_is_set(). I guess the race is possible since
qatomic is used and there is no lock.

I like the idea of dropping write notifiers:
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--RqR3UCEfjpt1sdRo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCSbwsACgkQnKSrs4Gr
c8hV0wf/SBPqlOh0bTpFGr3h+z/EnHXqdeVgwcApos1wBTPsMHh52v+K4hNVnKjO
1ETTQ+IiMSMqmEmwjLRxpRXnojeUg+GGmIf+JPYqmX2UeOmjmrEsjLdMWh2kAsf0
R97zkQ9zAAeGRlNoQgIUHyBXWqWNpCbxqYgyGiBnQKBFPQXRgSKcSu+DYaoS/F64
cV8eTsj9ssz8RCz0fepvGfVUNdXX2qTWuCBuPlaoWEDfu35M85AT0aQVoub/pD83
knylIXhbmmgDAQhqcRdY2Q6OvonmRkCtpXKYCI5qsgTkqTROwmxtSsNKHkYw9jL/
4ENL88WYm5IrxhTuSDYWeGx03Q/Y9w==
=TzLW
-----END PGP SIGNATURE-----

--RqR3UCEfjpt1sdRo--


