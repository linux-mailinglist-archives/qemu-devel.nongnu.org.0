Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7955E4455AC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:49:00 +0100 (CET)
Received: from localhost ([::1]:38546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mie31-0007pU-77
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mie25-0006kM-BX
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:48:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mie21-0004Vh-SZ
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636037276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=11zNSTXobLuuXTHhwbj6tBle3nqwx35u4LAk6YGSy+c=;
 b=UoOeXTo/qMvLWXKte8OlqCDQ6NNfTltBv28snhTjnrBHf/pEMcDMe/GTwtP+3OGj5kCrDx
 w+p9qXWEn5BnfAflDjjUe4f7IbwO2KVF11dRp59cqfxopO6Ueg3wWS6EYvz9Yhlh9IBt3F
 rdNxe5Fak0zoQzMsZA+znm7xxjvkKJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-msywzUUyO2qu1zcFZIRmSg-1; Thu, 04 Nov 2021 10:47:55 -0400
X-MC-Unique: msywzUUyO2qu1zcFZIRmSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B3091B2C99C;
 Thu,  4 Nov 2021 14:47:54 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECE581037F3F;
 Thu,  4 Nov 2021 14:47:45 +0000 (UTC)
Date: Thu, 4 Nov 2021 15:47:42 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] file-posix: Fix alignment after reopen changing O_DIRECT
Message-ID: <YYPyjrSB3W+vUeZv@redhat.com>
References: <20211104113109.56336-1-kwolf@redhat.com>
 <20211104142029.gcfgwrq4wuvzg5as@steredhat>
MIME-Version: 1.0
In-Reply-To: <20211104142029.gcfgwrq4wuvzg5as@steredhat>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: hreitz@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.11.2021 um 15:20 hat Stefano Garzarella geschrieben:
> On Thu, Nov 04, 2021 at 12:31:09PM +0100, Kevin Wolf wrote:
> > At the end of a reopen, we already call bdrv_refresh_limits(), which
> > should update bs->request_alignment according to the new file
> > descriptor. However, raw_probe_alignment() relies on s->needs_alignment
> > and just uses 1 if it isn't set. We neglected to update this field, so
> > starting with cache=writeback and then reopening with cache=none means
> > that we get an incorrect bs->request_alignment == 1 and unaligned
> > requests fail instead of being automatically aligned.
> > 
> > Fix this by recalculating s->needs_alignment in raw_refresh_limits()
> > before calling raw_probe_alignment().
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> > block/file-posix.c         | 20 ++++++++++++++++----
> > tests/qemu-iotests/142     | 22 ++++++++++++++++++++++
> > tests/qemu-iotests/142.out | 15 +++++++++++++++
> > 3 files changed, 53 insertions(+), 4 deletions(-)
> > 
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 7a27c83060..3f14e47096 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -167,6 +167,7 @@ typedef struct BDRVRawState {
> >     int page_cache_inconsistent; /* errno from fdatasync failure */
> >     bool has_fallocate;
> >     bool needs_alignment;
> > +    bool force_alignment;
> >     bool drop_cache;
> >     bool check_cache_dropped;
> >     struct {
> > @@ -351,6 +352,17 @@ static bool dio_byte_aligned(int fd)
> >     return false;
> > }
> > 
> > +static int raw_needs_alignment(BlockDriverState *bs)
> 
> If you need to respin, maybe it's better to use `bool` as return type.

Yes, that's what it should be. Can be fixed up while applying. I had a
0/1/-errno return value in an intermediate version, which is how it
became 'int', but it's not necessary any more in this version.

> In both cases:
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks!

Kevin


