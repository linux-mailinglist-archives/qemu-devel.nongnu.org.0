Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7312B718E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 23:27:16 +0100 (CET)
Received: from localhost ([::1]:50862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf9RT-0004ea-Bv
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 17:27:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kf9PL-00043Q-HI
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 17:25:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kf9PI-0004lM-7B
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 17:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605651897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fSjcJaIC9B9swatxqfXsaTwMbjxQfOFDgtmVTvxiDXI=;
 b=Lkb1NOwdKd9TxW/AcuRNAEAHXTTyWjdeEScs379neAIOQHBqbaOe1qEVWY/1bVoZcubz3O
 7lMAYMAMZ1GTMDEzoqkcD88ikD/or4eSZQyYXU7AQYNAdUELINgpM3Ar+lfZTZ04PAPgHH
 aua4Y6wTivT2n3JkHOq2e8tMvVabo1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255--9Sh1Yx9Mx-LmqE9ZvDBIA-1; Tue, 17 Nov 2020 17:24:55 -0500
X-MC-Unique: -9Sh1Yx9Mx-LmqE9ZvDBIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B3461891E84;
 Tue, 17 Nov 2020 22:24:54 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-186.rdu2.redhat.com [10.10.116.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 093E45C1A3;
 Tue, 17 Nov 2020 22:24:51 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 6B6C4220BCF; Tue, 17 Nov 2020 17:24:50 -0500 (EST)
Date: Tue, 17 Nov 2020 17:24:50 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: "Venegas Munoz, Jose Carlos" <jose.carlos.venegas.munoz@intel.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Use --thread-pool-size=0 to mean
 no thread pool
Message-ID: <20201117222450.GC91497@redhat.com>
References: <20201105194416.GA1384085@redhat.com>
 <20201105195253.GB1384085@redhat.com>
 <D9233684-9B76-468E-A5F1-B35DA3F3C091@intel.com>
 <20201106223524.GG1436035@redhat.com>
 <CAOssrKcJr9a_5EUTU19BTp1UaST64Shh9w0UeR6TXPLqkN7bBw@mail.gmail.com>
 <C5CAD300-DB1D-4C6A-A2D3-2E6BA9F901DF@intel.com>
MIME-Version: 1.0
In-Reply-To: <C5CAD300-DB1D-4C6A-A2D3-2E6BA9F901DF@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, Miklos Szeredi <mszeredi@redhat.com>,
 "Shinde, Archana M" <archana.m.shinde@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Miklos Szeredi <miklos@szeredi.hu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 17, 2020 at 04:00:09PM +0000, Venegas Munoz, Jose Carlos wrote:
> >   Not sure what the default is for 9p, but comparing
> >   default to default will definitely not be apples to apples since this
> >   mode is nonexistent in 9p.
> 
> In Kata we are looking for the best config for fs compatibility and performance. So even if are no apples to apples,
> we are for the best config for both and comparing the best that each of them can do.

Can we run tests in more than one configuration. Right now you are using
cache=mmap for virtio-9p and cache=auto for virtiofs and as Miklos
said this is not apples to apples comparison.

So you can continue to run above but also run additional tests if
time permits.

virtio-9p	virtio-fs

cache=mmap	cache=none + DAX
cache=none	cache=none
cache=loose	cache=always

Given you are using cache=mmap for virtio-9p, "cache=none + DAX" is
somewhat equivalent of that. Provides strong coherency as well as
allow for mmap() to work.

Now kernel virtiofs DAX support got merged in 5.10-rc1. For qemu,
you can use virtio-fs-dev branch.

https://gitlab.com/virtio-fs/qemu/-/commits/virtio-fs-dev

Thanks
Vivek


