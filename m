Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0553D5E9BE7
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 10:23:19 +0200 (CEST)
Received: from localhost ([::1]:35014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocjOY-00071E-4S
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 04:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ocjMZ-0004g2-Bd
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 04:21:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ocjMR-0005za-Ab
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 04:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664180465;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zzz7nLzPJ5jFI3DN8gl+xb55l6tCG+bonk0ZFq5fIc4=;
 b=QmDoTHAbG6MNbWP35NxmGi2lecvUOGcn2GW8uT/SjHsxxYkqki9PlOy4bjH1hMmuu6YdiW
 w3Is1s/RIdmpp8xqKSel09/HmdXjsk2sDj/+YLiiNdtn4diloJ5C1uKGRT8mjBRRx0CST7
 DUjdEOhv8PtcVELJwc0oL7UJaxvKfjY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-wd7iI75KMDaStvKjBSZjlg-1; Mon, 26 Sep 2022 04:21:04 -0400
X-MC-Unique: wd7iI75KMDaStvKjBSZjlg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18C6180029D;
 Mon, 26 Sep 2022 08:21:04 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74F7940C2064;
 Mon, 26 Sep 2022 08:21:02 +0000 (UTC)
Date: Mon, 26 Sep 2022 09:21:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Bin Meng <bmeng.cn@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 01/39] tests: Change to use g_mkdir()
Message-ID: <YzFg7HcxmuhZf0oK@redhat.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-2-bmeng.cn@gmail.com>
 <CAJ+F1CKiCiWBwr5CGAODZukJ8eYoJerhQ01AQYqWMLktsVDM2Q@mail.gmail.com>
 <CAEUhbmXV8SBNfW3teZw+A-EKxbjv-UwJZrND4mWOdxUKQT_MCw@mail.gmail.com>
 <1cec4c45-4449-8800-7bb3-c72269967398@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1cec4c45-4449-8800-7bb3-c72269967398@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Fri, Sep 23, 2022 at 08:02:46PM +0200, Thomas Huth wrote:
> On 23/09/2022 03.09, Bin Meng wrote:
> > On Fri, Sep 23, 2022 at 3:32 AM Marc-André Lureau
> > <marcandre.lureau@gmail.com> wrote:
> > > 
> > > Hi
> > > 
> > > On Tue, Sep 20, 2022 at 1:48 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > 
> > > > From: Bin Meng <bin.meng@windriver.com>
> > > > 
> > > > Commit 413bebc04603 ("tests: Use g_mkdir_with_parents()") replaces
> > > > the mkdir() call in the test codes with glib's g_mkdir_with_parents(),
> > > > but the exact portable replacement for mkdir() should be g_mkdir().
> > > > 
> > > > I probably was misled by the GTK glib doc [1] before, thinking that
> > > > g_mkdir() is not a supported API from glib. But the glib sources do
> > > > not support this statement. It is probably that the GTK documentation
> > > > was not built to include all APIs.
> > > > 
> > > > [1] https://docs.gtk.org/glib/?q=mkdir
> > > > 
> > > > Fixes: 413bebc04603 ("tests: Use g_mkdir_with_parents()")
> > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > 
> > > 
> > > I wouldn't bother anymore, I'd keep mkdir_with_parents for now. YMMV
> > > 
> > 
> > Yep but some maintainers pointed out in other patches in v1 that
> > g_mkdir() is the strict replacement for mkdir() :)
> > 
> > @Thomas Huth Would you share your thoughts?
> 
> It's a little bit weird that g_mkdir() does not show up in the glib docs ...
> let's keep g_mkdir_with_parents(), that sounds like the better choice to me.

That is a bug in the new docs generator for GTK. It appears to have
missed out a whole bunch of APIs.  It is certainly present in the old
docs from gtk-doc output

https://developer-old.gnome.org/glib/2.64/glib-File-Utilities.html#g-mkdir

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


