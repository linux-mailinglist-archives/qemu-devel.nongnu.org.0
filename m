Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF3858401E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:37:14 +0200 (CEST)
Received: from localhost ([::1]:57044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH3hR-0003a1-PL
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oH3ae-0005ew-CQ
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:30:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oH3ac-0002tf-Pf
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:30:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659015010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v4NDBabO87eMgw//tm5IPRl769IKkg8ma5inkeF5aJk=;
 b=Jk+XGeZHh+AfnXww3tflHD02CWsjUEwJZDGI+1uTr2roepVErKCAf7sb9p/N4sgTqM1AOA
 IfU/Ou4VKwUeA5VvYyeb1nbxCv3sx+GlANESR5TIXfjiiX9/V/GBvY2mQdVg+/5ERjOil5
 VKsi8eLwv+nR0lB+QAVUQ/+/6sJJTlY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-YXXznu3sOuO5zX7Aqn0Xqw-1; Thu, 28 Jul 2022 09:30:04 -0400
X-MC-Unique: YXXznu3sOuO5zX7Aqn0Xqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C746801755;
 Thu, 28 Jul 2022 13:30:03 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 209DDC04482;
 Thu, 28 Jul 2022 13:29:59 +0000 (UTC)
Date: Thu, 28 Jul 2022 15:29:58 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 richard.henderson@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, venture@google.com, Avi.Fishman@nuvoton.com,
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org,
 bin.meng@windriver.com, qemu-block@nongnu.org, thuth@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
Message-ID: <YuKPVi9UjmZVqw5a@redhat.com>
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com>
 <87ilnuda33.fsf@pond.sub.org> <YuGMFRDj3tLOIJK7@redhat.com>
 <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28.07.2022 um 11:46 hat Peter Maydell geschrieben:
> On Wed, 27 Jul 2022 at 20:03, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > Am 18.07.2022 um 11:49 hat Markus Armbruster geschrieben:
> > > An OTP device isn't really a parallel flash, and neither are eFuses.
> > > More fast-and-lose use of IF_PFLASH may exist in the tree, and maybe of
> > > other interface types, too.
> > >
> > > This patch introduces IF_OTHER.  The patch after next uses it for an
> > > EEPROM device.
> > >
> > > Do we want IF_OTHER?
> >
> > What would the semantics even be? Any block device that doesn't pick up
> > a different category may pick up IF_OTHER backends?
> >
> > It certainly feels like a strange interface to ask for "other" disk and
> > then getting as surprise what this other thing might be. It's
> > essentially the same as having an explicit '-device other', and I
> > suppose most people would find that strange.
> >
> > > If no, I guess we get to abuse IF_PFLASH some more.
> > >
> > > If yes, I guess we should use IF_PFLASH only for actual parallel flash
> > > memory going forward.  Cleaning up existing abuse of IF_PFLASH may not
> > > be worth the trouble, though.
> > >
> > > Thoughts?
> >
> > If the existing types aren't good enough (I don't have an opinion on
> > whether IF_PFLASH is a good match), let's add a new one. But a specific
> > new one, not just "other".
> 
> I think the common thread is "this isn't what anybody actually thinks
> of as being a 'disk', but we would like to back it with a block device
> anyway". That can cover a fair range of possibilities...

How confident are we that no board will ever have two devices of this
kind?

As long as every board has at most one, if=other is a bad user interface
in terms of descriptiveness, but still more or less workable as long as
you know what it means for the specific board you use.

But if you have more than one device, it becomes hard to predict which
device gets which backend - it depends on the initialisation order in
the code then, and I'm pretty sure that this isn't something that should
have significance in external interfaces and therefore become a stable
API.

Kevin


