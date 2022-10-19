Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB495604D82
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 18:37:15 +0200 (CEST)
Received: from localhost ([::1]:44836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olC4A-0002xn-Gw
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 12:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1olBwU-0006mY-2x
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 12:29:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1olBwO-0005Qe-FL
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 12:29:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666196949;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43rzjgqhq0MlDCfzAYjuPodWSYQ8RHdKtPxS3PHodz4=;
 b=GIBQAXlEmSMKV/thfX4bQDU8HCEWJVLjtB88F2o/MvWWPE2eCDwKbjLjTDw73Bqak1XIa3
 6RacCGv6VOokztRsmhP0ezqYSEZqc2pytkQnBwkbRGpQA7rzlhlmXv2QsC1JuZtocWunMD
 wLl3w9EZyifccg+MJo8Fm5AVp9cgdJs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-sj6oKBVDN3iffpS2x5U4sA-1; Wed, 19 Oct 2022 12:29:08 -0400
X-MC-Unique: sj6oKBVDN3iffpS2x5U4sA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2337D2999B54;
 Wed, 19 Oct 2022 16:29:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F4572166B41;
 Wed, 19 Oct 2022 16:29:07 +0000 (UTC)
Date: Wed, 19 Oct 2022 17:29:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: socket chardevs: data loss when other end closes connection?
Message-ID: <Y1Al0bfisa0ySez2@redhat.com>
References: <CAFEAcA9t7ujfVVOdg4m0PBt1DkYY+UpDr2tA_doEb71+r-gfXA@mail.gmail.com>
 <Y078zCODLU5XsJYs@redhat.com>
 <CAFEAcA9_fkO2ftjicxp5Ufe3KZE1Br6H=o5GHgLeJ5zchi6Lxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA9_fkO2ftjicxp5Ufe3KZE1Br6H=o5GHgLeJ5zchi6Lxw@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, Oct 19, 2022 at 05:26:28PM +0100, Peter Maydell wrote:
> On Tue, 18 Oct 2022 at 20:21, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Tue, Oct 18, 2022 at 06:55:08PM +0100, Peter Maydell wrote:
> > > How is this intended to work? I guess the socket ought to go
> > > into some kind of "disconnecting" state, but not actually do
> > > a tcp_chr_disconnect() until all the data has been read via
> > > tcp_chr_read() and it's finally got an EOF indication back from
> > > tcp_chr_recv() ?
> >
> > Right, this is basically broken by (lack of) design right now.
> >
> > The main problem here is that we're watching the socket twice.
> > One set of callbacks added with io_add_watch_poll, and then
> > a second callback added with qio_chanel_create_watch just for
> > G_IO_HUP.
> >
> > We need there to be only 1 callback, and when that callback
> > gets  G_IO_IN, it should *ignore* G_IO_HUP until tcp_chr_recv
> > returns 0 to indicate EOF. This would cause tcp_chr_read to
> > be invoked repeatedly with G_IO_IN | G_IO_HUP, as we read
> > "halt\r" one byte at a time.
> 
> Makes sense.
> 
> I've filed https://gitlab.com/qemu-project/qemu/-/issues/1264 to
> track this socket chardev bug.
> 
> It did occur to me that there's a potential complication with
> the 'server' mode of this chardev: does it need to cope with
> a new connection coming into the server socket while the old
> fd is still hanging around in this "waiting for the guest to
> read it" state? Currently tcp_chr_disconnect_locked() is where
> we restart listening for new connections, so QEMU wouldn't
> accept any new connection until the guest had got round to
> completely draining the data from the old one.

That's fine IMHO. We never actually stop listening at a socket
level, we just stop trying to accept(). So any new client will
get queued until we've drained data, then accept()d and its
new data handled

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


