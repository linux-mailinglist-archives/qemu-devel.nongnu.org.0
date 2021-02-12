Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C099C31A0D3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 15:43:41 +0100 (CET)
Received: from localhost ([::1]:35078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAZfY-0004vx-Sw
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 09:43:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lAZeB-0003vN-Su
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:42:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lAZe9-0002gb-J7
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:42:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613140932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F1dIcyHHcbhUqQIAw2lWAiyQsRU+nILJef909+ksHpw=;
 b=NWr0K1oXcYKAetiMM5yM87k9KF0A5RjR9FuARvvuC+q9qLI6EaDPx9/nK2RfFxH1mKDKjP
 T/A7GAsekx4EuqZqLUXrT+sFquiQxArc2BbeF4f68x97T66nv50QESwY8R6j0ly4Bl6IpE
 LyILO4RdsA8asbt91UsuVwveYfDjROs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-SUo4Wn0oOrimOy3BcsU9Qg-1; Fri, 12 Feb 2021 09:42:09 -0500
X-MC-Unique: SUo4Wn0oOrimOy3BcsU9Qg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 907E71E562;
 Fri, 12 Feb 2021 14:42:07 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A942210016FE;
 Fri, 12 Feb 2021 14:42:02 +0000 (UTC)
Date: Fri, 12 Feb 2021 15:41:59 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH v2 0/4] Allow changing bs->file on reopen
Message-ID: <20210212144159.GP54538@angien.pipo.sk>
References: <cover.1612809837.git.berto@igalia.com>
 <20210210172657.GJ5144@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210210172657.GJ5144@merkur.fritz.box>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 18:26:57 +0100, Kevin Wolf wrote:
> Am 08.02.2021 um 19:44 hat Alberto Garcia geschrieben:
> > Hi,
> > 
> > this series allows changing bs->file using x-blockdev-reopen. Read
> > here for more details:
> > 
> >    https://lists.gnu.org/archive/html/qemu-block/2021-01/msg00437.html
> > 
> > Version 2 of the series introduces a very significant change:
> > x-blockdev-reopen now receives a list of BlockdevOptions instead of
> > just one, so it is possible to reopen multiple block devices using a
> > single transaction.
> 
> Adding Peter to Cc for this one.

For now I've only used blockdev-reopen for turning backing files
read-write and back for bitmap manipulation. In such case I presume it
doesn't really make sense to use the batching if I ever need to reopen
multiple images.

Other than that, the blockdev-reopen code is still dormant in libvirt so
it's easy to add the extra required wrapping without any problem.


