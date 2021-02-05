Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37B3310D4C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:43:23 +0100 (CET)
Received: from localhost ([::1]:50702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83GU-0004D0-Ft
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l83Ep-0002tQ-Cn
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:41:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l83En-0001mw-9L
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612539694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C5RprKsO9hY88hkcf1RIXanOOaTMGRkd4Q3aAUZrSHk=;
 b=GWBXxJkZjQ2gM3g07atFOo9KgNYATPJPPenKlWsoO7laGNJUV0Fsk3U4l4zTyjgjG3RmFq
 pkSa3jxCJyhlbOHiIk9TFYMoirCz23JkpAfsIQLQtXJXqZHEF1wWVwL0szXczcSMCzdFnc
 tBKwevRMqZGOuMSeIOgZo8jPrA9xdjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-2WKJrvbVMRqFxvb4dvF6Xg-1; Fri, 05 Feb 2021 10:41:29 -0500
X-MC-Unique: 2WKJrvbVMRqFxvb4dvF6Xg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D9E7107ACE4;
 Fri,  5 Feb 2021 15:41:28 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23FBC60BF1;
 Fri,  5 Feb 2021 15:41:26 +0000 (UTC)
Date: Fri, 5 Feb 2021 16:41:25 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [RFC PATCH 0/2] Allow changing bs->file on reopen
Message-ID: <20210205154125.GD7072@merkur.fritz.box>
References: <cover.1610715661.git.berto@igalia.com>
 <dafbbcb3-9d87-ab04-5413-eac551cdfe44@virtuozzo.com>
 <20210121105217.GA5466@merkur.fritz.box>
 <w51ft2abs1n.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
In-Reply-To: <w51ft2abs1n.fsf@maestria.local.igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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
Cc: Kashyap Chamarthy <kchamart@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.02.2021 um 13:47 hat Alberto Garcia geschrieben:
> On Thu 21 Jan 2021 11:52:17 AM CET, Kevin Wolf wrote:
> >> Hmm, still, removing a filter which want to unshare WRITE even when
> >> doesn't have any parents will be a problem anyway, so we'll need a
> >> new command to drop filter with a logic like in bdrv_drop_filter in
> >> my series.
> >> 
> >> Or, we can introduce multiple reopen.. So that x-blockdev-reopen will
> >> take a list of BlockdevOptions, and do all modifications in one
> >> transaction. Than we'll be able to drop filter by transactional
> >> update of top node child and removing filter child link.
> >
> > Internally, we already have reopen queues anyway, so it would make
> > sense to me to expose them externally and take a list of
> > BlockdevOptions.  This way we should be able to do even complex
> > changes of the graph where adding some edges requires the removal of
> > other edges in a single atomic operation.
> 
> So you mean changing the signature to something like this?
> 
> { 'command': 'x-blockdev-reopen',
>   'data': { 'options': ['BlockdevOptions'] } }
> 
> It should be easy to make that change, I can have a look.

Yes, this is what I had in mind.

Kevin


