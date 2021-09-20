Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF66A411C64
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:08:16 +0200 (CEST)
Received: from localhost ([::1]:53264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMm7-000123-Jn
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mSMWl-0001Pb-2I
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:52:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mSMWh-00024C-UC
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:52:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632156738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W9Yj9R456etmwLG9YtWsaFIue/2i5r0XIlFDdUXnDXU=;
 b=W6sLe7ceR3qAX3C/SA0jGuhRexuiYscF/mGV2xobjyZ1m1Lliwu9I0v355PrIz3XqWxGO8
 2LMEYei8p7+uT4pjVaRJNtkHffzERPaWijSO+/FB1ztrQG5bxIBYq6e1GEyyc+QINhGIqx
 TClb9xhpOLfvdTdxVR8rFAbByxVb6H0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-TE-Nnq2FPA6HNK4z_MIy5w-1; Mon, 20 Sep 2021 12:52:15 -0400
X-MC-Unique: TE-Nnq2FPA6HNK4z_MIy5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EE311800D41;
 Mon, 20 Sep 2021 16:52:14 +0000 (UTC)
Received: from redhat.com (ovpn-114-117.phx2.redhat.com [10.3.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBF0560C17;
 Mon, 20 Sep 2021 16:52:13 +0000 (UTC)
Date: Mon, 20 Sep 2021 11:52:12 -0500
From: Eric Blake <eblake@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Subject: Re: [PATCH] qemu-nbd: Change default cache mode to writeback
Message-ID: <20210920165212.la2z7pyizm4sv4t4@redhat.com>
References: <20210813205519.50518-1-nsoffer@redhat.com>
 <20210816155028.6rfmuxpdmc6yniit@redhat.com>
 <CAMRbyytKnLWFm7G5-bq5A-3nny63ESoxYYQt4sigYg2c4f9Ryg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRbyytKnLWFm7G5-bq5A-3nny63ESoxYYQt4sigYg2c4f9Ryg@mail.gmail.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block <qemu-block@nongnu.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Nir Soffer <nirsof@gmail.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 19, 2021 at 10:56:58PM +0300, Nir Soffer wrote:
> On Mon, Aug 16, 2021 at 6:50 PM Eric Blake <eblake@redhat.com> wrote:
> >
> > On Fri, Aug 13, 2021 at 11:55:19PM +0300, Nir Soffer wrote:
> > > Both qemu and qemu-img use writeback cache mode by default, which is
> > > already documented in qemu(1). qemu-nbd uses writethrough cache mode by
> > > default, and the default cache mode is not documented.
> > >
> > > According to the qemu-nbd(8):
> > >
> > >    --cache=CACHE
> > >           The  cache  mode  to be used with the file.  See the
> > >           documentation of the emulator's -drive cache=... option for
> > >           allowed values.
> > >
> > > qemu(1) says:
> > >
> > >     The default mode is cache=writeback.
> > >
> > > So users have no reason to assume that qemu-nbd is using writethough
> > > cache mode. The only hint is the painfully slow writing when using the
> > > defaults.
> >
> > Oh, good catch.  Unfortunately too late for 6.1 proper, but I'll add
> > qemu-stable in cc and queue this through my NBD tree for 6.2.
> 
> I don't see this in master, lost in your NBD tree?

It's on my tree:
https://repo.or.cz/qemu/ericb.git/shortlog/refs/heads/nbd

I just haven't bundled up enough patches for a pull request yet.  I'll
get one out this week, probably with a few more patches included.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


