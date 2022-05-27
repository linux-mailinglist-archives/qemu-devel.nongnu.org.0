Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6258536615
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:42:12 +0200 (CEST)
Received: from localhost ([::1]:58404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nud2R-000371-Tg
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuczT-0000iw-5t
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:39:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuczP-0003oC-Io
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653669542;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l2xWlZKbkmuSdw7K2VDbqS52vJkyxnOSgrolIZXb52I=;
 b=SC2ZrXydF7iGLYnPRNJxXaB7cnt69vAab1EODD2Q3FLISA2RUvSte+z6imksQuTk85V+ki
 NhiPf5J5WMeU7PQ0/7on8aqHJ/ldz6h+JdIK1n2oWoCC32O9ndwHh6P6YwWw869PsbX3g5
 sCWVqPvAuz59pEIN+HsO3eIAA4+Cewc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-nMvtQyAcP8WE4-rSsaETXA-1; Fri, 27 May 2022 12:39:00 -0400
X-MC-Unique: nMvtQyAcP8WE4-rSsaETXA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0554858EFF
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 16:39:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F7AD2026D64;
 Fri, 27 May 2022 16:38:59 +0000 (UTC)
Date: Fri, 27 May 2022 17:38:57 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Peter Krempa <pkrempa@redhat.com>, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [libvirt PATCH] tools: add virt-qmp-proxy for proxying QMP
 clients to libvirt QEMU guests
Message-ID: <YpD+oSQ1G0NceUDR@redhat.com>
References: <20220527094758.604621-1-berrange@redhat.com>
 <YpCl9/EMwenZUxJs@angien.pipo.sk> <YpC25tpAEdn6BoXl@redhat.com>
 <CAFn=p-amy1sodeChaQvpVLwe_-L7pDAa4C9-JywdCu37VEWGBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFn=p-amy1sodeChaQvpVLwe_-L7pDAa4C9-JywdCu37VEWGBw@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Fri, May 27, 2022 at 12:07:55PM -0400, John Snow wrote:
> On Fri, May 27, 2022, 7:32 AM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Fri, May 27, 2022 at 12:20:39PM +0200, Peter Krempa wrote:
> > > On Fri, May 27, 2022 at 10:47:58 +0100, Daniel P. Berrangé wrote:
> > > > Libvirt provides QMP passthrough APIs for the QEMU driver and these are
> > > > exposed in virsh. It is not especially pleasant, however, using the raw
> > > > QMP JSON syntax. QEMU has a tool 'qmp-shell' which can speak QMP and
> > > > exposes a human friendly interactive shell. It is not possible to use
> > > > this with libvirt managed guest, however, since only one client can
> > > > attach to he QMP socket at any point in time.
> > > >
> > > > The virt-qmp-proxy tool aims to solve this problem. It opens a UNIX
> > > > socket and listens for incoming client connections, speaking QMP on
> > > > the connected socket. It will forward any QMP commands received onto
> > > > the running libvirt QEMU guest, and forward any replies back to the
> > > > QMP client.
> > > >
> > > >   $ virsh start demo
> > > >   $ virt-qmp-proxy demo demo.qmp &
> > > >   $ qmp-shell demo.qmp
> > > >   Welcome to the QMP low-level shell!
> > > >   Connected to QEMU 6.2.0
> > > >
> > > >   (QEMU) query-kvm
> > > >   {
> > > >       "return": {
> > > >           "enabled": true,
> > > >           "present": true
> > > >       }
> > > >   }
> > > >
> > > > Note this tool of course has the same risks as the raw libvirt
> > > > QMP passthrough. It is safe to run query commands to fetch information
> > > > but commands which change the QEMU state risk disrupting libvirt's
> > > > management of QEMU, potentially resulting in data loss/corruption in
> > > > the worst case.
> > > >
> > > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > > > ---
> > > >
> > > > CC'ing QEMU since this is likely of interest to maintainers and users
> > > > who work with QEMU and libvirt
> > > >
> > > > Note this impl is fairly crude in that it assumes it is receiving
> > > > the QMP commands linewise one at a time. None the less it is good
> > > > enough to work with qmp-shell already, so I figured it was worth
> > > > exposing to the world. It also lacks support for forwarding events
> > > > back to the QMP client.
> > >
> > > I originally wanted to teach the qemu tools to work with libvirt
> > > directly similarly how 'scripts/render_block_graph.py' from the qemu
> > > tree already does but I guess this is also an option.
> >
> > Yes, I do wonder about whether with John's new QMP python APIs,
> > it would be possible to plug in a livirt transport instead of
> > the socket transport. I've not spent enough time looking at the
> > Python QMP code to know if that's viable or not though.
> >
> 
> I can look into it. It looks like render_block_graph works by actually
> executing a subprocess. Is there a chance of getting anything socket-like
> or stream-like out of libvirt to work with instead?
> 
> As long as I can get some kind of stream going it should be easily possible
> to just replace the fd(s) the qmp lib uses and talk to libvirt instead.

Afraid not, any interface that plugs into libvirt would need to be
much higher level - send command and receive events - to map into
the libvirt APIs.

To get something stream oriented requires the proxy that I've proposd
here instead.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


