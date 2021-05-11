Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0015B37ACAA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 19:07:18 +0200 (CEST)
Received: from localhost ([::1]:51474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgVqo-0005Z1-26
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 13:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgVpO-00049l-VT
 for qemu-devel@nongnu.org; Tue, 11 May 2021 13:05:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgVpI-0001aB-Sc
 for qemu-devel@nongnu.org; Tue, 11 May 2021 13:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620752743;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vFz1npm9w8Tmsn1M23GzSluTr/VhGdd/MJZXZ2ZSH8=;
 b=i+U0jzEM1jPfcJZOa5gpYhMdCdIbHK8/CrL1QsVoHKW1w60iPmn5SdBiviOadma7iZXp7i
 mx2qKOIChSF4+QPqhIJW9Oze69RGedbV7hPfkIfr6fjXc1iMFySAgzMHtbRTnfUSDHdaSw
 TyAhw/ckOL77libxoeuTDnr1S6LXGJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-lbtL8TwPOB6KTtJD9LGB-w-1; Tue, 11 May 2021 13:05:41 -0400
X-MC-Unique: lbtL8TwPOB6KTtJD9LGB-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A9831854E2A;
 Tue, 11 May 2021 17:05:40 +0000 (UTC)
Received: from redhat.com (ovpn-115-93.ams2.redhat.com [10.36.115.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FEAA10016FC;
 Tue, 11 May 2021 17:05:37 +0000 (UTC)
Date: Tue, 11 May 2021 18:05:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] hmp: Fix loadvm to resume the VM on success instead of
 failure
Message-ID: <YJq5X/3P12YT8hHo@redhat.com>
References: <20210511163151.45167-1-kwolf@redhat.com>
 <YJq1fq57yQGFjw/E@redhat.com> <YJq3mYxNtqidONkg@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <YJq3mYxNtqidONkg@merkur.fritz.box>
User-Agent: Mutt/2.0.6 (2021-03-06)
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: qemu-stable@nongnu.org, yama@redhat.com, dgilbert@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 06:58:01PM +0200, Kevin Wolf wrote:
> Am 11.05.2021 um 18:49 hat Daniel P. Berrangé geschrieben:
> > On Tue, May 11, 2021 at 06:31:51PM +0200, Kevin Wolf wrote:
> > > Commit f61fe11aa6f broke hmp_loadvm() by adding an incorrect negation
> > > when converting from 0/-errno return values to a bool value. The result
> > > is that loadvm resumes the VM now if it failed and keeps it stopped if
> > > it failed. Fix it to restore the old behaviour and do it the other way
> > > around.
> > > 
> > > Fixes: f61fe11aa6f7f8f0ffe4ddaa56a8108f3ab57854
> > > Cc: qemu-stable@nongnu.org
> > > Reported-by: Yanhui Ma <yama@redhat.com>
> > > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > > ---
> > >  monitor/hmp-cmds.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> > > index 0ad5b77477..cc15d9b6ee 100644
> > > --- a/monitor/hmp-cmds.c
> > > +++ b/monitor/hmp-cmds.c
> > > @@ -1133,7 +1133,7 @@ void hmp_loadvm(Monitor *mon, const QDict *qdict)
> > >  
> > >      vm_stop(RUN_STATE_RESTORE_VM);
> > >  
> > > -    if (!load_snapshot(name, NULL, false, NULL, &err) && saved_vm_running) {
> > > +    if (load_snapshot(name, NULL, false, NULL, &err) && saved_vm_running) {
> > >          vm_start();
> > >      }
> > >      hmp_handle_error(mon, err);
> > 
> > Paolo had sent a different fix here:
> > 
> >   https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg01093.html
> 
> Hm... I missed that patch, but doesn't it just generalise the buggy HMP
> code instead of fixing it? That is, we still resume the VM on failure
> rather than on success?

Yes, if I use my iotest patch on Paolo's patch it shows that it is
still broken.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


