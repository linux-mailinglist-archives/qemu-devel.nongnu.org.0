Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2273FEC29
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:31:49 +0200 (CEST)
Received: from localhost ([::1]:43718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLk0a-00064A-VJ
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLjxU-0000ep-2w
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:28:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLjxP-0006Lw-N5
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:28:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630578511;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BsiN0AeCkL+aGVMEQwuyiOkjXuw+QA3vVAY9vd8r8J4=;
 b=gpR7r45kOj2Kv/lYTMuTJupuaUX6aU0c+B0Y6+gfH5q5Ndg3M9Mqs/OAx8wWySzsiU9yii
 9g1QkIn5186Vv9x0ppVKR7epPZzikxkr3GkMavhHnI5ra765qzkNVYrksE7tJTAPE+LdOD
 SpBkYcv62pSbhmu4OwGkiSlMlwU8+1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-aLPOrh1YMPuJla9VK43Tlw-1; Thu, 02 Sep 2021 06:28:29 -0400
X-MC-Unique: aLPOrh1YMPuJla9VK43Tlw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B68A8464D0;
 Thu,  2 Sep 2021 10:28:28 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF108104B51C;
 Thu,  2 Sep 2021 10:28:17 +0000 (UTC)
Date: Thu, 2 Sep 2021 11:28:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
Message-ID: <YTCnP9J/JINhg4h8@redhat.com>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-3-leobras@redhat.com>
 <YS4nPfEBCy9IC3rd@redhat.com>
 <CAJ6HWG75NDzaRAoHvM6FkFoB+sQvTpmdR8+AdMkoY6TsP06ZhA@mail.gmail.com>
 <YTCPngNB+l70sl06@redhat.com>
 <CAJ6HWG6dd+timQM27-NTumvwDM2bFawRsnmrZumdzGZ8hCR3dQ@mail.gmail.com>
 <YTCeNCEmr3NsQEPR@redhat.com>
 <CAJ6HWG6D61K49gyvfLo2c5=cZpkYh96ciZjO5V=wiPdG+wB5zQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG6D61K49gyvfLo2c5=cZpkYh96ciZjO5V=wiPdG+wB5zQ@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 07:19:58AM -0300, Leonardo Bras Soares Passos wrote:
> On Thu, Sep 2, 2021 at 6:50 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, Sep 02, 2021 at 06:34:01AM -0300, Leonardo Bras Soares Passos wrote:
> > > On Thu, Sep 2, 2021 at 5:47 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > >
> > > > On Thu, Sep 02, 2021 at 03:38:11AM -0300, Leonardo Bras Soares Passos wrote:
> > > >
> > > > > > I would suggest checkig in close(), but as mentioned
> > > > > > earlier, I think the design is flawed because the caller
> > > > > > fundamentally needs to know about completion for every
> > > > > > single write they make in order to know when the buffer
> > > > > > can be released / reused.
> > > > >
> > > > > Well, there could be a flush mechanism (maybe in io_sync_errck(),
> > > > > activated with a
> > > > > parameter flag, or on a different method if callback is preferred):
> > > > > In the MSG_ZEROCOPY docs, we can see that the example includes using a poll()
> > > > > syscall after each packet sent, and this means the fd gets a signal after each
> > > > > sendmsg() happens, with error or not.
> > > > >
> > > > > We could harness this with a poll() and a relatively high timeout:
> > > > > - We stop sending packets, and then call poll().
> > > > > - Whenever poll() returns 0, it means a timeout happened, and so it
> > > > > took too long
> > > > > without sendmsg() happening, meaning all the packets are sent.
> > > > > - If it returns anything else, we go back to fixing the errors found (re-send)
> > > > >
> > > > > The problem may be defining the value of this timeout, but it could be
> > > > > called only
> > > > > when zerocopy is active.
> > > >
> > > > Maybe we need to check completions at the end of each iteration of the
> > > > migration dirtypage loop ?
> > >
> > > Sorry, I am really new to this, and I still couldn't understand why would we
> > > need to check at the end of each iteration, instead of doing a full check at the
> > > end.
> >
> > The end of each iteration is an implicit synchronization point in the
> > current migration code.
> >
> > For example, we might do 2 iterations of migration pre-copy, and then
> > switch to post-copy mode. If the data from those 2 iterations hasn't
> > been sent at the point we switch to post-copy, that is a semantic
> > change from current behaviour. I don't know if that will have an
> > problematic effect on the migration process, or not. Checking the
> > async completions at the end of each iteration though, would ensure
> > the semantics similar to current semantics, reducing risk of unexpected
> > problems.
> >
> 
> What if we do the 'flush()' before we start post-copy, instead of after each
> iteration? would that be enough?

Possibly, yes. This really need David G's input since he understands
the code in way more detail than me.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


