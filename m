Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B69E3753C5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 14:24:53 +0200 (CEST)
Received: from localhost ([::1]:36240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1led3k-0004Wb-9O
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 08:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1led19-00033e-UA
 for qemu-devel@nongnu.org; Thu, 06 May 2021 08:22:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1led11-0003Q9-Km
 for qemu-devel@nongnu.org; Thu, 06 May 2021 08:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620303722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9F1exrN29xAFoOeCbd7QdH66iX3PjXKysHKZToFzdWg=;
 b=hODSNsfJVu6apBKa1M0L9unh+esq5iGXZW8RXzrG4etf9nMatE2wVtbx2hhzvaYUYFSi7j
 kfinMQ9Htf5pEdtt9w2Bbb2ymnRmuenFXqHqqH2x2ceV17SxaGrUqeZFyZT37IDworVkar
 6v/P+LvY3SX0DbCrvmmytfQPz+tq3d0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-KijRPbEyO8KeTClEhBqHEw-1; Thu, 06 May 2021 08:22:00 -0400
X-MC-Unique: KijRPbEyO8KeTClEhBqHEw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75276801817
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 12:21:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DFE510016F8;
 Thu,  6 May 2021 12:21:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D880E18003A4; Thu,  6 May 2021 14:21:50 +0200 (CEST)
Date: Thu, 6 May 2021 14:21:50 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH] virtio-gpu: handle partial maps properly
Message-ID: <20210506122150.42bd6phtpezr5ec2@sirius.home.kraxel.org>
References: <20210506091001.1301250-1-kraxel@redhat.com>
 <3dc52bb8-0a38-660b-7b2d-f1d0247c78d8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3dc52bb8-0a38-660b-7b2d-f1d0247c78d8@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > +            if (!(v % 16)) {
> > +                *iov = g_realloc(*iov, sizeof(struct iovec) * (v + 16));
> > +                if (addr) {
> > +                    *addr = g_realloc(*addr, sizeof(uint64_t) * (v + 16));
> nit: just wondering why you chose to do the alloc by slice of 16 instead
> of doing the usual allocation at the beginning and re-allocating the iov
> when l != len.

It's unknown in advance how many iov entries I'll need.  So I'll go
allocate them on demand.  To avoid one (or two) realloc calls on each
single loop run allocate in chunks.

Chunk size is 16 entries, it would also work with smaller or larger
chunks.  It's a tradeoff between realloc overhead (smaller chunks) and
wasted memory (larger chunks).

take care,
  Gerd


