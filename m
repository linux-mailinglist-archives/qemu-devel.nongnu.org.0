Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AF44F5680
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 08:30:37 +0200 (CEST)
Received: from localhost ([::1]:57836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbzBZ-0004dT-Vs
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 02:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nbz5r-0003GZ-4S
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 02:24:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nbz5o-0002lO-7R
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 02:24:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649226275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F98nrdrh0FV5FHVvhGlzr5uT3oixQZ4l//0eSeU4OkU=;
 b=jV5LzugZJb3LGtMwPOMV+IaxiOvoG47ZkWYhk76yZxwnjlelUKge/k20TJHSEbwMtPE2fa
 rQRDQed2H6R3GAk78diQq+wbr5iwyeHjzMru+aLx3H27/Vv5mB3yO2JUs5P+5PpW91dTwB
 7PLEmI8IsGKmngHTYtIoWOKMQ4IOgII=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-s3pP5MsUMgu7M4o2ZTNU_Q-1; Wed, 06 Apr 2022 02:24:34 -0400
X-MC-Unique: s3pP5MsUMgu7M4o2ZTNU_Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B273E3C0011E;
 Wed,  6 Apr 2022 06:24:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C72B401E93;
 Wed,  6 Apr 2022 06:24:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 040AE1800604; Wed,  6 Apr 2022 08:24:32 +0200 (CEST)
Date: Wed, 6 Apr 2022 08:24:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Mauro Matteo Cascella <mcascell@redhat.com>
Subject: Re: [PATCH] ui/cursor: fix integer overflow in cursor_alloc
 (CVE-2022-4206)
Message-ID: <20220406062431.mx6perofpqbyb5yf@sirius.home.kraxel.org>
References: <20220405103258.105701-1-mcascell@redhat.com>
 <CAJ+F1CKKyAg-d+3F_H+Q9gBTT0fz5txXkg0bsaRgu=qGkxRN1Q@mail.gmail.com>
 <20220405111010.kpjlfvtow7jxzk7w@sirius.home.kraxel.org>
 <CAA8xKjVX0BsosHQNOrfOemOhgv03qqVK0NFVAoCZa-3v4XWSxg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAA8xKjVX0BsosHQNOrfOemOhgv03qqVK0NFVAoCZa-3v4XWSxg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 05, 2022 at 04:47:18PM +0200, Mauro Matteo Cascella wrote:
> On Tue, Apr 5, 2022 at 1:10 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > > > +++ b/ui/cursor.c
> > > > @@ -46,6 +46,13 @@ static QEMUCursor *cursor_parse_xpm(const char *xpm[])
> > > >
> > > >      /* parse pixel data */
> > > >      c = cursor_alloc(width, height);
> > > > +
> > > > +    if (!c) {
> > > > +        fprintf(stderr, "%s: cursor %ux%u alloc error\n",
> > > > +                __func__, width, height);
> > > > +        return NULL;
> > > > +    }
> > > >
> > >
> > > I think you could simply abort() in this function. It is used with static
> > > data (ui/cursor*.xpm)
> >
> > Yes, that should never happen.
> >
> > Missing: vmsvga_cursor_define() calls cursor_alloc() with guest-supplied
> > values too.
> 
> I skipped that because the check (cursor.width > 256 || cursor.height
> > 256) is already done in vmsvga_fifo_run before calling
> vmsvga_cursor_define. You want me to add another check in
> vmsvga_cursor_define and return NULL if cursor_alloc fails?

No check required then.

Maybe add an 'assert(c != NULL)' to clarify this should never happen
b/c those call sites never call cursor_alloc() with width/height being
too big (your choice, applies to both vmsvga and ui/cursor.c).

take care,
  Gerd


