Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6236A9B36
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 16:53:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7hv-0000TR-Fs; Fri, 03 Mar 2023 10:52:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY7hu-0000T2-5W
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:52:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY7hs-000076-7J
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:52:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677858747;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V56OvcOO190xigwRcsAkqjlWVfJeFI8bqr4paxWoiok=;
 b=fzS0LsqHAlGJWakDDreNHTAdQUa8EV9vaq30jCcizSoIz79ldPX84Iat5khW3E7jRruXeu
 J13kwIMAuQNyrQLqf2ixZMdGxZF2rUlorQCPrHpObrzALdHbr/AUNqjOMMnVFr0me4ksan
 9wETaFuqBQFh94xgNnBOCuERQSxEZSc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-E_zzXPdUNBmBErgcv19FUg-1; Fri, 03 Mar 2023 10:52:21 -0500
X-MC-Unique: E_zzXPdUNBmBErgcv19FUg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5B87885621;
 Fri,  3 Mar 2023 15:52:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB3FA492C14;
 Fri,  3 Mar 2023 15:52:18 +0000 (UTC)
Date: Fri, 3 Mar 2023 15:52:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PATCH 0/5] iotests: make meson aware of individual I/O tests
Message-ID: <ZAIXryLLQhyzC5Fp@redhat.com>
References: <20230302184606.418541-1-berrange@redhat.com>
 <44d571e7-05b6-b2a1-7eb7-44bf2912ec69@redhat.com>
 <ZAHP1I82r/cbuUo4@redhat.com> <ZAHwyFhy+shNjfav@redhat.com>
 <c8893694-f842-9731-6b23-f2b43187db69@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8893694-f842-9731-6b23-f2b43187db69@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 03, 2023 at 04:49:36PM +0100, Thomas Huth wrote:
> On 03/03/2023 14.06, Daniel P. Berrangé wrote:
> > On Fri, Mar 03, 2023 at 10:45:40AM +0000, Daniel P. Berrangé wrote:
> > > On Fri, Mar 03, 2023 at 09:30:39AM +0100, Thomas Huth wrote:
> > > > On 02/03/2023 19.46, Daniel P. Berrangé wrote:
> > > > 3) When I tried this last year, I had a weird problem that
> > > >     the terminal sometimes gets messed up ... I wasn't able
> > > >     to track it down back then - could you check by running
> > > >     "make check-block" many times (>10 times) to see whether
> > > >     it happens with your series or not?
> > > 
> > > I've just seen this - echo got disabled on my terminal.
> > 
> > The problem is that testrunner.py script doing
> > 
> > # We want to save current tty settings during test run,
> > # since an aborting qemu call may leave things screwed up.
> > @contextmanager
> > def savetty() -> Iterator[None]:
> >      isterm = sys.stdin.isatty()
> >      if isterm:
> >          fd = sys.stdin.fileno()
> >          attr = termios.tcgetattr(fd)
> > 
> >      try:
> >          yield
> >      finally:
> >          if isterm:
> >              termios.tcsetattr(fd, termios.TCSADRAIN, attr)
> > 
> > 
> > When invoking 'check' this wraps around execution of the entire
> > 'check' script. IOW it saves/restores the terminal once.
> > 
> > When we invoke 'check' in parallel it will save/restore the same
> > terminal for each invokation.
> > 
> > If the 'termios.tcgetattr' call runs at the same time as there is
> > a QEMU running which has put the terminal in raw mode, then when
> > 'check' exits it'll "restore" the terminal to raw mode.
> > 
> > IOW, this savetty() logic is fundamentally unsafe when invoking
> > 'check' in parallel.
> 
> Hmm, couldn't we e.g. also simply skip this termios stuff when running with
> "--tap" ?

It actually turns out to be way simpler. We merely need to set
stdin=subprocess.DEVNULL. There is no valid reason for the test
cases to be reading for stdin, as that would block execution.
By setting stdin==/dev/null, the isatty(0) checks will fail and
thus QEMU won't mess with termios, and thus we don't need any
save/restore dance either.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


