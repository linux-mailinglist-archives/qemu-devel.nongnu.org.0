Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4584B48C6F4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:18:26 +0100 (CET)
Received: from localhost ([::1]:58724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7fOL-0005pJ-5H
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:18:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1n7eqT-0002cU-5I
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 09:43:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1n7eqO-0002kk-Q3
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 09:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641998599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGlweFwS+zIUrPSonKdktXqFotz/OyGEgvWd5RkG75o=;
 b=Db3EQKAkGMwKX/5ECWTgG3t4uO1v5C6gM6tvyLZenlj4SJ5ApS5QllHwkoY8qp4kMnBEYk
 NzWKatQcYzDZj/UQJW9o8QjRPNP2w0Z8Nylynzf+9x2YZB47uNMktON+gWIG6bTpMFH923
 aFy/0dcGlym3/GaV4iWsRUDflIAQR3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-Uwb7psEGNvO1Gp49wTDVow-1; Wed, 12 Jan 2022 09:43:13 -0500
X-MC-Unique: Uwb7psEGNvO1Gp49wTDVow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C6211083F91;
 Wed, 12 Jan 2022 14:43:11 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE96692A95;
 Wed, 12 Jan 2022 14:43:09 +0000 (UTC)
Date: Wed, 12 Jan 2022 08:43:07 -0600
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] net/dump.c: Suppress spurious compiler warning
Message-ID: <20220112144307.6svqrt3cycib5x5m@redhat.com>
References: <20220109205748.4127032-1-philipp.tomsich@vrull.eu>
 <0424f2d4-c9d0-3409-78e1-c0cabbff90a1@amsat.org>
MIME-Version: 1.0
In-Reply-To: <0424f2d4-c9d0-3409-78e1-c0cabbff90a1@amsat.org>
User-Agent: NeoMutt/20211029-182-90c72c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 10:38:59AM +0100, Philippe Mathieu-Daudé wrote:
> Cc'ing Richard & Eric for dubious compiler warning.
> 
> On 1/9/22 21:57, Philipp Tomsich wrote:
> > Compiling with gcc version 11.2.0 (Ubuntu 11.2.0-13ubuntu1) results in
> > a (spurious) warning:
> > 
> >   In function ‘dump_receive_iov’,
> >       inlined from ‘filter_dump_receive_iov’ at ../net/dump.c:157:5:
> >   ../net/dump.c:89:9: error: ‘writev’ specified size 18446744073709551600 exceeds maximum object size 9223372036854775807 [-Werror=stringop-overflow=]
> >      89 |     if (writev(s->fd, dumpiov, cnt + 1) != sizeof(hdr) + caplen) {
> >         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   In file included from /home/ptomsich/qemu/include/qemu/osdep.h:108,
> >                    from ../net/dump.c:25:
> >   ../net/dump.c: In function ‘filter_dump_receive_iov’:
> >   /usr/include/x86_64-linux-gnu/sys/uio.h:52:16: note: in a call to function ‘writev’ declared with attribute ‘read_only (2, 3)’
> >      52 | extern ssize_t writev (int __fd, const struct iovec *__iovec, int __count)
> >         |                ^~~~~~
> >   cc1: all warnings being treated as errors

That is an odd error message.

> > 
> > This change helps that version of GCC to understand what is going on
> > and suppresses this warning.
> > 
> > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > 
> > ---
> > 
> >  net/dump.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/net/dump.c b/net/dump.c
> > index a07ba62401..c32d3bf4e6 100644
> > --- a/net/dump.c
> > +++ b/net/dump.c
> > @@ -86,7 +86,7 @@ static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt)
> >      dumpiov[0].iov_len = sizeof(hdr);
> >      cnt = iov_copy(&dumpiov[1], cnt, iov, cnt, 0, caplen);
> >  
> > -    if (writev(s->fd, dumpiov, cnt + 1) != sizeof(hdr) + caplen) {
> > +    if (writev(s->fd, &dumpiov[0], cnt + 1) != sizeof(hdr) + caplen) {

This change is safe; it results in the same pointer.  Obviously, the
latter spelling is able to provide the compiler with a bit more type
information about the pointer, so that it no longer assumes a pointer
to an unbounded array, so if it silences the warning, I see no
downside in including it whether or not gcc is also patched to avoid
creating a spurious warning in the first place.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


