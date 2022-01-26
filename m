Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AFB49C594
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 09:53:48 +0100 (CET)
Received: from localhost ([::1]:44720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCe3n-00029p-DC
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 03:53:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nCdzb-0000Dg-6B
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 03:49:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nCdzV-0003jU-1a
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 03:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643186913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O2RWSpy6J6R0DhgcBUhrNPF9OYUL2WJbwYquq17Mf+0=;
 b=fwcrd7irw+wRM//fQEOn0MSiU7F56th21imbohBSY1gmxyfnsL+bKqAmIZxxFr5q6VNvr3
 z9CScQJMCJj5AbyyGb2pq8v8NBHKU7uYMISKFICPSWFjDpT0pjEeQnDpuuqmx0C+nw5a6W
 MkESPYPysC0d4pt48ldU+bAf9GBwBXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-QqI5vfYzP-a78CNHIoWb8A-1; Wed, 26 Jan 2022 03:48:29 -0500
X-MC-Unique: QqI5vfYzP-a78CNHIoWb8A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B407183DEAA;
 Wed, 26 Jan 2022 08:48:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31D1F66E00;
 Wed, 26 Jan 2022 08:48:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D916018000AA; Wed, 26 Jan 2022 09:48:25 +0100 (CET)
Date: Wed, 26 Jan 2022 09:48:25 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH v2 01/15] audio: replace open-coded buffer arithmetic
Message-ID: <20220126084825.uybvjg427lbjjc3y@sirius.home.kraxel.org>
References: <addf2564-d61c-707e-ce5f-fb06264e7a39@t-online.de>
 <20220122125745.5037-1-vr_qemu@t-online.de>
 <7976963.x2vcT3psHa@silver>
 <a9141436-adbb-e216-4131-157b0e634162@t-online.de>
MIME-Version: 1.0
In-Reply-To: <a9141436-adbb-e216-4131-157b0e634162@t-online.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > > --- a/audio/audio_int.h
> > > +++ b/audio/audio_int.h
> > > @@ -266,6 +266,12 @@ static inline size_t audio_ring_dist(size_t dst, size_t src, size_t len)
> > >       return (dst >= src) ? (dst - src) : (len - src + dst);
> > >   }
> > You haven't touched this function, but while I am looking at it, all function
> > arguments are unsigned. So probably modulo operator might be used to get rid
> > of a branch here.
> 
> That would be "return (len - dist + pos) % len;" but on my x86_64 system I
> always prefer a conditional move instruction to a 64 bit integer division
> instruction.

Why?  Performance?

Don't underestimate the optimizer of a modern compiler.  In many cases
it simply isn't worth the effort.  Better optimize the code for humans,
i.e. make it easy to read and understand.

take care,
  Gerd


