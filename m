Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984E055BF75
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:34:52 +0200 (CEST)
Received: from localhost ([::1]:39634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66gN-0004UI-DG
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o65qM-0001uh-Ky
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:41:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o65qJ-0005wS-0k
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656402062;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rAvYwnr8iOs9E8Uwgl64rxx4S2TtYaQ5k3etHYmZe4s=;
 b=a0ApjZIniGGbINeyX3VVXexRU79HhqN6lYsRV0nLKWIgdo63vRzer3MH5BLxMICrpemJ/u
 fx7iLhaHXb+jLqoqSCqY7d8LJbZkVbrjsPa0Gay1TtlHHNG4sK6r/ZE4lWA5596SY02LTk
 Rrd7YY/CCU6xQuHgvrYtS+fmMk4kESI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-YO6B5a6dOX6cSH-0bGeHOA-1; Tue, 28 Jun 2022 03:40:58 -0400
X-MC-Unique: YO6B5a6dOX6cSH-0bGeHOA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D95941C01E85;
 Tue, 28 Jun 2022 07:40:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9550F815B;
 Tue, 28 Jun 2022 07:40:54 +0000 (UTC)
Date: Tue, 28 Jun 2022 08:40:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, jdenemar@redhat.com
Subject: Re: [PULL 22/33] migration: remove the QEMUFileOps 'get_buffer'
 callback
Message-ID: <YrqwhNla7KDgxaQ0@redhat.com>
References: <20220622183917.155308-1-dgilbert@redhat.com>
 <20220622183917.155308-23-dgilbert@redhat.com>
 <YrNu3KesFVVvoWVb@xz-m1.local> <YrnGrXpwBdmt69Fp@redhat.com>
 <YroTwDmAzE7uImvu@xz-m1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YroTwDmAzE7uImvu@xz-m1.local>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 27, 2022 at 04:32:00PM -0400, Peter Xu wrote:
> On Mon, Jun 27, 2022 at 04:03:09PM +0100, Daniel P. Berrangé wrote:
> > On Wed, Jun 22, 2022 at 03:34:52PM -0400, Peter Xu wrote:
> > > On Wed, Jun 22, 2022 at 07:39:06PM +0100, Dr. David Alan Gilbert (git) wrote:
> > > > diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> > > > index 74f919de67..e206b05550 100644
> > > > --- a/migration/qemu-file.c
> > > > +++ b/migration/qemu-file.c
> > > > @@ -377,8 +377,22 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
> > > >          return 0;
> > > >      }
> > > >  
> > > > -    len = f->ops->get_buffer(f->ioc, f->buf + pending, f->total_transferred,
> > > > -                             IO_BUF_SIZE - pending, &local_error);
> > > > +    do {
> > > > +        len = qio_channel_read(f->ioc,
> > > > +                               (char *)f->buf + pending,
> > > > +                               IO_BUF_SIZE - pending,
> > > > +                               &local_error);
> > > > +        if (len == QIO_CHANNEL_ERR_BLOCK) {
> > > > +            if (qemu_in_coroutine()) {
> > > > +                qio_channel_yield(f->ioc, G_IO_IN);
> > > > +            } else {
> > > > +                qio_channel_wait(f->ioc, G_IO_IN);
> > > > +            }
> > > > +        } else if (len < 0) {
> > > > +            len = EIO;
> > > 
> > > This should be -EIO.
> > > 
> > > > +        }
> > > > +    } while (len == QIO_CHANNEL_ERR_BLOCK);
> > > 
> > > It's failing only with the new TLS test I added for postcopy somehow (at
> > > least /x86_64/migration/postcopy/recovery/tls).. I also verified after the
> > > change it'll work again.
> > 
> > Assuming you can still reproduce the pre-existing flaw, can you capture
> > a stack trace when it hangs.   I'm wondering if it is a sign that the
> > migration is not converging when using TLS under certain load conditions,
> > because the test waits forever for converge.
> 
> Yes it is, and it reproduces here every time.  It hangs at:
> 
>  if (!got_stop) {
>      qtest_qmp_eventwait(from, "STOP");
>  }
> 
> > 
> > Also what scenario are you running in ? Bare metal or a VM, and what
> > host arch ? Wondering if the machine is at all slow, or for example
> > missing AES hardware acceleration or some such thing.
> 
> It's Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz, 40 cores.
> 
> It'll pass after I modify the downtime:
> 
>   migrate_set_parameter_int(from, "downtime-limit", 100000);
> 
> And with QTEST_LOG=1 I found that the bw is indeed low, ~700mbps.

Good, this all makes sense, and I've got pending patchues I'm testing
that will fix this.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


