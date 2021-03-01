Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D5B327CBE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:01:44 +0100 (CET)
Received: from localhost ([::1]:48446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGgJ4-0001wb-Vm
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:01:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lGgHC-0001Mh-SF
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:59:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lGgHA-0008GU-Gg
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614596383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MspK6WNJaK9OOL/UPSk0Kc1r/Z6FEftRRi5UZbFYuhk=;
 b=eGDhN3lllKa8VcoXXkBgWk14nJLf8PrnX+5lE8QGc96PGsmAEj2ITDZqkw68E9CsV0D14c
 cu93xHCMHv8CscFVnl1yHnEt1L5R58MyLAj4lnOvczEe/VRnolrATusKKrrSwg36WvWSoY
 SNe6pyI/rtH/C45w2LCYjuGZrEIV4C0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-paKJqJ2pPvyHrWB4sclrug-1; Mon, 01 Mar 2021 05:59:39 -0500
X-MC-Unique: paKJqJ2pPvyHrWB4sclrug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D60D835E20;
 Mon,  1 Mar 2021 10:59:37 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-165.ams2.redhat.com [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 090295C661;
 Mon,  1 Mar 2021 10:59:35 +0000 (UTC)
Date: Mon, 1 Mar 2021 11:59:34 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: block/throttle and burst bucket
Message-ID: <20210301105934.GB7698@merkur.fritz.box>
References: <efe8ee1c-e12f-b739-b9dd-9bd6d80527cb@kamp.de>
 <w51blc7ji0b.fsf@maestria.local.igalia.com>
 <3b68544d-66bc-1790-26f9-6e50683119cc@kamp.de>
MIME-Version: 1.0
In-Reply-To: <3b68544d-66bc-1790-26f9-6e50683119cc@kamp.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Alberto Garcia <berto@igalia.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 qemu block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.02.2021 um 13:33 hat Peter Lieven geschrieben:
> Am 26.02.21 um 10:27 schrieb Alberto Garcia:
> > On Thu 25 Feb 2021 06:34:48 PM CET, Peter Lieven <pl@kamp.de> wrote:
> >> I was wondering if there is a way to check from outside (qmp etc.) if
> >> a throttled block device has exceeded the iops_max_length seconds of
> >> time bursting up to iops_max and is now hard limited to the iops limit
> >> that is supplied?
> >>
> >> Would it be also a good idea to exetend the accounting to account for
> >> requests that must have waited before being sent out to the backend
> >> device?
> > No, there's no such interface as far as I'm aware. I think one problem
> > is that throttling is now done using a filter, that can be inserted
> > anywhere in the node graph, and accounting is done at the BlockBackend
> > level.
> >
> > We don't even have a query-block-throttle function. I actually started
> > to write one six years ago but it was never finished.
> 
> 
> A quick idea that came to my mind was to add an option to emit a QMP
> event if the burst_bucket is exhausted and hard limits are enforced.

Do you actually need to do something every time that it's exceeded, so
QEMU needs to be the active part sending out an event, or is it
something that you need to check in specific places and could reasonably
query on demand?

For the latter, my idea would have been adding a new read-only QOM
property to the throttle group object that exposes how much is still
left. When it becomes 0, the hard limits are enforced.

> There seems to be something wrong in the throttling code anyway.
> Throttling causes addtional i/o latency always even if the actual iops
> rate is far away from the limits and ever more far away from the burst
> limits. I will dig into this.
> 
> My wishlist:
> 
>  - have a possibility to query the throttling state.
>  - have counters for no of delayed ops and for how long they were delayed.
>  - have counters for untrottled <= 4k request performance for a backend storage device.
> 
> The later two seem not trivial as you mentioned.

Do you need the information per throttle node or per throttle group? For
the latter, the same QOM property approach would work.

Kevin


