Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB4C4D04DF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 18:05:16 +0100 (CET)
Received: from localhost ([::1]:54622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGnK-0001CU-US
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 12:05:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRGi7-0002wP-LB
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:59:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRGi4-0001Gt-8i
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:59:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646672386;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8L3wHUF08irlamUl12ju3JRjGGWeuwZS2jxaylXGfn0=;
 b=J+iMRfKH4kkpYFt3bbdlEv4pdxsERTCjuScZhiQGuLKUnusbjOvBUc+gP8YTRXUbbCZt8h
 7hqYWxVLx0T1vO55wEyfEh2X+vPKC9L3kOkVAWRWTf0Xkl7Af4jIAJTvILOzLK8pXXzDEY
 bNoohFAvv/F8uKyY1+yLrUMettMxYwY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-lF5OnfoMO82aTDCVNdNP-Q-1; Mon, 07 Mar 2022 11:59:39 -0500
X-MC-Unique: lF5OnfoMO82aTDCVNdNP-Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38E4D801AFE;
 Mon,  7 Mar 2022 16:59:38 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A18B286C43;
 Mon,  7 Mar 2022 16:59:32 +0000 (UTC)
Date: Mon, 7 Mar 2022 16:59:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 12/12] tests/qemu-iotests: validate NBD TLS with UNIX
 sockets and PSK
Message-ID: <YiY570YuwO9vwjDZ@redhat.com>
References: <20220304193610.3293146-1-berrange@redhat.com>
 <20220304193610.3293146-13-berrange@redhat.com>
 <20220304212704.flvwwgzwhkmkk4cp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304212704.flvwwgzwhkmkk4cp@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 03:27:04PM -0600, Eric Blake wrote:
> On Fri, Mar 04, 2022 at 07:36:10PM +0000, Daniel P. Berrangé wrote:
> > This validates that connections to an NBD server running on a UNIX
> > socket can use TLS with pre-shared keys (PSK).
> > 
> > Reviewed-by: Eric Blake <eblake@redhat.com>
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  tests/qemu-iotests/233        | 28 ++++++++++++++++++++++++++++
> >  tests/qemu-iotests/233.out    | 17 +++++++++++++++++
> >  tests/qemu-iotests/common.tls | 24 ++++++++++++++++++++++++
> >  3 files changed, 69 insertions(+)
> 
> Same as in 11, and just as in there,
> 
> Tested-by: Eric Blake <eblake@redhat.com>
> 
> Thanks; I'll be queueing this series through my NBD tree.

Great, thank you for the speedy reviews


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


