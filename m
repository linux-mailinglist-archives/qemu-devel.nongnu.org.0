Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 034FC3B66EC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:41:19 +0200 (CEST)
Received: from localhost ([::1]:55014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxuJy-0005SL-2Q
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lxuEl-0007rZ-Aq
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:35:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lxuEh-0001nw-L2
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624898150;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8AmNfTYLZa+FZ8RdfaJpBiW/i0/lv1Ak+LMtN0LmArE=;
 b=C1AB4mblA21m2LIkX9wQN4yZe1j5x2FQDhYS+Gzo8CpbfzBsN2l+cldzkUoOoeKHQVYL4F
 YKsWgxZgCoetcZc6ewjAkEMl88dB/fKmAp8ErCDqi/9uvfI/J2SkSC7Q8Hj/QSTWVY12Sp
 rSHwJtS94LHgd1zvnYU+ZHFVWvvJxOM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-G6QJOd59N5u_cZNUU_qA2A-1; Mon, 28 Jun 2021 12:35:48 -0400
X-MC-Unique: G6QJOd59N5u_cZNUU_qA2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0EBC801B1C;
 Mon, 28 Jun 2021 16:35:47 +0000 (UTC)
Received: from redhat.com (ovpn-112-219.ams2.redhat.com [10.36.112.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A23E55D6AD;
 Mon, 28 Jun 2021 16:35:39 +0000 (UTC)
Date: Mon, 28 Jun 2021 17:35:36 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v3 1/1] yank: Unregister function when using TLS migration
Message-ID: <YNn6WDOoMpa3Gc17@redhat.com>
References: <20210601054030.1153249-1-leobras.c@gmail.com>
 <YMdEK6evcYtpbfMv@work-vm>
 <7cdf3e49-c68b-f5e5-ae1f-8274203a0f11@csgraf.de>
 <YNmyZUy4IwcgZKRy@work-vm>
 <cee64a5b-d274-49b3-fe6c-da73cd9fb505@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <cee64a5b-d274-49b3-fe6c-da73cd9fb505@csgraf.de>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Leonardo Bras <leobras.c@gmail.com>, qemu-devel@nongnu.org,
 lukasstraub2@web.de, Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 qemu-stable@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 28, 2021 at 03:12:33PM +0200, Alexander Graf wrote:
> 
> On 28.06.21 13:28, Dr. David Alan Gilbert wrote:
> > * Alexander Graf (agraf@csgraf.de) wrote:
> >> On 14.06.21 13:57, Dr. David Alan Gilbert wrote:
> >>> cc'ing in qemu-stable - I think we'd probably want this on 6.0
> >>> (It's currently merged as 7de2e8565335c13fb3516cddbe2e40e366cce273 ).
> >>> Although you'll probably also want the missing dependency fix
> >>> Philippe is working (See: 
> >>> Mathieu- ( 42) [RFC PATCH] migration: Add missing dependency on GNUTLS )
> >>
> >> Current master does not compile for me anymore (on macOS) due to this
> >> change. Can we please either disable yank support and revert this patch,
> >> pick the GNUTLS dependency patch you refer to quickly and work on a real
> >> fix afterwards or get the proposed fix in the "missing dependency on
> >> GNUTLS" discussion done quickly?
> >>
> >> Having a broken tree is going to make bisection super painful later.
> > There was Phil's dependency fix;
> > https://lore.kernel.org/qemu-devel/YMcTpO2SlVSc%2FHCR@redhat.com/t/
> >
> > but there still seemed to be some argument if this was the right way to
> > do it.
> 
> 
> Perfect is the enemy of good :). Can we please fix the tree first, then
> do "the right way"? I agree that not relying on the GNUTLS header in
> that file is sensible, but it's been almost 2 weeks since that simple
> one-liner, working fix was posted without anyone following up with a
> more complete solution.

Phillipe has provided a update of the series that eliminates the
compile time dependancy on gnutls from other QEMU headers. Once
i've tested that I'll ready a pull request.

I'm happy if someone wants to merge that quick one-liner in the
meantime as a workaround.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


