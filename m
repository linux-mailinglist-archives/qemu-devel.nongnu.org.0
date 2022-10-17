Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8789F60105E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 15:40:34 +0200 (CEST)
Received: from localhost ([::1]:39330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okQM4-0000Rf-LN
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 09:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okQBv-0000Am-7C
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 09:30:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okQBo-0003DS-Sl
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 09:29:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666013395;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hs9LfDPxnBueCfs4/tufiTMoW8kkgGWP4yk+hTT0JlU=;
 b=f70qTAaKm2/1q4MHI0iaob1QD/6DC0ImZgdW+kxGFulFhaPyYoGpW3X79x6z3zjdOzCJwf
 NHSHp4Y9fjUntidyiDvS6WSWBjt23/qsiYriScapRMfeSBtNSZL0IKkCYtGTGT4aYKEZvz
 TYZe8Wy0k8HdWQBPc6O1HmmXh9RDFFE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-vVZ-zu9ZOqeqK0XNZjHSrg-1; Mon, 17 Oct 2022 09:29:52 -0400
X-MC-Unique: vVZ-zu9ZOqeqK0XNZjHSrg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 502DF101A56C;
 Mon, 17 Oct 2022 13:29:52 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAD3D14613D2;
 Mon, 17 Oct 2022 13:29:49 +0000 (UTC)
Date: Mon, 17 Oct 2022 14:29:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 =?utf-8?Q?Cl=C3=A9ment?= Chigot <chigot@adacore.com>
Subject: Re: [PATCH 49/51] io/channel-watch: Fix socket watch on Windows
Message-ID: <Y01YyY0DM6HBRFDy@redhat.com>
References: <CAJ307EjyXxbGLK-PhBjf18p3AApYM-jGqA2L9q3xLS9wX16h_w@mail.gmail.com>
 <CAEUhbmWStgz4oUEgrtAVU_YFdKSPFJrK-4kd+DP4jqLS51+X+A@mail.gmail.com>
 <CAEUhbmVYPo46nx8LLXcS21myzxcwT0HAzKt+cTRprmn06+g0PQ@mail.gmail.com>
 <CAEUhbmUSLgiZM4w-rnrOeW+tER8SBdj5=1DvC85jp1e4GvKFoA@mail.gmail.com>
 <CAEUhbmUXUiW_Gr4wpeJR-32djq=-E_UJRYc8KN86Ko16w_ysNw@mail.gmail.com>
 <CAEUhbmVs3QXP7iDH1O5M9utLeyVmkMwf7hW8gty49SDcSBFj+w@mail.gmail.com>
 <CAEUhbmWkS1rx9O=mhPaoYm-Bk7AC6USrVb1iw-Vf0q6SB4Jn2w@mail.gmail.com>
 <CAEUhbmWV+7HxRE=oo9Eb9ys7tYE8uGp+PbaDVrD+wPULYSFfNw@mail.gmail.com>
 <Y01K+XFZBtm/YaCw@redhat.com>
 <CAEUhbmVdGu-Afk5hfX724eXjPxi-vGg7q-Sik3O2GC35y=D3AA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEUhbmVdGu-Afk5hfX724eXjPxi-vGg7q-Sik3O2GC35y=D3AA@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 17, 2022 at 09:03:15PM +0800, Bin Meng wrote:
> On Mon, Oct 17, 2022 at 8:30 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Mon, Oct 17, 2022 at 08:21:37PM +0800, Bin Meng wrote:
> > > +more people
> > >
> > > On Tue, Oct 11, 2022 at 6:42 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > Hi Paolo,
> > > >
> > > > On Thu, Oct 6, 2022 at 11:03 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > >
> > > > > Hi Paolo,
> > > > >
> > > > > On Wed, Sep 28, 2022 at 2:10 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > > >
> > > > > > Hi Paolo,
> > > > > >
> > > > > > On Wed, Sep 21, 2022 at 9:02 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > > > >
> > > > > > > On Wed, Sep 14, 2022 at 4:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Wed, Sep 7, 2022 at 1:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > > > > > > It seems to me that resetting the event twice (one time with the
> > > > > > > > > master Gsource, and the other time with the child GSource) causes some
> > > > > > > > > bizarre behavior. But MSDN [1] says
> > > > > > > > >
> > > > > > > > >     "Resetting an event that is already reset has no effect."
> > > > > > > > >
> > > > > > > > > [1] https://docs.microsoft.com/en-us/windows/win32/api/synchapi/nf-synchapi-resetevent
> > > > > > > > >
> > > > > > > >
> > > > > > > > Paolo, any comments about this issue?
> > > > > > >
> > > > > > > v2 series has been sent out, and this patch remains unchanged.
> > > > > > >
> > > > > > > Paolo, still would appreciate your comments.
> > > > > >
> > > > > > Ping?
> > > > >
> > > > > Ping? Can you please comment??
> > > >
> > > > Ping?
> > >
> > > Paolo remains silent. Please let me know who else could approve this
> > > change. Thanks.
> >
> > Given there has been plenty of time for objecting, I'll queue this
> > patch on the basis that you've tested it on a real Windows host
> > and found it better than what we have today.
> >
> 
> Thank you Daniel!
> 
> Please queue the following patches from v5 instead.
> 
> Message-ids:
> 
> 20221006151927.2079583-15-bmeng.cn@gmail.com
> 20221006151927.2079583-16-bmeng.cn@gmail.com
> 20221006151927.2079583-17-bmeng.cn@gmail.com

Ok, have done so.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


